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
sushi
mv fsh-generated/resources/Library-* input/resources/ 
bash _refresh.sh 
bash _genonce.sh -no-sushi 

# load data
# ./_runload.sh

echo "Exit code: ${?}"