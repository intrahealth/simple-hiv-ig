Alias: $measure-population = http://terminology.hl7.org/CodeSystem/measure-population

// Usage: #example is default so omitted
// * name is removed for clarity
// * title is removed for clarity
// * description is removed for clarity

RuleSet: meas-common
* identifier.system = "https://intrahealth.github.io/simple-hiv-ig/Measure/"
* version = "0.0.0"
* status = #draft
* experimental = true
* date = "2021-07-01"
* publisher = "OpenHIE"
* library[+] = "Library/KitchenSink"
// errors from publisher must be canonical
// still errors...
// * library = Canonical(KitchenSink)
// * library = Canonical(https://intrahealth.github.io/simple-hiv-ig/Library/KitchenSink)

// * type.coding.code = #process <- this is not used in calculations

Instance: HIVSimpleAgeGroup
InstanceOf: Measure
* url = "https://intrahealth.github.io/simple-hiv-ig/Measure/HIVSimpleAgeGroup"
* identifier.value = "HIVSimpleAgeGroup"
* insert meas-common

// options: proportion | ratio | continuous-variable | cohort
* scoring.coding.code = #proportion

// options: opportunity | all-or-nothing | linear | weighted
// * compositeScoring.coding.code = linear

// separate population groups with separate stratifiers per group

* group[+].population[+].description = "Initial Population"
// options: initial-population | numerator | numerator-exclusion | denominator | denominator-exclusion | denominator-exception | measure-population | measure-population-exclusion | measure-observation
* group[=].population[=].code = $measure-population#initial-population
* group[=].population[=].criteria.language = #text/cql
* group[=].population[=].criteria.expression = "Initial Population"
* group[=].stratifier[+].criteria.language = #text/cql
* group[=].stratifier[=].criteria.expression = "Age Group"

* group[+].population[+].description = "Denominator"
* group[=].population[=].code = $measure-population#denominator
* group[=].population[=].criteria.language = #text/cql
* group[=].population[=].criteria.expression = "Denominator"
* group[=].stratifier[+].criteria.language = #text/cql
* group[=].stratifier[=].criteria.expression = "Age Group"

* group[+].population[+].description = "Numerator"
* group[=].population[=].code = $measure-population#numerator
* group[=].population[=].criteria.language = #text/cql
* group[=].population[=].criteria.expression = "Numerator"
* group[=].stratifier[+].criteria.language = #text/cql
* group[=].stratifier[=].criteria.expression = "Age Group"


Instance: HIVSimpleCondition
InstanceOf: Measure
* url = "https://intrahealth.github.io/simple-hiv-ig/Measure/HIVSimpleCondition"
* identifier.value = "HIVSimpleCondition"
* insert meas-common

* scoring.coding.code = #proportion

// same population group with shared stratifiers
* group.population[+].description = "Initial Population"
* group.population[=].code = $measure-population#initial-population
* group.population[=].criteria.language = #text/cql
* group.population[=].criteria.expression = "Initial Population"

* group.population[+].description = "Denominator"
* group.population[=].code = $measure-population#denominator
* group.population[=].criteria.language = #text/cql
* group.population[=].criteria.expression = "Denominator"

* group.population[+].description = "Numerator"
* group.population[=].code = $measure-population#numerator
* group.population[=].criteria.language = #text/cql
* group.population[=].criteria.expression = "Numerator"

* group.stratifier[+].criteria.language = #text/cql
* group.stratifier[=].criteria.expression = "Age Group"


Instance: HIVSimpleGender
InstanceOf: Measure
* url = "https://intrahealth.github.io/simple-hiv-ig/Measure/HIVSimpleGender"
* identifier.value = "HIVSimpleGender"
* insert meas-common

* scoring.coding.code = #proportion

* group.population[+].description = "Initial Population"
* group.population[=].code = $measure-population#initial-population
* group.population[=].criteria.language = #text/cql
* group.population[=].criteria.expression = "Initial Population"

* group.population[+].description = "Denominator"
* group.population[=].code = $measure-population#denominator
* group.population[=].criteria.language = #text/cql
* group.population[=].criteria.expression = "Denominator"

* group.population[+].description = "Numerator"
* group.population[=].code = $measure-population#numerator
* group.population[=].criteria.language = #text/cql
* group.population[=].criteria.expression = "Numerator"


Instance: HIVSimpleGenderCohort
InstanceOf: Measure
* url = "https://intrahealth.github.io/simple-hiv-ig/Measure/HIVSimpleGenderCohort"
* identifier.value = "HIVSimpleGenderCohort"
* insert meas-common

* scoring.coding.code = #cohort

* group.population[+].description = "Initial Population"
* group.population[=].code = $measure-population#initial-population
* group.population[=].criteria.language = #text/cql
* group.population[=].criteria.expression = "Initial Population"


Instance: HIVSimpleGenderSubjectList
InstanceOf: Measure
* url = "https://intrahealth.github.io/simple-hiv-ig/Measure/HIVSimpleGenderSubjectList"
* identifier.value = "HIVSimpleGenderSubjectList"
* insert meas-common

* scoring.coding.code = #cohort

* group.population[+].description = "Initial Population"
* group.population[=].code = $measure-population#initial-population
* group.population[=].criteria.language = #text/cql
* group.population[=].criteria.expression = "Initial Population"


Instance: HIVSimpleGenderSuppData
InstanceOf: Measure
* url = "https://intrahealth.github.io/simple-hiv-ig/Measure/HIVSimpleGenderSuppData"
* identifier.value = "HIVSimpleGenderSuppData"
* insert meas-common

* scoring.coding.code = #proportion

* group.population[+].description = "Initial Population"
* group.population[=].code = $measure-population#initial-population
* group.population[=].criteria.language = #text/cql
* group.population[=].criteria.expression = "Initial Population"

* group.population[+].description = "Denominator"
* group.population[=].code = $measure-population#denominator
* group.population[=].criteria.language = #text/cql
* group.population[=].criteria.expression = "Denominator"

* group.population[+].description = "Numerator"
* group.population[=].code = $measure-population#numerator
* group.population[=].criteria.language = #text/cql
* group.population[=].criteria.expression = "Numerator"

* supplementalData.code.text = "supplemental-data-example-define"
* supplementalData.criteria.language = #text/cql
* supplementalData.criteria.expression = "SDE Sex"


Instance: HIVSimpleGenderSuppDataIndiv
InstanceOf: Measure
* url = "https://intrahealth.github.io/simple-hiv-ig/Measure/HIVSimpleGenderSuppDataIndiv"
* identifier.value = "HIVSimpleGenderSuppDataIndiv"
* insert meas-common

* scoring.coding.code = #proportion

* group.population[+].description = "Initial Population"
* group.population[=].code = $measure-population#initial-population
* group.population[=].criteria.language = #text/cql
* group.population[=].criteria.expression = "Initial Population"

* group.population[+].description = "Denominator"
* group.population[=].code = $measure-population#denominator
* group.population[=].criteria.language = #text/cql
* group.population[=].criteria.expression = "Denominator"

* group.population[+].description = "Numerator"
* group.population[=].code = $measure-population#numerator
* group.population[=].criteria.language = #text/cql
* group.population[=].criteria.expression = "Numerator"

* supplementalData[0].code.text = "supplemental-data-example-define-sex"
* supplementalData[=].criteria.language = #text/cql
* supplementalData[=].criteria.expression = "SDE Sex"
* supplementalData[+].code.text = "supplemental-data-example-define-location"
* supplementalData[=].criteria.language = #text/cql
* supplementalData[=].criteria.expression = "SDE Location"


Instance: HIVSimpleTestResult
InstanceOf: Measure
* url = "https://intrahealth.github.io/simple-hiv-ig/Measure/HIVSimpleTestResult"
* identifier.value = "HIVSimpleTestResult"
* insert meas-common

* scoring.coding.code = #proportion

* group.population[+].description = "Initial Population"
* group.population[=].code = $measure-population#initial-population
* group.population[=].criteria.language = #text/cql
* group.population[=].criteria.expression = "Initial Population"

* group.population[+].description = "Denominator"
* group.population[=].code = $measure-population#denominator
* group.population[=].criteria.language = #text/cql
* group.population[=].criteria.expression = "Denominator"

* group.population[+].description = "Numerator"
* group.population[=].code = $measure-population#numerator
* group.population[=].criteria.language = #text/cql
* group.population[=].criteria.expression = "Numerator"


RuleSet: meas-bundle
* entry[=].request.url = "Measure"
* entry[=].request.method = #PUT

Instance: HIVSimple-Measures
InstanceOf: Bundle
* type = #transaction

* entry[+].fullUrl = "http://www.example.org/fhir/Measure/HIVSimpleAgeGroup"
* entry[=].resource = HIVSimpleAgeGroup
* insert meas-bundle

* entry[+].fullUrl = "http://www.example.org/fhir/Measure/HIVSimpleCondition"
* entry[=].resource = HIVSimpleCondition
* insert meas-bundle

* entry[+].fullUrl = "http://www.example.org/fhir/Measure/HIVSimpleGender"
* entry[=].resource = HIVSimpleGender
* insert meas-bundle

* entry[+].fullUrl = "http://www.example.org/fhir/Measure/HIVSimpleGenderCohort"
* entry[=].resource = HIVSimpleGenderCohort
* insert meas-bundle

* entry[+].fullUrl = "http://www.example.org/fhir/Measure/HIVSimpleGenderSubjectList"
* entry[=].resource = HIVSimpleGenderSubjectList
* insert meas-bundle

* entry[+].fullUrl = "http://www.example.org/fhir/Measure/HIVSimpleGenderSuppData"
* entry[=].resource = HIVSimpleGenderSuppData
* insert meas-bundle

* entry[+].fullUrl = "http://www.example.org/fhir/Measure/HIVSimpleGenderSuppDataIndiv"
* entry[=].resource = HIVSimpleGenderSuppDataIndiv
* insert meas-bundle

* entry[+].fullUrl = "http://www.example.org/fhir/Measure/HIVSimpleTestResult"
* entry[=].resource = HIVSimpleTestResult
* insert meas-bundle
