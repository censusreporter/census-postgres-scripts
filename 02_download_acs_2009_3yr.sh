#!/bin/bash

# Make a data directory in ephemeral stoage
sudo mkdir -p /mnt/tmp
sudo chown ubuntu /mnt/tmp

# Grab the 2009 ACS 3 year
cd /mnt/tmp
mkdir -p acs2009_3yr
cd acs2009_3yr
sudo apt-get -y install unzip
curl -O "http://www2.census.gov/acs2009_3yr/summaryfile/2007-2009_ACSSF_All_In_1_Giant_File(Experienced-Users-Only)/All_Geographies.zip"
unzip All_Geographies.zip
curl -O "http://www2.census.gov/acs2009_3yr/summaryfile/UserTools/Sequence_Number_and_Table_Number_Lookup.txt"
