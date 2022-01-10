#!/bin/bash

docker volume create blaze-data
docker run -d --name=blaze -p 8080:8080 -v blaze-data:/app/data samply/blaze:latest


export FHIR="http://localhost:8080/fhir"
export HEADER="Content-Type: application/fhir+json"


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


curl -X PUT -H "$HEADER" --data @Library-FHIR-ModelInfo.json $FHIR/Library/FHIR-ModelInfo | jq .


cd output ; for FILE in cqf-tooling \
; do curl -X PUT -H "$HEADER" --data @Device-${FILE}.json $FHIR/Device/${FILE} | jq . ; done ; cd ..


cd output ; for FILE in OpenCR OpenHIE \
; do curl -X PUT -H "$HEADER" --data @CodeSystem-${FILE}.json $FHIR/CodeSystem/${FILE} | jq . ; done ; cd ../


cd output ; for FILE in FHIRHelpers Blaze \
; do curl -X PUT -H "$HEADER" --data @Library-${FILE}.json $FHIR/Library/${FILE} | jq . ; done ; cd ../


cd output ; for FILE in BlazeAgeGroupLocation BlazeGenderLocation BlazeStratifierTest BlazeStratifierAgeGroup \
; do curl -X PUT -H "$HEADER" --data @Measure-${FILE}.json $FHIR/Measure/${FILE} | jq . ; done ; cd ..


# cat output/Bundle-Example-HIVSimple.json | curl -X POST -H "$HEADER" --data-binary @- $FHIR | jq .
# cat output/Bundle-Example-HIVSimple2.json | curl -X POST -H "Content-Type: application/fhir+json" --data-binary @- $FHIR | jq .


cd output ; for FILE in Bundle-Example-*.json ; do echo ${FILE} ; done ; cd ../
# errors here
cd output ; for FILE in Bundle-Example-*.json ; do curl -X POST -H "$HEADER" --data @${FILE} $FHIR | jq . ; done ; cd ../


curl $FHIR'/Measure/BlazeStratifierAgeGroup/$evaluate-measure?periodStart=2000&periodEnd=2021' | jq . > measurereports/BlazeStratifierAgeGroup.json
curl $FHIR'/Measure/BlazeAgeGroupLocation/$evaluate-measure?periodStart=2000&periodEnd=2021' | jq . > measurereports/BlazeAgeGroupLocation.json
curl $FHIR'/Measure/BlazeGenderLocation/$evaluate-measure?periodStart=2000&periodEnd=2021' | jq . > measurereports/BlazeGenderLocation.json
curl $FHIR'/Measure/BlazeStratifierTest/$evaluate-measure?periodStart=2000&periodEnd=2021' | jq . > measurereports/BlazeStratifierTest.json


# cat bundle.json | curl -X POST -H "Content-Type: application/fhir+json" --data-binary @- http://localhost:8080/fhir

curl -sXPOST $FHIR'/Measure/BlazeStratifierTest/$evaluate-measure?periodStart=1970-01-01&periodEnd=2021-01-01'
curl -sXPOST $FHIR'/Measure/BlazeStratifierTest/$evaluate-measure?&periodStart=1970&periodEnd=2030&reportType=subject-list'

# curl -sXPOST $FHIR'/List/C6Z335LK5BC4RV4C' | jq

# subject-list must be a POST
# curl -sXPOST 'http://localhost:8080/fhir/Measure/$evaluate-measure?measure=urn:uuid:49f4c7de-3320-4208-8e60-ecc0d8824e08&periodStart=2000&periodEnd=2030&reportType=subject-list'



docker stop blaze
docker rm blaze
docker volume rm blaze-data