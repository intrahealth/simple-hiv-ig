# Simple HIV (for testing only)


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

