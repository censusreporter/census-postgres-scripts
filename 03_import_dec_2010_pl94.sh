#!/bin/bash

if [ -z $PGHOST ]; then
    echo "You must set PGHOST environment variable to the hostname of the PostgreSQL server to operate on."
    exit 1
fi

# Clone the import scripts from git
cd /home/ubuntu
sudo apt-get -y install csvkit
git clone git://github.com/censusreporter/census-postgres.git

DATA_DIR=/home/ubuntu/data/dec2010_pl94

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

for i in `ls ${DATA_DIR}/*zip`; do
    unzip -d ${DATA_DIR} $i
done

# Slurp in the actual data
# We're doing the COPY FROM STDIN so we don't have to be a psql superuser
# Only load blocks (SUMLEV 750)
echo "Importing geoheader"
for i in `ls ${DATA_DIR}/*geo2010.pl`; do
    echo `basename $i`
    cat $i | in2csv -s census2010_geo_schema.csv | csvgrep -c SUMLEV -m 750 | psql -v ON_ERROR_STOP=1 -q -c "COPY dec2010_pl94.geoheader FROM STDIN WITH CSV HEADER ENCODING 'latin1';"
    if [[ $? != 0 ]]; then
        echo "Failed importing geoheader $i."
        exit 1
    fi
done

# old geoheader files didn't include geoids so create a column. 
# Since we only loaded blocks we can use one method to populate geoid value.
psql -v ON_ERROR_STOP=1 -q -c "ALTER TABLE dec2010_pl94.geoheader add column GEOID varchar(15);"
echo "fill GEOID column"
psql -v ON_ERROR_STOP=1 -q -c "UPDATE dec2010_pl94.geoheader set geoid = state || county || tract || block;"
echo "add index on GEOID"
psql -v ON_ERROR_STOP=1 -q -c "CREATE UNIQUE INDEX geoheader_geoid_idx on dec2010_pl94.geoheader (GEOID);"

echo "Importing sequence 0001"
for i in $(ls ${DATA_DIR}/*12010.pl); do
    echo `basename $i`
    cat $i | psql -v ON_ERROR_STOP=1 -q -c "COPY dec2010_pl94.seq0001 FROM STDIN WITH CSV ENCODING 'latin1';"
    if [[ $? != 0 ]]; then
        echo "Failed importing sequence 0001 $i."
        exit 1
    fi
done;

echo "Importing sequence 0002"
for i in $(ls ${DATA_DIR}/*22010.pl); do
    echo `basename $i`
    cat $i | psql -v ON_ERROR_STOP=1 -q -c "COPY dec2010_pl94.seq0002 FROM STDIN WITH CSV ENCODING 'latin1';"
    if [[ $? != 0 ]]; then
        echo "Failed importing sequence 0002 $i."
        exit 1
    fi
done;

echo "Creating views"
psql -v ON_ERROR_STOP=1 -q -f select_into_views.sql
if [[ $? != 0 ]]; then
    echo "Failed creating views."
    # exit 1
fi
