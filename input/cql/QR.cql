library QR

// copied from https://github.com/cqframework/sample-content-ig/blob/master/input/cql/PHQ9Logic.cql

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'
include FHIRCommon version '4.0.1' called FC

// parameter response QuestionnaireResponse

context Patient

define QuestionnaireResponses: [QuestionnaireResponse]

// Use the QuestionnaireResponse provided as a parameter if available
// Otherwise look it up from the record
// define "QuestionnaireResponse":
//   if response is not null then
//     response
//   else
//     Last([QuestionnaireResponse] QR)

    // Last(
    //   [QuestionnaireResponse] QR
    //     where QR.questionnaire = 'http://somewhere.org/fhir/uv/mycontentig/Questionnaire/phq-9-questionnaire'
    //     sort by (authored as FHIR.dateTime) desc
    // )

// NOTE: This ties this logic directly to this particular rendering of the Questionnaire.
// Ideally the items would be filtered based on Code of the Item, rather than the LinkId,
// but that would require pulling in the Questionnaire because the QuestionnaireResponse
// only has the LinkId.

// define "Responses":
//   "QuestionnaireResponse" QR
//     return QR.item I
