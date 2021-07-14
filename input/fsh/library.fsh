// Usage: #example is the default, so omitted
// * title is unnecessary
// * name is unnecessary
// * id is unnecessary

// libraries

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

Instance: KitchenSink
InstanceOf: Library
* insert lib-common
* content.id = "ig-loader-KitchenSink.cql"

// bundle
// weird, only the cql is included, not the elm

RuleSet: lib-bundle
* entry[=].request.url = "Library"
* entry[=].request.method = #PUT

Instance: HIVSimple-Library
InstanceOf: Bundle
* type = #transaction

* entry[+].fullUrl = "http://www.example.org/fhir/Library/AgeRanges"
* entry[=].resource = AgeRanges
* insert lib-bundle

* entry[+].fullUrl = "http://www.example.org/fhir/Library/FHIRCommon"
* entry[=].resource = FHIRCommon
* insert lib-bundle

* entry[+].fullUrl = "http://www.example.org/fhir/Library/KitchenSink"
* entry[=].resource = KitchenSink
* insert lib-bundle
