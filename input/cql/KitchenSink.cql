library KitchenSink

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'
include FHIRCommon version '4.0.1' called FC
include DASHStratifiers called DASHStrat

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

define "Gender":
  Patient.gender.value

define "Sex":
  Patient.gender.value

define "Female":
  Patient.gender = 'female'

define "Male":
  Patient.gender = 'male'

define "Age Group":
  DASHStrat."Age Group"

define "Age Group/Gender":
  DASHStrat."Age Group".code + ':' + "Gender"

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


define "HIV Test Exists":
  exists ([Observation: "HIV 1 and 2 tests - Meaningful Use set"])

define "HIV Positive Observation":
  [Observation: "HIV 1 and 2 tests - Meaningful Use set"] Observation
    where Observation.value = "Is HIV Positive"



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
  DASHStrat."Age Group".code + ':' + "Sex" + ':' + "HIV Test Results".code */


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

define "Location ID":
  "Location".id.value


// not working for cql or evaluate-measure
define "Gender/AgeGroup/Location":
  DASHStrat."Age Group".code + ':' + "Sex" + ':' + "Location".id


define "Most Recent Encounter Location Reference":
  Last([Encounter] E
    return First(E.location L
      return L.location
    )
      //sort by start of period
  )

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


// this comes up as null in both fsh and evaluate-measure
define "SDE Location":
  // Code { code: "Location".name }
  Code { code: "Location".name, system: 'http://location-name-code-system', display: Location.name }


define "Most Recent Encounter Location Reference Reference":
  Last([Encounter] E
    return First(E.location L
      return L.location.reference
    )
      //sort by start of period
  )


define "Most Recent Encounter Location Reference Reference Value":
  "Most Recent Encounter Location Reference Reference".value


define "Age Group/Sex/Location 2":
  DASHStrat."Age Group".code + ':' + "Sex" + ':' + "Most Recent Encounter Location Reference Reference Value"



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

// Bundle.entry.resource.ofType(Encounter)[0].serviceProvider.reference
define "serviceProvider":
  Last([Encounter]).serviceProvider.reference.value

define "assert serviceProvider is string":
  "serviceProvider" is String
  

// Bundle.entry.resource.ofType(Encounter)[0].location[0].location.reference
define "Naive Location":
  Last([Encounter]).location[0].location.reference.value
  // sort by start of period
  // where E.period overlaps AR."Measurement Period"

define "assert Naive Location is string":
  "Naive Location" is String
