#!/bin/bash

# Make a data directory in ephemeral stoage
sudo mkdir -p /mnt/tmp
sudo chown ubuntu /mnt/tmp

# Grab the 2009 ACS 5 year
cd /mnt/tmp
mkdir -p acs2009_5yr/group{1,2}
sudo apt-get -y install unzip aria2
aria2c --dir=/mnt/tmp/acs2009_5yr --max-connection-per-server=5 --force-sequential=true \
    "http://www2.census.gov/acs2009_5yr/summaryfile/2005-2009_ACSSF_All_In_2_Giant_Files(Experienced-Users-Only)/All_Geographies_Not_Tracts_Block_Groups.zip" \
    "http://www2.census.gov/acs2009_5yr/summaryfile/2005-2009_ACSSF_All_In_2_Giant_Files(Experienced-Users-Only)/Tracts_Block_Groups_Only.zip" \
    "http://www2.census.gov/acs2009_5yr/summaryfile/UserTools/Sequence_Number_and_Table_Number_Lookup.txt"
unzip -q All_Geographies_Not_Tracts_Block_Groups.zip -d ./tmp
# This zip contains per-state zips, so unzip those too
for i in ./tmp/*_All_Geographies_Not_Tracts_Block_Groups.zip; do unzip -q -d ./group1 $i; done
unzip -q Tracts_Block_Groups_Only.zip -d ./group2

# Let the Postgres user access this data
chmod 777 /mnt/tmp/acs2009_5yr/group1 /mnt/tmp/acs2009_5yr/group2
chmod 644 /mnt/tmp/acs2009_5yr/group1/* /mnt/tmp/acs2009_5yr/group2/*
