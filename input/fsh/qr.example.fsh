// simplified from https://www.hl7.org/fhir/questionnaireresponse-example-f201-lifelines.json
Instance: f201
InstanceOf: QuestionnaireResponse
Usage: #example
* status = #completed
* authored = "2013-06-18T00:00:00+01:00"
* subject = Reference(Patient/Patient-HIVSimple)
// * author = Reference(Practitioner/f201)
* source = Reference(Patient/Patient-HIVSimple)
* item[+]
  * linkId = "1.1"
  * text = "What is your gender?"
  * answer.valueString = "Male"
* item[+]
  * linkId = "1.2"
  * text = "What is your date of birth?"
  * answer.valueDate = "1960-03-13"
* item[+]
  * linkId = "1.3"
  * text = "What is your country of birth?"
  * answer.valueString = "The Netherlands"
* item[+]
  * linkId = "1.4"
  * text = "What is your marital status?"
  * answer.valueString = "married"

Instance: Example-QR
InstanceOf: Bundle
Title: "Example-QR"
Description: "Example-QR"
* type = #transaction

* entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/Patient/Patient-HIVSimple"
* entry[=].request.url = "Patient"
* entry[=].resource = Patient-HIVSimple
* insert patient-bundle

* entry[+].fullUrl = "https://intrahealth.github.io/simple-hiv-ig/QuestionnaireResponse/f201"
* entry[=].request.url = "QuestionnaireResponse"
* entry[=].resource = f201
* insert patient-bundle
