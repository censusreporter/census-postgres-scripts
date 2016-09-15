#!/bin/bash

# Make a data directory in ephemeral stoage
sudo mkdir -p /mnt/tmp
sudo chown ubuntu /mnt/tmp

# Grab the 2012 ACS 3 year
cd /mnt/tmp
mkdir -p acs2012_3yr
cd acs2012_3yr
sudo apt-get -y install unzip aria2
aria2c --dir=/mnt/tmp/acs2012_3yr --max-connection-per-server=5 --force-sequential=true \
    "http://www2.census.gov/acs2012_3yr/summaryfile/2010-2012_ACSSF_All_In_1_Giant_Files(Experienced-Users-Only)/All_Geographies.zip" \
    "http://www2.census.gov/acs2012_3yr/summaryfile/Sequence_Number_and_Table_Number_Lookup.txt"
unzip -q All_Geographies.zip
