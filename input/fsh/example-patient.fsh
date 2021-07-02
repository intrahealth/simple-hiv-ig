Alias: LNC = http://loinc.org
Alias: SCT = http://snomed.info/sct

// Usage: #example is default
// Title: "" is unused
// Description: "" is unused

Instance:     Patient-HIVSimple
InstanceOf:   Patient
* name[+].text = "Felix Cat"
* birthDate = "2000-01-02"

Instance: Organization-HIVSimple
InstanceOf: Organization
* name = "Government Hospital"

Instance: Location-HIVSimple
InstanceOf: Location
* managingOrganization = Reference(Organization-HIVSimple)

Instance: Observation-HIVSimple
InstanceOf: Observation
* status = #final
* encounter = Reference(Encounter-HIVSimple)
* subject = Reference(Patient-HIVSimple)
* code = LNC#75622-1 "LOINC Code"
* valueCodeableConcept = SCT#165816005 "HIV Positive"

Instance: DiagnosticReport-HIVSimple
InstanceOf: DiagnosticReport
* status = #final
* encounter = Reference(Encounter-HIVSimple)
* subject = Reference(Patient-HIVSimple)
* result = Reference(Observation-HIVSimple)
* code = LNC#75622-1 "HIV types 1 and 2 testing"

Instance: Condition-HIVSimple
InstanceOf: Condition
* clinicalStatus = #active
* verificationStatus = #confirmed
* subject = Reference(Patient-HIVSimple)
* code = SCT#86406008 "HIV Positive"

Instance: Example-HIVSimple
InstanceOf: Bundle
* type = #transaction

* entry[+].fullUrl = "http://www.example.org/fhir/Patient/Patient-HIVSimple"
* entry[=].request.url = "Patient"
* entry[=].request.method = #PUT
* entry[=].resource = Patient-HIVSimple

* entry[+].fullUrl = "http://www.example.org/fhir/Organization/Organization-HIVSimple"
* entry[=].request.url = "Organization"
* entry[=].request.method = #PUT
* entry[=].resource = Organization-HIVSimple

* entry[+].fullUrl = "http://www.example.org/fhir/Location/Location-HIVSimple"
* entry[=].request.url = "Location"
* entry[=].request.method = #PUT
* entry[=].resource = Location-HIVSimple

* entry[+].fullUrl = "http://www.example.org/fhir/Observation/Observation-HIVSimple"
* entry[=].request.url = "Observation"
* entry[=].request.method = #PUT
* entry[=].resource = Observation-HIVSimple

* entry[+].fullUrl = "http://www.example.org/fhir/DiagnosticReport/DiagnosticReport-HIVSimple"
* entry[=].request.url = "DiagnosticReport"
* entry[=].request.method = #PUT
* entry[=].resource = DiagnosticReport-HIVSimple

* entry[+].fullUrl = "http://www.example.org/fhir/Condition/Condition-HIVSimple"
* entry[=].request.url = "Condition"
* entry[=].request.method = #PUT
* entry[=].resource = Condition-HIVSimple