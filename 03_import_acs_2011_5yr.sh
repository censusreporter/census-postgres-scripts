#!/bin/bash

# Clone the import scripts from git
cd /home/ubuntu
sudo apt-get -y install git
git clone git://github.com/censusreporter/census-postgres.git

# Create the schema
cd /home/ubuntu/census-postgres/acs2011_5yr
sudo -u postgres psql -c "DROP SCHEMA IF EXISTS acs2011_5yr CASCADE; CREATE SCHEMA acs2011_5yr;"

# Create import tables
sudo -u postgres psql -f create_geoheader.sql
sudo -u postgres psql -f geoheader_comments.sql
sudo -u postgres psql -f create_tmp_geoheader.sql
sudo -u postgres psql -f create_import_tables.sql

# Slurp in the actual data
sudo -u postgres psql -f import_geoheader.sql
sudo -u postgres psql -f import_sequences.sql # This takes a while
sudo -u postgres psql -f parse_tmp_geoheader.sql
sudo -u postgres psql -f store_by_tables.sql
sudo -u postgres psql -f insert_into_tables.sql # This takes ~8 hours
sudo -u postgres psql -f view_estimate_stored_by_tables.sql
sudo -u postgres psql -f view_moe_stored_by_tables.sql

# Drop temp tables
sudo -u postgres psql -f drop_import_tables.sql
