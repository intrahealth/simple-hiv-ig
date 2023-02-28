CodeSystem: OpenCR
Id: OpenCR
Title: "OpenCR CodeSystem"
Description: "OpenCR CodeSystem"
* ^experimental = true
* ^caseSensitive = false
* ^url = $OpenCR
* #1234 "Golden Record"

CodeSystem: OpenHIE
Id: OpenHIE
Title: "OpenHIE CodeSystem"
Description: "OpenHIE CodeSystem"
* ^experimental = true
* ^caseSensitive = false
* ^url = $OpenHIE
* #cohort "cohort"
// add this because it doesn't show up on snomed term servers
* #432101000124108 "History of antiretroviral therapy (situation)"

CodeSystem: PEPFAR
Id: PEPFAR
Title: "PEPFAR CodeSystem"
Description: "PEPFAR CodeSystem"
* ^experimental = true
* ^caseSensitive = false
* ^url = $PEPFAR
* #4321 "Contract ID"

CodeSystem: PMTCTHIVStatusCodes
Id: PMTCTHIVStatusCodes
Title: "PMTCTHIVStatusCodes CodeSystem"
Description: "PMTCTHIVStatusCodes CodeSystem"
* ^experimental = true
* ^caseSensitive = false
* ^url = $PMTCTHIVStatusCodes
* #known-positive "known-positive"
* #newly-identified-positive "newly-identified-positive"
* #newly-identified-negative "newly-identified-negative"

CodeSystem: PMTCTARTStatusCodes
Id: PMTCTARTStatusCodes
Title: "PMTCTARTStatusCodes CodeSystem"
Description: "PMTCTARTStatusCodes CodeSystem"
* ^experimental = true
* ^caseSensitive = false
* ^url = $PMTCTARTStatusCodes
* #already-on-art "already-on-art"
* #new-on-art "new-on-art"

ValueSet: ViralLoadTest
Id: ViralLoadTest
Title: "ViralLoadTest"
Description: "ViralLoadTest"
* ^experimental = true
* ^url = $ViralLoadTest
* $SCT#10 "ViralLoadTest Code 1"
* $SCT#20 "ViralLoadTest Code 2"

ValueSet: HIVTestingServices
Id: HIVTestingServices
Title: "HIVTestingServices"
Description: "HIVTestingServices"
* ^experimental = true
* ^url = $HIVTestingServices
* $SCT#30 "HIVTestingServices Code 1"
* $SCT#40 "HIVTestingServices Code 2"

ValueSet: SyntheaHIVMedications
Id: SyntheaHIVMedications
Title: "Synthea HIV Medications"
Description: "Synthea HIV Medications"
* ^experimental = true
* ^url = $SyntheaHIVMedications
// ART_MonoEra: art_sequence_1987_1994.json
* $RxNorm#199663 "zidovudine 300 MG Oral Tablet"
* $RxNorm#284988 "didanosine 400 MG Delayed Release Oral Capsule"
* $RxNorm#313760 "zalcitabine 0.75 MG Oral Tablet"
* $RxNorm#313110 "stavudine 40 MG Oral Capsule"
// ART_DualERA: art_sequence_1995_1996
* $RxNorm#349491 "lamivudine 300 MG Oral Tablet"
// ART_EarlyPI: art_sequence_1997_2002
* $RxNorm#200082 "lamivudine 150 MG / zidovudine 300 MG Oral Tablet"
* $RxNorm#310988 "indinavir 400 MG Oral Capsule"
* $RxNorm#859863 "saquinavir mesylate 500 MG Oral Tablet"
* $RxNorm#317150 "ritonavir 100 MG Oral Capsule"
* $RxNorm#403978 "nelfinavir 625 MG Oral Tablet"
* $RxNorm#349477 "efavirenz 600 MG Oral Tablet"
* $RxNorm#597730 "lopinavir 200 MG / ritonavir 50 MG Oral Tablet"
// ART_3TCZDV_Era: art_sequence_2003_2005
* $RxNorm#349251 "tenofovir disoproxil fumarate 300 MG Oral Tablet"
* $RxNorm#403875 "emtricitabine 200 MG Oral Capsule"
* $RxNorm#476556 "emtricitabine 200 MG / tenofovir disoproxil fumarate 300 MG Oral Tablet"
// ART_EarlyINSTI: art_sequence_2006_2014
* $RxNorm#1147334 "emtricitabine 200 MG / rilpivirine 25 MG / tenofovir disoproxil fumarate 300 MG Oral Tablet"
* $RxNorm#643066 "efavirenz 600 MG / emtricitabine 200 MG / tenofovir disoproxil fumarate 300 MG Oral Tablet"
* $RxNorm#1306292 "cobicistat 150 MG / elvitegravir 150 MG / emtricitabine 200 MG / tenofovir disoproxil fumarate 300 MG Oral Tablet"
* $RxNorm#744842 "raltegravir 400 MG Oral Tablet"
* $RxNorm#1433873 "dolutegravir 50 MG Oral Tablet"
* $RxNorm#402109 "fosamprenavir 700 MG Oral Tablet"
* $RxNorm#664741 "atazanavir 300 MG Oral Capsule"
* $RxNorm#1359269 "darunavir 800 MG Oral Tablet"
// ART_LateINSTI: art_sequence_2015.json
* $RxNorm#2003249 "lamivudine 300 MG / tenofovir disoproxil fumarate 300 MG Oral Tablet"
* $RxNorm#1747691 "emtricitabine 200 MG / tenofovir alafenamide 25 MG Oral Table"
* $RxNorm#1999667 "bictegravir 50 MG / emtricitabine 200 MG / tenofovir alafenamide 25 MG Oral Tablet"
* $RxNorm#1721613 "cobicistat 150 MG / elvitegravir 150 MG / emtricitabine 200 MG / tenofovir alafenamide 10 MG Oral Tablet"
* $RxNorm#2122519 "dolutegravir 50 MG / lamivudine 300 MG Oral Tablet"

// from https://github.com/openhie/case-reporting-hiv-vn
// CodeSystem:  CSHIVRiskPopulation
// Id: cs-hiv-population
// Title: "Population groups"
// Description: "CodeSystem - Population groups - Subjects to be tested for HIV"
// * ^experimental = true

// * #pwid "Injecting drug users"
// * #msm "Men who have sex with men"
// * #sw "Sex workers"
// * #client_sw "Clients of sex worker "
// * #partner_plhiv "Sexual partner of PLHIV"
// * #tg_women "Transgender women"
// * #tg_men "Transgender men"
// * #child_woman_hiv "Child of mother who is infected with HIV"
// * #blood-donor "Blood seller / blood donor"
// * #suspect_hiv "People suspected for AIDs"
// * #tb_patient "Tuberculosis patient"
// * #std_person "Persons with STD"
// * #prisoner "Prisoner"
// * #pregnant "Pregnant women"
// * #military_recruits "Young recruits for military service"
// * #partner_high_risk "Sexual partner of high risk group"
// * #other "Other"

