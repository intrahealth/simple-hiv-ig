#! /usr/bin/env python3
import os
import pathlib

import pandas as pd
from fhir.resources.measurereport import MeasureReport
from fhir.resources.identifier import Identifier

filename = pathlib.Path("AgeGroupGenderLocation.json")
data = MeasureReport.parse_file(filename)

stuff = {"mechanism":[],"start":[], "end":[], "agegroup": [], "gender": [], "location": [], "code": [], "count": []}

def Mechanism():
    data.identifier = list()
    identifier = Identifier.construct()
    identifier.system = "https://datim.org/factsinfo/mechanism"
    identifier.value = "12345"
    data.identifier.append(identifier)
    print(data.identifier[0].system)
    print(data.identifier[0].value)
    mechanism = data.identifier[0].value
    stuff["mechanism"].append(data.identifier[0].value)


# if None when empty or mechanism system doesn't exist then need to construct it
if data.identifier == None:
    Mechanism()
else:
    for i in data.identifier:
        if i.system == "https://datim.org/factsinfo/mechanism":
            mechanism = i.value
        else:
            Mechanism()

start = data.period.start
end = data.period.end
stuff["start"].append(start)
stuff["end"].append(end)

for i in data.group:

    for y in i.stratifier:

        for z in y.stratum:
            word = z.value.text
            word = word.split(':')
            agegroup = word[0]
            gender = word[1]
            location = word[2]

            for r in z.population:                
                stuff["count"].append(r.count)
                stuff["agegroup"].append(agegroup)
                stuff["gender"].append(gender)
                stuff["location"].append(location)

                for c in r.code.coding:
                    stuff["code"].append(c.code)

# df = pd.DataFrame.from_dict(stuff)
df = pd.DataFrame(dict([ (k,pd.Series(v)) for k,v in stuff.items() ]))
df["mechanism"].ffill(inplace=True)
df["start"].ffill(inplace=True)
df["end"].ffill(inplace=True)
print(df)
df.to_csv(index=False, path_or_buf="test.csv")