library TXCURR

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'
include FHIRCommon version '4.0.1' called FC

include HIVConcepts called Cx
include HIVDataElements called PatientData
include HIVStratifiers called HIVStrat

context Patient

// define "Initial Population": true

// Only numerator from patient data
// use denom and num exclusions

// Total Numerator
// Number of adults and children currently receiving antiretroviral therapy (ART)
// Sum of age/sex disaggregates
// TEMP
define "Numerator-Exclusion": true


define "Numerator":
  PatientData."HIV Condition"


define "Stratifier": 
  HIVStrat."Age Group/Sex/Location TXCURR"


// tbd

// Patients receiving MMD
// Patients that pick up 3 or more months of anti-retroviral drugs at one visit 
// (i.e., multi-month dispensation or MMD)
// Sum of MMD by age/sex disaggregates, 3-5 months and 6 or more months

// TX_CURR_ARVDisp_less_three_mo
// Patients that pick up less than months of anti-retroviral drugs at one visit 
// (i.e., multi-month dispensation or MMD)
// Sum of MMD by age/sex disaggregate less than three months of ARV dispensed

// TX_CURR_ARVDisp_three_five_mo
// Patients that pick up between three to five months of anti-retroviral drugs at one visit 
// (i.e., multi-month dispensation or MMD)
// Sum of MMD by age/sex disaggregate three to five months of ARV dispensed

// TX_CURR_ARVDisp_six_more_mo
// Patients that pick up more than six months of anti-retroviral drugs at one visit (i.e., multi-month dispensation or MMD)
// Sum of MMD by age/sex disaggregate more than six months ARV dispensed

// done by downstream systems

// TX_NET_NEW
// The quarterly net increase or decrease in ART patients.
// TX_CURR current quarter - TX_CURR previous quarter by age/sex group. 
// Note: TX_NET_NEW calculations across time periods where age bands have changed (such as between FY18 Q4 and FY19 Q1) may need to be calculated manually.
// Not included
// Net New Needed: requires subnational aggregates
// Continuity of Treatment Proxy: requires previous time period measurereports

