library EasyLib

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'
include FHIRCommon version '4.0.1' called FC
// include fhir.cqf.common.FHIRCommon

context Patient

define "Numerator": 
  Patient.gender.value = 'female'