#!/bin/bash
cd /mnt/ftp2.census.gov/geo/tiger/TIGER2012/
for i in **/*.zip
do
    unzip -n $i -d `dirname $i`
done

sudo -u postgres psql -c "DROP SCHEMA IF EXISTS tiger2012; CREATE SCHEMA tiger2012;"
sudo -u postgres psql -c "ALTER SCHEMA tiger2012 OWNER TO census;"

for i in CBSA CD COUNTY CSA PLACE STATE ELSD SCSD ZCTA5 COUSUB PUMA SLDL SLDU AIANNH AITS ANRC BG CNECTA CONCITY METDIV NECTA NECTADIV SUBMCD TBG TTRACT TABBLOCK TRACT UAC UNSD VTD
do
    # Pick one of the shapefiles to build schema with
    one_shapefile=`ls -a $i/*.shp | head -n 1`

    # Start by preparing the table
    shp2pgsql -W "latin1" -s 4326 -p -I $one_shapefile tiger2012.$i > $i.sql

    # Then append all the geometries
    for j in $i/*.shp
    do
        shp2pgsql -W "latin1" -s 4326 -a $j tiger2012.$i >> $i.sql
    done

    # Then load them in to postgres
    sudo -u postgres psql -q -f $i.sql

    if [ $? -ne 0 ]
    then
        echo "Couldn't import $i.sql."
        exit 1
    fi
done

# Add in the name indexes for autocomplete
sudo -u postgres psql -c "CREATE INDEX cbsa_idx_namelsad_lower ON tiger2012.cbsa ((lower(namelsad)) text_pattern_ops);"
sudo -u postgres psql -c "CREATE INDEX cd_idx_namelsad_lower ON tiger2012.cd ((lower(namelsad)) text_pattern_ops);"
sudo -u postgres psql -c "CREATE INDEX county_idx_namelsad_lower ON tiger2012.county ((lower(namelsad)) text_pattern_ops);"
sudo -u postgres psql -c "CREATE INDEX csa_idx_namelsad_lower ON tiger2012.csa ((lower(namelsad)) text_pattern_ops);"
sudo -u postgres psql -c "CREATE INDEX place_idx_namelsad_lower ON tiger2012.place ((lower(namelsad)) text_pattern_ops);"
sudo -u postgres psql -c "CREATE INDEX state_idx_name_lower ON tiger2012.state ((lower(name)) text_pattern_ops);"
sudo -u postgres psql -c "CREATE INDEX elsd_idx_name_lower ON tiger2012.elsd ((lower(name)) text_pattern_ops);"
sudo -u postgres psql -c "CREATE INDEX scsd_idx_name_lower ON tiger2012.scsd ((lower(name)) text_pattern_ops);"
sudo -u postgres psql -c "CREATE INDEX zcta5_idx_zcta5ce10_lower ON tiger2012.zcta5 ((lower(zcta5ce10)) text_pattern_ops);"
sudo -u postgres psql -c "CREATE INDEX cousub_idx_namelsad_lower ON tiger2012.cousub ((lower(namelsad)) text_pattern_ops);"
sudo -u postgres psql -c "CREATE INDEX puma_idx_namelsad10_lower ON tiger2012.puma ((lower(namelsad10)) text_pattern_ops);"
sudo -u postgres psql -c "CREATE INDEX sldl_idx_namelsad_lower ON tiger2012.sldl ((lower(namelsad)) text_pattern_ops);"
sudo -u postgres psql -c "CREATE INDEX sldu_idx_namelsad_lower ON tiger2012.sldu ((lower(namelsad)) text_pattern_ops);"
sudo -u postgres psql -c "CREATE INDEX aiannh_idx_namelsad_lower ON tiger2012.aiannh ((lower(namelsad)) text_pattern_ops);"
sudo -u postgres psql -c "CREATE INDEX aits_idx_namelsad_lower ON tiger2012.aits ((lower(namelsad)) text_pattern_ops);"
sudo -u postgres psql -c "CREATE INDEX anrc_idx_namelsad_lower ON tiger2012.anrc ((lower(namelsad)) text_pattern_ops);"
sudo -u postgres psql -c "CREATE INDEX bg_idx_namelsad_lower ON tiger2012.bg ((lower(namelsad)) text_pattern_ops);"
sudo -u postgres psql -c "CREATE INDEX cnecta_idx_namelsad_lower ON tiger2012.cnecta ((lower(namelsad)) text_pattern_ops);"
sudo -u postgres psql -c "CREATE INDEX concity_idx_namelsad_lower ON tiger2012.concity ((lower(namelsad)) text_pattern_ops);"
sudo -u postgres psql -c "CREATE INDEX metdiv_idx_namelsad_lower ON tiger2012.metdiv ((lower(namelsad)) text_pattern_ops);"
sudo -u postgres psql -c "CREATE INDEX necta_idx_namelsad_lower ON tiger2012.necta ((lower(namelsad)) text_pattern_ops);"
sudo -u postgres psql -c "CREATE INDEX nectadiv_idx_namelsad_lower ON tiger2012.nectadiv ((lower(namelsad)) text_pattern_ops);"
sudo -u postgres psql -c "CREATE INDEX submcd_idx_namelsad_lower ON tiger2012.submcd ((lower(namelsad)) text_pattern_ops);"
sudo -u postgres psql -c "CREATE INDEX tbg_idx_namelsad_lower ON tiger2012.tbg ((lower(namelsad)) text_pattern_ops);"
sudo -u postgres psql -c "CREATE INDEX ttract_idx_namelsad_lower ON tiger2012.ttract ((lower(namelsad)) text_pattern_ops);"
sudo -u postgres psql -c "CREATE INDEX tabblock_idx_name_lower ON tiger2012.tabblock ((lower(name)) text_pattern_ops);"
sudo -u postgres psql -c "CREATE INDEX tract_idx_namelsad_lower ON tiger2012.tract ((lower(namelsad)) text_pattern_ops);"
sudo -u postgres psql -c "CREATE INDEX uac_idx_namelsad10_lower ON tiger2012.uac ((lower(namelsad10)) text_pattern_ops);"
sudo -u postgres psql -c "CREATE INDEX unsd_idx_name_lower ON tiger2012.unsd ((lower(name)) text_pattern_ops);"
sudo -u postgres psql -c "CREATE INDEX vtd_idx_namelsad10_lower ON tiger2012.vtd ((lower(namelsad10)) text_pattern_ops);"

# Create a unified view for all census shapes
sudo -u postgres psql -c "CREATE VIEW census_names AS
SELECT '310' AS sumlevel, geoid, namelsad AS name, aland, awater, the_geom FROM tiger2012.cbsa
UNION ALL
SELECT '500' AS sumlevel, geoid, namelsad AS name, aland, awater, the_geom FROM tiger2012.cd
UNION ALL
SELECT '050' AS sumlevel, geoid, namelsad AS name, aland, awater, the_geom FROM tiger2012.county
UNION ALL
SELECT '330' AS sumlevel, geoid, namelsad AS name, aland, awater, the_geom FROM tiger2012.csa
UNION ALL
SELECT '160' AS sumlevel, geoid, namelsad AS name, aland, awater, the_geom FROM tiger2012.place
UNION ALL
SELECT '040' AS sumlevel, geoid, name, aland, awater, the_geom FROM tiger2012.state
UNION ALL
SELECT '950' AS sumlevel, geoid, name, aland, awater, the_geom FROM tiger2012.elsd
UNION ALL
SELECT '960' AS sumlevel, geoid, name, aland, awater, the_geom FROM tiger2012.scsd
UNION ALL
SELECT '860' AS sumlevel, geoid10 AS geoid, zcta5ce10 AS name, aland10 AS aland, awater10 AS awater, the_geom FROM tiger2012.zcta5
UNION ALL
SELECT '060' AS sumlevel, geoid, namelsad AS name, aland, awater, the_geom FROM tiger2012.cousub
UNION ALL
SELECT '795' AS sumlevel, geoid10 AS geoid, namelsad10 AS name, aland10 AS aland, awater10 AS awater, the_geom FROM tiger2012.puma
UNION ALL
SELECT '620' AS sumlevel, geoid, namelsad AS name, aland, awater, the_geom FROM tiger2012.sldl
UNION ALL
SELECT '610' AS sumlevel, geoid, namelsad AS name, aland, awater, the_geom FROM tiger2012.sldu
UNION ALL
SELECT '250' AS sumlevel, geoid, namelsad AS name, aland, awater, the_geom FROM tiger2012.aiannh
UNION ALL
SELECT '251' AS sumlevel, geoid, namelsad AS name, aland, awater, the_geom FROM tiger2012.aits
UNION ALL
SELECT '230' AS sumlevel, geoid, namelsad AS name, aland, awater, the_geom FROM tiger2012.anrc
UNION ALL
SELECT '150' AS sumlevel, geoid, namelsad AS name, aland, awater, the_geom FROM tiger2012.bg
UNION ALL
SELECT '335' AS sumlevel, geoid, namelsad AS name, aland, awater, the_geom FROM tiger2012.cnecta
UNION ALL
SELECT '170' AS sumlevel, geoid, namelsad AS name, aland, awater, the_geom FROM tiger2012.concity
UNION ALL
SELECT '314' AS sumlevel, geoid, namelsad AS name, aland, awater, the_geom FROM tiger2012.metdiv
UNION ALL
SELECT '350' AS sumlevel, geoid, namelsad AS name, aland, awater, the_geom FROM tiger2012.necta
UNION ALL
SELECT '355' AS sumlevel, geoid, namelsad AS name, aland, awater, the_geom FROM tiger2012.nectadiv
UNION ALL
SELECT '067' AS sumlevel, geoid, namelsad AS name, aland, awater, the_geom FROM tiger2012.submcd
UNION ALL
SELECT '258' AS sumlevel, geoid, namelsad AS name, aland, awater, the_geom FROM tiger2012.tbg
UNION ALL
SELECT '256' AS sumlevel, geoid, namelsad AS name, aland, awater, the_geom FROM tiger2012.ttract
UNION ALL
SELECT '101' AS sumlevel, geoid, name, aland, awater, the_geom FROM tiger2012.tabblock
UNION ALL
SELECT '140' AS sumlevel, geoid, namelsad AS name, aland, awater, the_geom FROM tiger2012.tract
UNION ALL
SELECT '400' AS sumlevel, geoid10 AS geoid, namelsad10 AS name, aland10 AS aland, awater10 AS awater, the_geom FROM tiger2012.uac
UNION ALL
SELECT '970' AS sumlevel, geoid, name, aland, awater, the_geom FROM tiger2012.unsd
UNION ALL
SELECT '700' AS sumlevel, geoid10 AS geoid, namelsad10 AS name, aland10 AS aland, awater10 AS awater, the_geom FROM tiger2012.vtd;"
