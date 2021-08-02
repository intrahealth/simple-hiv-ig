// Usage: #example is default

// common to all clinical resources

Instance:     Patient-HIVSimple
InstanceOf:   Patient
Title: "Patient-HIVSimple"
Description: "Patient-HIVSimple"
* name[+].given = "Mittens"
* name[=].family = "Cat"
* name[=].text = "Mittens Cat"
* gender = #female
* birthDate = "1985-01-01"

Instance: Organization-HIVSimple
InstanceOf: Organization
Title: "Organization-HIVSimple"
Description: "Organization-HIVSimple"
* name = "Government Hospital"

Instance: Location-HIVSimple
InstanceOf: Location
Title: "Location-HIVSimple"
Description: "Location-HIVSimple"
* managingOrganization = Reference(Organization-HIVSimple)
* identifier.system = "https://github.com/synthetichealth/synthea"
* identifier.value = "Location-HIVSimple"

// conditions

Instance: Condition-HIVSimple
InstanceOf: Condition
Title: "Condition-HIVSimple"
Description: "Condition-HIVSimple"
* clinicalStatus = $condition-clinical#active
* verificationStatus = $condition-ver-status#confirmed
* subject = Reference(Patient-HIVSimple)
// todo: review this for consistency
* code = $SCT#86406008 "HIV - Human immunodeficiency virus infection"
* onsetDateTime = "2010-01-01"

Instance: Condition-Pregnancy
InstanceOf: Condition
Title: "Condition-Pregnancy"
Description: "Condition-Pregnancy"
* clinicalStatus = $condition-clinical#inactive
* verificationStatus = $condition-ver-status#confirmed
* subject = Reference(Patient-HIVSimple)
* code = $SCT#77386006 "Pregnant (finding)"
* onsetDateTime = "2020-01-01"
* abatementDateTime = "2020-09-30"

// hiv positive test

Instance: Encounter-HIVSimple
InstanceOf: Encounter
Title: "Encounter-HIVSimple"
Description: "Encounter-HIVSimple"
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
Title: "DiagnosticReport-HIVSimple"
Description: "DiagnosticReport-HIVSimple"
* status = #final
* encounter = Reference(Encounter-HIVSimple)
* subject = Reference(Patient-HIVSimple)
* result = Reference(Observation-HIVSimple)
* code = $LNC#75622-1 "HIV 1 and 2 tests - Meaningful Use set"


Instance: Observation-HIVSimple
InstanceOf: Observation
Title: "Observation-HIVSimple"
Description: "Observation-HIVSimple"
* status = #final
* encounter = Reference(Encounter-HIVSimple)
* subject = Reference(Patient-HIVSimple)
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
* subject = Reference(Patient-HIVSimple)
* serviceProvider = Reference(Organization-HIVSimple)
* location[+].location = Reference(Location-HIVSimple)
* period.start = "2020-06-01"
* period.end = "2020-06-01"

Instance: DiagnosticReport-ViralLoad
InstanceOf: DiagnosticReport
Title: "DiagnosticReport-ViralLoad"
Description: "DiagnosticReport-ViralLoad"
* status = #final
* subject = Reference(Patient-HIVSimple)
//
* encounter = Reference(Encounter-ViralLoad)
* result = Reference(Observation-ViralLoad)
* code = $LNC#25836-8 "HIV 1 RNA [#/volume] (viral load) in Specimen by NAA with probe detection"

Instance: Observation-ViralLoad
InstanceOf: Observation
Title: "Observation-ViralLoad"
Description: "Observation-ViralLoad"
* status = #final
* subject = Reference(Patient-HIVSimple)
// 
* encounter = Reference(Encounter-ViralLoad) 
* code = $LNC#25836-8 "HIV 1 RNA [#/volume] (viral load) in Specimen by NAA with probe detection"
* valueQuantity.value = 741660
* valueQuantity.unit = "copies/mL"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #{copies}/mL


// bundle it all up

Instance: Example-HIVSimple
InstanceOf: Bundle
Title: "Example-HIVSimple"
Description: "Example-HIVSimple"
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
