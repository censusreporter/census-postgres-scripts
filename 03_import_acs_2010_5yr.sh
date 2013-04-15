#!/bin/bash

# Clone the import scripts from git
cd /home/ubuntu
sudo apt-get -y install git
git clone git://github.com/censusreporter/census-postgres.git

# Create the schema
cd /home/ubuntu/census-postgres/acs2010_5yr
sed -i '1i SET search_path = acs2010_5yr, public;' *.sql
sudo -u postgres psql -c "DROP SCHEMA IF EXISTS acs2010_5yr; CREATE SCHEMA acs2010_5yr;"

# Create import tables
sudo -u postgres psql -f create_geoheader.sql
sudo -u postgres psql -f geoheader_comments.sql
sudo -u postgres psql -f create_tmp_geoheader.sql
sudo -u postgres psql -f drop_import_tables.sql
sudo -u postgres psql -f create_import_tables.sql
sudo -u postgres psql -f drop_import_moe.sql
sudo -u postgres psql -f create_import_moe.sql

# Correct the directories in the import scripts
sed -i "s/\/<census_upload_root>\/acs2010_5yr\/All_Geographies_Not_Tracts_Block_Groups/\/mnt\/tmp\/acs2010_5yr\/geog/" /home/ubuntu/census-postgres/acs2010_5yr/import_geoheader.sql
sed -i "s/\/<census_upload_root>\/acs2010_5yr\/All_Geographies_Not_Tracts_Block_Groups/\/mnt\/tmp\/acs2010_5yr\/group1/" /home/ubuntu/census-postgres/acs2010_5yr/import_sequences.sql
sed -i "s/\/<census_upload_root>\/acs2010_5yr\/Tracts_Block_Groups_Only/\/mnt\/tmp\/acs2010_5yr\/group2/" /home/ubuntu/census-postgres/acs2010_5yr/import_sequences.sql

# Slurp in the actual data
sudo -u postgres psql -f import_geoheader.sql
sudo -u postgres psql -f import_sequences.sql # This takes a while
sudo -u postgres psql -f parse_tmp_geoheader.sql
sudo -u postgres psql -f store_by_tables.sql
sudo -u postgres psql -f store_moe_by_tables.sql
sudo -u postgres psql -f insert_into_tables.sql # This takes ~8 hours
sudo -u postgres psql -f view_estimate_stored_by_tables.sql
sudo -u postgres psql -f view_moe_stored_by_tables.sql

# Drop temp tables
cd /home/ubuntu/census-postgres-scripts
sudo -u postgres psql -f 04_drop_acs_2010_5yr_tmp_tables.sql
