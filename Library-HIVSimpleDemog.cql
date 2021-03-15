library HIVSimpleDemog version '0.1.0'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'
include FHIRCommon version '0.1.0' called FC
include AgeRanges version '0.1.0' called AR

// SNOMED-CT, International Edition
codesystem "SNOMED-CT": 'http://snomed.info/sct' version 'http://snomed.info/sct/900000000000207008'

// LOINC, 2.63+
codesystem "LOINC": 'http://loinc.org'

// inclusive (closed) boundaries are indicated with square brackets,
// and exclusive (open) boundaries are indicated with parentheses
parameter MeasurementPeriod default Interval[@1970-01-01, @2021-01-01)

context Patient

define "Sex": Patient.gender

// not working as expected
define "Age Group Test":
  AR."Age Group".code

  define Patient0To5AndFemale:
    AgeInYearsAt(start of "MeasurementPeriod") >= 0
      and AgeInYearsAt(start of "MeasurementPeriod") < 5
      and Patient.gender = 'female'

  define Patient5To15AndFemale:
    AgeInYearsAt(start of "MeasurementPeriod") >= 5
      and AgeInYearsAt(start of "MeasurementPeriod") < 15
      and Patient.gender = 'female'

  define Patient15To25AndFemale:
    AgeInYearsAt(start of "MeasurementPeriod") >= 15
      and AgeInYearsAt(start of "MeasurementPeriod") < 25
      and Patient.gender = 'female'

  define Patient25To50AndFemale:
    AgeInYearsAt(start of "MeasurementPeriod") >= 25
      and AgeInYearsAt(start of "MeasurementPeriod") < 50
      and Patient.gender = 'female'

  define Patient50To65AndFemale:
    AgeInYearsAt(start of "MeasurementPeriod") >= 50
      and AgeInYearsAt(start of "MeasurementPeriod") < 65
      and Patient.gender = 'female'

  define Patient65ToHighestAndFemale:
    AgeInYearsAt(start of "MeasurementPeriod") >= 65
      and Patient.gender = 'female'

  define Patient0To5AndMale:
    AgeInYearsAt(start of "MeasurementPeriod") >= 0
      and AgeInYearsAt(start of "MeasurementPeriod") < 5
      and Patient.gender = 'male'

  define Patient5To15AndMale:
    AgeInYearsAt(start of "MeasurementPeriod") >= 5
      and AgeInYearsAt(start of "MeasurementPeriod") < 15
      and Patient.gender = 'male'

  define Patient15To25AndMale:
    AgeInYearsAt(start of "MeasurementPeriod") >= 15
      and AgeInYearsAt(start of "MeasurementPeriod") < 25
      and Patient.gender = 'male'

  define Patient25To50AndMale:
    AgeInYearsAt(start of "MeasurementPeriod") >= 25
      and AgeInYearsAt(start of "MeasurementPeriod") < 50
      and Patient.gender = 'male'

  define Patient50To65AndMale:
    AgeInYearsAt(start of "MeasurementPeriod") >= 50
      and AgeInYearsAt(start of "MeasurementPeriod") < 65
      and Patient.gender = 'male'

  define Patient65ToHighestAndMale:
    AgeInYearsAt(start of "MeasurementPeriod") >= 65
      and Patient.gender = 'male'

define "Initial Population": true

define "Denominator": true

define "Numerator": true
