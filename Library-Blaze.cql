library Blaze version '0.1.0'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'

context Patient

define "Gender":
  Patient.gender

define "Sex":
  Patient.gender.value

define "Female":
  Patient.gender = 'female'

define "Male":
  Patient.gender = 'male'

define "Initial Population":
  true

define "Denominator":
  "Sex" is not null

define "Numerator":
  "Sex" = 'female'