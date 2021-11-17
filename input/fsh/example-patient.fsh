Instance:     Patient-HIVSimple
InstanceOf:   Patient
Title: "Patient-HIVSimple"
Description: "Patient-HIVSimple"
* name[+].given = "Mittens"
* name[=].family = "Cat"
* name[=].text = "Mittens Cat"
* gender = #female
* birthDate = "1985-01-01"
// for dedup tests
* identifier[+].system = $OpenCR
* identifier[=].value = "1234"


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
* identifier[+].system = $synthea
* identifier[=].value = "Location-HIVSimple"

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
* encounter = Reference(Encounter-ViralLoad)
* result = Reference(Observation-ViralLoad)
* code = $LNC#25836-8 "HIV 1 RNA [#/volume] (viral load) in Specimen by NAA with probe detection"


Instance: Observation-ViralLoad
InstanceOf: Observation
Title: "Observation-ViralLoad"
Description: "Observation-ViralLoad"
* status = #final
* subject = Reference(Patient-HIVSimple)
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

* entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/Condition/Condition-HIVSimple"
* entry[=].request.url = "Condition"
* entry[=].resource = Condition-HIVSimple
* insert patient-bundle

* entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/Condition/Condition-Pregnancy"
* entry[=].request.url = "Condition"
* entry[=].resource = Condition-Pregnancy
* insert patient-bundle

// encounter for hiv test

* entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/Encounter/Encounter-HIVSimple"
* entry[=].request.url = "Encounter"
* entry[=].resource = Encounter-HIVSimple
* insert patient-bundle

* entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/DiagnosticReport/DiagnosticReport-HIVSimple"
* entry[=].request.url = "DiagnosticReport"
* entry[=].resource = DiagnosticReport-HIVSimple
* insert patient-bundle

* entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/Observation/Observation-HIVSimple"
* entry[=].request.url = "Observation"
* entry[=].resource = Observation-HIVSimple
* insert patient-bundle

// encounter for viral load

* entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/Encounter/Encounter-ViralLoad"
* entry[=].request.url = "Encounter"
* entry[=].resource = Encounter-ViralLoad
* insert patient-bundle

* entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/DiagnosticReport/DiagnosticReport-ViralLoad"
* entry[=].request.url = "DiagnosticReport"
* entry[=].resource = DiagnosticReport-ViralLoad
* insert patient-bundle

* entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/Observation/Observation-ViralLoad"
* entry[=].request.url = "Observation"
* entry[=].resource = Observation-ViralLoad
* insert patient-bundle
