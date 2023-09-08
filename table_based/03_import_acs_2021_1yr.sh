#!/bin/bash

SCHEMA_NAME="acs2021_1yr_tables"
DATA_DIR="/home/ubuntu/data/acs2021_1yr"

export PGOPTIONS='--client-min-messages=warning'

if [ -z $PGURI ]; then
    echo "You must set PGURI environment variable to the connection string for the PostgreSQL server to operate on."
    exit 1
fi

# Clone the import scripts from git
echo "Cloning git repo"
rm -rf /home/ubuntu/census-postgres
cd /home/ubuntu
sudo apt-get -y install git
git clone https://github.com/censusreporter/census-postgres.git
if [[ $? != 0 ]]; then
    echo "Failed to clone git repo."
    exit 1
fi

cd /home/ubuntu/census-postgres/${SCHEMA_NAME}

# Create the schema
# Drop the tables - can't just use DROP SCHEMA because of out of shared memory issue
echo "Dropping tables"
psql $PGURI -v ON_ERROR_STOP=1 -q -f drop_schema_tables.sql
if [[ $? != 0 ]]; then
    echo "Failed dropping tables."
    exit 1
fi

echo "Dropping schema"
psql $PGURI -c "DROP SCHEMA IF EXISTS ${SCHEMA_NAME} CASCADE; CREATE SCHEMA ${SCHEMA_NAME};"
if [[ $? != 0 ]]; then
    echo "Failed dropping or creating schema."
    exit 1
fi

# Create import tables
echo "Creating geoheader"
psql $PGURI -v ON_ERROR_STOP=1 -q -f create_geoheader.sql
if [[ $? != 0 ]]; then
    echo "Failed creating geoheader."
    exit 1
fi

echo "Creating core data import tables"
psql $PGURI -v ON_ERROR_STOP=1 -q -f create_tables.sql
if [[ $? != 0 ]]; then
    echo "Failed creating data import tables."
    exit 1
fi

# Slurp in the actual data
echo "Fixing GEO_ID in geoheaders"
python3 fix_geoids.py ${DATA_DIR}/Geos20211YR.txt
if [[ $? != 0 ]]; then
    echo "Failed fixing geoids."
    exit 1
fi

echo "Importing geoheader"
cat ${DATA_DIR}/Geos20211YR.csv | psql $PGURI -v ON_ERROR_STOP=1 -q -c "COPY ${SCHEMA_NAME}.geoheader FROM STDIN WITH ENCODING 'UTF8' CSV HEADER;"
if [[ $? != 0 ]]; then
    echo "Failed importing geoheader."
    exit 1
fi

echo "Fixing GEO_ID in datafiles"
python3 fix_geoids.py ${DATA_DIR}
if [[ $? != 0 ]]; then
    echo "Failed fixing geoids."
    exit 1
fi

echo "Inserting into tables"
for i in `ls ${DATA_DIR}/acs*.csv`; # don't catch the geoheader file now that it also has a .csv suffix
    do
        table=`echo $(basename $i .csv) | cut -d "-" -f 2`
        if ! [[ "$table" =~ ^[b][9][89] ]]; then
            table="${table}_moe"
            cat $i | psql $PGURI -v ON_ERROR_STOP=1 -q -c "COPY ${SCHEMA_NAME}.${table} FROM STDIN WITH ENCODING 'UTF8' CSV HEADER;"
            if [[ $? != 0 ]]; then
                echo "Failed inserting into tables at $table."
                exit 1
            fi
        fi
    done

echo "Creating views"
psql $PGURI -v ON_ERROR_STOP=1 -q -f create_views.sql
if [[ $? != 0 ]]; then
    echo "Failed creating views."
    exit 1
fi


for i in `ls ${DATA_DIR}/acs*.csv`; # don't catch the geoheader file now that it also has a .csv suffix
    do
        table=`echo $(basename $i .csv) | cut -d "-" -f 2`
        if ! [[ "$table" =~ ^[b][9][89] ]]; then
            echo $table
        fi
    done
