// Common fields in RuleSets

// todo: measurereport doesn't include this - or doing it wrong
// todo: parameterized ruleset
// e.g. accept vars

// name can have underscore not dash; ID can have dash but not underscore
// don't mix or you'll experience fhir stupidity

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
  * population[+]
    * description = "Initial Population"
    * code = $measure-population#initial-population
    * criteria.language = #text/cql
    * criteria.expression = "Initial Population"
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


// DASH measures

Instance: DASHHTSTST
InstanceOf: Measure
Title: "DASHHTSTST"
Description: "DASHHTSTST"
* id = "DASHHTSTST"
* insert meas-common
* name = "DASHHTSTST"
* title = "DASHHTSTST"
* description = "HTSDASHTST"
* url = "https://intrahealth.github.io/simple-hiv-ig/Measure/DASHHTSTST"
* identifier[0].value = "DASHHTSTST"
// only numerator
* scoring = $measure-scoring#cohort
* library[+] = Canonical(HTSTST)
* insert dash-common-numonly


Instance: DASHPMTCTART
InstanceOf: Measure
Title: "DASHPMTCTART"
Description: "DASHPMTCTART"
* id = "DASHPMTCTART"
* insert meas-common
* name = "DASHPMTCTART"
* title = "DASHPMTCTART"
* description = "DASHPMTCTART"
* url = "https://intrahealth.github.io/simple-hiv-ig/Measure/DASHPMTCTART"
* identifier[0].value = "DASHPMTCTART"
// only numerator
* scoring = $measure-scoring#cohort
* library[+] = Canonical(PMTCTART)
* insert dash-common-numdenom


Instance: DASHPMTCTSTAT
InstanceOf: Measure
Title: "DASHPMTCTSTAT"
Description: "DASHPMTCTSTAT"
* id = "DASHPMTCTSTAT"
* insert meas-common
* name = "DASHPMTCTSTAT"
* title = "DASHPMTCTSTAT"
* description = "DASHPMTCTSTAT"
* url = "https://intrahealth.github.io/simple-hiv-ig/Measure/DASHPMTCTSTAT"
* identifier[0].value = "DASHPMTCTSTAT"
// only numerator
* scoring = $measure-scoring#cohort
* library[+] = Canonical(PMTCTSTAT)
* insert dash-common-numonly


Instance: DASHTXCURR
InstanceOf: Measure
Title: "DASHTXCURR"
Description: "DASHTXCURR"
* id = "DASHTXCURR"
* insert meas-common
* name = "DASHTXCURR"
* title = "DASHTXCURR"
* description = "DASHTXCURR"
* url = "https://intrahealth.github.io/simple-hiv-ig/Measure/DASHTXCURR"
* identifier[0].value = "DASHTXCURR"
// only numerator
* scoring = $measure-scoring#cohort
* library[+] = Canonical(TXCURR)
* insert dash-common-numonly


Instance: DASHTXML
InstanceOf: Measure
Title: "DASHTXML"
Description: "DASHTXML"
* id = "DASHTXML"
* insert meas-common
* name = "DASHTXML"
* title = "DASHTXML"
* description = "DASHTXML"
* url = "https://intrahealth.github.io/simple-hiv-ig/Measure/DASHTXML"
* identifier[0].value = "DASHTXML"
// only numerator
* scoring = $measure-scoring#cohort
* library[+] = Canonical(TXML)
* insert dash-common-numonly


Instance: DASHTXNEW
InstanceOf: Measure
Title: "DASHTXNEW"
Description: "DASHTXNEW"
* id = "DASHTXNEW"
* insert meas-common
* name = "DASHTXNEW"
* title = "DASHTXNEW"
* description = "DASHTXNEW"
* url = "https://intrahealth.github.io/simple-hiv-ig/Measure/DASHTXNEW"
* identifier[0].value = "DASHTXNEW"
// only numerator
* scoring = $measure-scoring#cohort
* library[+] = Canonical(TXNEW)
* insert dash-common-numonly


Instance: DASHTXPVLS
InstanceOf: Measure
Title: "DASHTXPVLS"
Description: "DASHTXPVLS"
* id = "DASHTXPVLS"
* insert meas-common
* name = "DASHTXPVLS"
* title = "DASHTXPVLS"
* description = "DASHTXPVLS"
* url = "https://intrahealth.github.io/simple-hiv-ig/Measure/DASHTXPVLS"
* identifier[0].value = "DASHTXPVLS"
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


Instance: Easy
InstanceOf: Measure
Title: "Easy"
Description: "Easy"
* insert meas-common
* name = "Easy"
* title = "Easy"
* description = "Easy"
* url = "https://intrahealth.github.io/simple-hiv-ig/Measure/Easy"
* identifier[0].value = "Easy"
* scoring = $measure-scoring#proportion
* library[+] = Canonical(EasyLib)
* group[+]
  * code = $OpenHIE#cohort "cohort"
  * population[+]
    * description = "Initial Population"
    * code = $measure-population#initial-population
    * criteria.language = #text/cql
    * criteria.expression = "Initial Population"
  * population[+]
    * description = "Numerator"
    * code = $measure-population#numerator
    * criteria.language = #text/cql
    * criteria.expression = "Numerator"
  * population[+]
    * description = "Denominator"
    * code = $measure-population#denominator
    * criteria.language = #text/cql
    * criteria.expression = "Denominator"


    // doesn't work
    // * criteria.language = #text/fhirpath
    // * criteria.expression = "Patient.gender = 'female'"
 