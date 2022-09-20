// TX_PVLS, WHO HIV.IND.AV.3
// Percentage of ART patients with a suppressed viral load (VL) result (<1000 copies/ml) 
// documented in the medical or laboratory records/laboratory information systems (LIS) within the past 12 months
// numerator and denominator

library TXPVLS version '0.1.0'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'
include FHIRCommon version '4.0.1' called FC

include DASHConcepts called Cx
include DASHDataElements called PatientData
include DASHStratifiers called DASHStrat


context Patient


define "Initial Population": true


// Denominator: Number of ART patients with a VL result documented 
// in the medical or laboratory records/LIS within the past 12 months.
// Stratified: Sum of Age/Sex/Indication and Age Aggregated/Sex/Indication disaggregates.

// CIEL-based
// define "Denominator":
//     "Initial Population"
 
// define "Numerator":
//     exists "Viral Load Suppresed"
 
// define "Viral Load Check":
//     ( [Observation: "Viral Load Quantitative"]
//         union [Observation: "Viral Load Qualitative"] ) o
//         where o.status in {'final', 'amended', 'corrected'}
//         and o.effective in day of "Measurement Period"
 
// define "Viral Load Suppresed":
//        "Viral Load Check" v where (v.value as Quantity)  < 1000
//         or v.value.coding[1]= "Viral Load Qualitative Value"
//         or v.value.coding[2]= "Viral Load Qualitative Value"  
 
// define "Initial Population":
//     exists "Viral Load Check"


define "Denominator-Exclusion": true


// add 'exists' to get bool: the numerator/denominator population expressions are not resulting in boolean results
define "Denominator": 
  exists (PatientData."Viral Load Test Result")


// Numerator: Number of ART patients with suppressed VL results 
// (<1,000 copies/ml) documented in the medical or laboratory records/LIS within the past 12 months
// Stratified: Sum of Age/Sex/Indication/HIVStatus and Age Aggregated/Sex/Indication/HIVStatus disaggregates.

define "Numerator-Exclusion": true


define "Numerator": 
  PatientData."Living with HIV and on ART with suppressed viral load results (<1000 copies/mL)"


define "Stratifier": 
  DASHStrat."Age Group/Sex/Location"

// Viral Load Suppression
// Percentage of ART patients with a suppressed viral load (VL) result 
// (<1000 copies/ml) documented in the medical or laboratory records/laboratory information systems (LIS) within the past 12 months
// TX_PVLS numerator / TX_PVLS denominator

// downstream systems to calculate

// Not included: requires previous time periods
// Viral Load Test Coverage
// Percentage of patients eligible for viral load testing who have received a viral load test. 
// Length of time on treatment may vary by ART regiment and/or national guidelines.
// TX_PVLS denominator / (TX_CURR from 2 quarters prior)

