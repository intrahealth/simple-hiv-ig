library TXML

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'
include FHIRCommon version '4.0.1' called FC

include HIVConcepts called Cx
include HIVDataElements called PatientData
include HIVStratifiers called HIVStrat


context Patient

// QA check on the data
// ML is exclusion criteria for CURR
// look for this - e.g. deceased

// define "Initial Population": true

// Only numerator from patient data

// Total Numerator: Number of ART patients (currently on ART or newly initiating ART) with no clinical contact 
// or ARV pick-up for greater than 28 days since their last expected clinical contact or ARV pick-up
// Stratifier: Sum of Outcome by Age/Sex disaggregates.
// TEMP
define "Numerator-Exclusion": true


define "Numerator": 
  PatientData."HIV Positive but no VL test"


define "Stratifier": 
  HIVStrat."Age Group/Sex/Location"



// TX_ML_IIT_less_three_mo
// Number of ART patients with no clinical contact or ARV pick-up for greater than 28 days after being on treatment for less than three months.
// Sum of IIT Less than Three Months disaggregate.

// TX_ML_IIT_three_five_mo
// Number of ART patients with no clinical contact or ARV pick-up for greater than 28 days after being on treatment for three to five months.
// Sum of IIT 3 to 5 Months disaggregate.

// TX_ML_IIT_more_six_mo
// Number of ART patients with no clinical contact or ARV pick-up for greater than 28 days after being on treatment for more than six months.
// Sum of IIT More than Six Months disaggregate.

// TX_ML Died
// Number of ART patients with no clinical contact or ARV pick-up due to death.
// Sum of IIT Died Disaggregate

// TX_ML_Refused_Stopped
// Number of ART patients who refused or stopped ART treatment
// Sum of IIT No Clinical Contact – Refused Stopped Treatment Disaggregate

// TX_ML_Transferred_Out
// Number of ART patients who transferred out of treatment
// Sum of IIT Transferred out Disaggregate

