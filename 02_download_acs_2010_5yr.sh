#!/bin/bash

# Make a data directory in ephemeral stoage
sudo mkdir -p /mnt/tmp
sudo chown ubuntu /mnt/tmp

# Grab the 2010 ACS 5 year
cd /mnt/tmp
mkdir -p acs2010_5yr
cd acs2010_5yr
sudo apt-get -y install unzip
curl -O "http://www2.census.gov/acs2010_5yr/summaryfile/2006-2010_ACSSF_All_In_2_Giant_Files(Experienced-Users-Only)/All_Geographies_Not_Tracts_Block_Groups.zip"
tar -zxvf All_Geographies_Not_Tracts_Block_Groups.zip
curl -O "http://www2.census.gov/acs2010_5yr/summaryfile/2006-2010_ACSSF_All_In_2_Giant_Files(Experienced-Users-Only)/Tracts_Block_Groups_Only.zip"
tar -zxvf Tracts_Block_Groups_Only.zip
curl -O "http://www2.census.gov/acs2010_5yr/summaryfile/2006-2010_ACSSF_All_In_2_Giant_Files(Experienced-Users-Only)/2010_ACS_Geography_Files.zip"
unzip 2010_ACS_Geography_Files.zip

# The 2010 ACS unzips into deep directory structure,
# so pull it into something sane
mv tab4/sumfile/prod/2006thru2010/group* .

# Let the Postgres user access this data
chmod 777 /mnt/tmp/acs2010_5yr/geog /mnt/tmp/acs2010_5yr/group1 /mnt/tmp/acs2010_5yr/group2
chmod 644 /mnt/tmp/acs2010_5yr/geog/* /mnt/tmp/acs2010_5yr/group1/* /mnt/tmp/acs2010_5yr/group2/*
