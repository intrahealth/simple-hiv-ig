library HIVDataElements

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'
include FHIRCommon version '4.0.1' called FC
include HIVConcepts called Cx


context Patient


define "HIV Condition":
  exists ["Condition": Cx."HIV Condition Positive"]  


define "Is HIV Positive":
  "HIV Condition"


define "Is HIV Negative":
  not "HIV Condition"


define "HIV Test Results":
  case
    when "Is HIV Positive" then "HIV Positive Observation"
    when "Is HIV Negative" then "HIV Negative Observation"
    else null
  end


define "Pregnant":
  exists ["Condition": Cx."Pregnant (finding)"]


define "HIV Test Exists":
  exists ([Observation: Cx."HIV 1 and 2 tests - Meaningful Use set"])


define "HIV Positive Observation":
  [Observation: Cx."HIV 1 and 2 tests - Meaningful Use set"] Observation
    where Observation.value = "Is HIV Positive"


define "HIV Negative Observation":
  [Observation: Cx."HIV 1 and 2 tests - Meaningful Use set"] Observation
    where Observation.value = "Is HIV Negative"


define "Viral Load Test Result":
  ["Observation": Cx."HIV 1 RNA NAA+probe (Specimen)"] Obs
    where Obs.status = 'final'
      and Obs.value is not null


// synthea uses copies/mL but fsh uses {copies}/mL which is official
define "Living with HIV and on ART with suppressed viral load results (<1000 copies/mL)":
  ["Observation": Cx."HIV 1 RNA NAA+probe (Specimen)"] Observation
    where Observation.value < 1000 '{copies}/mL'


define "Living with HIV and on ART with unsuppressed viral load results (>1000 copies/mL)":
  ["Observation": Cx."HIV 1 RNA NAA+probe (Specimen)"] Observation
    where Observation.value >= 1000 '{copies}/mL'


define "Suppressed":
  [Observation: Cx."HIV 1 RNA NAA+probe (Specimen)"] Observation
    where Observation.value < 1000 '{copies}/mL'


define "Unsuppressed":
  [Observation: Cx."HIV 1 RNA NAA+probe (Specimen)"] Observation
    where Observation.value >= 1000 '{copies}/mL'


define "Contact date":
  [Encounter] E
    return E.period.start


define "HIV Positive but no VL test":
  "Is HIV Positive" = true
  // "Viral Load Test Result"