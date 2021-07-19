Alias: LNC = http://loinc.org
Alias: SCT = http://snomed.info/sct
Alias: $measure-population = http://terminology.hl7.org/CodeSystem/measure-population
Alias: $condition-clinical = http://terminology.hl7.org/CodeSystem/condition-clinical
Alias: $condition-ver-status = http://terminology.hl7.org/CodeSystem/condition-ver-status
Alias: $v3-ActCode = http://terminology.hl7.org/CodeSystem/v3-ActCode

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
* clinicalStatus = $condition-clinical#active
* verificationStatus = $condition-ver-status#confirmed
* subject = Reference(Patient-HIVSimple)
// todo: review this for consistency
* code = SCT#86406008 "HIV - Human immunodeficiency virus infection"
* onsetDateTime = "2010-01-01"

Instance: Condition-Pregnancy
InstanceOf: Condition
* clinicalStatus = $condition-clinical#inactive
* verificationStatus = $condition-ver-status#confirmed
* subject = Reference(Patient-HIVSimple)
* code = SCT#77386006 "Pregnant (finding)"
* onsetDateTime = "2020-01-01"
* abatementDateTime = "2020-09-30"

// hiv positive test

Instance: Encounter-HIVSimple
InstanceOf: Encounter
Usage: #example
* status = #finished
* class = $v3-ActCode#ACUTE
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
* code = LNC#75622-1 "HIV 1 and 2 tests - Meaningful Use set"

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
* class = $v3-ActCode#ACUTE
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

* entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/Patient/Patient-HIVSimple"
* entry[=].request.url = "Patient"
* entry[=].request.method = #POST
* entry[=].resource = Patient-HIVSimple

* entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/Organization/Organization-HIVSimple"
* entry[=].request.url = "Organization"
* entry[=].request.method = #POST
* entry[=].resource = Organization-HIVSimple

* entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/Location/Location-HIVSimple"
* entry[=].request.url = "Location"
* entry[=].request.method = #POST
* entry[=].resource = Location-HIVSimple

* entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/Condition/Condition-HIVSimple"
* entry[=].request.url = "Condition"
* entry[=].request.method = #POST
* entry[=].resource = Condition-HIVSimple

* entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/Condition/Condition-Pregnancy"
* entry[=].request.url = "Condition"
* entry[=].request.method = #POST
* entry[=].resource = Condition-Pregnancy

// encounter for hiv test

* entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/Encounter/Encounter-HIVSimple"
* entry[=].request.url = "Encounter"
* entry[=].request.method = #POST
* entry[=].resource = Encounter-HIVSimple

* entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/DiagnosticReport/DiagnosticReport-HIVSimple"
* entry[=].request.url = "DiagnosticReport"
* entry[=].request.method = #POST
* entry[=].resource = DiagnosticReport-HIVSimple

* entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/Observation/Observation-HIVSimple"
* entry[=].request.url = "Observation"
* entry[=].request.method = #POST
* entry[=].resource = Observation-HIVSimple

// encounter for viral load

* entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/Encounter/Encounter-ViralLoad"
* entry[=].request.url = "Encounter"
* entry[=].request.method = #POST
* entry[=].resource = Encounter-ViralLoad

* entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/DiagnosticReport/DiagnosticReport-ViralLoad"
* entry[=].request.url = "DiagnosticReport"
* entry[=].request.method = #POST
* entry[=].resource = DiagnosticReport-ViralLoad

* entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/Observation/Observation-ViralLoad"
* entry[=].request.url = "Observation"
* entry[=].request.method = #POST
* entry[=].resource = Observation-ViralLoad
