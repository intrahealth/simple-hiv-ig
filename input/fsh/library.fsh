// Usage: #example is the default, so omitted
// * title is unnecessary
// * name is unnecessary
// * id is unnecessary

RuleSet: lib-common
* status = #draft
* experimental = true
* type = #logic-library

Instance: AgeRanges
InstanceOf: Library
* insert lib-common
* content.id = "ig-loader-AgeRanges.cql"

Instance: FHIRCommon
InstanceOf: Library
* insert lib-common
* content.id = "ig-loader-FHIRCommon.cql"

Instance: HIVSimpleAgeGroup
InstanceOf: Library
* insert lib-common
* content.id = "ig-loader-HIVSimpleAgeGroup.cql"

Instance: HIVSimpleCondition
InstanceOf: Library
* insert lib-common
* content.id = "ig-loader-HIVSimpleCondition.cql"

Instance: HIVSimpleDemog
InstanceOf: Library
* insert lib-common
* content.id = "ig-loader-HIVSimpleDemog.cql"

Instance: HIVSimpleGender
InstanceOf: Library
* insert lib-common
* content.id = "ig-loader-HIVSimpleGender.cql"

Instance: HIVSimpleTestResult
InstanceOf: Library
* insert lib-common
* content.id = "ig-loader-HIVSimpleTestResult.cql"

Instance: HIVSimpleViralLoad
InstanceOf: Library
* insert lib-common
* content.id = "ig-loader-HIVSimpleViralLoad.cql"


RuleSet: lib-bundle
* entry[=].request.url = "Library"
* entry[=].request.method = #PUT

// weird, only the cql is included, not the elm
Instance: HIVSimple-Library
InstanceOf: Bundle
* type = #transaction

* entry[+].fullUrl = "http://www.example.org/fhir/Library/AgeRanges"
* entry[=].resource = AgeRanges
* insert lib-bundle

* entry[+].fullUrl = "http://www.example.org/fhir/Library/FHIRCommon"
* entry[=].resource = FHIRCommon
* insert lib-bundle

* entry[+].fullUrl = "http://www.example.org/fhir/Library/HIVSimpleAgeGroup"
* entry[=].resource = HIVSimpleAgeGroup
* insert lib-bundle

* entry[+].fullUrl = "http://www.example.org/fhir/Library/HIVSimpleCondition"
* entry[=].resource = HIVSimpleCondition
* insert lib-bundle

* entry[+].fullUrl = "http://www.example.org/fhir/Library/HIVSimpleDemog"
* entry[=].resource = HIVSimpleDemog
* insert lib-bundle

* entry[+].fullUrl = "http://www.example.org/fhir/Library/HIVSimpleGender"
* entry[=].resource = HIVSimpleGender
* insert lib-bundle

* entry[+].fullUrl = "http://www.example.org/fhir/Library/HIVSimpleTestResult"
* entry[=].resource = HIVSimpleTestResult
* insert lib-bundle

* entry[+].fullUrl = "http://www.example.org/fhir/Library/HIVSimpleViralLoad"
* entry[=].resource = HIVSimpleViralLoad
* insert lib-bundle
