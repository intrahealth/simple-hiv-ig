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
```

Run Publisher. Resources are put in /output. This necessary because sushi will not add the CQL/ELM to the Library resources.
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

```sh
cd output
# library resources
for FILE in KitchenSink FHIRCommon AgeRanges \
; do curl -X PUT -H "Content-Type: application/fhir+json" --data @Library-${FILE}.json http://localhost:8080/fhir/Library/${FILE} ; done
```

PUT the Measure resources
```sh
for FILE in HIVSimpleAgeGroup HIVSimpleCondition HIVSimpleDemog \
HIVSimpleGender HIVSimpleGenderCohort HIVSimpleGenderSuppData HIVSimpleGenderSuppDataIndiv \
HIVSimpleGenderSubjectList HIVSimpleTestResult HIVSimpleViralLoad \
; do curl -X PUT -H "Content-Type: application/fhir+json" --data @Measure-${FILE}.json http://localhost:8080/fhir/Measure/${FILE} ; done
```

Run a provided example in the browser
```
http://localhost:8080/fhir/Measure/HIVSimpleGenderCohort-Measure/$evaluate-measure?periodStart=1970-01-01&periodEnd=2021-01-01
http://localhost:8080/fhir/Measure/HIVSimpleGender-Measure/$evaluate-measure?periodStart=1970-01-01&periodEnd=2021-01-01
http://localhost:8080/fhir/Measure/HIVSimpleAgeGroup-Measure/$evaluate-measure?periodStart=1970-01-01&periodEnd=2021-01-01
http://localhost:8080/fhir/Measure/HIVSimpleDemog-Measure/$evaluate-measure?periodStart=1970-01-01&periodEnd=2021-01-01
http://localhost:8080/fhir/Measure/HIVSimpleTestResult-Measure/$evaluate-measure?periodStart=1970-01-01&periodEnd=2021-01-01
http://localhost:8080/fhir/Measure/HIVSimpleCondition-Measure/$evaluate-measure?periodStart=1970-01-01&periodEnd=2021-01-01
http://localhost:8080/fhir/Measure/HIVSimpleViralLoad-Measure/$evaluate-measure?periodStart=1970-01-01&periodEnd=2021-01-01
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
