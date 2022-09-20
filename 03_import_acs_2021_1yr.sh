#!/bin/bash

if [ -z $PGHOST ]; then
    echo "You must set PGHOST environment variable to the hostname of the PostgreSQL server to operate on."
    exit 1
fi

# Clone the import scripts from git
cd /home/ubuntu
sudo apt-get -y install git
git clone git://github.com/censusreporter/census-postgres.git

# Create the schema
cd /home/ubuntu/census-postgres/acs2021_1yr
psql -d census -h $PGHOST -U census -c "DROP SCHEMA IF EXISTS acs2021_1yr CASCADE; CREATE SCHEMA acs2021_1yr;"

# Create import tables
echo "Creating geoheader"
psql -d census -h $PGHOST -U census -v ON_ERROR_STOP=1 -q -f create_geoheader.sql
if [[ $? != 0 ]]; then
    echo "Failed creating geoheader."
    exit 1
fi

echo "Creating geoheader comments"
psql -d census -h $PGHOST -U census -v ON_ERROR_STOP=1 -q -f geoheader_comments.sql
if [[ $? != 0 ]]; then
    echo "Failed creating geoheader comments."
    exit 1
fi

echo "Creating temp geoheader"
psql -d census -h $PGHOST -U census -v ON_ERROR_STOP=1 -q -f create_tmp_geoheader.sql
if [[ $? != 0 ]]; then
    echo "Failed creating temp geoheader."
    exit 1
fi

echo "Creating temp import tables"
psql -d census -h $PGHOST -U census -v ON_ERROR_STOP=1 -q -f create_import_tables.sql
if [[ $? != 0 ]]; then
    echo "Failed creating temp import tables."
    exit 1
fi

# Slurp in the actual data
echo "Importing geoheader"
cat /mnt/tmp/acs2021_1yr/g20211*txt | psql -d census -h $PGHOST -U census -v ON_ERROR_STOP=1 -q -c "COPY acs2021_1yr.tmp_geoheader FROM STDIN WITH ENCODING 'latin1';"
if [[ $? != 0 ]]; then
    echo "Failed importing geoheader."
    exit 1
fi

echo "Parsing geoheader"
psql -d census -h $PGHOST -U census -v ON_ERROR_STOP=1 -q -f parse_tmp_geoheader.sql
if [[ $? != 0 ]]; then
    echo "Failed parsing geoheader."
    exit 1
fi

echo "Importing sequences"
for s in $(seq -f "%04g" 1 189)
do
    echo "Importing sequence $s"
    cat /mnt/tmp/acs2021_1yr/e20211[a-z][a-z]${s}*txt | psql -d census -h $PGHOST -U census -v ON_ERROR_STOP=1 -q -c "COPY acs2021_1yr.tmp_seq${s} FROM STDIN WITH CSV ENCODING 'latin1';"
    if [[ $? != 0 ]]; then
        echo "Failed importing sequences."
        exit 1
    fi
    cat /mnt/tmp/acs2021_1yr/m20211[a-z][a-z]${s}*txt | psql -d census -h $PGHOST -U census -v ON_ERROR_STOP=1 -q -c "COPY acs2021_1yr.tmp_seq${s}_moe FROM STDIN WITH CSV ENCODING 'latin1';"
    if [[ $? != 0 ]]; then
        echo "Failed importing sequences."
        exit 1
    fi
done

echo "Storing tables"
psql -d census -h $PGHOST -U census -v ON_ERROR_STOP=1 -q -f store_by_tables.sql
if [[ $? != 0 ]]; then
    echo "Failed storing tables."
    exit 1
fi

echo "Inserting into tables"
psql -d census -h $PGHOST -U census -v ON_ERROR_STOP=1 -q -f insert_into_tables.sql # This takes ~5 minutes
if [[ $? != 0 ]]; then
    echo "Failed inserting into tables."
    exit 1
fi

echo "Creating views"
psql -d census -h $PGHOST -U census -v ON_ERROR_STOP=1 -q -f view_stored_by_tables.sql
if [[ $? != 0 ]]; then
    echo "Failed creating views."
    exit 1
fi

# Drop temp tables
echo "Dropping import tables"
psql -d census -h $PGHOST -U census -v ON_ERROR_STOP=1 -q -f drop_import_tables.sql
if [[ $? != 0 ]]; then
    echo "Failed dropping import tables."
    exit 1
fi
