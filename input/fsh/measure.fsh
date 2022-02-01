// outstanding: measurereport doesn't include this - or doing it wrong
RuleSet: meas-common
* identifier[0].system = "https://intrahealth.github.io/simple-hiv-ig/Measure/"
* identifier[1].system = "https://datim.org/factsinfo/mechanism"
* identifier[1].value = "12345"
* version = "0.0.0"
* status = #draft
* experimental = true
* date = "2021-07-01"
* publisher = "OpenHIE"


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


Instance: TX-CURR
InstanceOf: Measure
Title: "TX-CURR"
Description: "TX-CURR"
* insert meas-common
* name = "TX-CURR"
* title = "TX-CURR"
* description = "TX-CURR"
* url = "https://intrahealth.github.io/simple-hiv-ig/Measure/TX-CURR"
* identifier[0].value = "TX-CURR"
// only numerator
* scoring = $measure-scoring#cohort
* library[+] = Canonical(TXCURR)
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


Instance: TX-ML
InstanceOf: Measure
Title: "TX-ML"
Description: "TX-ML"
* insert meas-common
* name = "TX-ML"
* title = "TX-ML"
* description = "TX-ML"
* url = "https://intrahealth.github.io/simple-hiv-ig/Measure/TX-ML"
* identifier[0].value = "TX-ML"
// only numerator
* scoring = $measure-scoring#cohort
* library[+] = Canonical(TXML)
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



Instance: TX-NEW
InstanceOf: Measure
Title: "TX-NEW"
Description: "TX-NEW"
* insert meas-common
* name = "TX-NEW"
* title = "TX-NEW"
* description = "TX-NEW"
* url = "https://intrahealth.github.io/simple-hiv-ig/Measure/TX-NEW"
* identifier[0].value = "TX-NEW"
// only numerator
* scoring = $measure-scoring#cohort
* library[+] = Canonical(TXNEW)
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


Instance: TX-RTT
InstanceOf: Measure
Title: "TX-RTT"
Description: "TX-RTT"
* insert meas-common
* name = "TX-RTT"
* title = "TX-RTT"
* description = "TX-RTT"
* url = "https://intrahealth.github.io/simple-hiv-ig/Measure/TX-RTT"
* identifier[0].value = "TX-RTT"
// only numerator
* scoring = $measure-scoring#cohort
* library[+] = Canonical(TXRTT)
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


Instance: TX-PVLS
InstanceOf: Measure
Title: "TX-PVLS"
Description: "TX-PVLS"
* insert meas-common
* name = "TX-PVLS"
* title = "TX-PVLS"
* description = "TX-PVLS"
* url = "https://intrahealth.github.io/simple-hiv-ig/Measure/TX-PVLS"
* identifier[0].value = "TX-PVLS"
* scoring = $measure-scoring#proportion
* library[+] = Canonical(TXPVLS)
* group[+]
  * code = $OpenHIE#cohort "cohort"
  * population[+]
    * description = "Initial Population"
    * code = $measure-population#initial-population
    * criteria.language = #text/cql
    * criteria.expression = "Initial Population"
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
    

