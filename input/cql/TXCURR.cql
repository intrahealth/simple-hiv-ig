// TX_CURR, WHO HIV.IND.AV.1
// numerator only
// Number of adults and children currently receiving antiretroviral therapy (ART)
// Sum of age/sex disaggregates

// Patients excluded from the current on ART count are patients who died, stopped treatment, 
// transferred out, or experienced interruption in treatment (IIT). Patients who have not received 
// ARVs within four weeks (i.e., 28 days) of their last missed drug pick-up should not be counted.

// Patients who receive ARVs for post-exposure prophylaxis (PEP) or 
// short-term ART only for prevention (PrEP) should not be reported in this indicator.

library TXCURR version '0.1.0'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'
include FHIRCommon version '4.0.1' called FC

include DASHConcepts called Cx
include DASHDataElements called PatientData
include DASHStratifiers called DASHStrat


context Patient


define "Initial Population": true


define "Numerator-Exclusion": 
  PatientData."Deceased"


// todo: this is not showing up as true
define "Numerator":
  PatientData."On ART"


define "Stratifier": 
  DASHStrat."Age Group/Sex/Location TXCURR"



// define "Initial population":
//     exists "Anti Retroviral Therapy Adults And Children"
  
// define "Anti Retroviral Therapy Adults And Children":
//     ( [Observation: "Anti Retroviral Therapy"] ) o
//         where o.value.coding[1]= "Coded Answer"
//         or o.value.coding[2]= "Coded Answer"
//         and o.status in {'final', 'amended', 'corrected'}
//         and o.effective in day of "Measurement Period"

// Not included:
// ARV Dispensing Quantity by Coarse Age/Sex
// [Required]
// <3 months of ARVs (not MMD) dispensed to patient by: <15 F/M, 15+ F/M, Unknown Age F/M
// 3-5 months of ARVs dispensed to patient by: <15 F/M, 15+ F/M, Unknown Age F/M
// 6 or more months of ARVs dispensed to patient by: <15 F/M, 15+ F/M, Unknown Age F/M

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

