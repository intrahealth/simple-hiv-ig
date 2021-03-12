library HIVSimpleTestResult version '0.1.0'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'
include FHIRCommon version '0.1.0' called FC
include AgeRanges version '0.1.0' called AR

// SNOMED-CT, International Edition
codesystem "SNOMED-CT": 'http://snomed.info/sct' version 'http://snomed.info/sct/900000000000207008'

// LOINC, 2.63+
codesystem "LOINC": 'http://loinc.org'

// HIV Test Results
code "HIV Negative": '165815009' from "SNOMED-CT" display 'HIV Negative'
code "HIV Positive": '165816005' from "SNOMED-CT" display 'HIV Positive'
code "HIV 1 and 2 tests - Meaningful Use set": '75622-1' from "LOINC" display 'HIV 1 and 2 tests - Meaningful Use set'

context Patient

define "HIV Test Exists":
  exists ([Observation: "HIV 1 and 2 tests - Meaningful Use set"])

define "HIV Positive Observation":
  [Observation: "HIV 1 and 2 tests - Meaningful Use set"] Observation
    where Observation.value = "HIV Positive"

define "HIV Negative Observation":
  [Observation: "HIV 1 and 2 tests - Meaningful Use set"] Observation
    where Observation.value = "HIV Negative"

define "Is HIV Positive":
  exists ("HIV Positive Observation")
  and "HIV Test Exists"

define "Is HIV Negative":
  exists ("HIV Negative Observation")
  and "HIV Test Exists"

// always null
define "HIV Test Results":
  case
    when "Is HIV Positive" then "HIV Positive"
    when "Is HIV Negative" then "HIV Negative"
    else null
  end

define "Sex": Patient.gender

// Age Group/Sex
// always null
define "Age Group/Sex": AR."Age Group".code + ':' + "Sex"

// always null
define "Age Group/Sex/HIV Test Results":
  AR."Age Group".code + ':' + "Sex" + ':' + "HIV Test Results".code

define "Initial Population": true

define "Denominator": true

define "Numerator":
  "Is HIV Negative"
  and "Sex" = 'female'
