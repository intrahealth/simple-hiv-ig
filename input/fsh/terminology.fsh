CodeSystem: OpenCR
Id: OpenCR
Title: "OpenCR CodeSystem"
Description: "OpenCR CodeSystem"
* ^caseSensitive = false
* ^url = $OpenCR
* #1234 "Golden Record"

CodeSystem: OpenHIE
Id: OpenHIE
Title: "OpenHIE CodeSystem"
Description: "OpenHIE CodeSystem"
* ^caseSensitive = false
* ^url = $OpenHIE
* #cohort "cohort"
// add this because it doesn't show up on snomed term servers
* #432101000124108 "History of antiretroviral therapy (situation)"

CodeSystem: PEPFAR
Id: PEPFAR
Title: "PEPFAR CodeSystem"
Description: "PEPFAR CodeSystem"
* ^caseSensitive = false
* ^url = $PEPFAR
* #4321 "Contract ID"

CodeSystem: PMTCTHIVStatusCodes
Id: PMTCTHIVStatusCodes
Title: "PMTCTHIVStatusCodes CodeSystem"
Description: "PMTCTHIVStatusCodes CodeSystem"
* ^caseSensitive = false
* ^url = $PMTCTHIVStatusCodes
* #known-positive "known-positive"
* #newly-identified-positive "newly-identified-positive"
* #newly-identified-negative "newly-identified-negative"

CodeSystem: PMTCTARTStatusCodes
Id: PMTCTARTStatusCodes
Title: "PMTCTARTStatusCodes CodeSystem"
Description: "PMTCTARTStatusCodes CodeSystem"
* ^caseSensitive = false
* ^url = $PMTCTARTStatusCodes
* #already-on-art "already-on-art"
* #new-on-art "new-on-art"

ValueSet: PregnancyCodes
Id: PregnancyCodes
Title: "Pregnancy Codes"
Description: "Pregnancy Codes"
* ^url = $PregnancyCodes
* $SCT#1 "PregnancyCodes Code 1"
* $SCT#2 "PregnancyCodes Code 2"

ValueSet: BreastfeedingCodes
Id: BreastfeedingCodes
Title: "BreastfeedingCodes"
Description: "BreastfeedingCodes"
* ^url = $Breastfeeding
* $SCT#1 "BreastfeedingCodes Code 1"
* $SCT#2 "BreastfeedingCodes Code 2"

ValueSet: ViralLoadTest
Id: ViralLoadTest
Title: "ViralLoadTest"
Description: "ViralLoadTest"
* ^url = $ViralLoadTest
* $SCT#10 "ViralLoadTest Code 1"
* $SCT#20 "ViralLoadTest Code 2"

ValueSet: HIVTestingServices
Id: HIVTestingServices
Title: "HIVTestingServices"
Description: "HIVTestingServices"
* ^url = $HIVTestingServices
* $SCT#30 "HIVTestingServices Code 1"
* $SCT#40 "HIVTestingServices Code 2"

// CodeSystem:  CSHIVRiskPopulation
// Id: cs-hiv-population
// Title: "Population groups"
// Description: "CodeSystem - Population groups - Subjects to be tested for HIV"

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

