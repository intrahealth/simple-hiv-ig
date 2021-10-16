library Blaze version '0.1.0'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'

codesystem "ISO-8601-Derived Periods": 'http://ohie.org/CodeSystem/iso-8601-derived-periods' // { 'P0Y--P1Y', 'P1Y--P5Y', ... }

// Age Groups
code "P0Y--P1Y": 'P0Y--P1Y' from "ISO-8601-Derived Periods" display '< 1 year'
code "P1Y--P5Y": 'P1Y--P5Y' from "ISO-8601-Derived Periods" display '1-4 years'
code "P5Y--P10Y": 'P5Y--P10Y' from "ISO-8601-Derived Periods" display '5-9 year'
code "P10Y--P15Y": 'P10Y--P15Y' from "ISO-8601-Derived Periods" display '10-14 year'
code "P15Y--P20Y": 'P15Y--P20Y' from "ISO-8601-Derived Periods" display '15-19 year'
code "P20Y--P25Y": 'P20Y--P25Y' from "ISO-8601-Derived Periods" display '20-24 year'
code "P25Y--P30Y": 'P25Y--P30Y' from "ISO-8601-Derived Periods" display '25-29 year'
code "P30Y--P35Y": 'P30Y--P35Y' from "ISO-8601-Derived Periods" display '30-34 year'
code "P35Y--P40Y": 'P35Y--P40Y' from "ISO-8601-Derived Periods" display '35-39 year'
code "P40Y--P50Y": 'P40Y--P50Y' from "ISO-8601-Derived Periods" display '40-49 year'
code "P50Y--P9999Y": 'P50Y--P9999Y' from "ISO-8601-Derived Periods" display '50+ years'

// need DateTime eg @2014-01-25T not Date, eg @2014-01-25
// parameter "Measurement Period" Interval<DateTime> default Interval[@2020-01-01T, @2020-12-31T]
parameter "Measurement Period" Interval<DateTime>

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
  Patient.gender

define "Sex":
  Patient.gender.value

define "Female":
  Patient.gender = 'female'

define "Male":
  Patient.gender = 'male'


define "Age Group":
  case
    when AgeInYearsAt(start of "Measurement Period") in Interval[0, 1) then "P0Y--P1Y"
    when AgeInYearsAt(start of "Measurement Period") in Interval[1, 5) then "P1Y--P5Y"
    when AgeInYearsAt(start of "Measurement Period") in Interval[5, 10) then "P5Y--P10Y"
    when AgeInYearsAt(start of "Measurement Period") in Interval[10, 15) then "P10Y--P15Y"
    when AgeInYearsAt(start of "Measurement Period") in Interval[15, 20) then "P15Y--P20Y"
    when AgeInYearsAt(start of "Measurement Period") in Interval[20, 25) then "P20Y--P25Y"
    when AgeInYearsAt(start of "Measurement Period") in Interval[25, 30) then "P25Y--P30Y"
    when AgeInYearsAt(start of "Measurement Period") in Interval[30, 35) then "P30Y--P35Y"
    when AgeInYearsAt(start of "Measurement Period") in Interval[35, 40) then "P35Y--P40Y"
    when AgeInYearsAt(start of "Measurement Period") in Interval[40, 50) then "P40Y--P50Y"
    when AgeInYearsAt(start of "Measurement Period") in Interval[50, null] then "P50Y--P9999Y"
    else null
  end

define Patient0To5AndFemale:
  AgeInYearsAt(start of "Measurement Period") >= 0
    and AgeInYearsAt(start of "Measurement Period") < 5
    and Patient.gender = 'female'

define Patient5To15AndFemale:
  AgeInYearsAt(start of "Measurement Period") >= 5
    and AgeInYearsAt(start of "Measurement Period") < 15
    and Patient.gender = 'female'

define Patient15To25AndFemale:
  AgeInYearsAt(start of "Measurement Period") >= 15
    and AgeInYearsAt(start of "Measurement Period") < 25
    and Patient.gender = 'female'

define Patient25To50AndFemale:
  AgeInYearsAt(start of "Measurement Period") >= 25
    and AgeInYearsAt(start of "Measurement Period") < 50
    and Patient.gender = 'female'

define Patient50To65AndFemale:
  AgeInYearsAt(start of "Measurement Period") >= 50
    and AgeInYearsAt(start of "Measurement Period") < 65
    and Patient.gender = 'female'

define Patient65ToHighestAndFemale:
  AgeInYearsAt(start of "Measurement Period") >= 65
    and Patient.gender = 'female'

define Patient0To5AndMale:
  AgeInYearsAt(start of "Measurement Period") >= 0
    and AgeInYearsAt(start of "Measurement Period") < 5
    and Patient.gender = 'male'

define Patient5To15AndMale:
  AgeInYearsAt(start of "Measurement Period") >= 5
    and AgeInYearsAt(start of "Measurement Period") < 15
    and Patient.gender = 'male'

define Patient15To25AndMale:
  AgeInYearsAt(start of "Measurement Period") >= 15
    and AgeInYearsAt(start of "Measurement Period") < 25
    and Patient.gender = 'male'

define Patient25To50AndMale:
  AgeInYearsAt(start of "Measurement Period") >= 25
    and AgeInYearsAt(start of "Measurement Period") < 50
    and Patient.gender = 'male'

define Patient50To65AndMale:
  AgeInYearsAt(start of "Measurement Period") >= 50
    and AgeInYearsAt(start of "Measurement Period") < 65
    and Patient.gender = 'male'

define Patient65ToHighestAndMale:
  AgeInYearsAt(start of "Measurement Period") >= 65
    and Patient.gender = 'male'


define "Age Group/Sex":
  "Age Group".code + ':' + "Sex"

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

// synthea uses copies/mL but fsh uses {copies}/mL which is official

// define "Living with HIV and on ART with suppressed viral load results (<1000 copies/mL)":
//   ["Observation": "HIV 1 RNA NAA+probe (Specimen)"] Observation
//     where Observation.value < 1000 '{copies}/mL'

// define "Living with HIV and on ART with unsuppressed viral load results (>1000 copies/mL)":
//   ["Observation": "HIV 1 RNA NAA+probe (Specimen)"] Observation
//     where Observation.value >= 1000 '{copies}/mL'

// define "Suppressed":
//   [Observation: "HIV 1 RNA NAA+probe (Specimen)"] Observation
//     where Observation.value < 1000 '{copies}/mL'

// define "Unsuppressed":
//   [Observation: "HIV 1 RNA NAA+probe (Specimen)"] Observation
//     where Observation.value >= 1000 '{copies}/mL'


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

// this comes up as null in either approach
define "SDE Location":
  // Code { code: "Location".name }
  Code { code: "Location".name, system: 'http://location-name-code-system', display: Location.name }


// works with fsh
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

// works in cql
define "Location Code Revised Again":
  First("Location Code Revised".coding.code.value)




define "Most Recent Encounter Location Reference":
  Last([Encounter] E
    return First(E.location L
      return L.location
    )
      //sort by start of period
  )

// returns string
define "Most Recent Encounter Location Reference Reference":
  Last([Encounter] E
    return First(E.location L
      return L.location.reference
    )
      //sort by start of period
  )

// doesn't work
define "Age Group/Sex/Location Again":
  "Age Group".code + ':' + "Sex" + ':' + "Location Code Revised Again"


// doesn't work
define "Age Group/Sex/Location":
  "Age Group".code + ':' + "Sex" + ':' + "Most Recent Encounter Location Reference Reference"


define "Gender/Location":
  "Sex" + ':' + "Most Recent Encounter Location Reference Reference"


define "Initial Population":
  true


define "Denominator":
  "Sex" is not null


define "Numerator":
  "Sex" = 'female'