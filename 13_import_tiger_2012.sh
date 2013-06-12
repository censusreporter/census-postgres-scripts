#!/bin/bash
cd /mnt/ftp2.census.gov/geo/tiger/TIGER2012/
for i in **/*.zip
do
    unzip $i -d `dirname $i`
    rm -f $i
done

sudo -u postgres psql -c "DROP SCHEMA IF EXISTS tiger2012; CREATE SCHEMA tiger2012;"

for i in AIANNH AITS ANRC BG CBSA CD COUNTY COUSUB CSA ELSD PLACE PUMA SCSD SLDL SLDU STATE ZCTA5
do
    # Pick one of the shapefiles to build schema with
    one_shapefile=`ls -a $i/*.shp | head -n 1`

    # Start by preparing the table
    shp2pgsql -W "latin1" -s 4326 -p $one_shapefile tiger2012.$i > $i.sql

    # Then append all the geometries
    shp2pgsql -W "latin1" -s 4326 -a -I $i/*.shp tiger2012.$i >> $i.sql

    # Then load them in to postgres
    sudo -u postgres psql -q -f $i.sql

    if [ $? -ne 0 ]
    then
        echo "Couldn't import $i.sql."
        exit 1
    fi

    rm $i.sql
done
