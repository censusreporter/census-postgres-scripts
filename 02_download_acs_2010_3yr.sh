#!/bin/bash

# Make a data directory in ephemeral stoage
sudo mkdir -p /mnt/tmp
sudo chown ubuntu /mnt/tmp

# Grab the 2010 ACS 3 year
cd /mnt/tmp
mkdir -p acs2010_3yr
cd acs2010_3yr
sudo apt-get -y install unzip
aria2c --dir=/mnt/tmp/acs2010_3yr --max-connection-per-server=5 --force-sequential=true \
    "http://www2.census.gov/acs2010_3yr/summaryfile/2008-2010_ACSSF_All_In_2_Giant_Files(Experienced-Users-Only)/All_Geographies.zip" \
    "http://www2.census.gov/acs2010_3yr/summaryfile/Sequence_Number_and_Table_Number_Lookup.txt"
unzip -q All_Geographies.zip
