Alias: $measure-population = http://terminology.hl7.org/CodeSystem/measure-population

Instance: HIVSimpleAgeGroup-Measure
InstanceOf: Measure
Usage: #example
* url = "Measure/HIVSimpleAgeGroup"
* identifier.system = "http://ohie.org/Measure/"
* identifier.value = "HIVSimpleAgeGroup"
* version = "0.0.0"
* name = "HIVSimpleAgeGroup"
* title = "HIVSimpleAgeGroup"
* status = #draft
* experimental = true
* date = "2018-03-08"
* publisher = "Open HIE"
* description = "HIVSimpleAgeGroup"
* library = "Library/HIVSimpleAgeGroup"
* scoring.coding.code = #proportion
* type.coding.code = #process
* group.code.text = "cohort"
* group.description = "Cohort"
* group.population[0].description = "Initial Population"
* group.population[=].code = $measure-population#initial-population
* group.population[=].criteria.language = #text/cql
* group.population[=].criteria.expression = "Initial Population"
* group.population[+].description = "Numerator"
* group.population[=].code = $measure-population#numerator
* group.population[=].criteria.language = #text/cql
* group.population[=].criteria.expression = "Numerator"
* group.population[+].description = "Denominator"
* group.population[=].code = $measure-population#denominator
* group.population[=].criteria.language = #text/cql
* group.population[=].criteria.expression = "Denominator"

Instance: HIVSimpleCondition-Measure
InstanceOf: Measure
Usage: #example
* url = "Measure/HIVSimpleCondition"
* identifier.system = "http://ohie.org/Measure/"
* identifier.value = "HIVSimpleCondition"
* version = "0.0.0"
* name = "HIVSimpleCondition"
* title = "HIVSimpleCondition"
* status = #draft
* experimental = true
* date = "2018-03-08"
* publisher = "Open HIE"
* description = "HIVSimpleCondition"
* library = "Library/HIVSimpleCondition"
* scoring.coding.code = #proportion
* type.coding.code = #process
* group.code.text = "cohort"
* group.description = "Cohort"
* group.population[0].description = "Initial Population"
* group.population[=].code = $measure-population#initial-population
* group.population[=].criteria.language = #text/cql
* group.population[=].criteria.expression = "Initial Population"
* group.population[+].description = "Numerator"
* group.population[=].code = $measure-population#numerator
* group.population[=].criteria.language = #text/cql
* group.population[=].criteria.expression = "Numerator"
* group.population[+].description = "Denominator"
* group.population[=].code = $measure-population#denominator
* group.population[=].criteria.language = #text/cql
* group.population[=].criteria.expression = "Denominator"

Instance: HIVSimpleDemog-Measure
InstanceOf: Measure
Usage: #example
* url = "Measure/HIVSimpleDemog"
* identifier.system = "http://ohie.org/Measure/"
* identifier.value = "HIVSimpleDemog"
* version = "0.0.0"
* name = "HIVSimpleDemog"
* title = "HIVSimpleDemog"
* status = #draft
* experimental = true
* date = "2018-03-08"
* publisher = "Open HIE"
* description = "HIVSimpleDemog"
* library = "Library/HIVSimpleDemog"
* scoring.coding.code = #proportion
* type.coding.code = #process
* group.code.text = "cohort"
* group.description = "Cohort"
* group.population[0].description = "Initial Population"
* group.population[=].code = $measure-population#initial-population
* group.population[=].criteria.language = #text/cql
* group.population[=].criteria.expression = "Initial Population"
* group.population[+].description = "Numerator"
* group.population[=].code = $measure-population#numerator
* group.population[=].criteria.language = #text/cql
* group.population[=].criteria.expression = "Numerator"
* group.population[+].description = "Denominator"
* group.population[=].code = $measure-population#denominator
* group.population[=].criteria.language = #text/cql
* group.population[=].criteria.expression = "Denominator"

Instance: HIVSimpleGender-Measure
InstanceOf: Measure
Usage: #example
* url = "Measure/HIVSimpleGender"
* identifier.system = "http://ohie.org/Measure/"
* identifier.value = "HIVSimpleGender"
* version = "0.1.0"
* name = "HIVSimpleGender"
* title = "HIVSimpleGender"
* status = #draft
* experimental = true
* date = "2018-03-08"
* publisher = "Open HIE"
* description = "HIVSimpleGender"
* library = "Library/HIVSimpleGender"
* scoring.coding.code = #proportion
* type.coding.code = #process
* group.code.text = "cohort"
* group.description = "Cohort"
* group.population[0].description = "Initial Population"
* group.population[=].code = $measure-population#initial-population
* group.population[=].criteria.language = #text/cql
* group.population[=].criteria.expression = "Initial Population"
* group.population[+].description = "Numerator"
* group.population[=].code = $measure-population#numerator
* group.population[=].criteria.language = #text/cql
* group.population[=].criteria.expression = "Numerator"
* group.population[+].description = "Denominator"
* group.population[=].code = $measure-population#denominator
* group.population[=].criteria.language = #text/cql
* group.population[=].criteria.expression = "Denominator"

Instance: HIVSimpleGender2-Measure
InstanceOf: Measure
Usage: #example
* url = "Measure/HIVSimpleGender2"
* identifier.system = "http://ohie.org/Measure/"
* identifier.value = "HIVSimpleGender2"
* version = "0.1.0"
* name = "HIVSimpleGender2"
* title = "HIVSimpleGender2"
* status = #draft
* experimental = true
* date = "2021-03-01"
* publisher = "HL7 International - [Some] Work Group"
* description = "HIVSimpleGender2"
* library = "Library/HIVSimpleGender"
* scoring.coding.code = #proportion
* type.coding.code = #process
* group.code.text = "cohort"
* group.description = "Cohort"
* group.population[0].description = "Initial Population"
* group.population[=].code = $measure-population#initial-population
* group.population[=].criteria.language = #text/cql
* group.population[=].criteria.expression = "Initial Population"
* group.population[+].description = "Numerator"
* group.population[=].code = $measure-population#numerator
* group.population[=].criteria.language = #text/cql
* group.population[=].criteria.expression = "Numerator"
* group.population[+].description = "Denominator"
* group.population[=].code = $measure-population#denominator
* group.population[=].criteria.language = #text/cql
* group.population[=].criteria.expression = "Denominator"

Instance: HIVSimpleGenderCohort-Measure
InstanceOf: Measure
Usage: #example
* url = "Measure/HIVSimpleGenderCohort"
* identifier.system = "http://ohie.org/Measure/"
* identifier.value = "HIVSimpleGenderCohort"
* version = "0.1.0"
* name = "HIVSimpleGenderCohort"
* title = "HIVSimpleGenderCohort"
* status = #draft
* experimental = true
* date = "2021-03-01"
* publisher = "HL7 International - [Some] Work Group"
* description = "HIVSimpleGenderCohort"
* library = "Library/HIVSimpleGender"
* scoring.coding.code = #cohort
* group.code.text = "HIVSimpleGenderCohort"
* group.description = "HIVSimpleGenderCohort"
* group.population.description = "Initial Population"
* group.population.code = $measure-population#initial-population
* group.population.criteria.language = #text/cql
* group.population.criteria.expression = "Initial Population"

Instance: HIVSimpleGenderSubjectList-Measure
InstanceOf: Measure
Usage: #example
* url = "Measure/HIVSimpleGenderSubjectList"
* identifier.system = "http://ohie.org/Measure/"
* identifier.value = "HIVSimpleGenderSubjectList"
* version = "0.1.0"
* name = "HIVSimpleGenderSubjectList"
* title = "HIVSimpleGenderSubjectList"
* status = #draft
* experimental = true
* date = "2021-03-01"
* publisher = "HL7 International - [Some] Work Group"
* description = "HIVSimpleGenderSubjectList"
* library = "Library/HIVSimpleGender"
* type.coding.code = #subject-list
* scoring.coding.code = #cohort
* group.code.text = "HIVSimpleGenderSubjectList"
* group.description = "HIVSimpleGenderSubjectList"
* group.population.description = "Initial Population"
* group.population.code = $measure-population#initial-population
* group.population.criteria.language = #text/cql
* group.population.criteria.expression = "Initial Population"

Instance: HIVSimpleGenderSuppData-Measure
InstanceOf: Measure
Usage: #example
* url = "Measure/HIVSimpleGenderSuppData"
* identifier.system = "http://ohie.org/Measure/"
* identifier.value = "HIVSimpleGenderSuppData"
* version = "0.1.0"
* name = "HIVSimpleGenderSuppData"
* title = "HIVSimpleGenderSuppData"
* status = #draft
* experimental = true
* date = "2021-03-01"
* publisher = "HL7 International - [Some] Work Group"
* description = "HIVSimpleGenderSuppData"
* library = "Library/HIVSimpleGender"
* scoring.coding.code = #proportion
* type.coding.code = #process
* group.code.text = "cohort"
* group.description = "Cohort"
* group.population[0].description = "Initial Population"
* group.population[=].code = $measure-population#initial-population
* group.population[=].criteria.language = #text/cql
* group.population[=].criteria.expression = "Initial Population"
* group.population[+].description = "Numerator"
* group.population[=].code = $measure-population#numerator
* group.population[=].criteria.language = #text/cql
* group.population[=].criteria.expression = "Numerator"
* group.population[+].description = "Denominator"
* group.population[=].code = $measure-population#denominator
* group.population[=].criteria.language = #text/cql
* group.population[=].criteria.expression = "Denominator"
* supplementalData.code.text = "supplemental-data-example-define"
* supplementalData.criteria.language = #text/cql
* supplementalData.criteria.expression = "SDE Sex"

Instance: HIVSimpleGenderSuppDataIndiv-Measure
InstanceOf: Measure
Usage: #example
* url = "Measure/HIVSimpleGenderSuppDataIndiv"
* identifier.system = "http://ohie.org/Measure/"
* identifier.value = "HIVSimpleGenderSuppDataIndiv"
* version = "0.1.0"
* name = "HIVSimpleGenderSuppDataIndiv"
* title = "HIVSimpleGenderSuppDataIndiv"
* status = #draft
* experimental = true
* date = "2021-03-01"
* publisher = "HL7 International - [Some] Work Group"
* description = "HIVSimpleGenderSuppDataIndiv"
* library = "Library/HIVSimpleGenderIndiv"
* scoring.coding.code = #proportion
* type.coding.code = #individual
* group.code.text = "cohort"
* group.description = "Cohort"
* group.population[0].description = "Initial Population"
* group.population[=].code = $measure-population#initial-population
* group.population[=].criteria.language = #text/cql
* group.population[=].criteria.expression = "Initial Population"
* group.population[+].description = "Numerator"
* group.population[=].code = $measure-population#numerator
* group.population[=].criteria.language = #text/cql
* group.population[=].criteria.expression = "Numerator"
* group.population[+].description = "Denominator"
* group.population[=].code = $measure-population#denominator
* group.population[=].criteria.language = #text/cql
* group.population[=].criteria.expression = "Denominator"
* supplementalData[0].code.text = "supplemental-data-example-define-sex"
* supplementalData[=].criteria.language = #text/cql
* supplementalData[=].criteria.expression = "SDE Sex"
* supplementalData[+].code.text = "supplemental-data-example-define-location"
* supplementalData[=].criteria.language = #text/cql
* supplementalData[=].criteria.expression = "SDE Location"



Instance: HIVSimpleTestResult-Measure
InstanceOf: Measure
Usage: #example
* url = "Measure/HIVSimpleTestResult"
* identifier.system = "http://ohie.org/Measure/"
* identifier.value = "HIVSimpleTestResult"
* version = "0.0.0"
* name = "HIVSimpleTestResult"
* title = "HIVSimpleTestResult"
* status = #draft
* experimental = true
* date = "2021-03-01"
* publisher = "Open HIE"
* description = "HIVSimpleTestResult"
* library = "Library/HIVSimpleTestResult"
* scoring.coding.code = #proportion
* type.coding.code = #process
* group.code.text = "cohort"
* group.description = "Cohort"
* group.population[0].description = "Initial Population"
* group.population[=].code = $measure-population#initial-population
* group.population[=].criteria.language = #text/cql
* group.population[=].criteria.expression = "Initial Population"
* group.population[+].description = "Numerator"
* group.population[=].code = $measure-population#numerator
* group.population[=].criteria.language = #text/cql
* group.population[=].criteria.expression = "Numerator"
* group.population[+].description = "Denominator"
* group.population[=].code = $measure-population#denominator
* group.population[=].criteria.language = #text/cql
* group.population[=].criteria.expression = "Denominator"

Instance: HIVSimpleViralLoad-Measure
InstanceOf: Measure
Usage: #example
* url = "Measure/HIVSimpleViralLoad"
* identifier.system = "http://ohie.org/Measure/"
* identifier.value = "HIVSimpleViralLoad"
* version = "0.0.0"
* name = "HIVSimpleViralLoad"
* title = "HIVSimpleViralLoad"
* status = #draft
* experimental = true
* date = "2018-03-08"
* publisher = "Open HIE"
* description = "HIVSimpleViralLoad"
* library = "Library/HIVSimpleViralLoad"
* scoring.coding.code = #proportion
* type.coding.code = #process
* group.code.text = "cohort"
* group.description = "Cohort"
* group.population[0].description = "Initial Population"
* group.population[=].code = $measure-population#initial-population
* group.population[=].criteria.language = #text/cql
* group.population[=].criteria.expression = "Initial Population"
* group.population[+].description = "Numerator"
* group.population[=].code = $measure-population#numerator
* group.population[=].criteria.language = #text/cql
* group.population[=].criteria.expression = "Numerator"
* group.population[+].description = "Denominator"
* group.population[=].code = $measure-population#denominator
* group.population[=].criteria.language = #text/cql
* group.population[=].criteria.expression = "Denominator"