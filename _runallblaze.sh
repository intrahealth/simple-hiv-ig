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




curl -sXPOST 'http://localhost:8080/fhir/Measure/BlazeStratifierTest/$evaluate-measure?periodStart=1970-01-01&periodEnd=2021-01-01'

curl -sXPOST 'http://localhost:8080/fhir/Measure/BlazeStratifierTest/$evaluate-measure?&periodStart=1970&periodEnd=2030&reportType=subject-list'

curl -sXPOST 'http://localhost:8080/fhir/List/C6Z335LK5BC4RV4C' | jq

# subject-list must be a POST
# curl -sXPOST 'http://localhost:8080/fhir/Measure/$evaluate-measure?measure=urn:uuid:49f4c7de-3320-4208-8e60-ecc0d8824e08&periodStart=2000&periodEnd=2030&reportType=subject-list'



