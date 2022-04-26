// https://raw.githubusercontent.com/cqframework/hiv-indicators/master/input/cql/HIVIndicators.cql
library HIVIndicators

/*
The content in this library is draft content developed as part of a working OpenHIE
session on the use of FHIR quality reporting functionality to report public health
indicators: https://wiki.ihe.net/index.php/Aggregate_Data_Exchange_-_HIV
*/

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'
include FHIRCommon version '4.0.1' called FC
include DASHStratifiers called DASHStrat

// SNOMED-CT, International Edition
codesystem "SNOMED-CT": 'http://snomed.info/sct'
codesystem "LOINC": 'http://loinc.org'
codesystem "PMTCT HIV Status Codes": 'http://fhir.org/guides/who/hiv-cds/CodeSystem/hiv-pmtct-hiv-status-codes' 
// { 'known-positive', 'newly-identified-positive', 'newly-identified-negative' }
codesystem "PMTCT ART Status Codes": 'http://fhir.org/guides/who/hiv-cds/CodeSystem/hiv-pmtct-art-status-codes' 
// { 'already-on-art', 'new-on-art' }

valueset "HIV Testing Services": 'http://fhir.org/guides/who/hiv-cds/ValueSet/hiv-testing-services' // Should use HIV tests
valueset "Viral Load Test": 'http://fhir.org/guides/who/hiv-cds/ValueSet/hiv-viral-load-test'
valueset "HL7 Administrative Gender": 'http://hl7.org/fhir/ValueSet/administrative-gender'
valueset "ART Medications": 'http://fhir.org/guides/who/hiv-cds/ValueSet/hiv-art-medications' // ART medications
valueset "Antenatal Care": 'http://fhir.org/guides/who/hiv-cds/ValueSet/hiv-antenatal-care' // Antenatal Care
valueset "Pregnancy Codes": 'http://fhir.org/guides/who/hiv-cds/ValueSet/pregnancy-codes' // Pregnancy
valueset "Live Birth": 'http://fhir.org/guides/who/hiv-cds/ValueSet/live-birth' // Live Birth
valueset "Breastfeeding Codes": 'http://fhir.org/guides/who/hiv-cds/ValueSet/breastfeeding-codes' // Breastfeeding
valueset "Delivery Procedures": 'urn:oid:2.16.840.1.113762.1.4.1045.59' // Used by CMS113

// commenting out for now and the union
// valueset "Human Immunodeficiency Virus (HIV) Laboratory Test Codes (Ab and Ag)": 'urn:oid:2.16.840.1.113762.1.4.1056.50' // Used by CMS349

// HIV Test Results
code "HIV Negative": '165815009' from "SNOMED-CT" display 'HIV Negative'
code "HIV Positive": '165816005' from "SNOMED-CT" display 'HIV Positive'
code "HIV 1 and 2 tests - Meaningful Use set": '75622-1' from "LOINC" display 'HIV 1 and 2 tests - Meaningful Use set' // Used by CMS349

// History of ART Therapy
code "History of antiretroviral therapy (situation)": '432101000124108' from "SNOMED-CT" display 'History of antiretroviral therapy (situation)'

// PMTCT ART status
code "Already on ART": 'already-on-art' from "PMTCT ART Status Codes" display 'Already on ART'
code "New on ART": 'new-on-art' from "PMTCT ART Status Codes" display 'New on ART'

// PMTCT HIV status
code "Known Positive": 'known-positive' from "PMTCT HIV Status Codes" display 'Known Positive'
code "Newly Identified Positive": 'newly-identified-positive' from "PMTCT HIV Status Codes" display 'Newly Identified Positive'
code "Newly Identified Negative": 'newly-identified-negative' from "PMTCT HIV Status Codes" display 'Newly Identified Negative'

// Pregnancy/Breastfeeding (PREG_BF)
code "Pregnant": '146789000' from "SNOMED-CT" display 'Pregnant'
code "Breastfeeding": '169750002' from "SNOMED-CT" display 'Breastfeeding'

parameter "Measurement Period" Interval<DateTime>

context Patient

define "ART Therapy Observation":
  ["Observation": "History of antiretroviral therapy (situation)"] O
    where O.status = 'final'

define "ART Therapy Condition":
  ["Condition": "History of antiretroviral therapy (situation)"] C
    where C.verificationStatus ~ FC."confirmed"
      and C.clinicalStatus ~ FC."active"
      // TODO: Map? and C.clinicalStatus in { 'active', 'relapsed', 'well-controlled', 'poorly-controlled' }

define "ART Therapy Medication":
  ["MedicationDispense": "ART Medications"] M
    where M.status = 'completed'

define "ART Dates":
  ("ART Therapy Observation" O return O.effective as dateTime)
    union ("ART Therapy Condition" C return C.onset as dateTime)
    union ("ART Therapy Medication" M return M.whenHandedOver)

// TODO: Most recent start date with an allowable gap?
// Gap would be 6 months/year
// Turn each of the ART Dates into ART Periods
// Collapse all and then return start of most recent interval
define "Date of First Evidence of ART":
  Min("ART Dates")

// PMTCT ART status
define "PMTCT ART Status":
  case
    when "Date of First Evidence of ART" before start of "Measurement Period" then "Already on ART"
    when "Date of First Evidence of ART" during "Measurement Period" then "New on ART"
    else null
  end

// TODO: These were from the original example, but it's not clear what syntax the wildcard is expressing
// Needs terminology work to identify actual codes, or define new ones to support the indicator meaning
//code "Already on ART": '432101000124108' from "SNOMED-CT" display 'Already on ART'
//code "New on ART": '432101000124108*' from "SNOMED-CT" display 'New on ART'

define "On ART":
  exists ("ART Dates" D where D during "Measurement Period")
    or exists (
      "ART Therapy Condition" C
        where Interval[C.onset, C.abatement] overlaps "Measurement Period"
    )

define "HIV Test Observation":
  // (
  //   [Observation: "Human Immunodeficiency Virus (HIV) Laboratory Test Codes (Ab and Ag)"]
  //     union [Observation: "HIV 1 and 2 tests - Meaningful Use set"]
  // ) O
  [Observation: "HIV 1 and 2 tests - Meaningful Use set"] O
    where O.status = 'final'
      and O.value is not null

define "HIV Positive Observation":
  "HIV Test Observation" O where O.value ~ "HIV Positive"

define "HIV Negative Observation":
  "HIV Test Observation" O where O.value ~ "HIV Negative"

define "Is HIV Positive":
  exists ("HIV Positive Observation")

define "Is HIV Negative":
  exists ("HIV Negative Observation")

define "Date of First Evidence of HIV Status":
  Min("HIV Test Observation" O return O.effective)

define "Date of First Evidence of HIV Positive":
  Min("HIV Positive Observation" O return O.effective)

define "Date of First Evidence of HIV Negative":
  Min("HIV Negative Observation" O return O.effective)

// PMTCT HIV Status
define "PMTCT HIV Status":
  case
    when "Date of First Evidence of HIV Positive" before start of "Measurement Period" then 'Known Positive'
    when "Date of First Evidence of HIV Positive" during "Measurement Period" then 'Newly Identified Positive'
    when "Date of First Evidence of HIV Negative" during "Measurement Period" then 'Newly Identified Negative'
    else null
  end

//code "Known HIV positive": code '165816005**' from "SNOMED-CT" display 'Known HIV positive'
//code "Newly identified HIV Positive": code '165816005*' from "SNOMED-CT" display 'Newly identified HIV Positive'
//code "Newly identified HIV negative": code '165815009*' from "SNOMED-CT" display 'Newly identified HIV negative'

// QRPH_ADX_ART1_N:
// Number of adults and children newly enrolled on antiretroviral therapy (ART) in the reporting period
  // Stratifiers: AGE_GROUP,SEX
define "Newly enrolled on antiretroviral therapy (ART) during measurement period":
  "Date of First Evidence of ART" during "Measurement Period"

define "Is Pregnant":
  exists ([Condition: "Pregnancy Codes"] C
    where C.verificationStatus ~ FC."confirmed"
      and C.clinicalStatus ~ FC."active"
      and C.onset during "Measurement Period"
  )

define "Is Breastfeeding":
  exists ([Observation: "Breastfeeding Codes"] O
    where O.status = 'final'
      and O.effective during "Measurement Period"
  )

// QRPH_ADX_ART1_N_PREG_BF:
// Number of adults and children newly enrolled on ART in the reporting period_pregnant and breastfeeding
  // Stratifiers: PREG_BF
define "Newly enrolled on antiretroviral therapy (ART) during measurement period (pregnant and breastfeeding)":
  "Is Pregnant" and "Is Breastfeeding" and "Date of First Evidence of ART" during "Measurement Period"

// QRPH_ADX_ART3_N:
// Number of adults and children currently receiving antiretroviral therapy (ART)
  // Stratifiers: AGE_GROUP,SEX
define "Receiving antiretroviral therapy (ART) during measurement period":
  exists ("ART Dates" D where D during "Measurement Period")
    or exists (
      "ART Therapy Condition" C
        where Interval[C.onset, C.abatement] overlaps "Measurement Period"
    )

define "Year Preceding the Measurement Period":
  Interval[start of "Measurement Period" - 1 year, start of "Measurement Period")

define "Month Before the Year Preceding the Measurement Period":
  Interval[start of "Year Preceding the Measurement Period" - 1 month, start of "Year Preceding the Measurement Period")

// QRPH_ADX_ART5_N:
// Number of adults and children who are still on treatment at 12 months after initiating ART
  // Stratifiers: AGE_GROUP,SEX
define "Receiving antiretroviral therapy (ART) at 12 months after initiating":
  "Date of First Evidence of ART" during "Month Before the Year Preceding the Measurement Period"
    and "Receiving antiretroviral therapy (ART) during measurement period"

// QRPH_ADX_ART5_N_PREG_BF:
// Number of adults and children who are still on treatment at 12 months after initiating ART-pregnant and breastfeeding
  // Stratifiers: PREG_BF
define "Receiving antiretroviral therapy (ART) at 12 months after initiating (pregnant and breastfeeding)":
  "Receiving antiretroviral therapy (ART) at 12 months after initiating"
    and "Is Pregnant"
    and "Is Breastfeeding"

// QRPH_ADX_ART5_D:
// Number of adults and children who initiated ART in the 12 months prior to the beginning of the reporting period
  // Stratifiers: AGE_GROUP,SEX
define "Initiated antiretroviral therapy (ART) in the 12 months prior to measurement period":
  "Date of First Evidence of ART" during "Year Preceding the Measurement Period"

define "Antenatal Care Visit":
  [Encounter: "Antenatal Care"] E
    where E.status = 'finished'
      and E.period during Interval[start of "Year Preceding the Measurement Period", end of "Measurement Period"]

define "Live Birth Procedure":
  [Procedure: "Live Birth"] P
    where P.status = 'completed'

// QRPH_ADX_MTCT1_D:
// Number of pregnant women who attended ANC or had a facility-based delivery in the reporting period
 // Stratifiers: PMTCT_HIV_STATUS
define "Antenatal Care Visit or Live Birth during the Measurement Period":
  ("Is Pregnant" and exists ("Antenatal Care Visit" V where V.period during "Measurement Period"))
    or exists ("Live Birth Procedure" P where P.performed during "Measurement Period")

// QRPH_ADX_MTCT2_D:
// Number of HIV positive pregnant women who attended ANC or had a facility-based delivery within the reporting period
  // Stratifiers: None
define "Antenatal Care Visit or Live Birth during Measurement Period (HIV Positive)":
  "Is HIV Positive"
    and "Antenatal Care Visit or Live Birth during the Measurement Period"

// QRPH_ADX_MTCT2_N:
// Number of HIV-positive pregnant women who received ART to reduce the risk of mother-to-child-transmission during pregnancy
  // Stratifiers: PMTCT_ART_STATUS
define "HIV-positive, pregnant, and receiving antiretroviral therapy (ART) to reduce the risk of mother-to-child-transmission during pregnancy":
  "Is HIV Positive"
    and "Is Pregnant"
    and "Receiving antiretroviral therapy (ART) during measurement period"

define "Viral Load Test Result":
  ["Observation": "Viral Load Test"] O
    where O.status = 'final'
      and O.value is not null

// QRPH_ADX_VLS3_N:
// Number of people living with HIV and on ART who have a suppressed viral load results (&lt;1000 copies/mL).
  // Stratifiers: AGE_GROUP,SEX
define "Living with HIV and on ART with suppressed viral load results (<1000 copies/mL)":
  "Is HIV Positive"
    and "Receiving antiretroviral therapy (ART) during measurement period"
    and exists (
      "Viral Load Test Result" R
        where R.effective during "Measurement Period"
          and R.value < 1000 '{copies}/mL'
      )

// QRPH_ADX_HTS2_N:
// Number of individuals who received HIV Testing Services (HTS) and received their test results
  // Stratifiers: AGE_GROUP,SEX,HIV_TEST_RESULTS
define "Received HIV Testing Services (HTS) and Recevied Test Results":
  ["Observation": "HIV Testing Services"] O
    where O.status = 'final'
      and O.value is not null

define "First antenatal care visit":
  First("Antenatal Care Visit" V sort by start of period)

// QRPH_ADX_MTCT1_N:
// Number of pregnant women with known HIV status at first antenatal care visit
  // Stratifiers: PMTCT_HIV_STATUS
define "HIV Status Known at First Antenatal Care Visit":
  "Date of First Evidence of HIV Status" on or before start of "First antenatal care visit".period

// QRPH_ADX_VLS3_D:
// Number of people on ART who had a VL measurement in the past 12 months.
  // Stratifiers: AGE_GROUP,SEX
define "Receiving antiretroviral therapty (ART) and Viral Load Measurement in the past 12 months":
  "Receiving antiretroviral therapy (ART) during measurement period"
    and exists (
      "Viral Load Test Result" R
        where R.effective during "Year Preceding the Measurement Period"
    )

// Stratifiers

// Sex
define "Sex": Patient.gender.value

// Age Group/Sex
define "Age Group/Sex": DASHStrat."Age Group".code + ':' + "Sex"

// Pregnant/Breastfeeding
define "Pregnant/Breastfeeding":
  case
    when "Is Pregnant" then "Pregnant"
    when "Is Breastfeeding" then "Breastfeeding"
    else null
  end

// HIV Test Results
define "HIV Test Results":
  case
    when "Is HIV Positive" then "HIV Positive"
    when "Is HIV Negative" then "HIV Negative"
    else null
  end

define "Age Group/Sex/HIV Test Results":
  DASHStrat."Age Group".code + ':' + "Sex" + ':' + "HIV Test Results".code