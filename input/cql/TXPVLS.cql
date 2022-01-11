library TXPVLS version '0.1.0'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'
include FHIRCommon version '4.0.1' called FC
include AgeRanges version '0.1.0' called AR

// Denominator: Number of ART patients with a VL result documented 
// in the medical or laboratory records/LIS within the past 12 months.
// Stratified: Sum of Age/Sex/Indication and Age Aggregated/Sex/Indication disaggregates.

// Numerator: Number of ART patients with suppressed VL results 
// (<1,000 copies/ml) documented in the medical or laboratory records/LIS within the past 12 months
// Stratified: Sum of Age/Sex/Indication/HIVStatus and Age Aggregated/Sex/Indication/HIVStatus disaggregates.

// Viral Load Suppression
// Percentage of ART patients with a suppressed viral load (VL) result 
// (<1000 copies/ml) documented in the medical or laboratory records/laboratory information systems (LIS) within the past 12 months
// TX_PVLS numerator / TX_PVLS denominator

// Not included: requires previous time periods
// Viral Load Test Coverage
// Percentage of patients eligible for viral load testing who have received a viral load test. 
// Length of time on treatment may vary by ART regiment and/or national guidelines.
// TX_PVLS denominator / (TX_CURR from 2 quarters prior)

