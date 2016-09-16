#!/bin/bash
cd /mnt/tmp/tiger2015

# For shp2pgsql
sudo apt-get install -y postgis

if [ -z $PGHOST ]; then
    echo "You must set PGHOST environment variable to the hostname of the PostgreSQL server to operate on."
    exit 1
fi

psql -d census -U census -v ON_ERROR_STOP=1 -q -c "DROP SCHEMA IF EXISTS tiger2015 CASCADE; CREATE SCHEMA tiger2015;"
psql -d census -U census -v ON_ERROR_STOP=1 -q -c "ALTER SCHEMA tiger2015 OWNER TO census;"

for i in CBSA CD COUNTY CSA PLACE STATE ELSD SCSD ZCTA5 COUSUB PUMA SLDL SLDU AIANNH AITS ANRC BG CNECTA CONCITY METDIV NECTA NECTADIV SUBMCD TBG TTRACT TABBLOCK TRACT UAC UNSD
do
    for j in **/*.zip
    do
        unzip -q -n $j -d `dirname $i`
    done

    # Pick one of the shapefiles to build schema with
    one_shapefile=`ls -a $i/*.shp | head -n 1`

    # Start by preparing the table
    shp2pgsql -W "latin1" -s 4326 -p -I $one_shapefile tiger2015.$i > $i.sql

    # Then append all the geometries
    for j in $i/*.shp
    do
        shp2pgsql -W "latin1" -s 4326 -a $j tiger2015.$i >> $i.sql
    done

    # Then load them in to postgres
    psql -d census -U census -v ON_ERROR_STOP=1 -q -f $i.sql

    if [ $? -ne 0 ]
    then
        echo "Couldn't import $i.sql."
        exit 1
    fi

    rm -f $i.sql
done
