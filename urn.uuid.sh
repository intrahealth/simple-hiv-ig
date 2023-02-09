#!/bin/bash

# notes
# canonicals: canonical URL serves as a stable logical identifier for the resource, 
# and is the preferred way to reference a conformance or knowledge resource.

# urn:uuid in fhir must be lowercase in fhir

# item identifiers: If the item has a name, the id SHOULD be based on the item’s name, 
# with _ replaced by -, changed to lowercase, and truncated if necessary

# cant submit urn:uuid in separate linked bundles

# all bundles are submitted as POST
#  urn:uuid
# in instance
# Reference(noquotes urn:uuid)
#  in bundle 
# .reference (leave out urn:uuid, no quotes): .resource = aaaaaaaa-bbbb-cccc-dddd-e00111100001
# fullUrl = "urn:uuid:aaaaaaaa-bbbb-cccc-dddd-e00111100003"
# urn:uuid in a bundle trans bundle then hapi will resolve them
# or just uuid - just generate them, then PUT in the trans bundle
# if POST: urn:uuid:123e4567-e89b-12d3-a456-426655440000
# fullurl can be: urn:uuid:123e4567-e89b-12d3-a456-426655440000
# if you want to preserve DHIS2 UIDs you can do v3 UUID which is an md5 hash (of the UID) 
# that was the approach we did with (m)CSD facade for DHIS2
# for v3: generate v3
# preserve actual uid as identifier



declare -a loc=(
    "Location-HIVSimple"
    "Location-HIVSimple2"
    "Location-100"
    "Location-101"
    "Location-102"
    )

declare -a org=(
    "Organization-HIVSimple"
    "Organization-HIVSimple2"
    "Organization-100"
    "Organization-101"
    "Organization-102"
    "IntraHealth"
    )


ns="https://intrahealth.github.io/simple-hiv-ig/"
echo "Appended before hashing: ${ns}"

# this doesn't use the hashed url first, just the full url
# must use quotes around "${loc[@]}"
for i in "${loc[@]}"
do
    # v5 sha1 hash - recommended
    c=`uuid -v5 ns:URL ${ns}Location/${i}`
    echo "$i: urn:uuid:${c}"
done

for i in "${org[@]}"
do
    # v5 sha1 hash - recommended
    c=`uuid -v5 ns:URL ${ns}Organization/${i}`
    echo "$i: urn:uuid:${c}"
done


# OSSP uuid - Universally Unique Identifier Command-Line Tool
# For version 3 and version 5 UUIDs the additional command line arguments namespace and name have to be given. 
# The namespace is either a UUID in string representation or an identifier for internally pre-defined namespace UUIDs 
# (currently known are "ns:DNS", "ns:URL", "ns:OID", and "ns:X500"). The name is a string of arbitrary length.

# output:
# $ bash urn.uuid.sh
# Appended before hashing: https://intrahealth.github.io/simple-hiv-ig/
# Location-HIVSimple1: urn:uuid:b8cc8bf5-7f24-599b-80d4-bd0cf274021f
# Location-HIVSimple2: urn:uuid:e2c6ad14-3d00-5340-8d14-7ea67a5a04f5
# Location-100: urn:uuid:1dc4e26c-944f-5774-92dd-2d7bac17efc8
# Location-101: urn:uuid:697211cf-35ba-5b7a-b8c0-8bbc3413dc53
# Location-102: urn:uuid:51d3ade0-5d6b-5f51-be7e-a9b93e340cc2

# Organization-HIVSimple: urn:uuid:bfe60be6-1352-5bf5-bd00-4c7289cb1910
# Organization-HIVSimple2: urn:uuid:bc01a25b-488d-5b7a-ba8a-b49ce00bdd47
# Organization-100: urn:uuid:2f433b23-ceb6-54b2-8d62-638bf4060059
# Organization-101: urn:uuid:7e520e4a-65e3-5a54-bfef-c416eb5daf43
# Organization-102: urn:uuid:71dc6949-e4a7-56d8-bc7d-95abf8534570
# IntraHealth: urn:uuid:23edadd0-4d64-5bbc-9f6d-390bed51ed4e

# entry[1].fullUrl = "urn:uuid:2b90dd2b-2dab-4c75-9bb9-a355e07401e8"
# Instance:   593cd04e-b696-45c1-bc32-39e55a340a44