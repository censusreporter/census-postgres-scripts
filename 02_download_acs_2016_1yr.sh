#!/bin/bash

# Make a data directory in ephemeral stoage
sudo mkdir -p /mnt/tmp
sudo chown ubuntu /mnt/tmp

# Grab the 2016 ACS 1 year
cd /mnt/tmp
mkdir -p acs2016_1yr
cd acs2016_1yr
sudo apt-get -y install unzip aria2
aria2c --dir=/mnt/tmp/acs2016_1yr --max-connection-per-server=5 --force-sequential=true \
    "http://www2.census.gov/programs-surveys/acs/summary_file/2016/data/1_year_entire_sf/All_Geographies.zip" \
    "http://www2.census.gov/programs-surveys/acs/summary_file/2016/documentation/user_tools/ACS_1yr_Seq_Table_Number_Lookup.txt"
unzip -q All_Geographies.zip
mv /mnt/tmp/acs2016_1yr/ACS_1yr_Seq_Table_Number_Lookup.txt /mnt/tmp/acs2016_1yr/Sequence_Number_and_Table_Number_Lookup.txt
