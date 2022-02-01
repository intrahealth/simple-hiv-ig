#!/bin/bash

# create bulk test data
cd input/examples-src
./bulk-process.py female.template.fsh ru 4
./bulk-process.py male.template.fsh fr 4
cp output/* ../fsh/bulk/
cd ../..

echo "Exit code: ${?}"