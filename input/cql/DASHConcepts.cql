library DASHConcepts version '0.1.0'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'
include FHIRCommon version '4.0.1' called FC

// Code Systems
codesystem "SNOMED-CT": 'http://snomed.info/sct'
codesystem "LOINC": 'http://loinc.org'
// codesystem "RxNorm": 'http://www.nlm.nih.gov/research/umls/rxnorm'
// codesystem "CIEL": 'http://hl7.org/fhir/sid/ciel'
// codesystem "ICD-10": 'http://hl7.org/fhir/sid/icd-10'
// codesystem "ICD-11": 'http://hl7.org/fhir/sid/icd-11'
// codesystem "ICF": 'http://hl7.org/fhir/sid/icf-nl'
// codesystem "ICHI": 'https://mitel.dimi.uniud.it/ichi/#http://id.who.int/ichi'
codesystem "ISO-8601-Derived Periods": 'http://ohie.org/CodeSystem/iso-8601-derived-periods' // { 'P0Y--P1Y', 'P1Y--P5Y', ... }
codesystem "OpenHIE": 'https://openhie.org'
codesystem "PMTCT HIV Status Codes": 'http://fhir.org/guides/who/hiv-cds/CodeSystem/hiv-pmtct-hiv-status-codes' 
// { 'known-positive', 'newly-identified-positive', 'newly-identified-negative' }
codesystem "PMTCT ART Status Codes": 'http://fhir.org/guides/who/hiv-cds/CodeSystem/hiv-pmtct-art-status-codes'
// { 'already-on-art', 'new-on-art' }


//ValueSets
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


//Codes
// PEPFAR programs are required to report on the following standard age groups: 
// <1, 1-4, 5-9, 10-14, 15-19, 20-24, 25-29, 30-34, 35-39, 40-44, 45-49, and 50+. 
code "P0Y--P1Y": 'P0Y--P1Y' from "ISO-8601-Derived Periods" display '< 1 year'
code "P1Y--P5Y": 'P1Y--P5Y' from "ISO-8601-Derived Periods" display '1-4 years'
code "P5Y--P10Y": 'P5Y--P10Y' from "ISO-8601-Derived Periods" display '5-9 year'
code "P10Y--P15Y": 'P10Y--P15Y' from "ISO-8601-Derived Periods" display '10-14 year'
code "P15Y--P20Y": 'P15Y--P20Y' from "ISO-8601-Derived Periods" display '15-19 year'
code "P20Y--P25Y": 'P20Y--P25Y' from "ISO-8601-Derived Periods" display '20-24 year'
code "P25Y--P30Y": 'P25Y--P30Y' from "ISO-8601-Derived Periods" display '25-29 year'
code "P30Y--P35Y": 'P30Y--P35Y' from "ISO-8601-Derived Periods" display '30-34 year'
code "P35Y--P40Y": 'P35Y--P40Y' from "ISO-8601-Derived Periods" display '35-39 year'
code "P40Y--P45Y": 'P40Y--P45Y' from "ISO-8601-Derived Periods" display '40-45 year'
code "P45Y--P50Y": 'P45Y--P50Y' from "ISO-8601-Derived Periods" display '45-50 year'
code "P50Y--P9999Y": 'P50Y--P9999Y' from "ISO-8601-Derived Periods" display '50+ years'
// Starting in FY22, the age bands for TX_CURR will be expanded to 50-54, 55-59, 60-64, and 65+
code "P50Y--P55Y": 'P50Y--P55Y' from "ISO-8601-Derived Periods" display '50-55 year'
code "P55Y--P60Y": 'P50Y--P60Y' from "ISO-8601-Derived Periods" display '55-60 year'
code "P60Y--P65Y": 'P50Y--P60Y' from "ISO-8601-Derived Periods" display '60-65 year'
code "P65Y--P9999Y": 'P50Y--P9999Y' from "ISO-8601-Derived Periods" display '65+ years'

code "HIV Condition Positive": '86406008' from "SNOMED-CT" display 'HIV infection'
code "HIV 1 and 2 tests - Meaningful Use set": '75622-1' from "LOINC" display 'HIV 1 and 2 tests - Meaningful Use set'
code "Pregnancy (finding)": '77386006' from "SNOMED-CT" display 'Pregnancy (finding)'
code "HIV 1 RNA NAA+probe (Specimen)": '25836-8' from "LOINC" display 'HIV 1 RNA [#/volume] (viral load) in Specimen by NAA with probe detection'
code "Already on ART": 'already-on-art' from "PMTCT ART Status Codes" display 'Already on ART'
code "New on ART": 'new-on-art' from "PMTCT ART Status Codes" display 'New on ART'
code "Known Positive": 'known-positive' from "PMTCT HIV Status Codes" display 'Known Positive'
code "Newly Identified Positive": 'newly-identified-positive' from "PMTCT HIV Status Codes" display 'Newly Identified Positive'
code "Newly Identified Negative": 'newly-identified-negative' from "PMTCT HIV Status Codes" display 'Newly Identified Negative'
code "HIV Negative": '165815009' from "SNOMED-CT" display 'HIV Negative'
code "HIV Positive": '165816005' from "SNOMED-CT" display 'HIV Positive'
// code "HIV 1 and 2 tests - Meaningful Use set": '75622-1' from "LOINC" display 'HIV 1 and 2 tests - Meaningful Use set' // Used by CMS349
// code "History of antiretroviral therapy (situation)": '432101000124108' from "SNOMED-CT" display 'History of antiretroviral therapy (situation)'
code "History of antiretroviral therapy (situation)": '432101000124108' from "OpenHIE" display 'History of antiretroviral therapy (situation)'
code "Pregnant": '146789000' from "SNOMED-CT" display 'Pregnant'
code "Breastfeeding": '169750002' from "SNOMED-CT" display 'Breastfeeding'

