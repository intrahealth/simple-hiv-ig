library HIVSimpleCondition version '0.1.0'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'
include FHIRCommon version '0.1.0' called FC
include AgeRanges version '0.1.0' called AR

// SNOMED-CT, International Edition
codesystem "SNOMED-CT": 'http://snomed.info/sct' version 'http://snomed.info/sct/900000000000207008'

// LOINC, 2.63+
codesystem "LOINC": 'http://loinc.org'

// ConditionOnset: HIV infection
// this conflicts with test result, so should be renamed
code "HIV Positive": '86406008' from "SNOMED-CT" display 'HIV Positive'

context Patient

define "Sex": Patient.gender

// not working: everyone is false for some reason
define "HIV Condition":
  exists ["Condition": "HIV Positive"]

/* define "Get Condition from CodeSystem Declaration":
  [Condition: "SNOMED:86406008"] */

define "Initial Population": true

define "Denominator": true

// always comes up false
define "Numerator":
  "HIV Condition"
