# Simple HIV (for testing only)

## Quick start

Start HAPI FHIR Server
> This creates a temporary server with memory for storage only, for testing only. Refer to the HAPI docs for production usage.
```sh
docker run -p 8080:8080 -e spring.datasource.url=jdbc:h2:mem:test_mem -e hapi.fhir.cql_enabled=true hapiproject/hapi:latest
```

Confirm if necessary if the `$evaluate-measure` operation is supported (will return the text 'evaluate-measure' if so):
```sh
curl --silent http://localhost:8080/fhir/metadata | grep -o "evaluate-measure"
```

Install sushi for FHIR Shorthand
> The prototype version of this repo used Synthea-generated data. Now, it uses FSH to make iteration and customization easier.
```sh
npm install -g fsh-sushi
```

Clone this repo
```sh
git clone git@github.com:intrahealth/simple-hiv-ig.git
cd simple-hiv-ig
```

Sushi should be run independently first to generate patient test data
```sh
sushi
```

On the existing repo with no changes there should not be any errors, e.g.:
```
╔════════════════════════ SUSHI RESULTS ══════════════════════════╗
║ ╭──────────┬────────────┬───────────┬─────────────┬───────────╮ ║
║ │ Profiles │ Extensions │ ValueSets │ CodeSystems │ Instances │ ║
║ ├──────────┼────────────┼───────────┼─────────────┼───────────┤ ║
║ │    0     │     0      │     0     │      0      │    26     │ ║
║ ╰──────────┴────────────┴───────────┴─────────────┴───────────╯ ║
║                                                                 ║
║ Cool and So-fish-ticated!              0 Errors      0 Warnings ║
╚═════════════════════════════════════════════════════════════════╝
```

Run Publisher. Resources are put in /output. This is necessary because sushi will not add the CQL/ELM to the Library resources. A future version of sushi will support inserting the CQL/ELM.
```sh
# only need first time
bash _updatePublisher.sh
# run every time
bash _genonce.sh
```

Open the file `output/qa.html` to see errors or go to the qa page where it is published.


Load FHIR-ModelInfo just in case
```sh
curl -X PUT -H "Content-Type: application/fhir+json" --data @Library-FHIR-ModelInfo.json http://localhost:8080/cqf-ruler-r4/fhir/Library/FHIR-ModelInfo | jq .
```

```sh
cd output ; for FILE in OpenCR OpenHIE \
; do curl -X PUT -H "Content-Type: application/fhir+json" --data @CodeSystem-${FILE}.json http://localhost:8080/cqf-ruler-r4/fhir/CodeSystem/${FILE} | jq . ; done ; cd ../
```

```sh
cd output ; for FILE in FHIRHelpers FHIRCommon AgeRanges KitchenSink GoldenRecord Blaze \
; do curl -X PUT -H "Content-Type: application/fhir+json" --data @Library-${FILE}.json http://localhost:8080/cqf-ruler-r4/fhir/Library/${FILE} | jq . ; done ; cd ../
```

```sh
cd output ; for FILE in BlazeAgeGroupLocation BlazeGenderLocation BlazeStratifierTest BlazeStratifierAgeGroup \
JustGender JustAgeGroup JustLocation AgeGroupGender AgeGroupGenderLocation Cohort SuppData \
; do curl -X PUT -H "Content-Type: application/fhir+json" --data @Measure-${FILE}.json http://localhost:8080/cqf-ruler-r4/fhir/Measure/${FILE} | jq . ; done ; cd ..
```

```sh
cat output/Bundle-Example-HIVSimple.json | curl -X POST -H "Content-Type: application/fhir+json" --data-binary @- http://localhost:8080/cqf-ruler-r4/fhir | jq .
cat output/Bundle-Example-HIVSimple2.json | curl -X POST -H "Content-Type: application/fhir+json" --data-binary @- http://localhost:8080/cqf-ruler-r4/fhir | jq .
```

```sh
# set fhir server base as necessary
export FHIR="http://localhost:8080/cqf-ruler-r4/fhir"
curl $FHIR'/Measure/JustGender/$evaluate-measure?periodStart=2021&periodEnd=2021' | jq .
curl $FHIR'/Measure/JustAgeGroup/$evaluate-measure?periodStart=2021&periodEnd=2021' | jq .
curl $FHIR'/Measure/JustLocation/$evaluate-measure?periodStart=2021&periodEnd=2021' | jq .
curl $FHIR'/Measure/AgeGroupGender/$evaluate-measure?periodStart=2021&periodEnd=2021' | jq .
curl $FHIR'/Measure/AgeGroupGenderLocation/$evaluate-measure?periodStart=2021&periodEnd=2021' | jq .
curl $FHIR'/Measure/Cohort/$evaluate-measure?periodStart=2021&periodEnd=2021' | jq .
curl $FHIR'/Measure/SuppData/$evaluate-measure?periodStart=2021&periodEnd=2021' | jq .
curl $FHIR'/Measure/BlazeStratifierAgeGroup/$evaluate-measure?periodStart=2021&periodEnd=2021' | jq .
curl $FHIR'/Measure/BlazeAgeGroupLocation/$evaluate-measure?periodStart=2021&periodEnd=2021' | jq .
curl $FHIR'/Measure/BlazeGenderLocation/$evaluate-measure?periodStart=2021&periodEnd=2021' | jq .
curl $FHIR'/Measure/BlazeStratifierTest/$evaluate-measure?periodStart=2021&periodEnd=2021' | jq .
```