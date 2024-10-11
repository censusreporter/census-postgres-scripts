"""This script retrieves an official Excel spreadsheet indicating the delineation of CBSAs and CSAs by county.
It works through that spreadsheet and produces a SQL script which establishes the Census Reporter
parent/child relationships between
    parent 330 CSA / child 310 CBSA
    parent 310 CBSA / child 050 County
    parent 330 CSA / child 050 County

It depends upon the spreadsheet having at least these specific columns:

    # 0 CBSA Code
    # 2 CSA Code
    # 9 FIPS State Code
    # 10 FIPS County Code

and assumes that the first two rows are blank, followed by a header row, followed
by only data rows.

This doesn't make any database changes, but creates a SQL file which can be integrated in the
data pipeline.
"""

import requests
import pandas as pd


DELINEATION_URL = 'https://www2.census.gov/programs-surveys/metro-micro/geographies/reference-files/2023/delineation-files/list1_2023.xlsx'
SCHEMA_YEAR="2023"
SQL_FILE = f"15_cbsa_geocontainment_{SCHEMA_YEAR}.sql"
FQ_TABLE_NAME = f'tiger{SCHEMA_YEAR}.census_geo_containment'

resp = requests.get(DELINEATION_URL)
with open('delineation.xls', 'wb') as f:
    f.write(resp.content)

names = [
    'cbsa_code',
    'metdiv_code',
    'csa_code',
    'cbsa_name',
    'cbsa_type',
    'metdiv_name',
    'csa_name',
    'county_name',
    'state_name',
    'state_fips',
    'county_fips',
    'county_type'
]
dtypes = dict(zip(names,['object'] * len(names)))
df = pd.read_excel('delineation.xls', engine='openpyxl', skiprows=2, names=names, dtype=dtypes)

# might like to do
#   parent 040 state
#   child 310 CBSA
#
# but can't know percent_covered with this data
# could maybe compute if we were feeling fancy

# until then, don't do this:
# DELETE from {FQ_TABLE_NAME}
# WHERE parent_geoid like '04000US%'
# AND child_geoid like '31000US%'
#
# but when you can, just add it at the beginning of the
# delete statements immediately below
#

# 0 CBSA Code
# 1 Metropolitan Division Code
# 2 CSA Code
# 3 CBSA Title
# 4 Metropolitan/Micropolitan Statistical Area
# 5 Metropolitan Division Title
# 6 CSA Title
# 7 County/County Equivalent
# 8 State Name
# 9 FIPS State Code
# 10 FIPS County Code
# 11 Central/Outlying County

to_insert = []
for index, row in df.iterrows():
    cbsa = f'31000US{row["cbsa_code"]}'

    if not pd.isna(row['csa_code']):
        csa = f'33000US{row["csa_code"]}'
    else:
        csa = ''

    state_fips = row['state_fips']
    county_fips = row['county_fips']
    if state_fips and county_fips:
        county = f'05000US{state_fips}{county_fips}'
    else:
        county = ''

    if csa:
        # if not cbsa == '12740' and not csa == '162':  # specific error case found in Census delineation file
            to_insert.append((csa, cbsa, 100))
            to_insert.append((csa, county, 100))

    if county:
        to_insert.append((cbsa, county, 100))

to_insert = set(to_insert)

with open(SQL_FILE, 'w') as f:
    f.write(f"""BEGIN;

DELETE from {FQ_TABLE_NAME}
    WHERE parent_geoid like '31000US%'
    AND child_geoid like '05000US%';

DELETE from {FQ_TABLE_NAME}
    WHERE parent_geoid like '33000US%'
    AND child_geoid like '05000US%';

DELETE from {FQ_TABLE_NAME}
    WHERE parent_geoid like '33000US%'
    AND child_geoid like '31000US%';

INSERT INTO {FQ_TABLE_NAME}
    (parent_geoid, child_geoid, percent_covered)
VALUES
""")

    f.write(',\n'.join(["    ('{}', '{}', {})".format(*i) for i in to_insert]))
    f.write(';\n\n')
    f.write('COMMIT;\n')
