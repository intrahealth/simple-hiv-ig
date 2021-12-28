Instance: Example-Parameters
InstanceOf: Parameters
Usage: #example
//
* parameter[+].name = "patient"
* parameter[=].resource.resourceType = "Patient"
* parameter[=].resource.id = "example1"
* parameter[=].resource.name.use = #official
* parameter[=].resource.name.family = "Chalmers"
* parameter[=].resource.name.given[0] = "Peter"
* parameter[=].resource.name.given[+] = "James"
//
* parameter[+].name = "patient"
* parameter[=].resource.resourceType = "Patient"
* parameter[=].resource.id = "example2"
* parameter[=].resource.name.use = #official
* parameter[=].resource.name.family = "Chalmers"
* parameter[=].resource.name.given[0] = "Peter"
* parameter[=].resource.name.given[+] = "James"