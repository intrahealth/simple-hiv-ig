library Attribution version '0.1.0'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'
include FHIRCommon version '4.0.1' called FC

context Patient

define function "GetId"(uri String):
    Last(Split(uri, '/'))

define "Account": 
    Last([Encounter]).account.reference.value

define "Owner": 
    Last([Account]).owner.reference.value

define "Coverage":
    Last([Account]).coverage.coverage.reference.value

// always shows null
define "Contract":
    Last([Contract])

// .value.resolve().name

// define "Mother": singleton from ([RelatedPerson: "Mother Relationship"])

// define "Estimated Due Date":
//   Last(
//     ["Mother" -> "Observation": "Estimated Due Date Exam"] Exam
//       sort by effective
//   )

define "Account2": 
    Last([Encounter]).account

// related context retrieve -- shows null
define "Testy":
    ["Account2" -> "Contract"]
