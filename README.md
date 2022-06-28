# Simple HIV (for testing only)


## Getting started with cqf-ruler

Approach:
* Use an XML IG and not the Sushi, including includes/menu.xml not Sushi
* Comment out input/cql binary stuff in XML
* FSHOnly - true in sushi
* mv libraries or publisher errors with duplicate resources

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

Run the scripts. To run a very basic test to ensure your setup is working, use:
```
bash _runsimple.sh
```

To run a full suite:
```
bash _runcqf.sh
bash _runload.sh
```
