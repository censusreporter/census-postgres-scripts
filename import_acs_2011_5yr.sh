#!/bin/bash

# Clone the import scripts from git
cd /home/ubuntu
sudo apt-get -y install git
git clone git://github.com/censusreporter/census-postgres.git

# Create the schema
sed -i '1i SET search_path = acs2011_5yr, public;' *.sql
sudo su postgres
psql -c "DROP SCHEMA IF EXISTS acs2011_5yr; CREATE SCHEMA acs2011_5yr;"

# Create import tables
psql -f create_geoheader.sql
psql -f geoheader_comments.sql
psql -f create_tmp_geoheader.sql
psql -f create_import_tables.sql

# Correct the directories in the import scripts
sed -i "s/\/<census_upload_root>\/acs2011_5yr\/All_Geographies_Not_Tracts_Block_Groups/\/mnt\/tmp\/geog/" /home/ubuntu/census-postgres/acs2011_5yr/import_geoheader.sql
sed -i "s/\/<census_upload_root>\/acs2011_5yr\/All_Geographies_Not_Tracts_Block_Groups/\/mnt\/tmp\/group1/" /home/ubuntu/census-postgres/acs2011_5yr/import_sequences.sql
sed -i "s/\/<census_upload_root>\/acs2011_5yr\/Tracts_Block_Groups_Only/\/mnt\/tmp\/group2/" /home/ubuntu/census-postgres/acs2011_5yr/import_sequences.sql

# Slurp in the actual data
psql -f import_geoheader.sql
psql -f import_sequences.sql # This takes a while
psql -f parse_tmp_geoheader.sql
psql -f store_by_tables.sql
psql -f insert_into_tables.sql # This takes ~8 hours
psql -f view_estimate_stored_by_tables.sql
psql -f view_moe_stored_by_tables.sql
psql -c "DROP TABLE tmp_geoheader;"