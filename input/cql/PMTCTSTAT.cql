// PMTCT_STAT, WHO [Closest in ANC DAK] ANC.IND.12 Percentage of pregnant women counselled and tested for HIV
// Percentage of pregnant women with known HIV status at antenatal care (includes those who already knew their HIV status prior to ANC)
// numeratory only

library PMTCTSTAT

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'
include FHIRCommon version '4.0.1' called FC
include DASHConcepts called Cx
include DASHDataElements called PatientData
include DASHStratifiers called HIVStrat

context Patient
