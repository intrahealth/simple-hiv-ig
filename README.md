# Simple HIV (for testing only)


## Getting started with cqf-ruler

Install FSH:
```
npm install -g fsh-sushi
```

Prep repo:
```sh
git@github.com:intrahealth/simple-hiv-ig.git
cd simple-hiv-ig
bash _updateCQFTooling.sh
bash _updatePublisher.sh
```

To process the FSH files, CQL tooling, and publisher:
```
bash _runcqf.sh
```

To load test cases and Measures and Libraries to the testing server:
```
bash _runload.sh
```
