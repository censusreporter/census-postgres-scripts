#!/bin/bash

# Clone the import scripts from git
cd /home/ubuntu
sudo apt-get -y install git
git clone git://github.com/censusreporter/census-postgres.git

# Create the schema
cd /home/ubuntu/census-postgres/acs2007_3yr
sudo -u postgres psql -c "DROP SCHEMA IF EXISTS acs2007_3yr CASCADE; CREATE SCHEMA acs2007_3yr;"

# Create import tables
echo "Creating geoheader"
sudo -u postgres psql -v ON_ERROR_STOP=1 -q -f create_geoheader.sql
if [[ $? != 0 ]]; then
    echo "Failed creating geoheader."
    exit 1
fi

echo "Creating geoheader comments"
sudo -u postgres psql -v ON_ERROR_STOP=1 -q -f geoheader_comments.sql
if [[ $? != 0 ]]; then
    echo "Failed creating geoheader comments."
    exit 1
fi

echo "Creating temp geoheader"
sudo -u postgres psql -v ON_ERROR_STOP=1 -q -f create_tmp_geoheader.sql
if [[ $? != 0 ]]; then
    echo "Failed creating temp geoheader."
    exit 1
fi

echo "Creating temp import tables"
sudo -u postgres psql -v ON_ERROR_STOP=1 -q -f create_import_tables.sql
if [[ $? != 0 ]]; then
    echo "Failed creating temp import tables."
    exit 1
fi

# Slurp in the actual data
echo "Importing geoheader"
sudo -u postgres psql -v ON_ERROR_STOP=1 -q -f import_geoheader.sql
if [[ $? != 0 ]]; then
    echo "Failed importing geoheader."
    exit 1
fi

echo "Parsing geoheader"
sudo -u postgres psql -v ON_ERROR_STOP=1 -q -f parse_tmp_geoheader.sql
if [[ $? != 0 ]]; then
    echo "Failed parsing geoheader."
    exit 1
fi

echo "Importing sequences"
sudo -u postgres psql -v ON_ERROR_STOP=1 -q -f import_sequences.sql # This takes ~5 minutes
if [[ $? != 0 ]]; then
    echo "Failed importing sequences."
    exit 1
fi

echo "Storing tables"
sudo -u postgres psql -v ON_ERROR_STOP=1 -q -f store_by_tables.sql
if [[ $? != 0 ]]; then
    echo "Failed storing tables."
    exit 1
fi

echo "Inserting into tables"
sudo -u postgres psql -v ON_ERROR_STOP=1 -q -f insert_into_tables.sql # This takes ~5 minutes
if [[ $? != 0 ]]; then
    echo "Failed inserting into tables."
    exit 1
fi

echo "Creating views"
sudo -u postgres psql -v ON_ERROR_STOP=1 -q -f view_stored_by_tables.sql
if [[ $? != 0 ]]; then
    echo "Failed creating views."
    exit 1
fi

# Drop temp tables
echo "Dropping import tables"
sudo -u postgres psql -v ON_ERROR_STOP=1 -q -f drop_import_tables.sql
if [[ $? != 0 ]]; then
    echo "Failed dropping import tables."
    exit 1
fi
