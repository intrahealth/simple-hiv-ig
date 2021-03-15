library HIVSimpleAgeGroup version '0.1.0'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'
include FHIRCommon version '0.1.0' called FC
include AgeRanges version '0.1.0' called AR

// SNOMED-CT, International Edition
codesystem "SNOMED-CT": 'http://snomed.info/sct' version 'http://snomed.info/sct/900000000000207008'

// LOINC, 2.63+
codesystem "LOINC": 'http://loinc.org'

context Patient

define "Sex":
  Patient.gender

define "Age Group/Sex":
  AR."Age Group".code + ':' + "Sex"

define "Initial Population": true

define "Denominator": true

// returns null
define "Numerator":
  "Age Group/Sex"
