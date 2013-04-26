#!/bin/bash

# Make a data directory in ephemeral stoage
sudo mkdir -p /mnt/tmp
sudo chown ubuntu /mnt/tmp

# Grab the 2009 ACS 5 year
cd /mnt/tmp
mkdir -p acs2009_5yr/group{1,2}
cd acs2009_5yr/group1
sudo apt-get -y install unzip
curl -O "http://www2.census.gov/acs2009_5yr/summaryfile/2005-2009_ACSSF_All_In_2_Giant_Files(Experienced-Users-Only)/All_Geographies_Not_Tracts_Block_Groups.zip"
unzip All_Geographies_Not_Tracts_Block_Groups.zip
# This zip contains per-state zips, so unzip those too
for i in *_All_Geographies_Not_Tracts_Block_Groups.zip; do unzip $i; done
cd ../group2
curl -O "http://www2.census.gov/acs2009_5yr/summaryfile/2005-2009_ACSSF_All_In_2_Giant_Files(Experienced-Users-Only)/Tracts_Block_Groups_Only.zip"
unzip Tracts_Block_Groups_Only.zip
cd ..
curl -O "http://www2.census.gov/acs2009_5yr/summaryfile/UserTools/Sequence_Number_and_Table_Number_Lookup.txt"

# Let the Postgres user access this data
chmod 777 /mnt/tmp/acs2009_5yr/group1 /mnt/tmp/acs2009_5yr/group2
chmod 644 /mnt/tmp/acs2009_5yr/group1/* /mnt/tmp/acs2009_5yr/group2/*