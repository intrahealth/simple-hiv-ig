#!/bin/bash

# in another terminal or docker (above):
# can run on master
# mvn jetty:run -am --projects cqf-ruler-r4

export FHIR="http://localhost:8080/cqf-ruler-r4/fhir"
export HEADER="Content-Type: application/fhir+json"

# create bulk test data
rm -rf bulk/output/*
rm -rf input/fsh/bulk/*

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

cd output ; for FILE in FHIRHelpers FHIRCommon AgeRanges KitchenSink GoldenRecord Blaze Dedupe \
; do curl -X PUT -H "$HEADER" --data @Library-${FILE}.json $FHIR/Library/${FILE} | jq . ; done ; cd ../

# must POST a transaction bundle of POST methods on each resource
cd output ; for FILE in Bundle-Example-*.json ; do echo ${FILE} ; done ; cd ../
cd output ; for FILE in Bundle-Example-*.json ; do curl -XPOST -H "$HEADER" --data @${FILE} $FHIR | jq . ; done ; cd ../

curl 'http://localhost:8080/cqf-ruler-r4/fhir/Patient' | jq .

curl 'http://localhost:8080/cqf-ruler-r4/fhir/Library/Dedupe/$evaluate?subject=21' | jq . 

curl 'http://localhost:8080/cqf-ruler-r4/fhir/Library/Dedupe/$evaluate?subject=Patient/21' | jq .