// opencr example for a golden record

Instance:     Patient-GoldenRecord
InstanceOf:   Patient
Title: "Patient-GoldenRecord"
Description: "Patient-GoldenRecord"
// only used for internal opencr tracking purposes
* meta.tag[+] = $OpenCR#1234 "Golden Record"
// patient resource record linkages
* link[+].other.reference = "Patient/Patient-HIVSimple"
* link[=].type = #seealso
// 
* link[+].other.reference = "Patient/Patient-HIVSimple2"
* link[=].type = #seealso