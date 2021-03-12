library HIVSimpleViralLoad version '0.1.0'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'
include FHIRCommon version '0.1.0' called FC
include AgeRanges version '0.1.0' called AR

// SNOMED-CT, International Edition
codesystem "SNOMED-CT": 'http://snomed.info/sct' version 'http://snomed.info/sct/900000000000207008'

// LOINC, 2.63+
codesystem "LOINC": 'http://loinc.org'

// Viral load
// * LOINC code 25836-8
// * "HIV 1 RNA NAA+probe (Specimen)"
// * Units: copies/mL
// * Suppressed viral load (<1000 copies/mL)
// * Used range of 200 (very low) -> 1000000 (very high)
code "HIV 1 RNA NAA+probe (Specimen)": '25836-8' from "LOINC" display 'HIV 1 RNA NAA+probe (Specimen)'

context Patient

// all these seem to workie

define "Suppressed":
  [Observation: "HIV 1 RNA NAA+probe (Specimen)"] Observation
    where Observation.value < 1000 'copies/mL'

define "Unsuppressed":
  [Observation: "HIV 1 RNA NAA+probe (Specimen)"] Observation
    where Observation.value >= 1000 'copies/mL'

define "Viral Load Test Result":
  ["Observation": "HIV 1 RNA NAA+probe (Specimen)"] Observation
    where Observation.value is not null

// below works
define "Living with HIV and on ART with suppressed viral load results (<1000 copies/mL)":
  ["Observation": "HIV 1 RNA NAA+probe (Specimen)"] Observation
    where Observation.value < 1000 'copies/mL'

define "Living with HIV and on ART with unsuppressed viral load results (>1000 copies/mL)":
  ["Observation": "HIV 1 RNA NAA+probe (Specimen)"] Observation
    where Observation.value >= 1000 'copies/mL'

define "Sex": Patient.gender

define "Initial Population": true

define "Denominator": true

define "Numerator":
  "Unsuppressed"
