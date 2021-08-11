#!/bin/bash


# sushi
# cp fsh-generated/resources/* input/resources/
bash _genonce.sh

# wget http://build.fhir.org/ig/cqframework/cqf/Library-FHIRHelpers.json
curl -X PUT -H "Content-Type: application/fhir+json" --data @Library-FHIRHelpers.json http://localhost:8080/fhir/Library/FHIRHelpers

cd output
# library resources
for FILE in FHIRCommon AgeRanges \
HIVSimpleAgeGroup HIVSimpleCondition HIVSimpleDemog \
HIVSimpleGender HIVSimpleTestResult HIVSimpleViralLoad \
; do curl -X PUT -H "Content-Type: application/fhir+json" --data @Library-${FILE}.json http://localhost:8080/fhir/Library/${FILE} ; done

for FILE in HIVSimpleAgeGroup HIVSimpleCondition HIVSimpleDemog \
HIVSimpleGender HIVSimpleGender2 HIVSimpleGenderCohort HIVSimpleGenderSuppData HIVSimpleGenderSuppDataIndiv \
HIVSimpleGenderSubjectList HIVSimpleTestResult HIVSimpleViralLoad \
; do curl -X PUT -H "Content-Type: application/fhir+json" --data @Measure-${FILE}.json http://localhost:8080/fhir/Measure/${FILE} ; done

open "http://localhost:8080/fhir/Measure/HIVSimpleGenderSuppData/\$evaluate-measure?periodStart=1970&periodEnd=2021"
open "http://localhost:8080/fhir/Measure/HIVSimpleGenderSubjectList/\$evaluate-measure?periodStart=1970&periodEnd=2021"
open "http://localhost:8080/fhir/Measure/HIVSimpleGenderCohort/\$evaluate-measure?periodStart=1970&periodEnd=2021"
open "http://localhost:8080/fhir/Measure/HIVSimpleGender/\$evaluate-measure?periodStart=1970&periodEnd=2021"
open "http://localhost:8080/fhir/Measure/HIVSimpleAgeGroup/\$evaluate-measure?periodStart=1970&periodEnd=2021"
open "http://localhost:8080/fhir/Measure/HIVSimpleTestResult/\$evaluate-measure?periodStart=1970&periodEnd=2021"
open "http://localhost:8080/fhir/Measure/HIVSimpleCondition/\$evaluate-measure?periodStart=1970&periodEnd=2021"
open "http://localhost:8080/fhir/Measure/HIVSimpleViralLoad/\$evaluate-measure?periodStart=1970&periodEnd=2021"

# Patient/31672
open "http://localhost:8080/fhir/Measure/HIVSimpleGenderSuppData/\$evaluate-measure?patient=31672&periodStart=1970&periodEnd=2021"
open "http://localhost:8080/fhir/Measure/HIVSimpleGenderSuppDataIndiv/\$evaluate-measure?patient=89&periodStart=1970&periodEnd=2021"