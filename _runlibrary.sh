#!/bin/bash

# run sep cleanup script
./_runcleanup.sh

# todo: bulk data
# ./_runcreate.sh

# export FHIR="http://localhost:8080/cqf-ruler-r4/fhir"
export FHIR="https://cloud.alphora.com/sandbox/r4/cqm/fhir"
export HEADER="Content-Type: application/fhir+json"

# use refresh hack
sushi
mv fsh-generated/resources/Library-* input/resources/
bash _refresh.sh
bash _genonce.sh -no-sushi

cd output
curl -X PUT -H "$HEADER" --data @Library-DataContract.json $FHIR/Library/DataContract | jq .

# must POST a transaction bundle of POST methods on each resource
for FILE in Bundle-Example-*.json ; do echo ${FILE} ; done
for FILE in Bundle-Example-*.json ; do curl -XPOST -H "$HEADER" --data @${FILE} $FHIR | jq . ; done

curl '${FHIR}/Patient/1520' | jq .

curl https://cloud.alphora.com/sandbox/r4/cqm/fhir/Patient/1520

curl https://cloud.alphora.com/sandbox/r4/cqm/fhir/Library/DataContract/$evaluate?subject=Patient/1520




# curl 'http://localhost:8080/cqf-ruler-r4/fhir/Library/DataContract/$evaluate?subject=21' | jq . 

# curl 'http://localhost:8080/cqf-ruler-r4/fhir/Library/DataContract/$evaluate?subject=Patient/21' | jq .