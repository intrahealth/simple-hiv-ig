// opencr example for a golden record
Instance:     Patient-GoldenRecord
InstanceOf:   Patient
Title: "Patient-GoldenRecord"
Description: "Patient-GoldenRecord"
// this is not in a golden record in opencr but publisher errors without
* name[+].given = "Mittens"
* name[=].family = "Cat"
* name[=].text = "Mittens Cat"
// only used for internal opencr tracking purposes
* meta.tag[+] = $OpenCR#1234 "Golden Record"
// patient resource record linkages
* link[+].other = Reference($Patient-HIVSimple)
* link[=].type = #seealso
* link[+].other = Reference($Patient-HIVSimple2)
* link[=].type = #seealso