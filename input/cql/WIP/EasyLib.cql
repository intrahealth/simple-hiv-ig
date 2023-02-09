library EasyLib version '0.1.0'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'
// include FHIRCommon version '4.0.1' called FC
include fhir.cqf.common.FHIRCommon called FC

parameter "Measurement Period" Interval<DateTime>

context Patient

define "Initial Population": true

define "Numerator": true

define "Denominator": true