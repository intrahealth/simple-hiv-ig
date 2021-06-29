library HIVSimpleGender version '0.1.0'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'
include FHIRCommon version '4.0.1' called FC
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

// make a code for supp data
define "SDE Sex":
  case
    when Patient.gender = 'male' then Code { code: 'M', system: 'http://hl7.org/fhir/v3/AdministrativeGender', display: 'Male' }
    when Patient.gender = 'female' then Code { code: 'F', system: 'http://hl7.org/fhir/v3/AdministrativeGender', display: 'Female' }
    else null
  end

// hack to try pseudo-stratifier for location using supp data
define function "GetId"(uri String):
    Last(Split(uri, '/'))

define function "GetLocation"(reference Reference):
  singleton from (
    [Location] Location where Location.id.value = GetId(reference.reference)
  )

define "Location":
    First([Encounter] E return "GetLocation"(First(E.location).location))

define "SDE Location":
    Code { code: "Location".name, system: 'http://location-name-code-system' }

/*
Most recent encounter location
*/
define "Most Recent Encounter Location Reference":
  Last(
    [Encounter] E
      return First(E.location L return L.location)
      //sort by start of period
  )/*
Location Code
*/
define "Location Code":
  singleton from (
    [Location] L
      let identifier: L.identifier I where I.system = 'http://example.org/opencr-identifiers'
      where L.id = Last(Split("Most Recent Encounter Location Reference", '/'))
      return CodeableConcept {
        coding: {
          Coding {
            code: identifier.value,
            system: identifier.system
          }
        }
      }
  )
