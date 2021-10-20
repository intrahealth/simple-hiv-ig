#!/bin/bash

# create bulk test data
rm -rf bulk/output/*
rm -rf input/fsh/bulk/*
cd bulk
./bulk-process.py female.template.fsh ru 20
./bulk-process.py male.template.fsh fr 20
cd ..
cp bulk/output/* input/fsh/bulk/

# use refresh hack
rm -rf output/
rm -rf input/resources/Library-* input/resources/library-*
sushi
mv fsh-generated/resources/Library-* input/resources/
bash _refresh.sh
bash _genonce.sh -no-sushi

curl -X PUT -H "Content-Type: application/fhir+json" --data @Library-FHIR-ModelInfo.json http://localhost:8080/cqf-ruler-r4/fhir/Library/FHIR-ModelInfo | jq .


cd output ; for FILE in OpenCR OpenHIE \
; do curl -X PUT -H "Content-Type: application/fhir+json" --data @CodeSystem-${FILE}.json http://localhost:8080/cqf-ruler-r4/fhir/CodeSystem/${FILE} | jq . ; done ; cd ../


cd output ; for FILE in FHIRHelpers FHIRCommon AgeRanges KitchenSink GoldenRecord Blaze \
; do curl -X PUT -H "Content-Type: application/fhir+json" --data @Library-${FILE}.json http://localhost:8080/cqf-ruler-r4/fhir/Library/${FILE} | jq . ; done ; cd ../


cd output ; for FILE in BlazeAgeGroupLocation BlazeGenderLocation BlazeStratifierTest BlazeStratifierAgeGroup \
JustGender JustAgeGroup JustLocation AgeGroupGender AgeGroupGenderLocation Cohort SuppData TXPVLS \
; do curl -X PUT -H "Content-Type: application/fhir+json" --data @Measure-${FILE}.json http://localhost:8080/cqf-ruler-r4/fhir/Measure/${FILE} | jq . ; done ; cd ..


# cat output/Bundle-Example-HIVSimple.json | curl -X POST -H "Content-Type: application/fhir+json" --data-binary @- http://localhost:8080/cqf-ruler-r4/fhir | jq .
# cat output/Bundle-Example-HIVSimple2.json | curl -X POST -H "Content-Type: application/fhir+json" --data-binary @- http://localhost:8080/cqf-ruler-r4/fhir | jq .


cd output ; for FILE in Bundle-Example-*.json ; do echo ${FILE} ; done ; cd ../
cd output ; for FILE in Bundle-Example-*.json ; do curl -X POST -H "Content-Type: application/fhir+json" --data @${FILE} http://localhost:8080/cqf-ruler-r4/fhir | jq . ; done ; cd ../



export FHIR="http://localhost:8080/cqf-ruler-r4/fhir"
curl $FHIR'/Measure/JustGender/$evaluate-measure?periodStart=2000&periodEnd=2021' | jq . > measurereports/JustGender.json
curl $FHIR'/Measure/JustAgeGroup/$evaluate-measure?periodStart=2000&periodEnd=2021' | jq . > measurereports/JustAgeGroup.json
curl $FHIR'/Measure/JustLocation/$evaluate-measure?periodStart=2000&periodEnd=2021' | jq . > measurereports/JustLocation.json
curl $FHIR'/Measure/AgeGroupGender/$evaluate-measure?periodStart=2000&periodEnd=2021' | jq . > measurereports/AgeGroupGender.json
curl $FHIR'/Measure/AgeGroupGenderLocation/$evaluate-measure?periodStart=2000&periodEnd=2021' | jq . > measurereports/AgeGroupGenderLocation.json
curl $FHIR'/Measure/Cohort/$evaluate-measure?periodStart=2000&periodEnd=2021' | jq . > measurereports/Cohort.json
curl $FHIR'/Measure/SuppData/$evaluate-measure?periodStart=2000&periodEnd=2021' | jq . > measurereports/SuppData.json
curl $FHIR'/Measure/TXPVLS/$evaluate-measure?periodStart=2000&periodEnd=2021' | jq . > measurereports/TXPVLS.json
curl $FHIR'/Measure/BlazeStratifierAgeGroup/$evaluate-measure?periodStart=2000&periodEnd=2021' | jq . > measurereports/BlazeStratifierAgeGroup.json
curl $FHIR'/Measure/BlazeAgeGroupLocation/$evaluate-measure?periodStart=2000&periodEnd=2021' | jq . > measurereports/BlazeAgeGroupLocation.json
curl $FHIR'/Measure/BlazeGenderLocation/$evaluate-measure?periodStart=2000&periodEnd=2021' | jq . > measurereports/BlazeGenderLocation.json
curl $FHIR'/Measure/BlazeStratifierTest/$evaluate-measure?periodStart=2000&periodEnd=2021' | jq . > measurereports/BlazeStratifierTest.json
curl $FHIR'/Measure/TXPVLS/$evaluate-measure?periodStart=2000&periodEnd=2021' | jq . > measurereports/TXPVLS.json
