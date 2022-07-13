#/usr/bin/env bash


cd $HOME/src/github.com/synthetichealth/synthea
rm -rf output
git checkout -- src/main/resources/modules/lookup_tables/hiv_diagnosis_early.csv
git checkout -- src/main/resources/modules/lookup_tables/hiv_diagnosis_later.csv
git checkout -- src/main/resources/modules/lookup_tables/hiv_mortality_very_early.csv
git checkout -- src/main/resources/modules/lookup_tables/hiv_mortality_early.csv
git checkout -- src/main/resources/modules/lookup_tables/hiv_mortality_later.csv

python3 $HOME/src/github.com/intrahealth/simple-hiv-ig/input/examples-src/synthea/increaseprev.py

# run it: this works
# this stops it from looping forever to keep patient alive: --generate.max_attempts_to_keep_patient 10
./run_synthea -p 1000 -s 123 --exporter.use_uuid_filenames true --exporter.years_of_history 0 --exporter.baseDirectory ./output --exporter.fhir.use_us_core_ig false --generate.max_attempts_to_keep_patient 10
