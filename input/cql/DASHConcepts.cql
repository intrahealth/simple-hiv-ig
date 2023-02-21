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
// todo: replace this codesystem at some point
codesystem "OpenHIE": 'https://openhie.org'
codesystem "PMTCT HIV Status Codes": 'https://intrahealth.github.io/simple-hiv-ig/CodeSystem/hiv-pmtct-hiv-status-codes' 
codesystem "PMTCT ART Status Codes": 'https://intrahealth.github.io/simple-hiv-ig/CodeSystem/hiv-pmtct-art-status-codes'

// gender
valueset "HL7 Administrative Gender": 'http://hl7.org/fhir/ValueSet/administrative-gender'


// pregnancy, breastfeeding, anc
// Library.dataRequirement[5].codeFilter[0].code[0]	warning	The display "Pregnancy (finding)" is not a valid display for the code {http://snomed.info/sct}77386006 - should be one of ['Pregnancy not delivered', 'Gestation', 'Pregnant', 'Pregnancy confirmed', 'Pregnancy (finding)', 'Patient currently pregnant'] (from http://tx.fhir.org/r4) for 'http://snomed.info/sct#77386006'

code "Pregnancy (finding)": '77386006' from "SNOMED-CT" display 'Pregnancy (finding)'
code "Pregnant": '146789000' from "SNOMED-CT" display 'Pregnant'
code "Breastfeeding": '169750002' from "SNOMED-CT" display 'Breastfeeding'
code "Prenatal initial visit (regime/therapy)": '424441002' from "SNOMED-CT" display 'Prenatal initial visit (regime/therapy)'
code "Pregnancy status - Reported": '11449-6' from "LOINC" display 'Pregnancy status - Reported'
code "Livebirth (finding)": '281050002' from "SNOMED-CT" display 'Livebirth (finding)'
// code "Single live birth": '68499-3' from "LOINC" display 'Single live birth'
code "Postpartum state (finding)": '86569001' from "SNOMED-CT" display 'Postpartum state (finding)'
// valueset "Delivery Procedures": 'urn:oid:2.16.840.1.113762.1.4.1045.59' // Used by CMS113


// hiv testing, results, conditions
code "HIV Condition Positive": '86406008' from "SNOMED-CT" display 'HIV infection'
code "HIV Negative": '165815009' from "SNOMED-CT" display 'HIV Negative'
code "HIV Positive": '165816005' from "SNOMED-CT" display 'HIV Positive'
valueset "HIV Testing Services": 'https://intrahealth.github.io/simple-hiv-ig/ValueSet/hiv-testing-services' // Should use HIV tests


// viral load tests, results
code "HIV 1 and 2 tests - Meaningful Use set": '75622-1' from "LOINC" display 'HIV 1 and 2 tests - Meaningful Use set'
code "HIV 1 RNA NAA+probe (Specimen)": '25836-8' from "LOINC" display 'HIV 1 RNA [#/volume] (viral load) in Specimen by NAA with probe detection'
// code "HIV 1 and 2 tests - Meaningful Use set": '75622-1' from "LOINC" display 'HIV 1 and 2 tests - Meaningful Use set' // Used by CMS349
// code "Viral Load Quantitative": '856' from "CIEL" display 'HIV viral load'
// code "Viral Load Qualitative": '1305' from "CIEL" display 'HIV VIRAL LOAD, QUALITATIVE'
// code "Viral Load Qualitative Value": '1306' from "CIEL" display 'BEYOND DETECTABLE LIMIT'
// code "Anti Retroviral Therapy": '160119' from "CIEL" display 'Currently taking ARV'
// code "Coded Answer": '1065' from "CIEL" display 'Yes'
valueset "ART Medications": 'https://intrahealth.github.io/simple-hiv-ig/ValueSet/hiv-art-medications' // ART medications
// commenting out for now and the union
// valueset "Human Immunodeficiency Virus (HIV) Laboratory Test Codes (Ab and Ag)": 'urn:oid:2.16.840.1.113762.1.4.1056.50' // Used by CMS349
valueset "Viral Load Test": 'https://intrahealth.github.io/simple-hiv-ig/ValueSet/hiv-viral-load-test'


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


