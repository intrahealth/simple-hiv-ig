#!/bin/bash

# load data script
# fyi: hapi fhir hosted demo doesn't support measure eval
# export FHIR="https://blaze.life.uni-leipzig.de/fhir"
export FHIR="https://cloud.alphora.com/sandbox/r4/cqm/fhir"
# export FHIR="http://localhost:8080/cqf-ruler-r4/fhir"

export HEADER="Content-Type: application/fhir+json"

curl -X PUT -H "$HEADER" --data @Library-FHIR-ModelInfo.json $FHIR/Library/FHIR-ModelInfo | jq .
curl -X PUT -H "$HEADER" --data @output/Device-cqf-tooling.json $FHIR/Device/cqf-tooling | jq .

# modified to use input/vocab
for FILE in OpenCR OpenHIE PEPFAR ; do curl -X PUT -H "$HEADER" \
--data @input/vocabulary/codesystem/manual/CodeSystem-${FILE}.json $FHIR/CodeSystem/${FILE} | jq . ; done
# modified to use input/vocab
for FILE in BreastfeedingCodes HIVTestingServices PregnancyCodes ViralLoadTest; do curl -X PUT -H "$HEADER" \
--data @input/vocabulary/valueset/manual/ValueSet-${FILE}.json $FHIR/ValueSet/${FILE} | jq . ; done

# libaries
for FILE in FHIRHelpers FHIRCommon KitchenSink \
DASHConcepts DASHDataElements DASHStratifiers DataContract QR TXCURR TXNEW TXPVLS TXML HTSTST \
; do curl -X PUT -H "$HEADER" --data @output/Library-${FILE}.json $FHIR/Library/${FILE} | jq . ; done

for FILE in JustGender JustAgeGroup JustLocation AgeGroupGender AgeGroupGenderLocation Cohort SuppData \
DASHTXCURR DASHTXML DASHTXNEW DASHTXPVLS DASHHTSTST \
; do curl -X PUT -H "$HEADER" --data @output/Measure-${FILE}.json $FHIR/Measure/${FILE} | jq . ; done


# locations, organizations

# export HEADER-IFNONE="Content-Type: application/fhir+json, If-None-Exist: identifier=http://my-lab-system|123"
# curl -XPOST -H "$HEADER-IFNONE" --data @Bundle-Example-Locations-Organizations.json $FHIR | jq .

for FILE in Organization-HIVSimple1 Organization-HIVSimple2 \
Organization-100 Organization-101 Organization-102 IntraHealth \
; do curl -X PUT -H "Content-Type: application/fhir+json, If-None-Exist: \
identifier=https://github.com/synthetichealth/synthea|${FILE}" \
--data @output/Organization-${FILE}.json $FHIR/Organization/${FILE} | jq . ; done

for FILE in Location-HIVSimple1 Location-HIVSimple2 Location-100 Location-101 Location-102 \
; do curl -X PUT -H "Content-Type: application/fhir+json, If-None-Exist: \
identifier=https://github.com/synthetichealth/synthea|${FILE}" \
--data @output/Location-${FILE}.json $FHIR/Location/${FILE} | jq . ; done

# must POST a transaction bundle of POST methods on each resource
for FILE in output/Bundle-Example-HIV*.json ; do echo ${FILE} ; done
for FILE in output/Bundle-Example-HIV*.json ; do curl -XPOST -H "$HEADER" --data @${FILE} $FHIR | jq . ; done

curl $FHIR'/Measure/JustGender/$evaluate-measure?periodStart=2000-01-01&periodEnd=2021-12-31' | jq . 
curl $FHIR'/Measure/JustAgeGroup/$evaluate-measure?periodStart=2000-01-01&periodEnd=2021-12-31' | jq . 
curl $FHIR'/Measure/JustLocation/$evaluate-measure?periodStart=2000-01-01&periodEnd=2021-12-31' | jq . 
curl $FHIR'/Measure/AgeGroupGenderLocation/$evaluate-measure?periodStart=2000-01-01&periodEnd=2021-12-31' | jq . 

curl $FHIR'/Measure/DASHTXCURR/$evaluate-measure?periodStart=2000-01-01&periodEnd=2021-12-31' | jq . 
curl $FHIR'/Measure/DASHTXML/$evaluate-measure?periodStart=2000-01-01&periodEnd=2021-12-31' | jq . 
curl $FHIR'/Measure/DASHTXNEW/$evaluate-measure?periodStart=2000-01-01&periodEnd=2021-12-31' | jq . 
curl $FHIR'/Measure/DASHTXPVLS/$evaluate-measure?periodStart=2000-01-01&periodEnd=2021-12-31' | jq . 
curl $FHIR'/Measure/DASHHTSTST/$evaluate-measure?periodStart=2000-01-01&periodEnd=2021-12-31' | jq . 

# these are for saving the results of the measure evaluations
# curl $FHIR'/Measure/JustGender/$evaluate-measure?periodStart=2000-01-01&periodEnd=2021-12-31' | jq . > measurereports/JustGender.json
# curl $FHIR'/Measure/JustAgeGroup/$evaluate-measure?periodStart=2000-01-01&periodEnd=2021-12-31' | jq . > measurereports/JustAgeGroup.json
# curl $FHIR'/Measure/JustLocation/$evaluate-measure?periodStart=2000-01-01&periodEnd=2021-12-31' | jq . > measurereports/JustLocation.json
# curl $FHIR'/Measure/AgeGroupGender/$evaluate-measure?periodStart=2000-01-01&periodEnd=2021-12-31' | jq . > measurereports/AgeGroupGender.json
# curl $FHIR'/Measure/AgeGroupGenderLocation/$evaluate-measure?periodStart=2000-01-01&periodEnd=2021-12-31' | jq . > measurereports/AgeGroupGenderLocation.json
# curl $FHIR'/Measure/Cohort/$evaluate-measure?periodStart=2000-01-01&periodEnd=2021-12-31' | jq . > measurereports/Cohort.json
# curl $FHIR'/Measure/SuppData/$evaluate-measure?periodStart=2000-01-01&periodEnd=2021-12-31' | jq . > measurereports/SuppData.json

# these don't format correctly
# cat measurereports/JustLocation.json | jq --raw-output '.group[] | [.stratifier[].stratum[].value.text,.measureScore.value] | @csv '
# cat measurereports/AgeGroupGenderLocation.json | jq --raw-output '.group[] | [.stratifier[].stratum[].value.text,.measureScore.value] | @csv '
# cat measurereports/JustLocation.json | jq --raw-output '.group[] | [.stratifier[].stratum[].value.text,.measureScore.value,.stratifier[].stratum[].population[].count ] | @csv '
