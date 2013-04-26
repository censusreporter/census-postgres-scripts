#!/bin/bash

# Make a data directory in ephemeral stoage
sudo mkdir -p /mnt/tmp
sudo chown ubuntu /mnt/tmp

# Grab the 2009 ACS 5 year
cd /mnt/tmp
mkdir -p acs2009_5yr
cd acs2009_5yr
sudo apt-get -y install unzip
curl -O "http://www2.census.gov/acs2009_5yr/summaryfile/2005-2009_ACSSF_All_In_2_Giant_Files(Experienced-Users-Only)/All_Geographies_Not_Tracts_Block_Groups.zip"
tar -zxvf All_Geographies_Not_Tracts_Block_Groups.zip
curl -O "http://www2.census.gov/acs2009_5yr/summaryfile/2005-2009_ACSSF_All_In_2_Giant_Files(Experienced-Users-Only)/Tracts_Block_Groups_Only.zip"
tar -zxvf Tracts_Block_Groups_Only.zip
curl -O "http://www2.census.gov/acs2009_5yr/summaryfile/2005-2009_ACSSF_All_In_2_Giant_Files(Experienced-Users-Only)/2009_ACS_Geography_Files.zip"
unzip 2009_ACS_Geography_Files.zip
curl -O "http://www2.census.gov/acs2009_5yr/summaryfile/UserTools/Sequence_Number_and_Table_Number_Lookup.txt"

# The 2009 ACS unzips into deep directory structure,
# so pull it into something sane
mv tab4/sumfile/prod/2005thru2009/group* .

# Let the Postgres user access this data
chmod 777 /mnt/tmp/acs2009_5yr/geog /mnt/tmp/acs2009_5yr/group1 /mnt/tmp/acs2009_5yr/group2
chmod 644 /mnt/tmp/acs2009_5yr/geog/* /mnt/tmp/acs2009_5yr/group1/* /mnt/tmp/acs2009_5yr/group2/*
