Alias: $OpenCR = https://intrahealth.github.io/simple-hiv-ig/CodeSystem/OpenCR
Alias: $OpenHIE = https://intrahealth.github.io/simple-hiv-ig/CodeSystem/OpenHIE
Alias: $HIV = https://intrahealth.github.io/simple-hiv-ig/CodeSystem/LocationCS
Alias: $HIVVS = https://intrahealth.github.io/simple-hiv-ig/ValueSet/LocationVS

CodeSystem: OpenCR
Id: OpenCR
Title: "OpenCR CodeSystem"
Description: "OpenCR CodeSystem"
* ^url = $OpenCR
* #1234 "Golden Record"

CodeSystem: OpenHIE
Id: OpenHIE
Title: "OpenHIE CodeSystem"
Description: "OpenHIE CodeSystem"
* ^url = $OpenHIE
* #cohort "cohort"

// location stuff for tests

CodeSystem: LocationCS
Id: LocationCS
Title: "LocationCS"
Description: "LocationCS"
* ^url = $HIV
* #Location-HIVSimple "Location-HIVSimple"
* #Location-HIVSimple2 "Location-HIVSimple2"

ValueSet: LocationVS
Id: LocationVS
Title: "LocationVS"
Description: "LocationVS"
* include codes from system LocationCS
* ^url = $HIVVS
