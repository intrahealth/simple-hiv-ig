Alias: $base = https://intrahealth.github.io/simple-hiv-ig
Alias: $ohie = http://ohie.org/CodeSystem
Alias: $measure-population = http://terminology.hl7.org/CodeSystem/measure-population
Alias: $measure-scoring = http://terminology.hl7.org/CodeSystem/measure-scoring

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
// works to elimate errors, but eval-measure can't be found when measures are run
// * library[+] = "https://intrahealth.github.io/simple-hiv-ig/Library/KitchenSink"

// this is expected to work
* library[+] = Canonical(KitchenSink)

// still errors...
// * library = Canonical(Library/KitchenSink)
// * library = Canonical(https://intrahealth.github.io/simple-hiv-ig/Library/KitchenSink)
// * type.coding.code = #process <- this is not used in calculations


Instance: HIVSimpleAgeGroup
InstanceOf: Measure
Title: "HIVSimpleAgeGroup"
Description: "HIVSimpleAgeGroup"
* url = "https://intrahealth.github.io/simple-hiv-ig/Measure/HIVSimpleAgeGroup"
* identifier.value = "HIVSimpleAgeGroup"
* insert meas-common

// options: proportion | ratio | continuous-variable | cohort
* scoring = $measure-scoring#proportion

// options: opportunity | all-or-nothing | linear | weighted
// * compositeScoring.coding.code = linear

// separate population groups with separate stratifiers per group
// options: initial-population | numerator | numerator-exclusion | denominator | denominator-exclusion | denominator-exception | measure-population | measure-population-exclusion | measure-observation

* group[+].code = $ohie#cohort "cohort"
* group[=].population[+].description = "Initial Population"
* group[=].population[=].code = $measure-population#initial-population
* group[=].population[=].criteria.language = #text/cql
* group[=].population[=].criteria.expression = "Initial Population"
* group[=].stratifier[+].criteria.language = #text/cql
* group[=].stratifier[=].criteria.expression = "Age Group"

* group[+].code = $ohie#cohort "cohort"
* group[=].population[+].description = "Denominator"
* group[=].population[=].code = $measure-population#denominator
* group[=].population[=].criteria.language = #text/cql
* group[=].population[=].criteria.expression = "Denominator"
* group[=].stratifier[+].criteria.language = #text/cql
* group[=].stratifier[=].criteria.expression = "Age Group"

* group[+].code = $ohie#cohort "cohort"
* group[=].population[+].description = "Numerator"
* group[=].population[=].code = $measure-population#numerator
* group[=].population[=].criteria.language = #text/cql
* group[=].population[=].criteria.expression = "Numerator"
* group[=].stratifier[+].criteria.language = #text/cql
* group[=].stratifier[=].criteria.expression = "Age Group"


Instance: HIVSimpleCondition
InstanceOf: Measure
Title: "HIVSimpleCondition"
Description: "HIVSimpleCondition"
* url = "https://intrahealth.github.io/simple-hiv-ig/Measure/HIVSimpleCondition"
* identifier.value = "HIVSimpleCondition"
* insert meas-common

* scoring = $measure-scoring#proportion

// same population group with shared stratifiers
* group.code = $ohie#cohort "cohort"
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
Title: "HIVSimpleGender"
Description: "HIVSimpleGender"
* url = "https://intrahealth.github.io/simple-hiv-ig/Measure/HIVSimpleGender"
* identifier.value = "HIVSimpleGender"
* insert meas-common

* scoring = $measure-scoring#proportion

* group.code = $ohie#cohort "cohort"
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
Title: "HIVSimpleGenderCohort"
Description: "HIVSimpleGenderCohort"
* url = "https://intrahealth.github.io/simple-hiv-ig/Measure/HIVSimpleGenderCohort"
* identifier.value = "HIVSimpleGenderCohort"
* insert meas-common

* scoring = $measure-scoring#cohort

* group.code = $ohie#cohort "cohort"
* group.population[+].description = "Initial Population"
* group.population[=].code = $measure-population#initial-population
* group.population[=].criteria.language = #text/cql
* group.population[=].criteria.expression = "Initial Population"


Instance: HIVSimpleGenderSubjectList
InstanceOf: Measure
Title: "HIVSimpleGenderSubjectList"
Description: "HIVSimpleGenderSubjectList"
* url = "https://intrahealth.github.io/simple-hiv-ig/Measure/HIVSimpleGenderSubjectList"
* identifier.value = "HIVSimpleGenderSubjectList"
* insert meas-common

* scoring = $measure-scoring#cohort

* group.code = $ohie#cohort "cohort"
* group.population[+].description = "Initial Population"
* group.population[=].code = $measure-population#initial-population
* group.population[=].criteria.language = #text/cql
* group.population[=].criteria.expression = "Initial Population"


Instance: HIVSimpleGenderSuppData
InstanceOf: Measure
Title: "HIVSimpleGenderSuppData"
Description: "HIVSimpleGenderSuppData"
* url = "https://intrahealth.github.io/simple-hiv-ig/Measure/HIVSimpleGenderSuppData"
* identifier.value = "HIVSimpleGenderSuppData"
* insert meas-common

* scoring = $measure-scoring#proportion

* group.code = $ohie#cohort "cohort"
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
Title: "HIVSimpleGenderSuppDataIndiv"
Description: "HIVSimpleGenderSuppDataIndiv"
* url = "https://intrahealth.github.io/simple-hiv-ig/Measure/HIVSimpleGenderSuppDataIndiv"
* identifier.value = "HIVSimpleGenderSuppDataIndiv"
* insert meas-common

* scoring = $measure-scoring#proportion

* group.code = $ohie#cohort "cohort"
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
Title: "HIVSimpleTestResult"
Description: "HIVSimpleTestResult"
* url = "https://intrahealth.github.io/simple-hiv-ig/Measure/HIVSimpleTestResult"
* identifier.value = "HIVSimpleTestResult"
* insert meas-common

* scoring = $measure-scoring#proportion

* group.code = $ohie#cohort "cohort"
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


// RuleSet: meas-bundle
// * entry[=].request.method = #PUT

// Instance: HIVSimpleMeasures
// InstanceOf: Bundle
// Title: "HIVSimpleMeasures"
// Description: "HIVSimpleMeasures"
// * type = #transaction

// * entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/Measure/HIVSimpleAgeGroup"
// * entry[=].resource = HIVSimpleAgeGroup
// * entry[=].request.url = "Measure/HIVSimpleAgeGroup"
// * insert meas-bundle

// * entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/Measure/HIVSimpleCondition"
// * entry[=].resource = HIVSimpleCondition
// * entry[=].request.url = "Measure/HIVSimpleCondition"
// * insert meas-bundle

// * entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/Measure/HIVSimpleGender"
// * entry[=].resource = HIVSimpleGender
// * entry[=].request.url = "Measure/HIVSimpleGender"
// * insert meas-bundle

// * entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/Measure/HIVSimpleGenderCohort"
// * entry[=].resource = HIVSimpleGenderCohort
// * entry[=].request.url = "Measure/HIVSimpleGenderCohort"
// * insert meas-bundle

// * entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/Measure/HIVSimpleGenderSubjectList"
// * entry[=].resource = HIVSimpleGenderSubjectList
// * entry[=].request.url = "Measure/HIVSimpleGenderSubjectList"
// * insert meas-bundle

// * entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/Measure/HIVSimpleGenderSuppData"
// * entry[=].resource = HIVSimpleGenderSuppData
// * entry[=].request.url = "Measure/HIVSimpleGenderSuppData"
// * insert meas-bundle

// * entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/Measure/HIVSimpleGenderSuppDataIndiv"
// * entry[=].resource = HIVSimpleGenderSuppDataIndiv
// * entry[=].request.url = "Measure/HIVSimpleGenderSuppDataIndiv"
// * insert meas-bundle

// * entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/Measure/HIVSimpleTestResult"
// * entry[=].resource = HIVSimpleTestResult
// * entry[=].request.url = "Measure/HIVSimpleTestResult"
// * insert meas-bundle
