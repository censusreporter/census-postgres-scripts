#!/bin/bash
cd /mnt/tmp/tiger2013
for i in **/*.zip
do
    unzip -q -n $i -d `dirname $i`
done

sudo -u postgres psql -d census -c "DROP SCHEMA IF EXISTS tiger2013; CREATE SCHEMA tiger2013;"
sudo -u postgres psql -d census -c "ALTER SCHEMA tiger2013 OWNER TO census;"

for i in CBSA CD COUNTY CSA PLACE STATE ELSD SCSD ZCTA5 COUSUB PUMA SLDL SLDU AIANNH AITS ANRC BG CNECTA CONCITY METDIV NECTA NECTADIV SUBMCD TBG TTRACT TABBLOCK TRACT UAC UNSD VTD
do
    # Pick one of the shapefiles to build schema with
    one_shapefile=`ls -a $i/*.shp | head -n 1`

    # Start by preparing the table
    shp2pgsql -W "latin1" -s 4326 -p -I $one_shapefile tiger2013.$i > $i.sql

    # Then append all the geometries
    for j in $i/*.shp
    do
        shp2pgsql -W "latin1" -s 4326 -a $j tiger2013.$i >> $i.sql
    done

    # Then load them in to postgres
    psql -d census -h localhost -U census -q -f $i.sql

    if [ $? -ne 0 ]
    then
        echo "Couldn't import $i.sql."
        exit 1
    fi
done
