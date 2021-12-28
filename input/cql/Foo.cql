library Foo version '0.1.0'

using FHIR version '4.0.1'

context Unfiltered

define "foo": 1 + 1

define "bar": 'abc' + 'defg'

define "wrong": Patient.birthDate

