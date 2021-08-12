#!/bin/bash

# rm -rf output/
# rm -rf fsh-generated/resources/
# bash _genonce.sh

cd output ; for FILE in LocationCS OpenCR OpenHIE \
; do curl -X PUT -H "Content-Type: application/fhir+json" --data @CodeSystem-${FILE}.json http://localhost:8080/fhir/CodeSystem/${FILE} ; done ; cd ..

cd output ; for FILE in LocationVS \
; do curl -X PUT -H "Content-Type: application/fhir+json" --data @ValueSet-${FILE}.json http://localhost:8080/fhir/ValueSet/${FILE} ; done ; cd ..


cd output ; for FILE in Blaze \
; do curl -X PUT -H "Content-Type: application/fhir+json" --data @Library-${FILE}.json http://localhost:8080/fhir/Library/${FILE} ; done ; cd ..

cd output ; for FILE in BlazeStratifierTest \
; do curl -X PUT -H "Content-Type: application/fhir+json" --data @Measure-${FILE}.json http://localhost:8080/fhir/Measure/${FILE} ; done ; cd ..

cat bundle.json | curl -X POST -H "Content-Type: application/fhir+json" --data-binary @- http://localhost:8080/fhir

open "http://localhost:8080/fhir/Measure/BlazeStratifierTest/$evaluate-measure?periodStart=1970-01-01&periodEnd=2021-01-01"

