RuleSet: meas-common
* identifier.system = "https://intrahealth.github.io/simple-hiv-ig/Measure/"
* version = "0.0.0"
* status = #draft
* experimental = true
* date = "2021-07-01"
* publisher = "OpenHIE"
* library[+] = Canonical(KitchenSink)


Instance: JustGender
InstanceOf: Measure
Title: "JustGender"
Description: "JustGender"
* insert meas-common
* name = "JustGender"
* title = "JustGender"
* description = "JustGender"
* url = "https://intrahealth.github.io/simple-hiv-ig/Measure/JustGender"
* identifier.value = "JustGender"
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
  * stratifier[+]
    * criteria.language = #text/cql
    * criteria.expression = "Gender"


Instance: JustAgeGroup
InstanceOf: Measure
Title: "JustAgeGroup"
Description: "JustAgeGroup"
* insert meas-common
* name = "JustAgeGroup"
* title = "JustAgeGroup"
* description = "JustAgeGroup"
* url = "https://intrahealth.github.io/simple-hiv-ig/Measure/JustAgeGroup"
* identifier.value = "JustAgeGroup"
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
  * stratifier[+]
    * criteria.language = #text/cql
    * criteria.expression = "Age Group"


Instance: JustLocation
InstanceOf: Measure
Title: "JustLocation"
Description: "JustLocation"
* insert meas-common
* name = "JustLocation"
* title = "JustLocation"
* description = "JustLocation"
* url = "https://intrahealth.github.io/simple-hiv-ig/Measure/JustLocation"
* identifier.value = "JustLocation"
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
  * stratifier[+]
    * criteria.language = #text/cql
    * criteria.expression = "Naive Location"


Instance: AgeGroupGender
InstanceOf: Measure
Title: "AgeGroupGender"
Description: "AgeGroupGender"
* insert meas-common
* name = "AgeGroupGender"
* title = "AgeGroupGender"
* description = "AgeGroupGender"
* url = "https://intrahealth.github.io/simple-hiv-ig/Measure/AgeGroupGender"
* identifier.value = "GenderAgeGroup"
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
  * stratifier[+]
    * criteria.language = #text/cql
    * criteria.expression = "Age Group/Gender"


Instance: AgeGroupGenderLocation
InstanceOf: Measure
Title: "AgeGroupGenderLocation"
Description: "AgeGroupGenderLocation"
* insert meas-common
* name = "AgeGroupGenderLocation"
* title = "AgeGroupGenderLocation"
* description = "AgeGroupGenderLocation"
* url = "https://intrahealth.github.io/simple-hiv-ig/Measure/AgeGroupGenderLocation"
* identifier.value = "AgeGroupGenderLocation"
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
  * stratifier[+]
    * criteria.language = #text/cql
    * criteria.expression = "Age Group/Sex/Location 2"


Instance: Cohort
InstanceOf: Measure
Title: "Cohort"
Description: "Cohort"
* insert meas-common
* name = "Cohort"
* title = "Cohort"
* description = "Cohort"
* url = "https://intrahealth.github.io/simple-hiv-ig/Measure/Cohort"
* identifier.value = "Cohort"
* scoring = $measure-scoring#cohort
* group[+]
  * code = $OpenHIE#cohort "cohort"
  * population[+]
    * description = "Initial Population"
    * code = $measure-population#initial-population
    * criteria.language = #text/cql
    * criteria.expression = "Initial Population"


Instance: SuppData
InstanceOf: Measure
Title: "SuppData"
Description: "SuppData"
* insert meas-common
* name = "SuppData"
* title = "SuppData"
* description = "SuppData"
* url = "https://intrahealth.github.io/simple-hiv-ig/Measure/SuppData"
* identifier.value = "SuppData"
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
// not working
* supplementalData[+]
  * code.text = "supplemental-data-example-define-location"
  * criteria.language = #text/cql
  * criteria.expression = "Location Code Revised"


Instance: TXPVLS
InstanceOf: Measure
Title: "TXPVLS"
Description: "TXPVLS"
* insert meas-common
* name = "TXPVLS"
* title = "TXPVLS"
* description = "TXPVLS"
* url = "https://intrahealth.github.io/simple-hiv-ig/Measure/TXPVLS"
* identifier.value = "TXPVLS"
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
    // any viral load result
    * criteria.expression = "Viral Load Test Result"
  * population[+]
    * description = "Numerator"
    * code = $measure-population#numerator
    * criteria.language = #text/cql
    * criteria.expression = "Suppressed"
  * stratifier[+]
    * criteria.language = #text/cql
    * criteria.expression = "Age Group/Sex/Location 2"


RuleSet: meas-common-blaze
* identifier.system = "https://intrahealth.github.io/simple-hiv-ig/Measure/"
* version = "0.0.0"
* status = #draft
* experimental = true
* date = "2021-07-01"
* publisher = "OpenHIE"
* library[+] = Canonical(Blaze)


Instance: BlazeStratifierTest
InstanceOf: Measure
Title: "BlazeStratifierTest"
Description: "BlazeStratifierTest"
* insert meas-common-blaze
* name = "BlazeStratifierTest"
* title = "BlazeStratifierTest"
* description = "BlazeStratifierTest"
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
  * stratifier[+]
    * criteria.language = #text/cql
    * criteria.expression = "Gender"


Instance: BlazeStratifierAgeGroup
InstanceOf: Measure
Title: "BlazeStratifierAgeGroup"
Description: "BlazeStratifierAgeGroup"
* insert meas-common-blaze
* name = "BlazeStratifierAgeGroup"
* title = "BlazeStratifierAgeGroup"
* description = "BlazeStratifierAgeGroup"
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
  * stratifier[+]
    * criteria.language = #text/cql
    * criteria.expression = "Age Group/Sex"


Instance: BlazeAgeGroupLocation
InstanceOf: Measure
Title: "BlazeAgeGroupLocation"
Description: "BlazeAgeGroupLocation"
* insert meas-common-blaze
* name = "BlazeAgeGroupLocation"
* title = "BlazeAgeGroupLocation"
* description = "BlazeAgeGroupLocation"
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
  * stratifier[+]
    * criteria.language = #text/cql
    * criteria.expression = "Age Group/Sex/Location Again"


Instance: BlazeGenderLocation
InstanceOf: Measure
Title: "BlazeGenderLocation"
Description: "BlazeGenderLocation"
* insert meas-common-blaze
* name = "BlazeGenderLocation"
* title = "BlazeGenderLocation"
* description = "BlazeGenderLocation"
* url = "https://intrahealth.github.io/simple-hiv-ig/Measure/BlazeGenderLocation"
* identifier.value = "BlazeAgeGroupLocation"
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
  * stratifier[+]
    * criteria.language = #text/cql
    * criteria.expression = "Age Group/Sex/Location 2"



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