#!/bin/bash
cd /home/ubuntu/data/tiger2010

# For shp2pgsql
sudo apt-get install -y postgis

if [ -z $PGHOST ]; then
    echo "You must set PGHOST environment variable to the hostname of the PostgreSQL server to operate on."
    exit 1
fi

psql -v ON_ERROR_STOP=1 -q -c "DROP SCHEMA IF EXISTS tiger2010 CASCADE; CREATE SCHEMA tiger2010;"

for i in /home/ubuntu/data/tiger2010/TABBLOCK # not a list but easier to keep it like other tiger importers
do
    tablename=$(basename $i)
    for j in $i/*.zip
    do
        unzip -q -n $j -d $i
    done

    # Pick one of the shapefiles to build schema with
    one_shapefile=`ls -a $i/*.shp | head -n 1`

    # Start by preparing the table
    shp2pgsql -W "latin1" -s 4326 -p -I $one_shapefile tiger2010.$tablename | psql -v ON_ERROR_STOP=1 -q

    if [ $? -ne 0 ]
    then
        echo "Couldn't prep table from ${one_shapefile}"
        exit 1
    fi

    # Then append all the geometries
    for j in $i/*.shp
    do
        shp2pgsql -W "latin1" -s 4326 -a $j tiger2010.$tablename | psql -v ON_ERROR_STOP=1 -q

        if [ $? -ne 0 ]
        then
            echo "Couldn't import ${j}"
            exit 1
        fi
    done

    # Make sure the geometries in that table we just imported are valid
    psql -v ON_ERROR_STOP=1 -q -c "UPDATE tiger2010.${tablename} SET geom=ST_MakeValid(geom) WHERE NOT ST_IsValid(geom);"

    # Delete the unzipped stuff to save room
    find $i -type f ! -name '*.zip' -delete
done

psql -v ON_ERROR_STOP=1 -q -c "CREATE INDEX tabblock_geoid10_idx ON tiger2010.tabblock (geoid10);" 
