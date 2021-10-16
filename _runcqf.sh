#!/bin/bash

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
HIVSimpleAgeGroup HIVSimpleCondition HIVSimpleGender HIVSimpleGenderCohort \
HIVSimpleGenderSuppData HIVSimpleGenderSuppDataIndiv HIVSimpleGenderSubjectList HIVSimpleTestResult \
; do curl -X PUT -H "Content-Type: application/fhir+json" --data @Measure-${FILE}.json http://localhost:8080/cqf-ruler-r4/fhir/Measure/${FILE} | jq . ; done ; cd ..


cat output/Bundle-Example-HIVSimple.json | curl -X POST -H "Content-Type: application/fhir+json" --data-binary @- http://localhost:8080/cqf-ruler-r4/fhir | jq .
cat output/Bundle-Example-HIVSimple2.json | curl -X POST -H "Content-Type: application/fhir+json" --data-binary @- http://localhost:8080/cqf-ruler-r4/fhir | jq .


export FHIR="http://localhost:8080/cqf-ruler-r4/fhir"
curl $FHIR'/Measure/HIVSimpleAgeGroup/$evaluate-measure?periodStart=2021&periodEnd=2021' | jq .
curl $FHIR'/Measure/HIVSimpleCondition/$evaluate-measure?periodStart=2021&periodEnd=2021' | jq .
curl $FHIR'/Measure/HIVSimpleGender/$evaluate-measure?periodStart=2021&periodEnd=2021' | jq .
curl $FHIR'/Measure/HIVSimpleGenderCohort/$evaluate-measure?periodStart=2021&periodEnd=2021' | jq .
curl $FHIR'/Measure/HIVSimpleGenderSubjectList/$evaluate-measure?periodStart=2021&periodEnd=2021' | jq .
curl $FHIR'/Measure/HIVSimpleGenderSuppData/$evaluate-measure?periodStart=2021&periodEnd=2021' | jq .
curl $FHIR'/Measure/HIVSimpleGenderSuppDataIndiv/$evaluate-measure?periodStart=2021&periodEnd=2021' | jq .
curl $FHIR'/Measure/HIVSimpleTestResult/$evaluate-measure?periodStart=2021&periodEnd=2021' | jq .
curl $FHIR'/Measure/BlazeStratifierAgeGroup/$evaluate-measure?periodStart=2021&periodEnd=2021' | jq .
curl $FHIR'/Measure/BlazeAgeGroupLocation/$evaluate-measure?periodStart=2021&periodEnd=2021' | jq .
curl $FHIR'/Measure/BlazeGenderLocation/$evaluate-measure?periodStart=2021&periodEnd=2021' | jq .
curl $FHIR'/Measure/BlazeStratifierTest/$evaluate-measure?periodStart=2021&periodEnd=2021' | jq .
