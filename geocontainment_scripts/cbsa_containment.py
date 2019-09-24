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
import xlrd

DELINEATION_URL =    'https://www2.census.gov/programs-surveys/metro-micro/geographies/reference-files/2018/delineation-files/list1_Sep_2018.xls'
SCHEMA_YEAR="2018"
SQL_FILE = f"15_cbsa_geocontainment_{SCHEMA_YEAR}.sql"
FQ_TABLE_NAME = f'tiger{SCHEMA_YEAR}.census_geo_containment'

resp = requests.get(DELINEATION_URL)
with open('delineation.xls', 'wb') as f:
    f.write(resp.content)

wb = xlrd.open_workbook('delineation.xls')
sheet = wb.sheet_by_index(0)

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


with open(SQL_FILE, 'w') as f:
    f.write(f"""

DELETE from {FQ_TABLE_NAME} 
    WHERE parent_geoid like '31000US%'
    AND child_geoid like '05000US%';

DELETE from {FQ_TABLE_NAME} 
    WHERE parent_geoid like '33000US%'
    AND child_geoid like '05000US%';
""")

    rows = sheet.get_rows()
    junk = next(rows)  # first two rows are blank
    junk = next(rows)  # first two rows are blank
    headers = next(rows)
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

    for row in rows:
        cbsa = f'31000US{row[0].value}'
        if row[2].value:
            csa = f'33000US{row[2].value}'
        else: csa = ''
        state = f'04000US{row[9].value}'
        county = f'05000US{row[9].value}{row[10].value}'

        if csa:
            f.write(f"""

INSERT INTO {FQ_TABLE_NAME} 
        (parent_geoid, child_geoid, percent_covered)
    values
        ('{csa}','{cbsa}',100);

INSERT INTO {FQ_TABLE_NAME} 
        (parent_geoid, child_geoid, percent_covered)
    values
        ('{csa}','{county}',100);

""")


        f.write(f"""

INSERT INTO {FQ_TABLE_NAME} 
        (parent_geoid, child_geoid, percent_covered)
    values
        ('{cbsa}','{county}',100);

""")
