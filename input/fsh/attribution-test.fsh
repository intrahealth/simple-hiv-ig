// eClaim domain example
// patient -> encounter.account -> account.coverage -> 
// coverage.contract -> contract.term.offer.party -> organization
// Bundle.entry.resource.ofType(Encounter).account[0].reference | 
// Bundle.entry.resource.ofType(Account).coverage[0].coverage.reference | 
// Bundle.entry.resource.ofType(Coverage).contract[0].reference | 
// Bundle.entry.resource.ofType(Contract).term[0].offer.party[0].reference[0].reference
// Bundle.entry.resource.ofType(Encounter).account[0].reference | Bundle.entry.resource.ofType(Account).coverage[0].coverage.reference | Bundle.entry.resource.ofType(Coverage).contract[0].reference | Bundle.entry.resource.ofType(Contract).term[0].offer.party[0].reference[0].reference


// Instance: HealthcareService-HIVSimple
// InstanceOf: HealthcareService
// Usage: #example
// Title: "HealthcareService-HIVSimple"
// Description: "HealthcareService-HIVSimple"
// * active = true
// * providedBy = Reference(IntraHealth)
// // * providedBy = Reference(Organization-HIVSimple)
// * name = "HealthcareService-HIVSimple"


Instance: Contract-HIVSimple
InstanceOf: Contract
Usage: #example
Title: "Contract-HIVSimple"
Description: "Contract-HIVSimple"
* identifier[+].system = $PEPFAR
* identifier[=].value = "4321"
// * term[+].offer.party[+].reference = Reference(Organization-HIVSimple)
* term[+].offer.party[+].reference = Reference(IntraHealth)
* term[=].offer.party[=].role = $contract-party-role#flunky
* term[+].offer.party[+].reference = Reference(Patient-HIVSimple)
* term[=].offer.party[=].role = $contract-party-role#flunky
* term[=].action[+].subject[+].reference[+] = Reference(Organization-HIVSimple)
* term[=].action[=].type = $contractaction#action-a
* term[=].action[=].intent = $v3-ActReason#POPHLTH
* term[=].action[=].status = $contract-actionstatus#complete
* term[=].asset[+].period[+].start = "2005-01-01"
* term[=].asset[=].period[=].end = "2022-01-01"


Instance: Coverage-HIVSimple
InstanceOf: Coverage
Usage: #example
Title: "Coverage-HIVSimple"
Description: "Coverage-HIVSimple"
* status = $fm-status#active
* contract[+] = Reference(Contract-HIVSimple)
// * payor[+] = Reference(Organization-HIVSimple)
* payor[+] = Reference(IntraHealth)
* beneficiary = Reference(Patient-HIVSimple)


Instance: Account-HIVSimple
InstanceOf: Account
Usage: #example
Title: "Account-HIVSimple"
Description: "Account-HIVSimple"
* status = $account-status#active
* subject[+] = Reference(Patient-HIVSimple)
// * subject[+] = Reference(HealthcareService-HIVSimple)
* coverage[+].coverage = Reference(Coverage-HIVSimple)
* owner[+] = Reference(IntraHealth)
* guarantor[+].party = Reference(IntraHealth)