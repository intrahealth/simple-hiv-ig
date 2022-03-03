library DataContract

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'
include FHIRCommon version '4.0.1' called FC
// include fhir.cqf.common.FHIRCommon
include DASHConcepts called Cx

// Minimal Shared Health Record (mSHR) based on only the data needed for cqm, cds, etc.
// Example of a privacy-first, minimal data contract between a Provider of patient data and a Consumer of it.

// todo: remove entries that have no vl data, report type of virus? receive art distributions?

context Patient

// Provider issues a unique identifier that is random and unrelated to the patient and a namespace for it.
define "Identifier": 
  Patient.identifier I 
    where I.system = 'https://intrahealth.github.io/simple-hiv-ig/CodeSystem/OpenCR'
      // return I.value.value
      return Tuple {
        id: singleton from {I.value.value},
        namespace: I.system
      }

// Provider must provide the birth year of the patient.
define "Birthyear": 
  year from Patient.birthDate

// Provider must provide the sex of the patient.
define "Sex": 
  Patient.gender.value

// Provider must provide all observations for viral load and date of issuance for each test.
define "Viral Load Test Result Array with DateTime":
  ["Observation": Cx."HIV 1 RNA NAA+probe (Specimen)"] Obs
    where Obs.status = 'final'
      and Obs.value is not null
      and Obs.issued is not null
        return Tuple { 
          value: Obs.value.value,
          issued: ToDate(Obs.issued.value)
        }

