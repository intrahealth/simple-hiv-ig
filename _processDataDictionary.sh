#!/bin/bash
#DO NOT EDIT WITH WINDOWS
# tooling_jar=tooling-2.3.0-SNAPSHOT-jar-with-dependencies.jar
tooling_jar=tooling-cli-2.3.0-SNAPSHOT.jar
input_cache_path=./input-cache
datadictionary_filename="WHO-UCN-HHS-SIA-2022.1-eng.xlsx"

datadictionary_sheetname="\
HIV.A. Registration,\
HIV.B. HTS Visit,\
HIV.C. PrEP Visit,\
HIV.D. Care-Treatment Core,\
HIV.D.Care-Treatment Additional,\
HIV.D. TB-HIV,\
HIV.E-F. PMTCT,\
HIV.G. Diagnostics,\
HIV.H. Follow Up,\
HIV.I. Referral,\
HIV. Surveillance"
# HIV. Configuration,\

printf "$datadictionary_sheetname"

scope="HIV"

set -e

tooling=$input_cache_path/$tooling_jar
if test -f "$tooling"; then
	JAVA -jar $tooling -ProcessAcceleratorKit -s=$scope -pts=./input/l2/"$datadictionary_filename" -dep="$datadictionary_sheetname" -op=.
else
	tooling=../$tooling_jar
	echo $tooling
	if test -f "$tooling"; then
		JAVA -jar $tooling -ProcessAcceleratorKit -s=$scope -pts=./input/l2/"$datadictionary_filename" -dep="$datadictionary_sheetname" -op=.
	else
		echo ProcessAcceloratorKit NOT FOUND in input-cache or parent folder.  Please run _updateCQFTooling.  Aborting...
	fi
fi