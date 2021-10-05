#!/bin/bash
#DO NOT EDIT WITH WINDOWS
tooling_jar=tooling-1.3.1-SNAPSHOT-jar-with-dependencies.jar
input_cache_path=./input-cache
resources_path=$PWD/input/resources
# resources_path=$PWD/fsh-generated/resources
# ig_resource_path=./input/anc-cds.xml
# ig_resource_path=./fsh-generated/resources/ImplementationGuide-simple.hiv.ig.json
ig_ini_path=$PWD/ig.ini

set -e
echo Checking internet connection...
wget -q --spider tx.fhir.org

if [ $? -eq 0 ]; then
	echo "Online"
	fsoption=""
#"-fs http://cds-sandbox.alphora.com/cqf-ruler-r4/fhir/"
else
	echo "Offline"
	fsoption=""
fi

echo "$fsoption"

tooling=$input_cache_path/$tooling_jar
if test -f "$tooling"; then
	JAVA -jar $tooling -RefreshIG -ini="$ig_ini_path" -d -p -t $fsoption
else
	tooling=../$tooling_jar
	echo $tooling
	if test -f "$tooling"; then
		JAVA -jar $tooling -RefreshIG -ini="$ig_ini_path" -d -p -t $fsoption
	else
		echo IG Refresh NOT FOUND in input-cache or parent folder.  Please run _updateCQFTooling.  Aborting...
	fi
fi