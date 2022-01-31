// library TXFOO

// using FHIR version '4.0.1'

// include FHIRHelpers version '4.0.1'
// include FHIRCommon version '4.0.1' called FC

// include HIVConcepts called Cx
// include HIVDataElements called PatientData
// include HIVStratifiers called HIVStrat

// context Patient

library TXFOO

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'
include FHIRCommon version '4.0.1' called FC

context Patient

define "PatientStuff": Patient.name.given

