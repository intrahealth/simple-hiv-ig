library Bar version '0.1.0'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'
include FHIRCommon version '4.0.1' called FC

context Patient

// per fhir chat: this helper is for converting a reference to an id
define function "GetId"(uri String):
    Last(Split(uri, '/'))

define "some test":
  [Coverage] C
    return First(C.contract)

// objective: contract from coverage from patient beneficiary
// define "some test2":
// [Coverage] C
//     with [Patient] P
//         such that P.id ~ GetId(C.beneficiary.reference.value)
//     return First(C.contract)

