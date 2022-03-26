library Attribution version '0.1.0'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'
include FHIRCommon version '4.0.1' called FC


context Patient

// per fhir chat: this helper is for converting a reference to an id
define function "GetId"(uri String):
    Last(Split(uri, '/'))

define "Account": 
    Last([Encounter]).account.reference.value

define "Coverage":
    Last([Account]).coverage.coverage.reference.value

// account -> coverage -> contract
// always shows null
define "Contract":
    Last([Coverage]).contract.reference.value



// or this method

define "Owner": 
    Last([Account]).owner.reference.value

// this has a syntax error
// define "Beneficiary":
//     [Coverage] C
//         C.beneficiary


// always shows null
// define "Contract":
//     Last([Contract])

