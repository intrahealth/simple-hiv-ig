#!/bin/bash

# load data script
jq --version

# convenience
export FHIR="https://cloud.alphora.com/sandbox/r4/cqm/fhir"
# export FHIR="http://hapi.fhir.org/baseR4"
export HEADER="Content-Type: application/fhir+json"

# PUT
for FILE in EasyLib ; do curl -X PUT -H "$HEADER" --data @output/Library-${FILE}.json $FHIR/Library/${FILE} | jq . ; done
for FILE in Easy ; do curl -X PUT -H "$HEADER" --data @output/Measure-${FILE}.json $FHIR/Measure/${FILE} | jq . ; done

# confirm
curl $FHIR'/Library/EasyLib'
curl $FHIR'/Measure/Easy'

# profit
curl $FHIR'/Measure/Easy/$evaluate-measure?periodStart=1960-01-01&periodEnd=2022-12-31&subject=numerator&reportType=subject' | jq . 
curl $FHIR'/Measure/Easy/$evaluate-measure?periodStart=1960-01-01&periodEnd=2022-12-31' | jq . 

# fyi: result for using fhirpath as numerator
# "Failed to call access method: java.lang.IllegalArgumentException: 
# Measure https://intrahealth.github.io/simple-hiv-ig/Measure/Easy does not have a primary library specified"

