library NewAttribution version '0.1.0'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'
include FHIRCommon version '4.0.1' called FC


// https://github.com/cqframework/ecqm-content-r4-2021/blob/master/input/cql/MATGlobalCommonFunctionsFHIR4.cql#L266-L272

define function "EncounterAccount"(Enc Encounter ):
  Enc.account EA
    return singleton from ([Account] A where A.id = "GetId"(EA.reference))

define function "GetId"(uri String ):
  Last(Split(uri, '/'))

define function "AccountCoverage"(Acct Account ):
  Acct.coverage AC
    return singleton from ([Coverage] CV where CV.id = "GetId"(AC.reference))

define function "CoverageContract"(Cov Coverage ):
  Cov.contract CK
    return singleton from ([Contract] K where K.id = "GetId"(CK.reference))
