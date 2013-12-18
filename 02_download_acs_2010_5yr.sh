#!/bin/bash

# Make a data directory in ephemeral stoage
sudo mkdir -p /mnt/tmp
sudo chown ubuntu /mnt/tmp

# Grab the 2010 ACS 5 year
cd /mnt/tmp
mkdir -p acs2010_5yr
cd acs2010_5yr
sudo apt-get -y install aria2 unzip
aria2c --dir=/mnt/tmp/acs2010_5yr --max-connection-per-server=5 --force-sequential=true \
    "http://www2.census.gov/acs2010_5yr/summaryfile/2006-2010_ACSSF_All_In_2_Giant_Files(Experienced-Users-Only)/All_Geographies_Not_Tracts_Block_Groups.zip" \
    "http://www2.census.gov/acs2010_5yr/summaryfile/2006-2010_ACSSF_All_In_2_Giant_Files(Experienced-Users-Only)/Tracts_Block_Groups_Only.zip" \
    "http://www2.census.gov/acs2010_5yr/summaryfile/2006-2010_ACSSF_All_In_2_Giant_Files(Experienced-Users-Only)/2010_ACS_Geography_Files.zip" \
    "http://www2.census.gov/acs2010_5yr/summaryfile/Sequence_Number_and_Table_Number_Lookup.txt"
tar -zxf All_Geographies_Not_Tracts_Block_Groups.zip
tar -zxf Tracts_Block_Groups_Only.zip
unzip -q 2010_ACS_Geography_Files.zip

# The 2010 ACS unzips into deep directory structure,
# so pull it into something sane
mv tab4/sumfile/prod/2006thru2010/group* .

# Let the Postgres user access this data
chmod 777 /mnt/tmp/acs2010_5yr/geog /mnt/tmp/acs2010_5yr/group1 /mnt/tmp/acs2010_5yr/group2
chmod 644 /mnt/tmp/acs2010_5yr/geog/* /mnt/tmp/acs2010_5yr/group1/* /mnt/tmp/acs2010_5yr/group2/*
