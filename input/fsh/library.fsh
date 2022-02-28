// https://chat.fhir.org/#narrow/stream/215610-shorthand/topic/Resource.20names.20not.20populating

RuleSet: lib-common
* status = #draft
* experimental = true
* type = $library-type#logic-library
// * identifier.system = "https://intrahealth.github.io/simple-hiv-ig/Library"


Instance: FHIRCommon
InstanceOf: Library
Title: "FHIRCommon"
Description: "FHIRCommon"
* insert lib-common
* name = "FHIRCommon"
* title = "FHIRCommon"
* description = "FHIRCommon"
* version = "4.0.1"
* url = "https://intrahealth.github.io/simple-hiv-ig/Library/FHIRCommon"
// * identifier.value = "FHIRCommon"
* content.id = "ig-loader-FHIRCommon.cql"

Instance: FHIRHelpers
InstanceOf: Library
Title: "FHIRHelpers"
Description: "FHIRHelpers"
* insert lib-common
* name = "FHIRHelpers"
* title = "FHIRHelpers"
* description = "FHIRHelpers"
* version = "4.0.1"
* url = "https://intrahealth.github.io/simple-hiv-ig/Library/FHIRHelpers"
// * identifier.value = "FHIRHelpers"
* content.id = "ig-loader-FHIRHelpers.cql"


Instance: DataContract
InstanceOf: Library
Title: "DataContract"
Description: "DataContract"
* insert lib-common
* name = "DataContract"
* title = "DataContract"
* description = "DataContract"
// * version = "4.0.1"
* url = "https://intrahealth.github.io/simple-hiv-ig/Library/DataContract"
// * identifier.value = "DataContract"
* content.id = "ig-loader-DataContract.cql"


Instance: HIVConcepts
InstanceOf: Library
Title: "HIVConcepts"
Description: "HIVConcepts"
* insert lib-common
* name = "HIVConcepts"
* title = "HIVConcepts"
* description = "HIVConcepts"
// * version = "4.0.1"
* url = "https://intrahealth.github.io/simple-hiv-ig/Library/HIVConcepts"
// * identifier.value = "HIVConcepts"
* content.id = "ig-loader-HIVConcepts.cql"


Instance: HIVDataElements
InstanceOf: Library
Title: "HIVDataElements"
Description: "HIVDataElements"
* insert lib-common
* name = "HIVDataElements"
* title = "HIVDataElements"
* description = "HIVDataElements"
* version = "4.0.1"
* url = "https://intrahealth.github.io/simple-hiv-ig/Library/HIVDataElements"
// * identifier.value = "HIVDataElements"
* content.id = "ig-loader-HIVDataElements.cql"


Instance: HIVStratifiers
InstanceOf: Library
Title: "HIVStratifiers"
Description: "HIVStratifiers"
* insert lib-common
* name = "HIVStratifiers"
* title = "HIVStratifiers"
* description = "HIVStratifiers"
// * version = "4.0.1"
* url = "https://intrahealth.github.io/simple-hiv-ig/Library/HIVStratifiers"
// * identifier.value = "HIVStratifiers"
* content.id = "ig-loader-HIVStratifiers.cql"


// Instance: HIVIndicators
// InstanceOf: Library
// Title: "HIVIndicators"
// Description: "HIVIndicators"
// * insert lib-common
// * name = "HIVIndicators"
// * title = "HIVIndicators"
// * description = "HIVIndicators"
// // * version = "0.1.0"
// * url = "https://intrahealth.github.io/simple-hiv-ig/Library/HIVIndicators"
// // * identifier.value = "HIVIndicators"
// * content.id = "ig-loader-HIVIndicators.cql"


Instance: KitchenSink
InstanceOf: Library
Title: "KitchenSink"
Description: "KitchenSink"
* insert lib-common
* name = "KitchenSink"
* title = "KitchenSink"
* description = "KitchenSink"
// * version = "0.1.0"
* url = "https://intrahealth.github.io/simple-hiv-ig/Library/KitchenSink"
// * identifier.value = "KitchenSink"
* content.id = "ig-loader-KitchenSink.cql"


Instance: TXCURR
InstanceOf: Library
Title: "TXCURR"
Description: "TXCURR"
* insert lib-common
* name = "TXCURR"
* title = "TXCURR"
* description = "TXCURR"
// * version = "0.1.0"
* url = "https://intrahealth.github.io/simple-hiv-ig/Library/TXCURR"
// * identifier.value = "TXCURR"
* content.id = "ig-loader-TXCURR.cql"


Instance: TXML
InstanceOf: Library
Title: "TXML"
Description: "TXML"
* insert lib-common
* name = "TXML"
* title = "TXML"
* description = "TXML"
// * version = "0.1.0"
* url = "https://intrahealth.github.io/simple-hiv-ig/Library/TXML"
// * identifier.value = "TXML"
* content.id = "ig-loader-TXML.cql"


Instance: TXNEW
InstanceOf: Library
Title: "TXNEW"
Description: "TXNEW"
* insert lib-common
* name = "TXNEW"
* title = "TXNEW"
* description = "TXNEW"
// * version = "0.1.0"
* url = "https://intrahealth.github.io/simple-hiv-ig/Library/TXNEW"
// * identifier.value = "TXNEW"
* content.id = "ig-loader-TXNEW.cql"


Instance: TXPVLS
InstanceOf: Library
Title: "TXPVLS"
Description: "TXPVLS"
* insert lib-common
* name = "TXPVLS"
* title = "TXPVLS"
* description = "TXPVLS"
// * version = "0.1.0"
* url = "https://intrahealth.github.io/simple-hiv-ig/Library/TXPVLS"
// * identifier.value = "TXPVLS"
* content.id = "ig-loader-TXPVLS.cql"


Instance: TXRTT
InstanceOf: Library
Title: "TXRTT"
Description: "TXRTT"
* insert lib-common
* name = "TXRTT"
* title = "TXRTT"
* description = "TXRTT"
// * version = "0.1.0"
* url = "https://intrahealth.github.io/simple-hiv-ig/Library/TXRTT"
// * identifier.value = "TXRTT"
* content.id = "ig-loader-TXRTT.cql"
