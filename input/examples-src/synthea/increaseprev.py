#!/usr/bin/env python3

import pandas as pd

# diagnosis

# edit hiv_diagnosis_early
# Diagnosed_Early_Years + Wait_Until_Next_Diagnosis_Check must equal 1
df = pd.read_csv("src/main/resources/modules/lookup_tables/hiv_diagnosis_early.csv")
df['Diagnosed_Early_Years'] = 0.02
df['Wait_Until_Next_Diagnosis_Check'] = 0.98
df.to_csv("src/main/resources/modules/lookup_tables/hiv_diagnosis_early.csv", index=False)
print(df)
del df

# edit: hiv_diagnosis_later
# Diagnosed_Later_Years + Wait_Until_Next_Diagnosis_Check must equal 1
df = pd.read_csv("src/main/resources/modules/lookup_tables/hiv_diagnosis_later.csv")
df['Diagnosed_Later_Years'] = 0.02
df['Wait_Until_Next_Diagnosis_Check'] = 0.98
df.to_csv("src/main/resources/modules/lookup_tables/hiv_diagnosis_later.csv", index=False)
print(df)
del df

# mortality: mind the column names as they are different between files

# hiv_mortality_very_early.csv
# Death_within_six_months + Living_with_Diagnosis_Six_Months
df = pd.read_csv("src/main/resources/modules/lookup_tables/hiv_mortality_very_early.csv")
df['Death_within_six_months'] = 0.01
df['Living_with_Diagnosis_Six_Months'] = 0.99
df.to_csv("src/main/resources/modules/lookup_tables/hiv_mortality_very_early.csv", index=False)
print(df)
del df


# hiv_mortality_early.csv
df = pd.read_csv("src/main/resources/modules/lookup_tables/hiv_mortality_early.csv")
df['Death'] = 0.01
df['Living_with_Diagnosis_Early_Years'] = 0.99
df.to_csv("src/main/resources/modules/lookup_tables/hiv_mortality_early.csv", index=False)
print(df)
del df


# hiv_mortality_later.csv
df = pd.read_csv("src/main/resources/modules/lookup_tables/hiv_mortality_later.csv")
df['Death'] = 0.01
df['Living_with_Diagnosis_Later_Years'] = 0.99
df.to_csv("src/main/resources/modules/lookup_tables/hiv_mortality_later.csv", index=False)
print(df)
del df
