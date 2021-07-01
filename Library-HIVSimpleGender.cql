library HIVSimpleGender version '0.1.0'

using FHIR version '4.0.1'
using QUICK

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

// make a gender code for supp data
define "SDE Sex":
  case
    when Patient.gender = 'male' then Code { code: 'M', system: 'http://hl7.org/fhir/v3/AdministrativeGender', display: 'Male' }
    when Patient.gender = 'female' then Code { code: 'F', system: 'http://hl7.org/fhir/v3/AdministrativeGender', display: 'Female' }
    else null
  end

/* first attempt at supp data for location */

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
    Code { code: "Location".name, system: 'https://github.com/synthetichealth/synthea' }

/* second attempt at supp data for location*/

/*
Most recent encounter location
*/
define "Most Recent Encounter Location Reference":
  Last(
    [Encounter] E
      return First(E.location L return L.location)
      //sort by start of period
  )

/*
Location Code
*/
define "Location Code":
 singleton from (
   [Location] L
     let identifier: singleton from (L.identifier I where I.system = 'Location?identifier=https://github.com/synthetichealth/synthea|b19ad638-35cc-3819-958d-618086f6180a')
     where L.id = Last(Split("Most Recent Encounter Location Reference".reference, '/'))
     return CodeableConcept {
       coding: {
         Coding {
           code: code { value: identifier.value },
           system: identifier.system
         }
       }
     }
 )

define "Location Code Deux":
singleton from (
  [Location] L
    let identifier: singleton from (L.identifier)
    where L.id = Last(Split("Most Recent Encounter Location Reference".reference, '/'))
    return CodeableConcept {
      coding: {
        Coding {
          code: code { value: identifier.value },
          system: identifier.system
        }
      }
    }
)


/* must also try serviceprovider */
/* not working */

/*
Most recent encounter serviceprovider
*/
/* define "Most Recent Encounter serviceprovider Reference":
 Last(
   [Encounter] E
     return First(E.serviceprovider L return L.serviceprovider)
     //sort by start of period
 ) */

/* create clinical decision support logic */
/*
define "HIVTestProposed": ServiceRequest {
 type: Code '75622-1' from "LOINC"
 display 'HIV 1 and 2 tests - Meaningful Use set',
 status 'active'
 intent: 'proposal'
 // values for other elements of the request...
}
 */
