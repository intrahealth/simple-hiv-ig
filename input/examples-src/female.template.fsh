Instance:     Patient-{{suffix}}
InstanceOf:   Patient
Title: "Patient-{{suffix}}"
Description: "Patient-{{suffix}}"
* name[+].given = "{{given}}"
* name[=].family = "{{family}}"
* name[=].text = "{{name}}"
* gender = #female
* birthDate = "{{birthDate}}"


Instance: Organization-{{suffix}}
InstanceOf: Organization
Title: "Organization-{{suffix}}"
Description: "Organization-{{suffix}}"
* name = "Government Hospital"


Instance: Location-{{suffix}}
InstanceOf: Location
Title: "Location-{{suffix}}"
Description: "Location-{{suffix}}"
* managingOrganization = Reference(Organization-{{suffix}})
* identifier[+].system = $synthea
* identifier[=].value = "Location-{{suffix}}"

// conditions

Instance: Condition-{{suffix}}
InstanceOf: Condition
Title: "Condition-{{suffix}}"
Description: "Condition-{{suffix}}"
* clinicalStatus = $condition-clinical#active
* verificationStatus = $condition-ver-status#confirmed
* subject = Reference(Patient-{{suffix}})
// todo: review this for consistency
* code = $SCT#86406008 "HIV - Human immunodeficiency virus infection"
* onsetDateTime = "{{hivonsetdate}}"


Instance: Condition-Pregnancy-{{suffix}}
InstanceOf: Condition
Title: "Condition-Pregnancy-{{suffix}}"
Description: "Condition-Pregnancy-{{suffix}}"
* clinicalStatus = $condition-clinical#inactive
* verificationStatus = $condition-ver-status#confirmed
* subject = Reference(Patient-{{suffix}})
* code = $SCT#77386006 "Pregnant (finding)"
* onsetDateTime = "{{pregstart}}"
* abatementDateTime = "{{pregstop}}"

// hiv positive test

Instance: Encounter-{{suffix}}
InstanceOf: Encounter
Title: "Encounter-{{suffix}}"
Description: "Encounter-{{suffix}}"
* status = #finished
* class = $v3-ActCode#ACUTE
* subject = Reference(Patient-{{suffix}})
* serviceProvider = Reference(Organization-{{suffix}})
* location[+].location = Reference(Location-{{suffix}})
* period.start = "{{hivtestdate}}"
* period.end = "{{hivtestdate}}"


Instance: DiagnosticReport-{{suffix}}
InstanceOf: DiagnosticReport
Title: "DiagnosticReport-{{suffix}}"
Description: "DiagnosticReport-{{suffix}}"
* status = #final
* encounter = Reference(Encounter-{{suffix}})
* subject = Reference(Patient-{{suffix}})
* result = Reference(Observation-{{suffix}})
* code = $LNC#75622-1 "HIV 1 and 2 tests - Meaningful Use set"


Instance: Observation-{{suffix}}
InstanceOf: Observation
Title: "Observation-{{suffix}}"
Description: "Observation-{{suffix}}"
* status = #final
* encounter = Reference(Encounter-{{suffix}})
* subject = Reference(Patient-{{suffix}})
* code = $LNC#75622-1 "HIV 1 and 2 tests - Meaningful Use set"
* valueCodeableConcept = $SCT#165816005 "HIV Positive"

// hiv viral load

Instance: Encounter-ViralLoad-{{suffix}}
InstanceOf: Encounter
Title: "Encounter-ViralLoad-{{suffix}}"
Description: "Encounter-ViralLoad-{{suffix}}"
Usage: #example
* status = #finished
* class = $v3-ActCode#ACUTE
* subject = Reference(Patient-{{suffix}})
* serviceProvider = Reference(Organization-{{suffix}})
* location[+].location = Reference(Location-{{suffix}})
* period.start = "{{vltestdate}}"
* period.end = "{{vltestdate}}"


Instance: DiagnosticReport-ViralLoad-{{suffix}}
InstanceOf: DiagnosticReport
Title: "DiagnosticReport-ViralLoad-{{suffix}}"
Description: "DiagnosticReport-ViralLoad-{{suffix}}"
* status = #final
* subject = Reference(Patient-{{suffix}})
* encounter = Reference(Encounter-ViralLoad-{{suffix}})
* result = Reference(Observation-ViralLoad-{{suffix}})
* code = $LNC#25836-8 "HIV 1 RNA [#/volume] (viral load) in Specimen by NAA with probe detection"


Instance: Observation-ViralLoad-{{suffix}}
InstanceOf: Observation
Title: "Observation-ViralLoad-{{suffix}}"
Description: "Observation-ViralLoad-{{suffix}}"
* status = #final
* subject = Reference(Patient-{{suffix}})
* encounter = Reference(Encounter-ViralLoad-{{suffix}}) 
* code = $LNC#25836-8 "HIV 1 RNA [#/volume] (viral load) in Specimen by NAA with probe detection"
* valueQuantity.value = {{viralload}}
* valueQuantity.unit = "copies/mL"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #{copies}/mL


// bundle it all up

Instance: Example-{{suffix}}
InstanceOf: Bundle
Title: "Example-{{suffix}}"
Description: "Example-{{suffix}}"
* type = #transaction

* entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/Patient/Patient-{{suffix}}"
* entry[=].request.url = "Patient"
* entry[=].resource = Patient-{{suffix}}
* insert patient-bundle

* entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/Organization/Organization-{{suffix}}"
* entry[=].request.url = "Organization"
* entry[=].resource = Organization-{{suffix}}
* insert patient-bundle

* entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/Location/Location-{{suffix}}"
* entry[=].request.url = "Location"
* entry[=].resource = Location-{{suffix}}
* insert patient-bundle

* entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/Condition/Condition-{{suffix}}"
* entry[=].request.url = "Condition"
* entry[=].resource = Condition-{{suffix}}
* insert patient-bundle

* entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/Condition/Condition-Pregnancy-{{suffix}}"
* entry[=].request.url = "Condition"
* entry[=].resource = Condition-Pregnancy-{{suffix}}
* insert patient-bundle

// encounter for hiv test

* entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/Encounter/Encounter-{{suffix}}"
* entry[=].request.url = "Encounter"
* entry[=].resource = Encounter-{{suffix}}
* insert patient-bundle

* entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/DiagnosticReport/DiagnosticReport-{{suffix}}"
* entry[=].request.url = "DiagnosticReport"
* entry[=].resource = DiagnosticReport-{{suffix}}
* insert patient-bundle

* entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/Observation/Observation-{{suffix}}"
* entry[=].request.url = "Observation"
* entry[=].resource = Observation-{{suffix}}
* insert patient-bundle

// encounter for viral load

* entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/Encounter/Encounter-ViralLoad-{{suffix}}"
* entry[=].request.url = "Encounter"
* entry[=].resource = Encounter-ViralLoad-{{suffix}}
* insert patient-bundle

* entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/DiagnosticReport/DiagnosticReport-ViralLoad-{{suffix}}"
* entry[=].request.url = "DiagnosticReport"
* entry[=].resource = DiagnosticReport-ViralLoad-{{suffix}}
* insert patient-bundle

* entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/Observation/Observation-ViralLoad-{{suffix}}"
* entry[=].request.url = "Observation"
* entry[=].resource = Observation-ViralLoad-{{suffix}}
* insert patient-bundle
