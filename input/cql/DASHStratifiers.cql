library DASHStratifiers

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'
include FHIRCommon version '4.0.1' called FC

include DASHConcepts called Cx

// need DateTime eg @2014-01-25T not Date, eg not this: @2014-01-25
// parameter "Measurement Period" Interval<DateTime>
// comment out for testing, will be overridden by $evaluate-measure operation in any case
parameter "Measurement Period" Interval<DateTime> default Interval[@1990-01-01T, @2022-08-30T]

// Not included yet:
// Key Population Type [Required]
// • People who inject drugs (PWID)
// • Men who have sex with men (MSM)
// • Transgender people (TG)
// • Female sex workers (FSW)
// • People in prison and other closed settings

// TODO: course disaggregates?

// How to review for data quality:
// How to calculate annual total:
// Disaggregations:
// • Confirm that TX_CURR ≥ TX_NEW.
// • Confirm that TX_CURR ≥ TX_RTT.
// • Confirm that TX_CURR ≥ Disaggregates for ARV Dispensing Quantity

// TODO: Unknown Age M/F

context Patient

define "Sex":
  Patient.gender.value


// Age Group
define "Age Group":
  case
    when AgeInYearsAt(start of "Measurement Period") in Interval[0, 1) then Cx."P0Y--P1Y"
    when AgeInYearsAt(start of "Measurement Period") in Interval[1, 5) then Cx."P1Y--P5Y"
    when AgeInYearsAt(start of "Measurement Period") in Interval[5, 10) then Cx."P5Y--P10Y"
    when AgeInYearsAt(start of "Measurement Period") in Interval[10, 15) then Cx."P10Y--P15Y"
    when AgeInYearsAt(start of "Measurement Period") in Interval[15, 20) then Cx."P15Y--P20Y"
    when AgeInYearsAt(start of "Measurement Period") in Interval[20, 25) then Cx."P20Y--P25Y"
    when AgeInYearsAt(start of "Measurement Period") in Interval[25, 30) then Cx."P25Y--P30Y"
    when AgeInYearsAt(start of "Measurement Period") in Interval[30, 35) then Cx."P30Y--P35Y"
    when AgeInYearsAt(start of "Measurement Period") in Interval[35, 40) then Cx."P35Y--P40Y"
    when AgeInYearsAt(start of "Measurement Period") in Interval[40, 45) then Cx."P40Y--P45Y"
    when AgeInYearsAt(start of "Measurement Period") in Interval[45, 50) then Cx."P45Y--P50Y"
    when AgeInYearsAt(start of "Measurement Period") in Interval[50, null] then Cx."P50Y--P9999Y"
    else null
  end


define "Age Group TXCURR":
  case
    when AgeInYearsAt(start of "Measurement Period") in Interval[0, 1) then Cx."P0Y--P1Y"
    when AgeInYearsAt(start of "Measurement Period") in Interval[1, 5) then Cx."P1Y--P5Y"
    when AgeInYearsAt(start of "Measurement Period") in Interval[5, 10) then Cx."P5Y--P10Y"
    when AgeInYearsAt(start of "Measurement Period") in Interval[10, 15) then Cx."P10Y--P15Y"
    when AgeInYearsAt(start of "Measurement Period") in Interval[15, 20) then Cx."P15Y--P20Y"
    when AgeInYearsAt(start of "Measurement Period") in Interval[20, 25) then Cx."P20Y--P25Y"
    when AgeInYearsAt(start of "Measurement Period") in Interval[25, 30) then Cx."P25Y--P30Y"
    when AgeInYearsAt(start of "Measurement Period") in Interval[30, 35) then Cx."P30Y--P35Y"
    when AgeInYearsAt(start of "Measurement Period") in Interval[35, 40) then Cx."P35Y--P40Y"
    when AgeInYearsAt(start of "Measurement Period") in Interval[40, 45) then Cx."P40Y--P45Y"
    when AgeInYearsAt(start of "Measurement Period") in Interval[45, 50) then Cx."P45Y--P50Y"
    when AgeInYearsAt(start of "Measurement Period") in Interval[50, 55) then Cx."P50Y--P55Y"
    when AgeInYearsAt(start of "Measurement Period") in Interval[55, 60) then Cx."P55Y--P60Y"
    when AgeInYearsAt(start of "Measurement Period") in Interval[60, 65) then Cx."P60Y--P65Y"
    when AgeInYearsAt(start of "Measurement Period") in Interval[65, null] then Cx."P65Y--P9999Y"
    else null
  end


define "Age Group/Sex":
  "Age Group".code + ':' + "Sex"


define "Location":
  Last([Encounter] E
    return First(E.location L
      return L.location.reference
    ).value
  )


define "Age Group/Sex/Location":
  "Age Group".code + ':' + "Sex" + ':' + "Location"


define "Age Group/Sex/Location TXCURR":
  "Age Group TXCURR".code + ':' + "Sex" + ':' + "Location"

