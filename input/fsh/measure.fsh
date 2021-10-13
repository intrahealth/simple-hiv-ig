Alias: $measure-scoring = http://terminology.hl7.org/CodeSystem/measure-scoring
Alias: $measure-population = http://terminology.hl7.org/CodeSystem/measure-population

RuleSet: meas-common
* identifier.system = "https://intrahealth.github.io/simple-hiv-ig/Measure/"
* version = "0.0.0"
* status = #draft
* experimental = true
* date = "2021-07-01"
* publisher = "OpenHIE"
* library[+] = Canonical(KitchenSink)
// * type.coding.code = #process <- this is not used in calculations


RuleSet: meas-common-blaze
* identifier.system = "https://intrahealth.github.io/simple-hiv-ig/Measure/"
* version = "0.0.0"
* status = #draft
* experimental = true
* date = "2021-07-01"
* publisher = "OpenHIE"
* library[+] = Canonical(Blaze)


Instance: HIVSimpleAgeGroup
InstanceOf: Measure
Title: "HIVSimpleAgeGroup"
Description: "HIVSimpleAgeGroup"
* insert meas-common
* name = "HIVSimpleAgeGroup"
* url = "https://intrahealth.github.io/simple-hiv-ig/Measure/HIVSimpleAgeGroup"
* identifier.value = "HIVSimpleAgeGroup"
// options: proportion | ratio | continuous-variable | cohort
* scoring = $measure-scoring#proportion
// options: opportunity | all-or-nothing | linear | weighted
// * compositeScoring.coding.code = linear
// options: initial-population | numerator | numerator-exclusion | denominator | denominator-exclusion | denominator-exception | measure-population | measure-population-exclusion | measure-observation
* group[+]
  * code = $OpenHIE#cohort "cohort"
  * population[+]
    * description = "Initial Population"
    * code = $measure-population#initial-population
    * criteria.language = #text/cql
    * criteria.expression = "Initial Population"
  * population[+]
    * description = "Denominator"
    * code = $measure-population#denominator
    * criteria.language = #text/cql
    * criteria.expression = "Denominator"
  * population[+]
    * description = "Numerator"
    * code = $measure-population#numerator
    * criteria.language = #text/cql
    * criteria.expression = "Numerator"
  * stratifier[0].criteria.language = #text/cql
  * stratifier[=].criteria.expression = "Age Group"


Instance: HIVSimpleCondition
InstanceOf: Measure
Title: "HIVSimpleCondition"
Description: "HIVSimpleCondition"
* insert meas-common
* name = "HIVSimpleCondition"
* url = "https://intrahealth.github.io/simple-hiv-ig/Measure/HIVSimpleCondition"
* identifier.value = "HIVSimpleCondition"
* scoring = $measure-scoring#proportion
* group[+]
  * code = $OpenHIE#cohort "cohort"
  * population[+]
    * description = "Initial Population"
    * code = $measure-population#initial-population
    * criteria.language = #text/cql
    * criteria.expression = "Initial Population"
  * population[+]
    * description = "Denominator"
    * code = $measure-population#denominator
    * criteria.language = #text/cql
    * criteria.expression = "Denominator"
  * population[+]
    * description = "Numerator"
    * code = $measure-population#numerator
    * criteria.language = #text/cql
    * criteria.expression = "Numerator"
  * stratifier[0].criteria.language = #text/cql
  * stratifier[=].criteria.expression = "Age Group"


Instance: HIVSimpleGender
InstanceOf: Measure
Title: "HIVSimpleGender"
Description: "HIVSimpleGender"
* insert meas-common
* name = "HIVSimpleGender"
* url = "https://intrahealth.github.io/simple-hiv-ig/Measure/HIVSimpleGender"
* identifier.value = "HIVSimpleGender"
* scoring = $measure-scoring#proportion
* group[+]
  * code = $OpenHIE#cohort "cohort"
  * population[+]
    * description = "Initial Population"
    * code = $measure-population#initial-population
    * criteria.language = #text/cql
    * criteria.expression = "Initial Population"
  * population[+]
    * description = "Denominator"
    * code = $measure-population#denominator
    * criteria.language = #text/cql
    * criteria.expression = "Denominator"
  * population[+]
    * description = "Numerator"
    * code = $measure-population#numerator
    * criteria.language = #text/cql
    * criteria.expression = "Numerator"


Instance: HIVSimpleGenderCohort
InstanceOf: Measure
Title: "HIVSimpleGenderCohort"
Description: "HIVSimpleGenderCohort"
* insert meas-common
* name = "HIVSimpleGenderCohort"
* url = "https://intrahealth.github.io/simple-hiv-ig/Measure/HIVSimpleGenderCohort"
* identifier.value = "HIVSimpleGenderCohort"
* scoring = $measure-scoring#cohort
* group[+]
  * code = $OpenHIE#cohort "cohort"
  * population[+]
    * description = "Initial Population"
    * code = $measure-population#initial-population
    * criteria.language = #text/cql
    * criteria.expression = "Initial Population"


Instance: HIVSimpleGenderSubjectList
InstanceOf: Measure
Title: "HIVSimpleGenderSubjectList"
Description: "HIVSimpleGenderSubjectList"
* insert meas-common
* name = "HIVSimpleGenderSubjectList"
* url = "https://intrahealth.github.io/simple-hiv-ig/Measure/HIVSimpleGenderSubjectList"
* identifier.value = "HIVSimpleGenderSubjectList"
* scoring = $measure-scoring#cohort
* group[+]
  * code = $OpenHIE#cohort "cohort"
  * population[+]
    * description = "Initial Population"
    * code = $measure-population#initial-population
    * criteria.language = #text/cql
    * criteria.expression = "Initial Population"


Instance: HIVSimpleGenderSuppData
InstanceOf: Measure
Title: "HIVSimpleGenderSuppData"
Description: "HIVSimpleGenderSuppData"
* insert meas-common
* name = "HIVSimpleGenderSuppData"
* url = "https://intrahealth.github.io/simple-hiv-ig/Measure/HIVSimpleGenderSuppData"
* identifier.value = "HIVSimpleGenderSuppData"
* scoring = $measure-scoring#proportion
* group[+]
  * code = $OpenHIE#cohort "cohort"
  * population[+]
    * description = "Initial Population"
    * code = $measure-population#initial-population
    * criteria.language = #text/cql
    * criteria.expression = "Initial Population"
  * population[+]
    * description = "Denominator"
    * code = $measure-population#denominator
    * criteria.language = #text/cql
    * criteria.expression = "Denominator"
  * population[+]
    * description = "Numerator"
    * code = $measure-population#numerator
    * criteria.language = #text/cql
    * criteria.expression = "Numerator"
* supplementalData[+]
  * code.text = "supplemental-data-example-define"
  * criteria.language = #text/cql
  * criteria.expression = "SDE Sex"


Instance: HIVSimpleGenderSuppDataIndiv
InstanceOf: Measure
Title: "HIVSimpleGenderSuppDataIndiv"
Description: "HIVSimpleGenderSuppDataIndiv"
* insert meas-common
* name = "HIVSimpleGenderSuppDataIndiv"
* url = "https://intrahealth.github.io/simple-hiv-ig/Measure/HIVSimpleGenderSuppDataIndiv"
* identifier.value = "HIVSimpleGenderSuppDataIndiv"
* scoring = $measure-scoring#proportion
* group[+]
  * code = $OpenHIE#cohort "cohort"
  * population[+]
    * description = "Initial Population"
    * code = $measure-population#initial-population
    * criteria.language = #text/cql
    * criteria.expression = "Initial Population"
  * population[+]
    * description = "Denominator"
    * code = $measure-population#denominator
    * criteria.language = #text/cql
    * criteria.expression = "Denominator"
  * population[+]
    * description = "Numerator"
    * code = $measure-population#numerator
    * criteria.language = #text/cql
    * criteria.expression = "Numerator"
* supplementalData[+]
  * code.text = "supplemental-data-example-define-sex"
  * criteria.language = #text/cql
  * criteria.expression = "SDE Sex"
* supplementalData[+]
  * code.text = "supplemental-data-example-define-location"
  * criteria.language = #text/cql
  * criteria.expression = "SDE Location"


Instance: HIVSimpleTestResult
InstanceOf: Measure
Title: "HIVSimpleTestResult"
Description: "HIVSimpleTestResult"
* insert meas-common
* name = "HIVSimpleTestResult"
* url = "https://intrahealth.github.io/simple-hiv-ig/Measure/HIVSimpleTestResult"
* identifier.value = "HIVSimpleTestResult"
* scoring = $measure-scoring#proportion
* group[+]
  * code = $OpenHIE#cohort "cohort"
  * population[+]
    * description = "Initial Population"
    * code = $measure-population#initial-population
    * criteria.language = #text/cql
    * criteria.expression = "Initial Population"
  * population[+]
    * description = "Denominator"
    * code = $measure-population#denominator
    * criteria.language = #text/cql
    * criteria.expression = "Denominator"
  * population[+]
    * description = "Numerator"
    * code = $measure-population#numerator
    * criteria.language = #text/cql
    * criteria.expression = "Numerator"

// "The reportType `%s` is invalid. Please use one of `subject`, `subject-list` or `population`." report-type
// subject-list must be a POST

Instance: BlazeStratifierTest
InstanceOf: Measure
Title: "BlazeStratifierTest"
Description: "BlazeStratifierTest"
* insert meas-common-blaze
* name = "BlazeStratifierTest"
* url = "https://intrahealth.github.io/simple-hiv-ig/Measure/BlazeStratifierTest"
* identifier.value = "BlazeStratifierTest"
* scoring = $measure-scoring#proportion
* group[+]
  * code = $OpenHIE#cohort "cohort"
  * population[+]
    * description = "Initial Population"
    * code = $measure-population#initial-population
    * criteria.language = #text/cql
    * criteria.expression = "Initial Population"
  * stratifier[+]
    * criteria.language = #text/cql
    * criteria.expression = "Gender"


Instance: BlazeStratifierAgeGroup
InstanceOf: Measure
Title: "BlazeStratifierAgeGroup"
Description: "BlazeStratifierAgeGroup"
* insert meas-common-blaze
* name = "BlazeStratifierAgeGroup"
* url = "https://intrahealth.github.io/simple-hiv-ig/Measure/BlazeStratifierAgeGroup"
* identifier.value = "BlazeStratifierAgeGroup"
* scoring = $measure-scoring#proportion
* group[+]
  * code = $OpenHIE#cohort "cohort"
  * population[+]
    * description = "Initial Population"
    * code = $measure-population#initial-population
    * criteria.language = #text/cql
    * criteria.expression = "Initial Population"
  * stratifier[+]
    * criteria.language = #text/cql
    * criteria.expression = "Age Group/Sex"


Instance: BlazeAgeGroupLocation
InstanceOf: Measure
Title: "BlazeAgeGroupLocation"
Description: "BlazeAgeGroupLocation"
* insert meas-common-blaze
* name = "BlazeAgeGroupLocation"
* url = "https://intrahealth.github.io/simple-hiv-ig/Measure/BlazeAgeGroupLocation"
* identifier.value = "BlazeAgeGroupLocation"
* scoring = $measure-scoring#proportion
* group[+]
  * code = $OpenHIE#cohort "cohort"
  * population[+]
    * description = "Initial Population"
    * code = $measure-population#initial-population
    * criteria.language = #text/cql
    * criteria.expression = "Initial Population"
  * stratifier[+]
    * criteria.language = #text/cql
    * criteria.expression = "Age Group/Sex/Location"



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
