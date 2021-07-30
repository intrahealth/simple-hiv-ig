Alias: $library-type = http://terminology.hl7.org/CodeSystem/library-type

// Usage: #example is the default, so omitted
// * title is unnecessary
// * name is unnecessary
// * id is unnecessary

// libraries

RuleSet: lib-common
* status = #draft
* experimental = true
* type = $library-type#logic-library
// * identifier.system = "https://intrahealth.github.io/simple-hiv-ig/Library"


Instance: AgeRanges
InstanceOf: Library
Title: "AgeRanges"
Description: "AgeRanges"
* insert lib-common
* url = "https://intrahealth.github.io/simple-hiv-ig/Library/AgeRanges"
// * identifier.value = "AgeRanges"
* content.id = "ig-loader-AgeRanges.cql"

Instance: FHIRCommon
InstanceOf: Library
Title: "FHIRCommon"
Description: "FHIRCommon"
* insert lib-common
* url = "https://intrahealth.github.io/simple-hiv-ig/Library/FHIRCommon"
// * identifier.value = "FHIRCommon"
* content.id = "ig-loader-FHIRCommon.cql"

// Instance: FHIRHelpers
// InstanceOf: Library
// Title: "FHIRHelpers"
// Description: "FHIRHelpers"
// * insert lib-common
// * url = "http://hl7.org/fhir/Library/FHIRHelpers"
// // * identifier.value = "FHIRHelpers"
// * content.id = "ig-loader-FHIRHelpers-4.0.1.cql"

Instance: KitchenSink
InstanceOf: Library
Title: "KitchenSink"
Description: "KitchenSink"
* insert lib-common
* url = "https://intrahealth.github.io/simple-hiv-ig/Library/KitchenSink"
// * identifier.value = "KitchenSink"
* content.id = "ig-loader-KitchenSink.cql"

// bundle
// weird, only the cql is included, not the elm

// RuleSet: lib-bundle
// * entry[=].request.method = #PUT

// Instance: HIVSimpleLibrary
// InstanceOf: Bundle
// Title: "HIVSimpleLibrary"
// Description: "HIVSimpleLibrary"
// * type = #transaction

// * entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/Library/AgeRanges"
// * entry[=].resource = AgeRanges
// * entry[=].request.url = "Library/AgeRanges"
// * insert lib-bundle

// * entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/Library/FHIRCommon"
// * entry[=].resource = FHIRCommon
// * entry[=].request.url = "Library/FHIRCommon"
// * insert lib-bundle

// * entry[+].fullUrl = "http://hl7.org/fhir/Library/FHIRHelpers"
// * entry[=].resource = FHIRHelpers
// * entry[=].request.url = "Library/FHIRHelpers"
// * insert lib-bundle

// * entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/Library/KitchenSink"
// * entry[=].resource = KitchenSink
// * entry[=].request.url = "Library/KitchenSink"
// * insert lib-bundle
