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

Copy over patient test data into test folders (see caveats below for how/why)
```
cp fsh-generated/resources/Bundle-Example-HIVSimple.json input/tests/KitchenSink/Patient-HIVSimple/
cp fsh-generated/resources/Bundle-Example-HIVSimple.json input/tests/AgeRanges/Patient-HIVSimple/
cp fsh-generated/resources/Bundle-Example-HIVSimple.json input/tests/GoldenRecord/Patient-GoldenRecord/
cp fsh-generated/resources/Bundle-Example-HIVSimple2.json input/tests/KitchenSink/Patient-HIVSimple2/
cp fsh-generated/resources/Bundle-Example-HIVSimple2.json input/tests/AgeRanges/Patient-HIVSimple2/
cp fsh-generated/resources/Bundle-Example-HIVSimple2.json input/tests/GoldenRecord/Patient-GoldenRecord/
cp fsh-generated/resources/Patient-Patient-GoldenRecord.json input/tests/GoldenRecord/Patient-GoldenRecord/
```

Run Publisher. Resources are put in /output. This is necessary because sushi will not add the CQL/ELM to the Library resources. A future version of sushi will support inserting the CQL/ELM.
```sh
# only need first time
bash _updatePublisher.sh
# run every time
bash _genonce.sh
```

Open the file `output/qa.html` to see errors or go to the qa page where it is published.

PUT the Library resources. We use PUT to ensure that the id is always the same and when changes are made they overwrite the resource with those updates.

The FHIR Helpers Library generated from the provided CQL produces an error, so we load that directly after downloading it.

```
wget http://build.fhir.org/ig/cqframework/cqf/Library-FHIRHelpers.json
curl -X PUT -H "Content-Type: application/fhir+json" --data @Library-FHIRHelpers.json http://localhost:8080/fhir/Library/FHIRHelpers
```


## Quick Start with Blaze


Use the awesome [jq](https://stedolan.github.io/jq/download/) for pretty printing curl output.


### If editing the files
* Edit the FSH
* Add any new (non-conformance) resources to input/simple-hiv-ig.xml

Then choose the standard or temporary pipeline to ensure artifacts are in /output and ready to load.

Standard pipeline.
> This assumes the FSH-CQL-Measure pipeline is working as expected.
```sh
bash _genonce.sh
```

Otherwise follow the temporary pipeline which uses CQF tooling as an intermediate step.
```
rm -rf input/resources/Library-*
sushi
mv fsh-generated/resources/Library-* input/resources/
bash _refresh.sh
bash _genonce.sh -no-sushi
```

### Start and Load Blaze and $evaluate-measure operations

```sh
# may want to delete previous volumes if there were mistakes
docker volume rm blaze-data
docker volume create blaze-data
docker run -p 8080:8080 -v blaze-data:/app/data samply/blaze:latest
```

```sh
cd output ; for FILE in OpenCR OpenHIE \
; do curl -X PUT -H "Content-Type: application/fhir+json" --data @CodeSystem-${FILE}.json http://localhost:8080/fhir/CodeSystem/${FILE} | jq . ; done ; cd ..
```

```sh
cd output ; for FILE in cqf-tooling \
; do curl -X PUT -H "Content-Type: application/fhir+json" --data @Device-${FILE}.json http://localhost:8080/fhir/Device/${FILE} | jq . ; done ; cd ..
```

```sh
cd output ; for FILE in Blaze \
; do curl -X PUT -H "Content-Type: application/fhir+json" --data @Library-${FILE}.json http://localhost:8080/fhir/Library/${FILE} | jq . ; done ; cd ..
```


```sh
cd output ; for FILE in BlazeStratifierTest BlazeStratifierAgeGroup BlazeAgeGroupLocation \
; do curl -X PUT -H "Content-Type: application/fhir+json" --data @Measure-${FILE}.json http://localhost:8080/fhir/Measure/${FILE} | jq . ; done ; cd ..
```


POST the patient bundles with fullUrl of the bundle entries as references
```sh
cat output/Bundle-Example-HIVSimple.json | curl -X POST -H "Content-Type: application/fhir+json" --data-binary @- http://localhost:8080/fhir | jq .
cat output/Bundle-Example-HIVSimple2.json | curl -X POST -H "Content-Type: application/fhir+json" --data-binary @- http://localhost:8080/fhir | jq .
```

Run a provided example in the browser
```
http://localhost:8080/fhir/Measure/BlazeStratifierTest/$evaluate-measure?periodStart=1970-01-01&periodEnd=2021-01-01
```
or on command line:
```
curl 'http://localhost:8080/fhir/Measure/BlazeStratifierTest/$evaluate-measure?&periodStart=2000&periodEnd=2030' | jq .
curl 'http://localhost:8080/fhir/Measure/BlazeStratifierAgeGroup/$evaluate-measure?&periodStart=2000&periodEnd=2030' | jq .
curl 'http://localhost:8080/fhir/Measure/BlazeAgeGroupLocation/$evaluate-measure?&periodStart=2000&periodEnd=2030' | jq .

```

The Blaze docs explain how to process Measure resources with CQL in Library resources.


## Getting started with cqf-ruler

> These instructions are temporary until feature-stratification are merged into main branch and a Publisher bug fix is released which prevents errors. Approach:
* Use an XML IG and not the Sushi, including includes/menu.xml not Sushi
* Comment out input/cql binary stuff in XML
* FSHOnly - true in sushi
* mv libraries or publisher errors with duplicate resources


```sh
git clone git@github.com:DBCG/cqf-ruler.git
cd cqf-ruler/
git checkout feature-stratification
mvn jetty:run -am --projects cqf-ruler-r4
```

```sh
# if making changes to the cql/measures, may have to delete database on each iteration
rm -rf target
```

Prep repo:
```sh
git@github.com:citizenrich/simple-hiv-ig.git
cd simple-hiv-ig
bash _updateCQFTooling.sh
bash _updatePublisher.sh
```


Steps:
```sh
rm -rf input/resources/Library-* input/resources/library-*
sushi
mv fsh-generated/resources/Library-* input/resources/
bash _refresh.sh
bash _genonce.sh -no-sushi
```

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

## Authoring

Implementation Guides are the FHIR community's supported approach to authorship, creation of Library and Measure resources, versioning. The Atom editor and package for CQL are recommended for iterating on CQL.

* Install the Atom editor and [Atom CQL language package](https://github.com/cqframework/atom_cql_support).
* To test that your setup is working, clone this repo, open a CQL file then make sure you have focus on the CQL file. Then right-click and at the bottom will be the CQL menu to `Execute CQL`. This will bring up a results window as it processes tests.

The folder structure must be set up accordingly (from [Atom CQL language package](https://github.com/cqframework/atom_cql_support)):
```
input/cql
input/tests
input/tests/<cql-library-name>
input/tests/<cql-library-name>/<patient-id>
input/tests/<cql-library-name>/<patient-id>/<resource-type-name>/<resource files> // flexible structure
input/vocabulary/codesystem
input/vocabulary/valueset
```
Observe the above or there will be issues.

For example:
* The CQL files are all under `input/cql`
* Library and Measure templates are under `input/resources`. They must be named and fields match the CQL files.
* The `_genonce` script in Publisher will convert those template Library and Measure resources into full resources that can be PUT on a FHIR server.
* Tests must have the `resource.id` of the resource as a folder name. Thus, there is a separate folder for each Patient bundle.
* The Patient bundles inside the folder can actually be named anything, but they are named here by `resource.id`.

> Patient bundles for tests do not have to be complex (these were generated by a custom Synthea module), but they must have the codesystems required in the CQL. It is important to determine codesystems in advance to author CQL or create temp ones while doing authorship.

* There must be an `input/vocabulary/valueset` folder even if it is empty.



```
$ cd input/
~/src/github.com/intrahealth/simple-hiv-ig/input
$ tree
.
├── cql
│   ├── AgeRanges.cql
│   ├── FHIRCommon.cql
│   ├── HIVSimpleAgeGroup.cql
│   └── cql-options.json
...
├── resources
│   ├── library-AgeRanges.json
│   ├── library-FHIRCommon.json
│   ├── library-HIVSimpleAgeGroup.json
...
├── tests
│   ├── HIVSimpleAgeGroup
│   │   ├── 0695de04-1a5d-e2c0-3e4f-79121465ba67
│   │   │   └── 0695de04-1a5d-e2c0-3e4f-79121465ba67.json
│   │   ├── 0ae954fa-eff8-0d38-c840-3af401abc9fd
│   │   │   └── 0ae954fa-eff8-0d38-c840-3af401abc9fd.json
...
└── vocabulary
    └── valueset
```

Some hints on authorship from recent workshops:
* Double quotes are for identifiers and single quotes represent string literals, for example, "female" should be 'female'.
* Check for odd copy/paste errors in quotes.
* Required libraries: `include FHIRHelpers version '4.0.1'` Use of FHIRHelpers is implicit in the translator, based on the modelinfo file with FHIR. This must be included in the boilerplate of any CQL that processes FHIR.



### Measure options and examples

$measure-scoring#cohort

A proportion Measure requires at least Initial Population, Denominator, and Numerator.

// * type.coding.code = #process <- this is not used in calculations


// options: proportion | ratio | continuous-variable | cohort
* scoring = $measure-scoring#proportion

// options: opportunity | all-or-nothing | linear | weighted
// * compositeScoring.coding.code = linear
// options: initial-population | numerator | numerator-exclusion | denominator | denominator-exclusion | denominator-exception | measure-population | measure-population-exclusion | measure-observation


// "The reportType `%s` is invalid. Please use one of `subject`, `subject-list` or `population`." report-type
// subject-list must be a POST

