// Usage: #example is default

// common to all clinical resources

Instance:     Patient-HIVSimple2
InstanceOf:   Patient
Title: "Patient-HIVSimple2"
Description: "Patient-HIVSimple2"
* name[+].given = "Mittens"
* name[=].family = "Cat"
* name[=].text = "Mittens Cat"
* gender = #female
* birthDate = "1985-01-01"

Instance: Organization-HIVSimple2
InstanceOf: Organization
Title: "Organization-HIVSimple2"
Description: "Organization-HIVSimple2"
* name = "Government Hospital"

Instance: Location-HIVSimple2
InstanceOf: Location
Title: "Location-HIVSimple2"
Description: "Location-HIVSimple2"
* managingOrganization = Reference(Organization-HIVSimple2)
* identifier.system = "https://github.com/synthetichealth/synthea"
* identifier.value = "Location-HIVSimple2"

// conditions

Instance: Condition-HIVSimple2
InstanceOf: Condition
Title: "Condition-HIVSimple2"
Description: "Condition-HIVSimple2"
* clinicalStatus = $condition-clinical#active
* verificationStatus = $condition-ver-status#confirmed
* subject = Reference(Patient-HIVSimple2)
// todo: review this for consistency
* code = $SCT#86406008 "HIV - Human immunodeficiency virus infection"
* onsetDateTime = "2010-01-01"

Instance: Condition-Pregnancy
InstanceOf: Condition
Title: "Condition-Pregnancy"
Description: "Condition-Pregnancy"
* clinicalStatus = $condition-clinical#inactive
* verificationStatus = $condition-ver-status#confirmed
* subject = Reference(Patient-HIVSimple2)
* code = $SCT#77386006 "Pregnant (finding)"
* onsetDateTime = "2020-01-01"
* abatementDateTime = "2020-09-30"

// hiv positive test

Instance: Encounter-HIVSimple2
InstanceOf: Encounter
Title: "Encounter-HIVSimple2"
Description: "Encounter-HIVSimple2"
Usage: #example
* status = #finished
* class = $v3-ActCode#ACUTE
* subject = Reference(Patient-HIVSimple2)
* serviceProvider = Reference(Organization-HIVSimple2)
* location[+].location = Reference(Location-HIVSimple2)
* period.start = "2011-01-01"
* period.end = "2011-01-01"

Instance: DiagnosticReport-HIVSimple2
InstanceOf: DiagnosticReport
Title: "DiagnosticReport-HIVSimple2"
Description: "DiagnosticReport-HIVSimple2"
* status = #final
* encounter = Reference(Encounter-HIVSimple2)
* subject = Reference(Patient-HIVSimple2)
* result = Reference(Observation-HIVSimple2)
* code = $LNC#75622-1 "HIV 1 and 2 tests - Meaningful Use set"

Instance: Observation-HIVSimple2
InstanceOf: Observation
Title: "Observation-HIVSimple2"
Description: "Observation-HIVSimple2"
* status = #final
* encounter = Reference(Encounter-HIVSimple2)
* subject = Reference(Patient-HIVSimple2)
* code = $LNC#75622-1 "HIV 1 and 2 tests - Meaningful Use set"
* valueCodeableConcept = $SCT#165816005 "HIV Positive"

// hiv viral load

Instance: Encounter-ViralLoad
InstanceOf: Encounter
Title: "Encounter-ViralLoad"
Description: "Encounter-ViralLoad"
Usage: #example
* status = #finished
* class = $v3-ActCode#ACUTE
* subject = Reference(Patient-HIVSimple2)
* serviceProvider = Reference(Organization-HIVSimple2)
* location[+].location = Reference(Location-HIVSimple2)
* period.start = "2020-06-01"
* period.end = "2020-06-01"

Instance: DiagnosticReport-ViralLoad
InstanceOf: DiagnosticReport
Title: "DiagnosticReport-ViralLoad"
Description: "DiagnosticReport-ViralLoad"
* status = #final
* subject = Reference(Patient-HIVSimple2)
//
* encounter = Reference(Encounter-ViralLoad)
* result = Reference(Observation-ViralLoad)
* code = $LNC#25836-8 "HIV 1 RNA [#/volume] (viral load) in Specimen by NAA with probe detection"

Instance: Observation-ViralLoad
InstanceOf: Observation
Title: "Observation-ViralLoad"
Description: "Observation-ViralLoad"
* status = #final
* subject = Reference(Patient-HIVSimple2)
// 
* encounter = Reference(Encounter-ViralLoad) 
* code = $LNC#25836-8 "HIV 1 RNA [#/volume] (viral load) in Specimen by NAA with probe detection"
* valueQuantity.value = 741660
* valueQuantity.unit = "copies/mL"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #{copies}/mL


// bundle it all up

Instance: Example-HIVSimple2
InstanceOf: Bundle
Title: "Example-HIVSimple2"
Description: "Example-HIVSimple2"
* type = #transaction

* entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/Patient/Patient-HIVSimple2"
* entry[=].request.url = "Patient"
* entry[=].request.method = #POST
* entry[=].resource = Patient-HIVSimple2

* entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/Organization/Organization-HIVSimple2"
* entry[=].request.url = "Organization"
* entry[=].request.method = #POST
* entry[=].resource = Organization-HIVSimple2

* entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/Location/Location-HIVSimple2"
* entry[=].request.url = "Location"
* entry[=].request.method = #POST
* entry[=].resource = Location-HIVSimple2

* entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/Condition/Condition-HIVSimple2"
* entry[=].request.url = "Condition"
* entry[=].request.method = #POST
* entry[=].resource = Condition-HIVSimple2

* entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/Condition/Condition-Pregnancy"
* entry[=].request.url = "Condition"
* entry[=].request.method = #POST
* entry[=].resource = Condition-Pregnancy

// encounter for hiv test

* entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/Encounter/Encounter-HIVSimple2"
* entry[=].request.url = "Encounter"
* entry[=].request.method = #POST
* entry[=].resource = Encounter-HIVSimple2

* entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/DiagnosticReport/DiagnosticReport-HIVSimple2"
* entry[=].request.url = "DiagnosticReport"
* entry[=].request.method = #POST
* entry[=].resource = DiagnosticReport-HIVSimple2

* entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/Observation/Observation-HIVSimple2"
* entry[=].request.url = "Observation"
* entry[=].request.method = #POST
* entry[=].resource = Observation-HIVSimple2

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
