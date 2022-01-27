library HIVConcepts


// Code Systems
codesystem "SNOMED-CT": 'http://snomed.info/sct'
codesystem "LOINC": 'http://loinc.org'
// codesystem "RxNorm": 'http://www.nlm.nih.gov/research/umls/rxnorm'
// codesystem "CIEL": 'http://hl7.org/fhir/sid/ciel'
// codesystem "ICD-10": 'http://hl7.org/fhir/sid/icd-10'
// codesystem "ICD-11": 'http://hl7.org/fhir/sid/icd-11'
// codesystem "ICF": 'http://hl7.org/fhir/sid/icf-nl'
// codesystem "ICHI": 'https://mitel.dimi.uniud.it/ichi/#http://id.who.int/ichi'
// for hiv
codesystem "ISO-8601-Derived Periods": 'http://ohie.org/CodeSystem/iso-8601-derived-periods' // { 'P0Y--P1Y', 'P1Y--P5Y', ... }


//ValueSets


//Codes
// for hiv
code "HIV Condition Positive": '86406008' from "SNOMED-CT" display 'HIV infection'
code "HIV 1 and 2 tests - Meaningful Use set": '75622-1' from "LOINC" display 'HIV 1 and 2 tests - Meaningful Use set'
code "Pregnant (finding)": '77386006' from "SNOMED-CT" display 'Pregnant (finding)'
code "HIV 1 RNA NAA+probe (Specimen)": '25836-8' from "LOINC" display 'HIV 1 RNA [#/volume] (viral load) in Specimen by NAA with probe detection'
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


