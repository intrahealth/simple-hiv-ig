library TXNEW version '0.1.0'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'
include FHIRCommon version '4.0.1' called FC
include AgeRanges version '0.1.0' called AR

// Only numerator from patient data

// Linkage Proxy: Estimate of the percentage of people who test HIV positive and are linked to treatment. 
// This metric is not calculated at the individual level.

// Total Numerator: Number of adults and children newly enrolled on antiretroviral therapy (ART)
// Stratified: Sum of Age/Sex and Age Aggregated/Sex disaggregates

