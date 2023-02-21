#!/bin/bash

# run sep cleanup script
./_runcleanup.sh

# use refresh hack, mind the .
sushi

# move vocabulary, libraries to the right place
cp fsh-generated/resources/CodeSystem-* input/vocabulary/codesystem/manual/
cp fsh-generated/resources/ValueSet-* input/vocabulary/valueset/manual/
cp fsh-generated/resources/Library-* input/resources/library/

# put test cases in place
# todo to add: QR, Parameters
CASE=('QR' 'EasyLib' 'DASHConcepts' 'DASHDataElements' 'Analytics' 'AgeRanges' 'Dedupe' 'KitchenSink' 'HIVIndicators' 'DASHStratifiers' 'TXCURR' 'TXML' 'TXNEW' 'TXPVLS' 'HTSTST' 'PMTCTSTAT' 'PMTCTART')
 
for case in "${CASE[@]}"
do
    cp fsh-generated/resources/Bundle-Example-HIVSimple.json input/tests/${case}/Patient-HIVSimple
    cp fsh-generated/resources/Bundle-Example-HIVSimple2.json input/tests/${case}/Patient-HIVSimple2
done

bash _refresh.sh 
bash _genonce.sh -no-sushi 

# load data
# ./_runload.sh

echo "Exit code: ${?}"