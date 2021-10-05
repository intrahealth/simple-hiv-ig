Alias: $Patient-HIVSimple2 = https://intrahealth.github.io/simple-hiv-ig/Patient/Patient-HIVSimple2
Alias: $Organization-HIVSimple2 = https://intrahealth.github.io/simple-hiv-ig/Organization/Organization-HIVSimple2
Alias: $Location-HIVSimple2 = https://intrahealth.github.io/simple-hiv-ig/Location/Location-HIVSimple2
Alias: $Condition-HIVSimple2 = https://intrahealth.github.io/simple-hiv-ig/Condition/Condition-HIVSimple2
Alias: $Condition-Pregnancy2 = https://intrahealth.github.io/simple-hiv-ig/Condition/Condition-Pregnancy2

Alias: $Encounter-HIVSimple2 = https://intrahealth.github.io/simple-hiv-ig/Encounter/Encounter-HIVSimple2
Alias: $DiagnosticReport-HIVSimple2 = https://intrahealth.github.io/simple-hiv-ig/DiagnosticReport/DiagnosticReport-HIVSimple2
Alias: $Observation-HIVSimple2 = https://intrahealth.github.io/simple-hiv-ig/Observation/Observation-HIVSimple2

Alias: $Encounter-ViralLoad2 = https://intrahealth.github.io/simple-hiv-ig/Encounter/Encounter-ViralLoad2
Alias: $DiagnosticReport-ViralLoad2 = https://intrahealth.github.io/simple-hiv-ig/DiagnosticReport/DiagnosticReport-ViralLoad2
Alias: $Observation-ViralLoad2 = https://intrahealth.github.io/simple-hiv-ig/Observation/Observation-ViralLoad2


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
* managingOrganization = Reference($Organization-HIVSimple2)
* identifier[+].system = $synthea
* identifier[=].value = "Location-HIVSimple2"
// conditions

Instance: Condition-HIVSimple2
InstanceOf: Condition
Title: "Condition-HIVSimple2"
Description: "Condition-HIVSimple2"
* clinicalStatus = $condition-clinical#active
* verificationStatus = $condition-ver-status#confirmed
* subject = Reference($Patient-HIVSimple2)
// todo: review this for consistency
* code = $SCT#86406008 "HIV - Human immunodeficiency virus infection"
* onsetDateTime = "2010-01-01"


Instance: Condition-Pregnancy2
InstanceOf: Condition
Title: "Condition-Pregnancy"
Description: "Condition-Pregnancy"
* clinicalStatus = $condition-clinical#inactive
* verificationStatus = $condition-ver-status#confirmed
* subject = Reference($Patient-HIVSimple2)
* code = $SCT#77386006 "Pregnant (finding)"
* onsetDateTime = "2020-01-01"
* abatementDateTime = "2020-09-30"

// hiv positive test

Instance: Encounter-HIVSimple2
InstanceOf: Encounter
Title: "Encounter-HIVSimple2"
Description: "Encounter-HIVSimple2"
* status = #finished
* class = $v3-ActCode#ACUTE
* subject = Reference($Patient-HIVSimple2)
* serviceProvider = Reference($Organization-HIVSimple2)
* location[+].location = Reference($Location-HIVSimple2)
* period.start = "2011-01-01"
* period.end = "2011-01-01"


Instance: DiagnosticReport-HIVSimple2
InstanceOf: DiagnosticReport
Title: "DiagnosticReport-HIVSimple2"
Description: "DiagnosticReport-HIVSimple2"
* status = #final
* encounter = Reference($Encounter-HIVSimple2)
* subject = Reference($Patient-HIVSimple2)
* result = Reference($Observation-HIVSimple2)
* code = $LNC#75622-1 "HIV 1 and 2 tests - Meaningful Use set"


Instance: Observation-HIVSimple2
InstanceOf: Observation
Title: "Observation-HIVSimple2"
Description: "Observation-HIVSimple2"
* status = #final
* encounter = Reference($Encounter-HIVSimple2)
* subject = Reference($Patient-HIVSimple2)
* code = $LNC#75622-1 "HIV 1 and 2 tests - Meaningful Use set"
* valueCodeableConcept = $SCT#165816005 "HIV Positive"

// hiv viral load

Instance: Encounter-ViralLoad2
InstanceOf: Encounter
Title: "Encounter-ViralLoad"
Description: "Encounter-ViralLoad"
Usage: #example
* status = #finished
* class = $v3-ActCode#ACUTE
* subject = Reference($Patient-HIVSimple2)
* serviceProvider = Reference($Organization-HIVSimple2)
* location[+].location = Reference($Location-HIVSimple2)
* period.start = "2020-06-01"
* period.end = "2020-06-01"


Instance: DiagnosticReport-ViralLoad2
InstanceOf: DiagnosticReport
Title: "DiagnosticReport-ViralLoad"
Description: "DiagnosticReport-ViralLoad"
* status = #final
* subject = Reference($Patient-HIVSimple2)
* encounter = Reference($Encounter-ViralLoad2)
* result = Reference($Observation-ViralLoad2)
* code = $LNC#25836-8 "HIV 1 RNA [#/volume] (viral load) in Specimen by NAA with probe detection"


Instance: Observation-ViralLoad2
InstanceOf: Observation
Title: "Observation-ViralLoad"
Description: "Observation-ViralLoad"
* status = #final
* subject = Reference($Patient-HIVSimple2)
* encounter = Reference($Encounter-ViralLoad2) 
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

* entry[+].fullUrl = $Patient-HIVSimple2
* entry[=].request.url = "Patient"
* entry[=].resource = Patient-HIVSimple2
* insert patient-bundle

* entry[+].fullUrl = $Organization-HIVSimple2
* entry[=].request.url = "Organization"
* entry[=].resource = Organization-HIVSimple2
* insert patient-bundle

* entry[+].fullUrl = $Location-HIVSimple2
* entry[=].request.url = "Location"
* entry[=].resource = Location-HIVSimple2
* insert patient-bundle

* entry[+].fullUrl = $Condition-HIVSimple2
* entry[=].request.url = "Condition"
* entry[=].resource = Condition-HIVSimple2
* insert patient-bundle

* entry[+].fullUrl = $Condition-Pregnancy2
* entry[=].request.url = "Condition"
* entry[=].resource = Condition-Pregnancy2
* insert patient-bundle

// encounter for hiv test

* entry[+].fullUrl = $Encounter-HIVSimple2
* entry[=].request.url = "Encounter"
* entry[=].resource = Encounter-HIVSimple2
* insert patient-bundle

* entry[+].fullUrl = $DiagnosticReport-HIVSimple2
* entry[=].request.url = "DiagnosticReport"
* entry[=].resource = DiagnosticReport-HIVSimple2
* insert patient-bundle

* entry[+].fullUrl = $Observation-HIVSimple2
* entry[=].request.url = "Observation"
* entry[=].resource = Observation-HIVSimple2
* insert patient-bundle

// encounter for viral load

* entry[+].fullUrl = $Encounter-ViralLoad2
* entry[=].request.url = "Encounter"
* entry[=].resource = Encounter-ViralLoad2
* insert patient-bundle

* entry[+].fullUrl = $DiagnosticReport-ViralLoad2
* entry[=].request.url = "DiagnosticReport"
* entry[=].resource = DiagnosticReport-ViralLoad2
* insert patient-bundle

* entry[+].fullUrl = $Observation-ViralLoad2
* entry[=].request.url = "Observation"
* entry[=].resource = Observation-ViralLoad2
* insert patient-bundle
