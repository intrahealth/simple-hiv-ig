#!/usr/bin/env python
# coding: utf-8

# In[1]:


#!/usr/bin/env python
# coding: utf-8

# pip install pandas openpyxl jinja2 faker
import pandas as pd
import pathlib
from jinja2 import Template
from faker import Faker
import sys
from datetime import datetime
from dateutil.relativedelta import relativedelta
import random


# In[2]:


df_names = pd.read_csv('out.csv')
# print(df_names[:4])
names = df_names['en'].sample(n=1, random_state=1)
# print(names.values)
# print(names.values[0])


# In[3]:


# vars: {{suffix}}, {{given}}, {{family}}, {{name}}, {{hivonsetdate}}, {{birthDate}}, {{hivtestdate}}
# for now, suffix = name and suffix
fake = Faker()
def genfsh(file, lang, obs):
    for i in range(obs):
        tempname = df_names[lang].sample(n=1)
        tempname = tempname.values[0]
        suffix = 'bulk-' + lang + str(i)
        given = tempname
        family = str(i)
        name = tempname + str(i)
        # for a small bulk sample, the range needs to be slim
        x = fake.date_between(start_date='-60y', end_date='-30y')
        birthDate = str(x)
        # todo: make a bit more random, stop making future dates
        # hivonsetdate = x + relativedelta(months=240) # '1995-01-01'
        hivonsetdate = '1995-01-01'
        hivtestdate = '2005-01-01'
        # hivtestdate = hivonsetdate + relativedelta(months=12) # '2005-01-01'
        pregstart = x + relativedelta(months=240)
        pregstop = pregstart + relativedelta(months=9)
        # vltestdate = pregstart
        vltestdate = '2021-01-01'
        viralload = random.randint(50,2000)
        location = random.randint(100,104)
        identifier = lang + str(9999) + str(i)
        print(file, lang, suffix, name, birthDate, hivonsetdate, hivtestdate, identifier, location)

        # put through jinja2
        path = pathlib.Path(file)
        text = path.read_text()
        t = Template(text)
        msg = t.render(
            suffix=suffix,
            given=given,
            family=family,
            name=name,
            birthDate=birthDate,
            hivonsetdate=hivonsetdate,
            hivtestdate=hivtestdate,
            pregstart=pregstart,
            pregstop=pregstop,
            viralload=viralload,
            vltestdate=vltestdate,
            location=location
        )
        path_out = pathlib.Path(f"output/{suffix}.fsh")
        path_out.write_text(msg)

print("command:", str(sys.argv))
templates = ['female.template.fsh', 'male.template.fsh']
if sys.argv[1] in templates:
    genfsh(str(sys.argv[1]), str(sys.argv[2]), int(sys.argv[3]))
else:
    genfsh('male.template.fsh', 'ar', 10)


# In[1]:


# run this cell to refresh the bulk-process script
get_ipython().system('jupyter nbconvert --to script bulk-process.ipynb')


# In[ ]:




