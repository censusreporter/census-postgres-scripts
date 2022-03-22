#!/bin/bash
cd /mnt/tmp/tiger2020

# For shp2pgsql
sudo apt-get install -y postgis

if [ -z $PGHOST ]; then
    echo "You must set PGHOST environment variable to the hostname of the PostgreSQL server to operate on."
    exit 1
fi

psql -d census -U census -v ON_ERROR_STOP=1 -q -c "DROP SCHEMA IF EXISTS tiger2020 CASCADE; CREATE SCHEMA tiger2020;"
psql -d census -U census -v ON_ERROR_STOP=1 -q -c "ALTER SCHEMA tiger2020 OWNER TO census;"

for i in /mnt/tmp/tiger2020/{AIANNH,AITSN,ANRC,BG,CBSA,CD,CNECTA,CONCITY,COUNTY,COUSUB,CSA,ELSD,METDIV,NECTA,NECTADIV,PLACE,PUMA,SCSD,SLDL,SLDU,STATE,SUBMCD,TBG,TRACT,TTRACT,UAC,UNSD,ZCTA5}
do
    tablename=$(basename $i)
    for j in $i/*.zip
    do
        unzip -q -n $j -d $i
    done

    # Pick one of the shapefiles to build schema with
    one_shapefile=`ls -a $i/*.shp | head -n 1`

    # Start by preparing the table
    shp2pgsql -W "latin1" -s 4326 -p -I $one_shapefile tiger2020.$tablename | psql -d census -U census -v ON_ERROR_STOP=1 -q

    if [ $? -ne 0 ]
    then
        echo "Couldn't prep table from ${one_shapefile}"
        exit 1
    fi

    # Then append all the geometries
    for j in $i/*.shp
    do
        shp2pgsql -W "latin1" -s 4326 -a $j tiger2020.$tablename | psql -d census -U census -v ON_ERROR_STOP=1 -q

        if [ $? -ne 0 ]
        then
            echo "Couldn't import ${j}"
            exit 1
        fi
    done

    # Make sure the geometries in that table we just imported are valid
    psql -d census -U census -v ON_ERROR_STOP=1 -q -c "UPDATE tiger2020.${tablename} SET geom=ST_MakeValid(geom) WHERE NOT ST_IsValid(geom);"

    # Delete the unzipped stuff to save room
    find $i -type f ! -name '*.zip' -delete
done
