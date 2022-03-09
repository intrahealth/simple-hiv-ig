// HTS_TST, WHO HIV.IND.TL.2
// Number of individuals who received HIV Testing Services (HTS) and received their test results
// numerator only

library HTSTST

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'
include FHIRCommon version '4.0.1' called FC
include DASHConcepts called Cx
include DASHDataElements called PatientData
include DASHStratifiers called HIVStrat

context Patient


define "Numerator-Exclusion": true


define "Numerator":
  PatientData."HIV Test Results"


define "Stratifier": 
  HIVStrat."Age Group/Sex/Location"
