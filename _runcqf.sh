#!/bin/bash

# git checkout feature-stratification
# mvn package
# docker build -t cqf .
# docker run -p "8080:8080" cqf

# in another terminal or docker (above):
# git checkout feature-stratification
# mvn jetty:run -am --projects cqf-ruler-r4

# cleanup
rm -rf fsh-generated/resources/*
rm -rf input/examples-src/output/*
rm -rf input/fsh/bulk/*
rm -rf output/
rm -rf input/resources/Library-* input/resources/library-*

# create bulk test data
cd input/examples-src
./bulk-process.py female.template.fsh ru 4
./bulk-process.py male.template.fsh fr 4
cp output/* ../fsh/bulk/
cd ../..

# use refresh hack
sushi
mv fsh-generated/resources/Library-* input/resources/ 
bash _refresh.sh 
bash _genonce.sh -no-sushi 

# export FHIR="https://cds-sandbox.alphora.com/cqf-ruler-r4/fhir"
export FHIR="http://localhost:8080/cqf-ruler-r4/fhir"
export HEADER="Content-Type: application/fhir+json"

curl -X PUT -H "$HEADER" --data @Library-FHIR-ModelInfo.json $FHIR/Library/FHIR-ModelInfo | jq .
curl -X PUT -H "$HEADER" --data @output/Device-cqf-tooling.json $FHIR/Device/cqf-tooling | jq .

for FILE in OpenCR OpenHIE PEPFAR ; do curl -X PUT -H "$HEADER" \
--data @output/CodeSystem-${FILE}.json $FHIR/CodeSystem/${FILE} | jq . ; done

for FILE in FHIRHelpers FHIRCommon KitchenSink \
HIVConcepts HIVDataElements HIVStratifiers TXCURR TXNEW TXPVLS TXML \
; do curl -X PUT -H "$HEADER" --data @output/Library-${FILE}.json $FHIR/Library/${FILE} | jq . ; done

for FILE in JustGender JustAgeGroup JustLocation AgeGroupGender AgeGroupGenderLocation Cohort SuppData \
HIV-TXCURR HIV-TXML HIV-TXNEW HIV-TXPVLS \
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

curl $FHIR'/Measure/JustGender/$evaluate-measure?periodStart=2000&periodEnd=2021' | jq . 
curl $FHIR'/Measure/JustAgeGroup/$evaluate-measure?periodStart=2000&periodEnd=2021' | jq . 
curl $FHIR'/Measure/JustLocation/$evaluate-measure?periodStart=2000&periodEnd=2021' | jq . 
curl $FHIR'/Measure/AgeGroupGenderLocation/$evaluate-measure?periodStart=2000&periodEnd=2021' | jq . 

curl $FHIR'/Measure/HIV-TXCURR/$evaluate-measure?periodStart=2000&periodEnd=2021' | jq . 
curl $FHIR'/Measure/HIV-TXML/$evaluate-measure?periodStart=2000&periodEnd=2021' | jq . 
curl $FHIR'/Measure/HIV-TXNEW/$evaluate-measure?periodStart=2000&periodEnd=2021' | jq . 
curl $FHIR'/Measure/HIV-TXPVLS/$evaluate-measure?periodStart=2000&periodEnd=2021' | jq . 

curl $FHIR'/Measure/JustGender/$evaluate-measure?periodStart=2000&periodEnd=2021' | jq . > measurereports/JustGender.json
curl $FHIR'/Measure/JustAgeGroup/$evaluate-measure?periodStart=2000&periodEnd=2021' | jq . > measurereports/JustAgeGroup.json
curl $FHIR'/Measure/JustLocation/$evaluate-measure?periodStart=2000&periodEnd=2021' | jq . > measurereports/JustLocation.json
curl $FHIR'/Measure/AgeGroupGender/$evaluate-measure?periodStart=2000&periodEnd=2021' | jq . > measurereports/AgeGroupGender.json
curl $FHIR'/Measure/AgeGroupGenderLocation/$evaluate-measure?periodStart=2000&periodEnd=2021' | jq . > measurereports/AgeGroupGenderLocation.json
curl $FHIR'/Measure/Cohort/$evaluate-measure?periodStart=2000&periodEnd=2021' | jq . > measurereports/Cohort.json
curl $FHIR'/Measure/SuppData/$evaluate-measure?periodStart=2000&periodEnd=2021' | jq . > measurereports/SuppData.json

# these don't format correctly
# cat measurereports/JustLocation.json | jq --raw-output '.group[] | [.stratifier[].stratum[].value.text,.measureScore.value] | @csv '
# cat measurereports/AgeGroupGenderLocation.json | jq --raw-output '.group[] | [.stratifier[].stratum[].value.text,.measureScore.value] | @csv '
# cat measurereports/JustLocation.json | jq --raw-output '.group[] | [.stratifier[].stratum[].value.text,.measureScore.value,.stratifier[].stratum[].population[].count ] | @csv '
