// TX_NEW, WHO HIV.IND.AV.4
// Number of adults and children newly enrolled on antiretroviral therapy (ART)
// numerator only

library TXNEW version '0.1.0'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'
include FHIRCommon version '4.0.1' called FC

include DASHConcepts called Cx
include DASHDataElements called PatientData
include DASHStratifiers called DASHStrat

context Patient

define "Initial Population": true

// Linkage Proxy: Estimate of the percentage of people who test HIV positive and are linked to treatment. 
// This metric is not calculated at the individual level.

// Total Numerator: Number of adults and children newly enrolled on antiretroviral therapy (ART)
// Stratified: Sum of Age/Sex and Age Aggregated/Sex disaggregates
// TEMP
define "Numerator-Exclusion": true


define "Numerator": 
  PatientData."Newly enrolled on antiretroviral therapy (ART) during measurement period"


define "Stratifier": 
  DASHStrat."Age Group/Sex/Location"
