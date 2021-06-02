library HIVSimpleGender version '0.1.0'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'
include FHIRCommon version '0.1.0' called FC
// include AgeRanges called AR

// SNOMED-CT, International Edition
codesystem "SNOMED-CT": 'http://snomed.info/sct' version 'http://snomed.info/sct/900000000000207008'

// LOINC, 2.63+
codesystem "LOINC": 'http://loinc.org'

context Patient

define "Sex": Patient.gender

define "Female":
  Patient.gender = 'female'

define "Male":
  Patient.gender = 'male'

define "Initial Population": true

define "Denominator":
  "Sex" is not null

define "Numerator":
  "Sex" = 'female'

define "Hello, World!": 'Hello, World!'

define "birthDate": Patient.birthDate
define "birthDate_str": ToString(Patient.birthDate)

define "Given Name str": Patient.name.given[0]
define "Given Name": Patient.name.given[0].value

define "Family Name str": Patient.name.family[0]
define "Family Name": Patient.name.family[0].value
