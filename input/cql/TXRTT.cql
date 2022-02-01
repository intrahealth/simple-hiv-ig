library TXRTT

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'
include FHIRCommon version '4.0.1' called FC
include HIVConcepts called Cx
include HIVDataElements called PatientData
include HIVStratifiers called HIVStrat

context Patient

define "PatientStuff": Patient.name.given

// Number of ART patients who experienced IIT during any previous reporting period, 
// who successfully restarted ARVs within the reporting period and remained on treatment 
// until the end of the reporting period.

// define "Initial Population": true

// Only numerator from patient data

// Total Numerator
// Number of adults and children currently receiving antiretroviral therapy (ART)
// Sum of age/sex disaggregates
// TEMP
define "Numerator-Exclusion": true


define "Numerator":
  PatientData."HIV Condition"

// Not included:
// ARV Dispensing Quantity by Coarse Age/Sex
// [Required]
// • <3 months of ARVs (not MMD) dispensed to patient by: <15 F/M, 15+ F/M, Unknown Age F/M
// • 3-5 months of ARVs dispensed to patient by: <15 F/M, 15+ F/M, Unknown Age F/M
// • 6 or more months of ARVs dispensed to patient by: <15 F/M, 15+ F/M, Unknown Age F/M

define "Stratifier": 
  HIVStrat."Age Group/Sex/Location TXCURR"

// Duration of treatment interruption before returning to treatment [Required]
// o Experienced treatment interruption of <3 months before returning to treatment
// o Experienced treatment interruption of 3-5 months before returning to treatment
// o Experienced treatment interruption of 6+ months before returning to treatment