#!/bin/bash

if [ -z $PGHOST ]; then
    echo "You must set PGHOST environment variable to the hostname of the PostgreSQL server to operate on."
    exit 1
fi

# Clone the import scripts from git
cd /home/ubuntu
sudo apt-get -y install csvkit
git clone git://github.com/censusreporter/census-postgres.git

DATA_DIR=/home/ubuntu/data/dec2020_pl94

# Create the schema
cd /home/ubuntu/census-postgres/dec2020_pl94
psql -v ON_ERROR_STOP=1 -q -c "DROP SCHEMA IF EXISTS dec2020_pl94 CASCADE; CREATE SCHEMA dec2020_pl94;"

# Create import tables
echo "Creating import tables"
psql -v ON_ERROR_STOP=1 -q -f 01_create_import_tables.sql
if [[ $? != 0 ]]; then
    echo "Failed creating import tables."
    exit 1
fi

for i in `ls ${DATA_DIR}/*zip`; do
    unzip -d ${DATA_DIR} $i
done

# Slurp in the actual data
# We're doing the COPY FROM STDIN so we don't have to be a psql superuser
# Only load blocks (SUMLEV 750)
echo "Importing geoheader"
for i in `ls ${DATA_DIR}/*geo2020.pl`; do
    echo `basename $i`
    # expecting pipe delimited, no header row - but after csvgrep, delim is comma and header has been added
    cat $i | csvgrep -H -d \| -c 3 -m 750 | psql -v ON_ERROR_STOP=1 -q -c "COPY dec2020_pl94.geoheader FROM STDIN WITH CSV HEADER ENCODING 'latin1';"
    if [[ $? != 0 ]]; then
        echo "Failed importing geoheader $i."
        exit 1
    fi
done

# 2020 geoheader files include geoids so don't create a column. 

echo "Importing sequence 0001"
for i in $(ls ${DATA_DIR}/*12020.pl); do
    echo `basename $i`
    cat $i | psql -v ON_ERROR_STOP=1 -q -c "COPY dec2020_pl94.seq0001 FROM STDIN WITH CSV DELIMITER '|' ENCODING 'latin1';"
    if [[ $? != 0 ]]; then
        echo "Failed importing sequence 0001 $i."
        exit 1
    fi
done;

echo "Importing sequence 0002"
for i in $(ls ${DATA_DIR}/*22020.pl); do
    echo `basename $i`
    cat $i | psql -v ON_ERROR_STOP=1 -q -c "COPY dec2020_pl94.seq0002 FROM STDIN WITH CSV DELIMITER '|' ENCODING 'latin1';"
    if [[ $? != 0 ]]; then
        echo "Failed importing sequence 0002 $i."
        exit 1
    fi
done;

echo "Importing sequence 0003"
for i in $(ls ${DATA_DIR}/*32020.pl); do
    echo `basename $i`
    cat $i | psql -v ON_ERROR_STOP=1 -q -c "COPY dec2020_pl94.seq0003 FROM STDIN WITH CSV DELIMITER '|' ENCODING 'latin1';"
    if [[ $? != 0 ]]; then
        echo "Failed importing sequence 0003 $i."
        exit 1
    fi
done;

echo "Creating real tables from import tables"
psql -v ON_ERROR_STOP=1 -q -f 02_select_seq_into_tables.sql
if [[ $? != 0 ]]; then
    echo "Failed creating real tables from import tables."
    # exit 1
fi
