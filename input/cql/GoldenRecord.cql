library GoldenRecord version '0.1.0'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'
include FHIRCommon version '4.0.1' called FC
include AgeRanges version '0.1.0' called AR

codesystem "SNOMED-CT": 'http://snomed.info/sct' version 'http://snomed.info/sct/900000000000207008'
codesystem "LOINC": 'http://loinc.org'

code "HIV Condition Positive": '86406008' from "SNOMED-CT" display 'HIV infection'
code "HIV 1 and 2 tests - Meaningful Use set": '75622-1' from "LOINC" display 'HIV 1 and 2 tests - Meaningful Use set'
code "Pregnant (finding)": '77386006' from "SNOMED-CT" display 'Pregnant (finding)'
code "HIV 1 RNA NAA+probe (Specimen)": '25836-8' from "LOINC" display 'HIV 1 RNA NAA+probe (Specimen)'

context Patient

define "LinkedPatients":
  Patient.link.other
