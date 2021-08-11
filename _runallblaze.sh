#!/bin/bash

rm -rf output/
rm -rf fsh-generated/resources/
bash _genonce.sh

docker volume rm blaze-data
docker volume create blaze-data
# -t -d to keep running in background
docker run -t -d -p 8080:8080 -v blaze-data:/app/data samply/blaze:0.11.0
sleep 12

cd output ; for FILE in LocationCS OpenCR OpenHIE \
; do curl -X PUT -H "Content-Type: application/fhir+json" --data @CodeSystem-${FILE}.json http://localhost:8080/fhir/CodeSystem/${FILE} ; done ; cd ..

cd output ; for FILE in LocationVS \
; do curl -X PUT -H "Content-Type: application/fhir+json" --data @ValueSet-${FILE}.json http://localhost:8080/fhir/ValueSet/${FILE} ; done ; cd ..


cd output ; for FILE in FHIRHelpers FHIRCommon AgeRanges KitchenSink \
; do curl -X PUT -H "Content-Type: application/fhir+json" --data @Library-${FILE}.json http://localhost:8080/fhir/Library/${FILE} ; done ; cd ..

cd output ; for FILE in HIVSimpleAgeGroup HIVSimpleCondition HIVSimpleGender HIVSimpleGenderCohort \
HIVSimpleGenderSuppData HIVSimpleGenderSuppDataIndiv HIVSimpleGenderSubjectList HIVSimpleTestResult \
; do curl -X PUT -H "Content-Type: application/fhir+json" --data @Measure-${FILE}.json http://localhost:8080/fhir/Measure/${FILE} ; done ; cd ..

cat bundle.json | curl -X POST -H "Content-Type: application/fhir+json" --data-binary @- http://localhost:8080/fhir

open "http://localhost:8080/fhir/Measure/HIVSimpleGender/\$evaluate-measure?periodStart=1970&periodEnd=2021"

