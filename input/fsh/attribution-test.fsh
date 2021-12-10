// eClaim domain example
// patient -> encounter.account -> account.coverage -> coverage.contract -> contract -> organization
// patient -> encounter.account -> account.subject -> healthcareservice.organization -> organization

Instance: HealthcareService-HIVSimple
InstanceOf: HealthcareService
Usage: #example
Title: "HealthcareService-HIVSimple"
Description: "HealthcareService-HIVSimple"
* active = true
* providedBy = Reference(Organization-HIVSimple)
* name = "HealthcareService-HIVSimple"


Instance: Contract-HIVSimple
InstanceOf: Contract
Usage: #example
Title: "Contract-HIVSimple"
Description: "Contract-HIVSimple"
* term[+].offer.party[+].reference = Reference(Organization-HIVSimple)
* term[=].offer.party[=].role = $contract-party-role#flunky


Instance: Coverage-HIVSimple
InstanceOf: Coverage
Usage: #example
Title: "Coverage-HIVSimple"
Description: "Coverage-HIVSimple"
* status = $fm-status#active
* contract[+] = Reference(Contract-HIVSimple)
* payor[+] = Reference(Organization-HIVSimple)
* beneficiary = Reference(Patient-HIVSimple)


Instance: Account-HIVSimple
InstanceOf: Account
Usage: #example
Title: "Account-HIVSimple"
Description: "Account-HIVSimple"
* status = $account-status#active
* subject[+] = Reference(HealthcareService-HIVSimple)
* coverage[+].coverage = Reference(Coverage-HIVSimple)


// bundle up for visualization

// RuleSet: patient-bundle
// * entry[=].request.method = #POST

Instance: Example-Attribution
InstanceOf: Bundle
Title: "Example-Attribution"
Description: "Example-Attribution"
* type = #transaction

* entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/Patient/Patient-HIVSimple"
* entry[=].request.url = "Patient"
* entry[=].resource = Patient-HIVSimple
* insert patient-bundle

* entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/Organization/Organization-HIVSimple"
* entry[=].request.url = "Organization"
* entry[=].resource = Organization-HIVSimple
* insert patient-bundle

* entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/Location/Location-HIVSimple"
* entry[=].request.url = "Location"
* entry[=].resource = Location-HIVSimple
* insert patient-bundle

* entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/Encounter/Encounter-HIVSimple"
* entry[=].request.url = "Encounter"
* entry[=].resource = Encounter-HIVSimple
* insert patient-bundle

* entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/HealthcareService/HealthcareService-HIVSimple"
* entry[=].request.url = "HealthcareService"
* entry[=].resource = HealthcareService-HIVSimple
* insert patient-bundle

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

