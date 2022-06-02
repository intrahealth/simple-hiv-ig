#!/bin/bash

# in another terminal:
# git clone git@github.com:DBCG/cqf-ruler.git
# cd cqf-ruler
# git checkout feature-stratification
# mvn jetty:run -am --projects cqf-ruler-r4


# run sep cleanup script
./_runcleanup.sh

# create bulk test data
# ./_runcreate.sh

# use refresh hack
sushi .

mv fsh-generated/resources/Library-* input/resources/
# put test cases in place
# todo to add: QR, Parameters, Contract
CASE=('DataContract' 'AgeRanges' 'Dedupe' 'KitchenSink' 'HIVIndicators' 'DASHStratifiers' 'TXCURR' 'TXML' 'TXNEW' 'TXPVLS' 'HTSTST' 'PMTCTSTAT' 'PMTCTART')
 
for case in "${CASE[@]}"
do
    cp fsh-generated/resources/Bundle-Example-HIVSimple.json input/tests/${case}/Patient-HIVSimple
    cp fsh-generated/resources/Bundle-Example-HIVSimple2.json input/tests/${case}/Patient-HIVSimple2
done

# vocabulary
mv fsh-generated/resources/CodeSystem-* input/vocabulary/codesystem/
mv fsh-generated/resources/ValueSet-* input/vocabulary/valueset/

# bash _refresh.sh 
# bash _genonce.sh -no-sushi 

# load data
# ./_runload.sh

# echo "Exit code: ${?}"