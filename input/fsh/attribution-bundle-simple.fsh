Instance: Attribution-Bundle-Simple
InstanceOf: Bundle
Title: "Attribution-Bundle"
Description: "Attribution-Bundle"
* type = #transaction

* entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/Patient/Patient-HIVSimple"
* entry[=].request.url = "Patient"
* entry[=].resource = Patient-HIVSimple
* insert patient-bundle

* entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/Organization/Organization-HIVSimple"
* entry[=].request.url = "Organization"
* entry[=].resource = Organization-HIVSimple
* insert patient-bundle

* entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/Organization/IntraHealth"
* entry[=].request.url = "Organization"
* entry[=].resource = IntraHealth
* insert patient-bundle

* entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/Location/Location-HIVSimple"
* entry[=].request.url = "Location"
* entry[=].resource = Location-HIVSimple
* insert patient-bundle

// * entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/Condition/Condition-HIVSimple"
// * entry[=].request.url = "Condition"
// * entry[=].resource = Condition-HIVSimple
// * insert patient-bundle

// * entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/Condition/Condition-Pregnancy"
// * entry[=].request.url = "Condition"
// * entry[=].resource = Condition-Pregnancy
// * insert patient-bundle

// encounter for hiv test

* entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/Encounter/Encounter-HIVSimple"
* entry[=].request.url = "Encounter"
* entry[=].resource = Encounter-HIVSimple
* insert patient-bundle

// * entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/DiagnosticReport/DiagnosticReport-HIVSimple"
// * entry[=].request.url = "DiagnosticReport"
// * entry[=].resource = DiagnosticReport-HIVSimple
// * insert patient-bundle

// * entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/Observation/Observation-HIVSimple"
// * entry[=].request.url = "Observation"
// * entry[=].resource = Observation-HIVSimple
// * insert patient-bundle

// encounter for viral load

// * entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/Encounter/Encounter-ViralLoad"
// * entry[=].request.url = "Encounter"
// * entry[=].resource = Encounter-ViralLoad
// * insert patient-bundle

// * entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/DiagnosticReport/DiagnosticReport-ViralLoad"
// * entry[=].request.url = "DiagnosticReport"
// * entry[=].resource = DiagnosticReport-ViralLoad
// * insert patient-bundle

// * entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/Observation/Observation-ViralLoad"
// * entry[=].request.url = "Observation"
// * entry[=].resource = Observation-ViralLoad
// * insert patient-bundle

// * entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/HealthcareService/HealthcareService-HIVSimple"
// * entry[=].request.url = "HealthcareService"
// * entry[=].resource = HealthcareService-HIVSimple
// * insert patient-bundle

* entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/Account/Account-HIVSimple"
* entry[=].request.url = "Account"
* entry[=].resource = Account-HIVSimple
* insert patient-bundle

* entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/Coverage/Coverage-HIVSimple"
* entry[=].request.url = "Coverage"
* entry[=].resource = Coverage-HIVSimple
* insert patient-bundle

* entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/Contract/Contract-HIVSimple"
* entry[=].request.url = "Contract"
* entry[=].resource = Contract-HIVSimple
* insert patient-bundle

