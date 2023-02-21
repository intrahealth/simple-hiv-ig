#!/bin/bash

# run sep cleanup script
./_runcleanup.sh

# use refresh hack
sushi

# move vocabulary, libraries to the right place
cp fsh-generated/resources/CodeSystem-* input/vocabulary/codesystem/manual/
cp fsh-generated/resources/ValueSet-* input/vocabulary/valueset/manual/
cp fsh-generated/resources/Library-* input/resources/library/


bash _refresh.sh
bash _genonce.sh -no-sushi

# export FHIR="http://localhost:8080/cqf-ruler-r4/fhir"
export FHIR="https://cloud.alphora.com/sandbox/r4/cqm/fhir"
export HEADER="Content-Type: application/fhir+json"

cd output

# libaries
for FILE in Analytics FHIRHelpers FHIRCommon DASHConcepts DASHDataElements DASHStratifiers TXCURR TXNEW TXPVLS TXML HTSTST \
; do curl -X PUT -H "$HEADER" --data @output/Library-${FILE}.json $FHIR/Library/${FILE} | jq . ; done

# curl -X PUT -H "$HEADER" --data @output/Library-FHIRCommon.json $FHIR/Library/FHIRCommon | jq .
# curl -X PUT -H "$HEADER" --data @output/Library-DASHConcepts.json $FHIR/Library/DASHConcepts | jq .
# curl -X PUT -H "$HEADER" --data @output/Library-Analytics.json $FHIR/Library/Analytics | jq .

# must POST a transaction bundle of POST methods on each resource
for FILE in Bundle-Example-*.json ; do echo ${FILE} ; done
for FILE in Bundle-Example-*.json ; do curl -XPOST -H "$HEADER" --data @${FILE} $FHIR | jq . ; done

cd ../

# curl '${FHIR}/Patient/1520' | jq .
# curl https://cloud.alphora.com/sandbox/r4/cqm/fhir/Patient/89
# curl https://cloud.alphora.com/sandbox/r4/cqm/fhir/Library/Analytics/$evaluate?subject=Patient/89





# curl 'http://localhost:8080/cqf-ruler-r4/fhir/Library/Analytics/$evaluate?subject=21' | jq . 

# curl 'http://localhost:8080/cqf-ruler-r4/fhir/Library/Analytics/$evaluate?subject=Patient/21' | jq .