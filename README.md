# Simple HIV (for testing only)

## How to use

### Configure HAPI FHIR Server to process CQL/Measures. 

> Note that the HAPI Docker image doesn't include the feature, the server must be run from the JAR or rebuilt with the JAR and then put into your own container.

Clone hapi-fhir-jpaserver-starter
```
git clone git@github.com:hapifhir/hapi-fhir-jpaserver-starter.git
cd hapi-fhir-jpaserver-starter
```
Uncomment the cql line in src/main/resources/application.yaml so that it is enabled.
```sh
#    auto_create_placeholder_reference_targets: false
    cql_enabled: true
#    default_encoding: JSON
```
Run HAPI
```
mvn jetty:run
```

### Prepare and load synthetic data

See https://github.com/intrahealth/synthea-hiv

## Prepare this repo

Clone this IG repo

```sh
git clone git@github.com:citizenrich/simple-hiv-ig.git
cd simple-hiv-ig
```

Run Publisher and create resources. Resources are put in /output
```sh
# only need first time
bash _updatePublisher
# run every time
bash _genonce.sh
cd output
```

PUT the Library resources. We use PUT to ensure that the id is always the same and when changes are made they overwrite the resource with those updates.
```sh
for FILE in FHIRHelpers-4.0.1 FHIRCommon AgeRanges \
HIVSimpleAgeGroup HIVSimpleCondition HIVSimpleDemog HIVSimpleGender HIVSimpleTestResult HIVSimpleViralLoad \
; do curl -X PUT -H "Content-Type: application/fhir+json" --data @Library-${FILE}.json http://localhost:8080/fhir/Library/${FILE} ; done
```

PUT the Measure resources
```sh
for FILE in HIVSimpleAgeGroup HIVSimpleCondition HIVSimpleDemog HIVSimpleGender HIVSimpleTestResult HIVSimpleViralLoad \
; do curl -X PUT -H "Content-Type: application/fhir+json" --data @Measure-${FILE}.json http://localhost:8080/fhir/Measure/${FILE} ; done
```

Run 
```
http://localhost:8080/fhir/Measure/HIVSimpleGender/$evaluate-measure?periodStart=1970-01-01&periodEnd=2021-01-01
```


