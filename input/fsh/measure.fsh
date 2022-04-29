// Common fields in RuleSets

// todo: measurereport doesn't include this - or doing it wrong
// todo: parameterized ruleset
// e.g. accept vars

// name can have _ but the id can have -. don't mix or you'll experience fhir standard stupidity.
// 'Name should be usable as an identifier for the module by machine processing applications such as code generation'

// "TX_PVLS" represents a valid FHIR name but not a valid FHIR id. FHIR ids cannot contain "_"
// name can have underscore but ID can have dash

RuleSet: meas-common
* identifier[0].system = "https://intrahealth.github.io/simple-hiv-ig/Measure/"
* identifier[1].system = "https://datim.org/factsinfo/mechanism"
* identifier[1].value = "12345"
* version = "0.0.0"
* status = #draft
* experimental = true
* date = "2021-07-01"
* publisher = "OpenHIE"


RuleSet: dash-common-numonly
* group[+]
  * code = $OpenHIE#cohort "cohort"
  // * population[+]
  //   * description = "Initial Population"
  //   * code = $measure-population#initial-population
  //   * criteria.language = #text/cql
  //   * criteria.expression = "Initial Population"
  * population[+]
    * description = "Numerator-Exclusion"
    * code = $measure-population#numerator-exclusion
    * criteria.language = #text/cql
    * criteria.expression = "Numerator-Exclusion"
  * population[+]
    * description = "Numerator"
    * code = $measure-population#numerator
    * criteria.language = #text/cql
    * criteria.expression = "Numerator"
  * stratifier[+]
    * criteria.language = #text/cql
    * criteria.expression = "Stratifier"


RuleSet: dash-common-numdenom
* group[+]
  * code = $OpenHIE#cohort "cohort"
  // * population[+]
  //   * description = "Initial Population"
  //   * code = $measure-population#initial-population
  //   * criteria.language = #text/cql
  //   * criteria.expression = "Initial Population"
  * population[+]
    * description = "Denominator-Exclusion"
    * code = $measure-population#denominator-exclusion
    * criteria.language = #text/cql
    * criteria.expression = "Denominator-Exclusion"
  * population[+]
    * description = "Denominator"
    * code = $measure-population#denominator
    * criteria.language = #text/cql
    * criteria.expression = "Denominator"
  * population[+]
    * description = "Numerator-Exclusion"
    * code = $measure-population#numerator-exclusion
    * criteria.language = #text/cql
    * criteria.expression = "Numerator-Exclusion"
  * population[+]
    * description = "Numerator"
    * code = $measure-population#numerator
    * criteria.language = #text/cql
    * criteria.expression = "Numerator"
  * stratifier[+]
    * criteria.language = #text/cql
    * criteria.expression = "Stratifier"


// DASH measures

Instance: HTS_TST
InstanceOf: Measure
Title: "HTS_TST"
Description: "HTS_TST"
* id = "HTS-TST"
* insert meas-common
* name = "HTS_TST"
* title = "HTS_TST"
* description = "HTS_TST"
* url = "https://intrahealth.github.io/simple-hiv-ig/Measure/HTS_TST"
* identifier[0].value = "HTS_TST"
// only numerator
* scoring = $measure-scoring#cohort
* library[+] = Canonical(HTSTST)
* insert dash-common-numonly


Instance: PMTCT_ART
InstanceOf: Measure
Title: "PMTCT_ART"
Description: "PMTCT_ART"
* id = "PMTCT-ART"
* insert meas-common
* name = "PMTCT_ART"
* title = "PMTCT_ART"
* description = "PMTCT_ART"
* url = "https://intrahealth.github.io/simple-hiv-ig/Measure/PMTCT_ART"
* identifier[0].value = "PMTCT_ART"
// only numerator
* scoring = $measure-scoring#cohort
* library[+] = Canonical(PMTCTART)
* insert dash-common-numdenom


Instance: PMTCT_STAT
InstanceOf: Measure
Title: "PMTCT_STAT"
Description: "PMTCT_STAT"
* id = "PMTCT-STAT"
* insert meas-common
* name = "PMTCT_STAT"
* title = "PMTCT_STAT"
* description = "PMTCT_STAT"
* url = "https://intrahealth.github.io/simple-hiv-ig/Measure/PMTCT_STAT"
* identifier[0].value = "PMTCT_STAT"
// only numerator
* scoring = $measure-scoring#cohort
* library[+] = Canonical(PMTCTSTAT)
* insert dash-common-numonly


Instance: TX_CURR
InstanceOf: Measure
Title: "TX_CURR"
Description: "TX_CURR"
* id = "TX-CURR"
* insert meas-common
* name = "TX_CURR"
* title = "TX_CURR"
* description = "TX_CURR"
* url = "https://intrahealth.github.io/simple-hiv-ig/Measure/TX_CURR"
* identifier[0].value = "TX_CURR"
// only numerator
* scoring = $measure-scoring#cohort
* library[+] = Canonical(TXCURR)
* insert dash-common-numonly


Instance: TX_ML
InstanceOf: Measure
Title: "TX_ML"
Description: "TX_ML"
* id = "TX-ML"
* insert meas-common
* name = "TX_ML"
* title = "TX_ML"
* description = "TX_ML"
* url = "https://intrahealth.github.io/simple-hiv-ig/Measure/TX_ML"
* identifier[0].value = "TX_ML"
// only numerator
* scoring = $measure-scoring#cohort
* library[+] = Canonical(TXML)
* insert dash-common-numonly


Instance: TX_NEW
InstanceOf: Measure
Title: "TX_NEW"
Description: "TX_NEW"
* id = "TX-NEW"
* insert meas-common
* name = "TX_NEW"
* title = "TX_NEW"
* description = "TX_NEW"
* url = "https://intrahealth.github.io/simple-hiv-ig/Measure/TX_NEW"
* identifier[0].value = "TX_NEW"
// only numerator
* scoring = $measure-scoring#cohort
* library[+] = Canonical(TXNEW)
* insert dash-common-numonly


Instance: TX_PVLS
InstanceOf: Measure
Title: "TX_PVLS"
Description: "TX_PVLS"
* id = "TX-PVLS"
* insert meas-common
* name = "TX_PVLS"
* title = "TX_PVLS"
* description = "TX_PVLS"
* url = "https://intrahealth.github.io/simple-hiv-ig/Measure/TX_PVLS"
* identifier[0].value = "TX_PVLS"
* scoring = $measure-scoring#proportion
* library[+] = Canonical(TXPVLS)
* insert dash-common-numdenom
    

// Test measures

Instance: JustGender
InstanceOf: Measure
Title: "JustGender"
Description: "JustGender"
* insert meas-common
* name = "JustGender"
* title = "JustGender"
* description = "JustGender"
* url = "https://intrahealth.github.io/simple-hiv-ig/Measure/JustGender"
* identifier[0].value = "JustGender"
* scoring = $measure-scoring#proportion
* library[+] = Canonical(KitchenSink)
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
* identifier[0].value = "JustAgeGroup"
* scoring = $measure-scoring#proportion
* library[+] = Canonical(KitchenSink)
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
* identifier[0].value = "JustLocation"
* scoring = $measure-scoring#proportion
* library[+] = Canonical(KitchenSink)
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
* identifier[0].value = "GenderAgeGroup"
* scoring = $measure-scoring#proportion
* library[+] = Canonical(KitchenSink)
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
* identifier[0].value = "AgeGroupGenderLocation"
* scoring = $measure-scoring#proportion
* library[+] = Canonical(KitchenSink)
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
* identifier[0].value = "Cohort"
* scoring = $measure-scoring#cohort
* library[+] = Canonical(KitchenSink)
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
* identifier[0].value = "SuppData"
* scoring = $measure-scoring#proportion
* library[+] = Canonical(KitchenSink)
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


