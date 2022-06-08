#!/bin/bash

# run sep cleanup script
./_runcleanup.sh

sushi .

# move vocabulary, libraries to the right place
mv fsh-generated/resources/CodeSystem-* input/vocabulary/codesystem/manual/
mv fsh-generated/resources/ValueSet-* input/vocabulary/valueset/manual/
mv fsh-generated/resources/Library-* input/resources/

bash _refresh.sh
bash _genonce.sh -no-sushi 

export FHIR="https://blaze.life.uni-leipzig.de/fhir"
# export FHIR="https://cloud.alphora.com/sandbox/r4/cqm/fhir"
# export FHIR="http://hapi.fhir.org/baseR4"
export HEADER="Content-Type: application/fhir+json"

# PUT
# curl -X PUT -H "$HEADER" --data @Library-FHIR-ModelInfo.json $FHIR/Library/FHIR-ModelInfo | jq .
curl -X PUT -H "$HEADER" --data @output/Device-cqf-tooling.json $FHIR/Device/cqf-tooling | jq .

for FILE in FHIRHelpers FHIRCommon EasyLib ; do curl -X PUT -H "$HEADER" --data @output/Library-${FILE}.json $FHIR/Library/${FILE} | jq . ; done
# for FILE in FHIRHelpers FHIRCommon EasyLib ; do curl -X PUT -H "$HEADER" --data @output/Library-${FILE}.json $FHIR/Library/${FILE} | jq . ; done
# for FILE in FHIRHelpers FHIRCommon EasyLib ; do curl -X PUT -H "$HEADER" --data @input/resources/Library-${FILE}.json $FHIR/Library/${FILE} | jq . ; done
# for FILE in EasyLib ; do curl -X PUT -H "$HEADER" --data @input/resources/Library-${FILE}.json $FHIR/Library/${FILE} | jq . ; done

for FILE in Easy ; do curl -X PUT -H "$HEADER" --data @output/Measure-${FILE}.json $FHIR/Measure/${FILE} | jq . ; done
# for FILE in Easy ; do curl -X PUT -H "$HEADER" --data @fsh-generated/resources/Measure-${FILE}.json $FHIR/Measure/${FILE} | jq . ; done

# confirm
curl $FHIR'/Library/EasyLib'
curl $FHIR'/Measure/Easy'

echo "Exit code: ${?}"

# profit
curl -H "$HEADER" $FHIR'/Measure/Easy/$evaluate-measure?periodStart=2019-01-01&periodEnd=2022-12-31' | jq . 
# curl -H "$HEADER" $FHIR'/Measure/Easy/$evaluate-measure?periodStart=1960-01-01&periodEnd=2022-12-31&subject=numerator&reportType=subject' | jq . 


# fyi: result for using fhirpath as numerator
# "Failed to call access method: java.lang.IllegalArgumentException: 
# Measure https://intrahealth.github.io/simple-hiv-ig/Measure/Easy does not have a primary library specified"

