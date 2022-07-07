library DASHConcepts version '0.1.0'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'
include FHIRCommon version '4.0.1' called FC


// codesystems
codesystem "SNOMED-CT": 'http://snomed.info/sct'
codesystem "LOINC": 'http://loinc.org'
codesystem "CIEL": 'https://openconceptlab.org/orgs/CIEL/sources/CIEL'
// codesystem "RxNorm": 'http://www.nlm.nih.gov/research/umls/rxnorm'
// codesystem "ICD-10": 'http://hl7.org/fhir/sid/icd-10'
// codesystem "ICD-11": 'http://hl7.org/fhir/sid/icd-11'
// codesystem "ICF": 'http://hl7.org/fhir/sid/icf-nl'
// codesystem "ICHI": 'https://mitel.dimi.uniud.it/ichi/#http://id.who.int/ichi'
codesystem "OpenHIE": 'https://openhie.org'
codesystem "PMTCT HIV Status Codes": 'http://fhir.org/guides/who/hiv-cds/CodeSystem/hiv-pmtct-hiv-status-codes' 
codesystem "PMTCT ART Status Codes": 'http://fhir.org/guides/who/hiv-cds/CodeSystem/hiv-pmtct-art-status-codes'


// gender
valueset "HL7 Administrative Gender": 'http://hl7.org/fhir/ValueSet/administrative-gender'


// pregnancy, breastfeeding, anc
code "Pregnancy (finding)": '77386006' from "SNOMED-CT" display 'Pregnancy (finding)'
code "Pregnant": '146789000' from "SNOMED-CT" display 'Pregnant'
code "Breastfeeding": '169750002' from "SNOMED-CT" display 'Breastfeeding'
valueset "Antenatal Care": 'http://fhir.org/guides/who/hiv-cds/ValueSet/hiv-antenatal-care' // Antenatal Care
valueset "Pregnancy Codes": 'http://fhir.org/guides/who/hiv-cds/ValueSet/pregnancy-codes' // Pregnancy
valueset "Live Birth": 'http://fhir.org/guides/who/hiv-cds/ValueSet/live-birth' // Live Birth
valueset "Breastfeeding Codes": 'http://fhir.org/guides/who/hiv-cds/ValueSet/breastfeeding-codes' // Breastfeeding
valueset "Delivery Procedures": 'urn:oid:2.16.840.1.113762.1.4.1045.59' // Used by CMS113


// hiv testing, results, conditions
code "HIV Condition Positive": '86406008' from "SNOMED-CT" display 'HIV infection'
code "HIV Negative": '165815009' from "SNOMED-CT" display 'HIV Negative'
code "HIV Positive": '165816005' from "SNOMED-CT" display 'HIV Positive'
valueset "HIV Testing Services": 'http://fhir.org/guides/who/hiv-cds/ValueSet/hiv-testing-services' // Should use HIV tests


// viral load tests, results
code "HIV 1 and 2 tests - Meaningful Use set": '75622-1' from "LOINC" display 'HIV 1 and 2 tests - Meaningful Use set'
code "HIV 1 RNA NAA+probe (Specimen)": '25836-8' from "LOINC" display 'HIV 1 RNA [#/volume] (viral load) in Specimen by NAA with probe detection'
// code "HIV 1 and 2 tests - Meaningful Use set": '75622-1' from "LOINC" display 'HIV 1 and 2 tests - Meaningful Use set' // Used by CMS349
// code "Viral Load Quantitative": '856' from "CIEL" display 'HIV viral load'
// code "Viral Load Qualitative": '1305' from "CIEL" display 'HIV VIRAL LOAD, QUALITATIVE'
// code "Viral Load Qualitative Value": '1306' from "CIEL" display 'BEYOND DETECTABLE LIMIT'
// code "Anti Retroviral Therapy": '160119' from "CIEL" display 'Currently taking ARV'
// code "Coded Answer": '1065' from "CIEL" display 'Yes'
valueset "ART Medications": 'http://fhir.org/guides/who/hiv-cds/ValueSet/hiv-art-medications' // ART medications
// commenting out for now and the union
// valueset "Human Immunodeficiency Virus (HIV) Laboratory Test Codes (Ab and Ag)": 'urn:oid:2.16.840.1.113762.1.4.1056.50' // Used by CMS349
valueset "Viral Load Test": 'http://fhir.org/guides/who/hiv-cds/ValueSet/hiv-viral-load-test'


// art
// code "History of antiretroviral therapy (situation)": '432101000124108' from "SNOMED-CT" display 'History of antiretroviral therapy (situation)'
code "History of antiretroviral therapy (situation)": '432101000124108' from "OpenHIE" display 'History of antiretroviral therapy (situation)'


// pmtct hiv and art
// { 'known-positive', 'newly-identified-positive', 'newly-identified-negative' }
code "Known Positive": 'known-positive' from "PMTCT HIV Status Codes" display 'Known Positive'
code "Newly Identified Positive": 'newly-identified-positive' from "PMTCT HIV Status Codes" display 'Newly Identified Positive'
code "Newly Identified Negative": 'newly-identified-negative' from "PMTCT HIV Status Codes" display 'Newly Identified Negative'
// { 'already-on-art', 'new-on-art' }
code "Already on ART": 'already-on-art' from "PMTCT ART Status Codes" display 'Already on ART'
code "New on ART": 'new-on-art' from "PMTCT ART Status Codes" display 'New on ART'


