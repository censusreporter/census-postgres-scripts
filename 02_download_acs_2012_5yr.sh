#!/bin/bash

# Make a data directory in ephemeral stoage
sudo mkdir -p /mnt/tmp
sudo chown ubuntu /mnt/tmp

# Grab the 2012 ACS 5 year
cd /mnt/tmp
mkdir -p acs2012_5yr
cd acs2012_5yr
sudo apt-get -y install aria2 unzip
aria2c --dir=/mnt/tmp/acs2012_5yr --max-connection-per-server=5 --force-sequential=true \
    "http://www2.census.gov/acs2012_5yr/summaryfile/2008-2012_ACSSF_All_In_2_Giant_Files(Experienced-Users-Only)/All_Geographies_Not_Tracts_Block_Groups.tar.gz" \
    "http://www2.census.gov/acs2012_5yr/summaryfile/2008-2012_ACSSF_All_In_2_Giant_Files(Experienced-Users-Only)/Tracts_Block_Groups_Only.tar.gz" \
    "http://www2.census.gov/acs2012_5yr/summaryfile/2008-2012_ACSSF_All_In_2_Giant_Files(Experienced-Users-Only)/2012_ACS_Geography_Files.zip" \
    "http://www2.census.gov/acs2012_5yr/summaryfile/Sequence_Number_and_Table_Number_Lookup.txt"
tar -xzf All_Geographies_Not_Tracts_Block_Groups.tar.gz
tar -xzf Tracts_Block_Groups_Only.tar.gz
unzip -q 2012_ACS_Geography_Files.zip

# Let the Postgres user access this data
chmod 777 /mnt/tmp/acs2012_5yr/geog /mnt/tmp/acs2012_5yr/group1 /mnt/tmp/acs2012_5yr/group2
chmod 644 /mnt/tmp/acs2012_5yr/geog/* /mnt/tmp/acs2012_5yr/group1/* /mnt/tmp/acs2012_5yr/group2/*
