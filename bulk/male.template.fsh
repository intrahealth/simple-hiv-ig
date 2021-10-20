// vars: {{suffix}}, {{hivonsetdate}}, {{birthDate}}, {{hivonsetdate}}, {{hivtestdate}}

Alias: $Patient-{{suffix}} = https://intrahealth.github.io/simple-hiv-ig/Patient/Patient-{{suffix}}
Alias: $Organization-{{suffix}} = https://intrahealth.github.io/simple-hiv-ig/Organization/Organization-{{suffix}}
Alias: $Location-{{suffix}} = https://intrahealth.github.io/simple-hiv-ig/Location/Location-{{suffix}}
Alias: $Condition-{{suffix}} = https://intrahealth.github.io/simple-hiv-ig/Condition/Condition-{{suffix}}

Alias: $Encounter-{{suffix}} = https://intrahealth.github.io/simple-hiv-ig/Encounter/Encounter-{{suffix}}
Alias: $DiagnosticReport-{{suffix}} = https://intrahealth.github.io/simple-hiv-ig/DiagnosticReport/DiagnosticReport-{{suffix}}
Alias: $Observation-{{suffix}} = https://intrahealth.github.io/simple-hiv-ig/Observation/Observation-{{suffix}}

Alias: $Encounter-ViralLoad-{{suffix}} = https://intrahealth.github.io/simple-hiv-ig/Encounter/Encounter-ViralLoad-{{suffix}}
Alias: $DiagnosticReport-ViralLoad-{{suffix}} = https://intrahealth.github.io/simple-hiv-ig/DiagnosticReport/DiagnosticReport-ViralLoad-{{suffix}}
Alias: $Observation-ViralLoad-{{suffix}} = https://intrahealth.github.io/simple-hiv-ig/Observation/Observation-ViralLoad-{{suffix}}


Instance:     Patient-{{suffix}}
InstanceOf:   Patient
Title: "Patient-{{suffix}}"
Description: "Patient-{{suffix}}"
* name[+].given = "{{given}}"
* name[=].family = "{{family}}"
* name[=].text = "{{name}}"
* gender = #male
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
* managingOrganization = Reference($Organization-{{suffix}})
* identifier[+].system = $synthea
* identifier[=].value = "Location-{{suffix}}"

// conditions

Instance: Condition-{{suffix}}
InstanceOf: Condition
Title: "Condition-{{suffix}}"
Description: "Condition-{{suffix}}"
* clinicalStatus = $condition-clinical#active
* verificationStatus = $condition-ver-status#confirmed
* subject = Reference($Patient-{{suffix}})
// todo: review this for consistency
* code = $SCT#86406008 "HIV - Human immunodeficiency virus infection"
* onsetDateTime = "{{hivonsetdate}}"

Instance: Encounter-{{suffix}}
InstanceOf: Encounter
Title: "Encounter-{{suffix}}"
Description: "Encounter-{{suffix}}"
* status = #finished
* class = $v3-ActCode#ACUTE
* subject = Reference($Patient-{{suffix}})
* serviceProvider = Reference($Organization-{{suffix}})
* location[+].location = Reference($Location-{{suffix}})
* period.start = "{{hivtestdate}}"
* period.end = "{{hivtestdate}}"


Instance: DiagnosticReport-{{suffix}}
InstanceOf: DiagnosticReport
Title: "DiagnosticReport-{{suffix}}"
Description: "DiagnosticReport-{{suffix}}"
* status = #final
* encounter = Reference($Encounter-{{suffix}})
* subject = Reference($Patient-{{suffix}})
* result = Reference($Observation-{{suffix}})
* code = $LNC#75622-1 "HIV 1 and 2 tests - Meaningful Use set"


Instance: Observation-{{suffix}}
InstanceOf: Observation
Title: "Observation-{{suffix}}"
Description: "Observation-{{suffix}}"
* status = #final
* encounter = Reference($Encounter-{{suffix}})
* subject = Reference($Patient-{{suffix}})
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
* subject = Reference($Patient-{{suffix}})
* serviceProvider = Reference($Organization-{{suffix}})
* location[+].location = Reference($Location-{{suffix}})
* period.start = "{{vltestdate}}"
* period.end = "{{vltestdate}}"


Instance: DiagnosticReport-ViralLoad-{{suffix}}
InstanceOf: DiagnosticReport
Title: "DiagnosticReport-ViralLoad-{{suffix}}"
Description: "DiagnosticReport-ViralLoad-{{suffix}}"
* status = #final
* subject = Reference($Patient-{{suffix}})
* encounter = Reference($Encounter-ViralLoad-{{suffix}})
* result = Reference($Observation-ViralLoad-{{suffix}})
* code = $LNC#25836-8 "HIV 1 RNA [#/volume] (viral load) in Specimen by NAA with probe detection"


Instance: Observation-ViralLoad-{{suffix}}
InstanceOf: Observation
Title: "Observation-ViralLoad-{{suffix}}"
Description: "Observation-ViralLoad-{{suffix}}"
* status = #final
* subject = Reference($Patient-{{suffix}})
* encounter = Reference($Encounter-ViralLoad-{{suffix}}) 
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

* entry[+].fullUrl = $Patient-{{suffix}}
* entry[=].request.url = "Patient"
* entry[=].resource = Patient-{{suffix}}
* insert patient-bundle

* entry[+].fullUrl = $Organization-{{suffix}}
* entry[=].request.url = "Organization"
* entry[=].resource = Organization-{{suffix}}
* insert patient-bundle

* entry[+].fullUrl = $Location-{{suffix}}
* entry[=].request.url = "Location"
* entry[=].resource = Location-{{suffix}}
* insert patient-bundle

* entry[+].fullUrl = $Condition-{{suffix}}
* entry[=].request.url = "Condition"
* entry[=].resource = Condition-{{suffix}}
* insert patient-bundle

// encounter for hiv test

* entry[+].fullUrl = $Encounter-{{suffix}}
* entry[=].request.url = "Encounter"
* entry[=].resource = Encounter-{{suffix}}
* insert patient-bundle

* entry[+].fullUrl = $DiagnosticReport-{{suffix}}
* entry[=].request.url = "DiagnosticReport"
* entry[=].resource = DiagnosticReport-{{suffix}}
* insert patient-bundle

* entry[+].fullUrl = $Observation-{{suffix}}
* entry[=].request.url = "Observation"
* entry[=].resource = Observation-{{suffix}}
* insert patient-bundle

// encounter for viral load

* entry[+].fullUrl = $Encounter-ViralLoad-{{suffix}}
* entry[=].request.url = "Encounter"
* entry[=].resource = Encounter-ViralLoad-{{suffix}}
* insert patient-bundle

* entry[+].fullUrl = $DiagnosticReport-ViralLoad-{{suffix}}
* entry[=].request.url = "DiagnosticReport"
* entry[=].resource = DiagnosticReport-ViralLoad-{{suffix}}
* insert patient-bundle

* entry[+].fullUrl = $Observation-ViralLoad-{{suffix}}
* entry[=].request.url = "Observation"
* entry[=].resource = Observation-ViralLoad-{{suffix}}
* insert patient-bundle
