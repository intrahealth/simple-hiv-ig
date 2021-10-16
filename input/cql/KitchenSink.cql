library KitchenSink version '0.1.0'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'
include FHIRCommon version '4.0.1' called FC
include AgeRanges version '0.1.0' called AR

// SNOMED-CT, International Edition

codesystem "SNOMED-CT": 'http://snomed.info/sct' version 'http://snomed.info/sct/900000000000207008'
// LOINC, 2.63+
codesystem "LOINC": 'http://loinc.org'

// ConditionOnset: HIV infection, this conflicts with test result, so is be renamed

code "HIV Condition Positive": '86406008' from "SNOMED-CT" display 'HIV infection'
code "HIV 1 and 2 tests - Meaningful Use set": '75622-1' from "LOINC" display 'HIV 1 and 2 tests - Meaningful Use set'
code "Pregnant (finding)": '77386006' from "SNOMED-CT" display 'Pregnant (finding)'
code "HIV 1 RNA NAA+probe (Specimen)": '25836-8' from "LOINC" display 'HIV 1 RNA [#/volume] (viral load) in Specimen by NAA with probe detection'

context Patient

define "Sex":
  Patient.gender.value

define "Female":
  Patient.gender = 'female'

define "Male":
  Patient.gender = 'male'

define "Age Group/Sex":
  AR."Age Group".code + ':' + "Sex"

define "Age Group":
  AR."Age Group"

define "Initial Population":
  true

define "Denominator":
  "Sex" is not null

define "Numerator":
  "Sex" is not null

define "Hello, World!":
  'Hello, World!'

/* define "birthDate": Patient.birthDate */

define "birthDate_str":
  ToString(Patient.birthDate)

/* define "Given Name str": Patient.name.given[0] */

define "Given Name":
  Patient.name.given[0].value

/* define "Family Name str": Patient.name.family[0] */

define "Family Name":
  Patient.name.family[0].value

// works in fsh

define "HIV Condition":
  exists ["Condition": "HIV Condition Positive"]

define "Is HIV Positive":
  "HIV Condition"

define "Is HIV Negative":
  not "HIV Condition"

define "Pregnant":
  exists ["Condition": "Pregnant (finding)"]

define "Viral Load Test Result":
  ["Observation": "HIV 1 RNA NAA+probe (Specimen)"] Obs
    where Obs.status = 'final'
      and Obs.value is not null


// check these
/* define "HIV Test Exists":
  exists ([Observation: "HIV 1 and 2 tests - Meaningful Use set"])

define "HIV Positive Observation":
  [Observation: "HIV 1 and 2 tests - Meaningful Use set"] Observation
    where Observation.value = "Is HIV Positive"

define "HIV Negative Observation":
  [Observation: "HIV 1 and 2 tests - Meaningful Use set"] Observation
    where Observation.value = "Is HIV Negative"

define "HIV Test Results":
  case
    when "Is HIV Positive" then "HIV Positive Observation"
    when "Is HIV Negative" then "HIV Negative Observation"
    else null
  end */

// always null
/* define "Age Group/Sex/HIV Test Results":
  AR."Age Group".code + ':' + "Sex" + ':' + "HIV Test Results".code */


// synthea uses copies/mL but fsh uses {copies}/mL which is official

define "Living with HIV and on ART with suppressed viral load results (<1000 copies/mL)":
  ["Observation": "HIV 1 RNA NAA+probe (Specimen)"] Observation
    where Observation.value < 1000 '{copies}/mL'

define "Living with HIV and on ART with unsuppressed viral load results (>1000 copies/mL)":
  ["Observation": "HIV 1 RNA NAA+probe (Specimen)"] Observation
    where Observation.value >= 1000 '{copies}/mL'

define "Suppressed":
  [Observation: "HIV 1 RNA NAA+probe (Specimen)"] Observation
    where Observation.value < 1000 '{copies}/mL'

define "Unsuppressed":
  [Observation: "HIV 1 RNA NAA+probe (Specimen)"] Observation
    where Observation.value >= 1000 '{copies}/mL'

define "Contact date":
  [Encounter] E
    return E.period.start

// make a gender code for supp data
define "SDE Sex":
  case
    when Patient.gender = 'male' then Code { code: 'M', system: 'http://hl7.org/fhir/administrative-gender', display: 'Male' }
    when Patient.gender = 'female' then Code { code: 'F', system: 'http://hl7.org/fhir/administrative-gender', display: 'Female' }
    else null
  end

/* first attempt at supp data for location */

define function "GetId"(uri String):
  Last(Split(uri, '/'))

define function "GetLocation"(reference Reference):
  singleton from ( [Location] Location
    where Location.id.value = GetId(reference.reference)
  )

define "Location":
  First([Encounter] E
    return "GetLocation"(First(E.location).location)
  )

define "Most Recent Encounter Location Reference":
  Last([Encounter] E
    return First(E.location L
      return L.location
    )
      //sort by start of period
  )
// works with cql not evaluate-measure
define "Location Code Revised":
  singleton from (
    [Location] L
      let identifier: singleton from (L.identifier I)
      // let identifier: singleton from (L.identifier I where I.system = 'https://github.com/synthetichealth/synthea')
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


define "Age Group/Sex/Location 2":
  "Age Group".code + ':' + "Sex" + ':' + "Most Recent Encounter Location Reference Reference".value


// this comes up as null in both fsh and evaluate-measure
define "SDE Location":
  // Code { code: "Location".name }
  Code { code: "Location".name, system: 'http://location-name-code-system', display: Location.name }


// returns string, not usable in stratifier
define "Most Recent Encounter Location Reference Reference":
  Last([Encounter] E
    return First(E.location L
      return L.location.reference
    )
      //sort by start of period
  )

// not working for cql or evaluate-measure
define "Age Group/Sex/Location":
  "Age Group".code + ':' + "Sex" + ':' + "Most Recent Encounter Location Reference".reference

// works with cql not evaluate-measure
define "Location Code":
  singleton from ( [Location] L
    let identifier: singleton from ( L.identifier I
        where I.system = 'https://github.com/synthetichealth/synthea'
    )
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

// works with cql not evaluate-measure
define "Location Code Deux":
  singleton from ( [Location] L
    let identifier: singleton from ( L.identifier )
    where L.id = Last(Split("Most Recent Encounter Location Reference".reference, '/'))
    return CodeableConcept { 
      coding: { 
        Coding { code: code { value: identifier.value }, 
        system: identifier.system 
        } 
      } 
    }
  )



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
