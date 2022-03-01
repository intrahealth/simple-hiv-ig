// PMTCT_ART, WHO HIV.IND.VT.4 (similar to)
// Percentage of HIV-positive pregnant women who received ART to reduce the risk of 
// mother-to-child-transmission (MTCT) during pregnancy
// numerator and denominator

library PMTCTART

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'
include FHIRCommon version '4.0.1' called FC
include DASHConcepts called Cx
include DASHDataElements called PatientData
include DASHStratifiers called HIVStrat

context Patient
