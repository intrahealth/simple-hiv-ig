library Synthea version '0.1.0'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'
include FHIRCommon version '4.0.1' called FC

include DASHConcepts called Cx
include DASHDataElements called PatientData
include DASHStratifiers called DASHStrat



codesystem "LOINC": 'http://loinc.org'
codesystem "SNOMED-CT": 'http://snomed.info/sct'

// code "HIV 1 Ab [Presence] in Serum": '7917-8' from "LOINC" display 'HIV 1 Ab [Presence] in Serum'
code "Human immunodeficiency virus positive (finding)": '165816005' from "SNOMED-CT" display 'Human immunodeficiency virus positive (finding)'
// 55277-8 "HIV status"


context Patient


define "Initial Population": true


define "Numerator-Exclusion": 
  PatientData."Deceased"


define "Numerator":
  PatientData."On ART"


define "Stratifier": 
  DASHStrat."Age Group/Sex/Location TXCURR"


// these are together in Synthea, but only need the finding
define "HIV Positive Synthea": 
  // exists ["Observation": "HIV 1 Ab [Presence] in Serum"]
  exists ["Observation": "Human immunodeficiency virus positive (finding)"]



define "Viral Load Synthea":
  true


define "Synthea":
  singleton from ( [Patient] L
    let identifier: singleton from ( L.identifier I
        where I.system = 'https://github.com/synthetichealth/synthea'
    )
    return CodeableConcept { 
      coding: { 
        Coding { 
          code: code { value: identifier.value }, 
            system: identifier.system 
        } 
      } 
    }
  )


define "serviceProvider":
  Last([Encounter]).serviceProvider.reference.value
