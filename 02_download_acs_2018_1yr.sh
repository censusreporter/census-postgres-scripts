#!/bin/bash

# Make a data directory in ephemeral stoage
sudo mkdir -p /mnt/tmp
sudo chown ubuntu /mnt/tmp

# Grab the 2018 ACS 1 year
cd /mnt/tmp
mkdir -p acs2018_1yr
cd acs2018_1yr
sudo apt-get -y install unzip
curl -L "http://www2.census.gov/programs-surveys/acs/summary_file/2018/data/1_year_entire_sf/All_Geographies.zip" -o /mnt/tmp/acs2018_1yr/All_Geographies.zip
curl -L "http://www2.census.gov/programs-surveys/acs/summary_file/2018/documentation/user_tools/ACS_1yr_Seq_Table_Number_Lookup.txt" -o /mnt/tmp/acs2018_1yr/Sequence_Number_and_Table_Number_Lookup.txt
unzip -q All_Geographies.zip
