Alias: $measure-population = http://terminology.hl7.org/CodeSystem/measure-population

// Usage: #example is default so omitted
// * name is removed for clarity
// * title is removed for clarity
// * description is removed for clarity

RuleSet: meas-common
* identifier.system = "http://ohie.org/Measure/"
* version = "0.0.0"
* status = #draft
* experimental = true
* date = "2021-07-01"
* publisher = "OpenHIE"
// * type.coding.code = #process <- this is not used in calculations

Instance: HIVSimpleAgeGroup-Measure
InstanceOf: Measure
* url = "Measure/HIVSimpleAgeGroup"
* identifier.value = "HIVSimpleAgeGroup"
* library = "Library/HIVSimpleAgeGroup"
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


Instance: HIVSimpleCondition-Measure
InstanceOf: Measure
* url = "Measure/HIVSimpleCondition"
* identifier.value = "HIVSimpleCondition"
* library = "Library/HIVSimpleCondition"
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


Instance: HIVSimpleDemog-Measure
InstanceOf: Measure
* url = "Measure/HIVSimpleDemog"
* identifier.value = "HIVSimpleDemog"
* library = "Library/HIVSimpleDemog"
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


Instance: HIVSimpleGender-Measure
InstanceOf: Measure
* url = "Measure/HIVSimpleGender"
* identifier.value = "HIVSimpleGender"
* library = "Library/HIVSimpleGender"
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


Instance: HIVSimpleGender2-Measure
InstanceOf: Measure
* url = "Measure/HIVSimpleGender2"
* identifier.value = "HIVSimpleGender2"
* library = "Library/KitchenSink"
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


Instance: HIVSimpleGenderCohort-Measure
InstanceOf: Measure
* url = "Measure/HIVSimpleGenderCohort"
* identifier.value = "HIVSimpleGenderCohort"
* library = "Library/KitchenSink"
* insert meas-common

* scoring.coding.code = #cohort

* group.population[+].description = "Initial Population"
* group.population[=].code = $measure-population#initial-population
* group.population[=].criteria.language = #text/cql
* group.population[=].criteria.expression = "Initial Population"


Instance: HIVSimpleGenderSubjectList-Measure
InstanceOf: Measure
* url = "Measure/HIVSimpleGenderSubjectList"
* identifier.value = "HIVSimpleGenderSubjectList"
* library = "Library/KitchenSink"
* insert meas-common

* scoring.coding.code = #cohort

* group.population[+].description = "Initial Population"
* group.population[=].code = $measure-population#initial-population
* group.population[=].criteria.language = #text/cql
* group.population[=].criteria.expression = "Initial Population"


Instance: HIVSimpleGenderSuppData-Measure
InstanceOf: Measure
* url = "Measure/HIVSimpleGenderSuppData"
* identifier.value = "HIVSimpleGenderSuppData"
* library = "Library/KitchenSink"
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


Instance: HIVSimpleGenderSuppDataIndiv-Measure
InstanceOf: Measure
* url = "Measure/HIVSimpleGenderSuppDataIndiv"
* identifier.value = "HIVSimpleGenderSuppDataIndiv"
* library = "Library/KitchenSink"
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


Instance: HIVSimpleTestResult-Measure
InstanceOf: Measure
* url = "Measure/HIVSimpleTestResult"
* identifier.value = "HIVSimpleTestResult"
* library = "Library/HIVSimpleTestResult"
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


Instance: HIVSimpleViralLoad-Measure
InstanceOf: Measure
* url = "Measure/HIVSimpleViralLoad"
* identifier.value = "HIVSimpleViralLoad"
* library = "Library/HIVSimpleViralLoad"
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

* entry[+].fullUrl = "http://www.example.org/fhir/Measure/HIVSimpleAgeGroup-Measure"
* entry[=].resource = HIVSimpleAgeGroup-Measure
* insert meas-bundle

* entry[+].fullUrl = "http://www.example.org/fhir/Measure/HIVSimpleCondition-Measure"
* entry[=].resource = HIVSimpleCondition-Measure
* insert meas-bundle

* entry[+].fullUrl = "http://www.example.org/fhir/Measure/HIVSimpleDemog-Measure"
* entry[=].resource = HIVSimpleDemog-Measure
* insert meas-bundle

* entry[+].fullUrl = "http://www.example.org/fhir/Measure/HIVSimpleGender-Measure"
* entry[=].resource = HIVSimpleGender-Measure
* insert meas-bundle

* entry[+].fullUrl = "http://www.example.org/fhir/Measure/HIVSimpleGender2-Measure"
* entry[=].resource = HIVSimpleGender2-Measure
* insert meas-bundle

* entry[+].fullUrl = "http://www.example.org/fhir/Measure/HIVSimpleGenderCohort-Measure"
* entry[=].resource = HIVSimpleGenderCohort-Measure
* insert meas-bundle

* entry[+].fullUrl = "http://www.example.org/fhir/Measure/HIVSimpleGenderSubjectList-Measure"
* entry[=].resource = HIVSimpleGenderSubjectList-Measure
* insert meas-bundle

* entry[+].fullUrl = "http://www.example.org/fhir/Measure/HIVSimpleGenderSuppData-Measure"
* entry[=].resource = HIVSimpleGenderSuppData-Measure
* insert meas-bundle

* entry[+].fullUrl = "http://www.example.org/fhir/Measure/HIVSimpleGenderSuppDataIndiv-Measure"
* entry[=].resource = HIVSimpleGenderSuppDataIndiv-Measure
* insert meas-bundle

* entry[+].fullUrl = "http://www.example.org/fhir/Measure/HIVSimpleTestResult-Measure"
* entry[=].resource = HIVSimpleTestResult-Measure
* insert meas-bundle

* entry[+].fullUrl = "http://www.example.org/fhir/Measure/HIVSimpleViralLoad-Measure"
* entry[=].resource = HIVSimpleViralLoad-Measure
* insert meas-bundle
