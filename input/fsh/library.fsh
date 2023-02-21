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
// change to proper url
* url = "http://fhir.org/guides/cqf/common/Library/FHIRCommon"
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
// change to proper url
* url = "http://fhir.org/guides/cqf/common/Library/FHIRHelpers"
// * identifier.value = "FHIRHelpers"
* content.id = "ig-loader-FHIRHelpers.cql"


// Instance: DataContract
// InstanceOf: Library
// Title: "DataContract"
// Description: "DataContract"
// * insert lib-common
// * name = "DataContract"
// * title = "DataContract"
// * description = "DataContract"
// * version = "0.1.0"
// * url = "https://intrahealth.github.io/simple-hiv-ig/Library/DataContract"
// // * identifier.value = "DataContract"
// * content.id = "ig-loader-DataContract.cql"

Instance: Analytics
InstanceOf: Library
Title: "Analytics"
Description: "Analytics"
* insert lib-common
* name = "Analytics"
* title = "Analytics"
* description = "Analytics"
* version = "0.1.0"
* url = "https://intrahealth.github.io/simple-hiv-ig/Library/Analytics"
// * identifier.value = "Analytics"
* content.id = "ig-loader-Analytics.cql"


Instance: DASHConcepts
InstanceOf: Library
Title: "DASHConcepts"
Description: "DASHConcepts"
* insert lib-common
* name = "DASHConcepts"
* title = "DASHConcepts"
* description = "DASHConcepts"
* version = "0.1.0"
* url = "https://intrahealth.github.io/simple-hiv-ig/Library/DASHConcepts"
// * identifier.value = "DASHConcepts"
* content.id = "ig-loader-DASHConcepts.cql"


Instance: DASHDataElements
InstanceOf: Library
Title: "DASHDataElements"
Description: "DASHDataElements"
* insert lib-common
* name = "DASHDataElements"
* title = "DASHDataElements"
* description = "DASHDataElements"
* version = "0.1.0"
* url = "https://intrahealth.github.io/simple-hiv-ig/Library/DASHDataElements"
// * identifier.value = "DASHDataElements"
* content.id = "ig-loader-DASHDataElements.cql"


Instance: DASHStratifiers
InstanceOf: Library
Title: "DASHStratifiers"
Description: "DASHStratifiers"
* insert lib-common
* name = "DASHStratifiers"
* title = "DASHStratifiers"
* description = "DASHStratifiers"
* version = "0.1.0"
* url = "https://intrahealth.github.io/simple-hiv-ig/Library/DASHStratifiers"
// * identifier.value = "DASHStratifiers"
* content.id = "ig-loader-DASHStratifiers.cql"


// Instance: EasyLib
// InstanceOf: Library
// Title: "EasyLib"
// Description: "EasyLib"
// * insert lib-common
// * name = "EasyLib"
// * title = "EasyLib"
// * description = "EasyLib"
// * version = "0.1.0"
// * url = "https://intrahealth.github.io/simple-hiv-ig/Library/EasyLib"
// // * identifier.value = "EasyLib"
// * content.id = "ig-loader-EasyLib.cql"


// Instance: HIVIndicators
// InstanceOf: Library
// Title: "HIVIndicators"
// Description: "HIVIndicators"
// * insert lib-common
// * name = "HIVIndicators"
// * title = "HIVIndicators"
// * description = "HIVIndicators"
// * version = "0.1.0"
// * url = "https://intrahealth.github.io/simple-hiv-ig/Library/HIVIndicators"
// // * identifier.value = "HIVIndicators"
// * content.id = "ig-loader-HIVIndicators.cql"


Instance: HTSTST
InstanceOf: Library
Title: "HTSTST"
Description: "HTSTST"
* insert lib-common
* name = "HTSTST"
* title = "HTSTST"
* description = "HTSTST"
* version = "0.1.0"
* url = "https://intrahealth.github.io/simple-hiv-ig/Library/HTSTST"
// * identifier.value = "HTSTST"
* content.id = "ig-loader-HTSTST.cql"


// Instance: KitchenSink
// InstanceOf: Library
// Title: "KitchenSink"
// Description: "KitchenSink"
// * insert lib-common
// * name = "KitchenSink"
// * title = "KitchenSink"
// * description = "KitchenSink"
// * version = "0.1.0"
// * url = "https://intrahealth.github.io/simple-hiv-ig/Library/KitchenSink"
// // * identifier.value = "KitchenSink"
// * content.id = "ig-loader-KitchenSink.cql"


Instance: PMTCTART
InstanceOf: Library
Title: "PMTCTART"
Description: "PMTCTART"
* insert lib-common
* name = "PMTCTART"
* title = "PMTCTART"
* description = "PMTCTART"
* version = "0.1.0"
* url = "https://intrahealth.github.io/simple-hiv-ig/Library/PMTCTART"
// * identifier.value = "PMTCTART"
* content.id = "ig-loader-PMTCTART.cql"


Instance: PMTCTSTAT
InstanceOf: Library
Title: "PMTCTSTAT"
Description: "PMTCTSTAT"
* insert lib-common
* name = "PMTCTSTAT"
* title = "PMTCTSTAT"
* description = "PMTCTSTAT"
* version = "0.1.0"
* url = "https://intrahealth.github.io/simple-hiv-ig/Library/PMTCTSTAT"
// * identifier.value = "PMTCTSTAT"
* content.id = "ig-loader-PMTCTSTAT.cql"


// Instance: QR
// InstanceOf: Library
// Title: "QR"
// Description: "QR"
// * insert lib-common
// * name = "QR"
// * title = "QR"
// * description = "QR"
// * version = "0.1.0"
// * url = "https://intrahealth.github.io/simple-hiv-ig/Library/QR"
// // * identifier.value = "QR"
// * content.id = "ig-loader-QR.cql"


// Instance: Synthea
// InstanceOf: Library
// Title: "Synthea"
// Description: "Synthea"
// * insert lib-common
// * name = "Synthea"
// * title = "Synthea"
// * description = "Synthea"
// * version = "0.1.0"
// * url = "https://intrahealth.github.io/simple-hiv-ig/Library/Synthea"
// // * identifier.value = "Synthea"
// * content.id = "ig-loader-Synthea.cql"


Instance: TXCURR
InstanceOf: Library
Title: "TXCURR"
Description: "TXCURR"
* insert lib-common
* name = "TXCURR"
* title = "TXCURR"
* description = "TXCURR"
* version = "0.1.0"
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
* version = "0.1.0"
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
* version = "0.1.0"
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
* version = "0.1.0"
* url = "https://intrahealth.github.io/simple-hiv-ig/Library/TXPVLS"
// * identifier.value = "TXPVLS"
* content.id = "ig-loader-TXPVLS.cql"
