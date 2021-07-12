#!/bin/bash

if [ -z $PGHOST ]; then
    echo "You must set PGHOST environment variable to the hostname of the PostgreSQL server to operate on."
    exit 1
fi

# Clone the import scripts from git
cd /home/ubuntu
sudo apt-get -y install csvkit
git clone git://github.com/censusreporter/census-postgres.git

# Create the schema
cd /home/ubuntu/census-postgres/dec2010_pl94
psql -v ON_ERROR_STOP=1 -q -c "DROP SCHEMA IF EXISTS dec2010_pl94 CASCADE; CREATE SCHEMA dec2010_pl94;"

# Create import tables
echo "Creating geoheader"
psql -v ON_ERROR_STOP=1 -q -f create_geoheader.sql
if [[ $? != 0 ]]; then
    echo "Failed creating geoheader."
    exit 1
fi

echo "Creating geoheader comments"
psql -v ON_ERROR_STOP=1 -q -f geoheader_comments.sql
if [[ $? != 0 ]]; then
    echo "Failed creating geoheader comments."
    exit 1
fi

echo "Creating temp import tables"
psql -v ON_ERROR_STOP=1 -q -f create_import_tables.sql
if [[ $? != 0 ]]; then
    echo "Failed creating temp import tables."
    exit 1
fi

for i in `ls /home/ubuntu/data/dec2010_pl94/*zip`; do
    unzip $i
done

# Slurp in the actual data
# We're doing the COPY FROM STDIN so we don't have to be a psql superuser
echo "Importing geoheader"
for i in `ls /home/ubuntu/data/dec2010_pl94/*geo2010.pl`; do
    cat $i | in2csv -s census2010_geo_schema.csv | psql -v ON_ERROR_STOP=1 -q -c "COPY dec2010_pl94.geoheader FROM STDIN WITH CSV HEADER ENCODING 'latin1';"
    if [[ $? != 0 ]]; then
        echo "Failed importing geoheader $i."
        exit 1
    fi
done

echo "Importing sequence 0001"
for i in $(ls *12010.pl); do
    cat $i | psql -v ON_ERROR_STOP=1 -q -c "COPY dec2010_pl94.tmp_seq0001 FROM STDIN WITH CSV ENCODING 'latin1';"
    if [[ $? != 0 ]]; then
        echo "Failed importing sequences $i."
        exit 1
    fi
done;

echo "Importing sequence 0002"
for i in $(ls *22010.pl); do
    cat $i | psql -v ON_ERROR_STOP=1 -q -c "COPY dec2010_pl94.tmp_seq0002 FROM STDIN WITH CSV ENCODING 'latin1';"
    if [[ $? != 0 ]]; then
        echo "Failed importing sequences $i."
        exit 1
    fi
done;

echo "Creating views"
psql -v ON_ERROR_STOP=1 -q -f select_into_views.sql
if [[ $? != 0 ]]; then
    echo "Failed creating views."
    exit 1
fi
