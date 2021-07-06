Alias: LNC = http://loinc.org
Alias: SCT = http://snomed.info/sct

// Usage: #example is default
// Title: "" is unused
// Description: "" is unused

// common to all clinical resources

Instance:     Patient-HIVSimple
InstanceOf:   Patient
* name[+].given = "Mittens"
* name[=].family = "Cat"
* name[=].text = "Mittens Cat"
* gender = #female
* birthDate = "1985-01-01"

Instance: Organization-HIVSimple
InstanceOf: Organization
* name = "Government Hospital"

Instance: Location-HIVSimple
InstanceOf: Location
* managingOrganization = Reference(Organization-HIVSimple)
* identifier.system = "https://github.com/synthetichealth/synthea"
* identifier.value = "Location-HIVSimple"

// conditions

Instance: Condition-HIVSimple
InstanceOf: Condition
* clinicalStatus = #active
* verificationStatus = #confirmed
* subject = Reference(Patient-HIVSimple)
* code = SCT#86406008 "HIV Positive"
* onsetDateTime = "2010-01-01"

Instance: Condition-Pregnancy
InstanceOf: Condition
* clinicalStatus = #active
* verificationStatus = #confirmed
* subject = Reference(Patient-HIVSimple)
* code = SCT#77386006 "Pregnant (finding)"
* onsetDateTime = "2020-01-01"
* abatementDateTime = "2020-09-30"

// hiv positive test

Instance: Encounter-HIVSimple
InstanceOf: Encounter
Usage: #example
* status = #finished
* class = #ACUTE
* subject = Reference(Patient-HIVSimple)
* serviceProvider = Reference(Organization-HIVSimple)
* location[+].location = Reference(Location-HIVSimple)
* period.start = "2011-01-01"
* period.end = "2011-01-01"

Instance: DiagnosticReport-HIVSimple
InstanceOf: DiagnosticReport
* status = #final
* encounter = Reference(Encounter-HIVSimple)
* subject = Reference(Patient-HIVSimple)
* result = Reference(Observation-HIVSimple)
* code = LNC#75622-1 "HIV types 1 and 2 testing"

Instance: Observation-HIVSimple
InstanceOf: Observation
* status = #final
* encounter = Reference(Encounter-HIVSimple)
* subject = Reference(Patient-HIVSimple)
* code = LNC#75622-1 "LOINC Code"
* valueCodeableConcept = SCT#165816005 "HIV Positive"

// hiv viral load

Instance: Encounter-ViralLoad
InstanceOf: Encounter
Usage: #example
* status = #finished
* class = #ACUTE
* subject = Reference(Patient-HIVSimple)
* serviceProvider = Reference(Organization-HIVSimple)
* location[+].location = Reference(Location-HIVSimple)
* period.start = "2020-06-01"
* period.end = "2020-06-01"

Instance: DiagnosticReport-ViralLoad
InstanceOf: DiagnosticReport
* status = #final
* subject = Reference(Patient-HIVSimple)
//
* encounter = Reference(Encounter-ViralLoad)
* result = Reference(Observation-ViralLoad)
* code = LNC#25836-8 "HIV 1 RNA NAA+probe (Specimen)"

Instance: Observation-ViralLoad
InstanceOf: Observation
* status = #final
* subject = Reference(Patient-HIVSimple)
// 
* encounter = Reference(Encounter-ViralLoad) 
* code = LNC#25836-8 "HIV 1 RNA NAA+probe (Specimen)"
* valueQuantity.value = 741660
* valueQuantity.unit = "copies/mL"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #{copies}/mL


// bundle it all up

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

* entry[+].fullUrl = "http://www.example.org/fhir/Condition/Condition-HIVSimple"
* entry[=].request.url = "Condition"
* entry[=].request.method = #PUT
* entry[=].resource = Condition-HIVSimple

* entry[+].fullUrl = "http://www.example.org/fhir/Condition/Condition-Pregnancy"
* entry[=].request.url = "Condition"
* entry[=].request.method = #PUT
* entry[=].resource = Condition-Pregnancy

// encounter for hiv test

* entry[+].fullUrl = "http://www.example.org/fhir/Encounter/Encounter-HIVSimple"
* entry[=].request.url = "Encounter"
* entry[=].request.method = #PUT
* entry[=].resource = Encounter-HIVSimple

* entry[+].fullUrl = "http://www.example.org/fhir/DiagnosticReport/DiagnosticReport-HIVSimple"
* entry[=].request.url = "DiagnosticReport"
* entry[=].request.method = #PUT
* entry[=].resource = DiagnosticReport-HIVSimple

* entry[+].fullUrl = "http://www.example.org/fhir/Observation/Observation-HIVSimple"
* entry[=].request.url = "Observation"
* entry[=].request.method = #PUT
* entry[=].resource = Observation-HIVSimple

// encounter for viral load

* entry[+].fullUrl = "http://www.example.org/fhir/Encounter/Encounter-ViralLoad"
* entry[=].request.url = "Encounter"
* entry[=].request.method = #PUT
* entry[=].resource = Encounter-ViralLoad

* entry[+].fullUrl = "http://www.example.org/fhir/DiagnosticReport/DiagnosticReport-ViralLoad"
* entry[=].request.url = "DiagnosticReport"
* entry[=].request.method = #PUT
* entry[=].resource = DiagnosticReport-ViralLoad

* entry[+].fullUrl = "http://www.example.org/fhir/Observation/Observation-ViralLoad"
* entry[=].request.url = "Observation"
* entry[=].request.method = #PUT
* entry[=].resource = Observation-ViralLoad
