library Dedupe version '0.1.0'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'
include FHIRCommon version '4.0.1' called FC

// Patient.identifier[].system: https://intrahealth.github.io/simple-hiv-ig/CodeSystem/OpenCR
//  If you run Unfiltered for multiple patients you get one result with values for multiple Patients.

context Patient

define "GoldenID":
  singleton from (
    Patient.identifier I where I.system = 'https://intrahealth.github.io/simple-hiv-ig/CodeSystem/OpenCR'
  ) //.value.value

context Unfiltered

define "ThisPatient": "GoldenID"
  
  // [Patient] P where P.identifier.value.value = "GoldenID".value.value
  // not working
  // [Patient] P where P.identifier.value.value ~ "GoldenID"


