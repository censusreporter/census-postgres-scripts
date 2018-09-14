#!/bin/bash

# Make a data directory in ephemeral stoage
sudo mkdir -p /mnt/tmp
sudo chown ubuntu /mnt/tmp

# Grab the 2016 ACS 5 year
cd /mnt/tmp
mkdir -p acs2016_5yr
cd acs2016_5yr
sudo apt-get -y install unzip aria2
aria2c --dir=/mnt/tmp/acs2016_5yr --max-connection-per-server=5 --force-sequential=true \
    "https://www2.census.gov/programs-surveys/acs/summary_file/2016/data/5_year_entire_sf/All_Geographies_Not_Tracts_Block_Groups.tar.gz" \
    "https://www2.census.gov/programs-surveys/acs/summary_file/2016/data/5_year_entire_sf/Tracts_Block_Groups_Only.tar.gz" \
    "https://www2.census.gov/programs-surveys/acs/summary_file/2016/data/5_year_entire_sf/2016_ACS_Geography_Files.zip" \
    "https://www2.census.gov/programs-surveys/acs/summary_file/2016/documentation/user_tools/ACS_5yr_Seq_Table_Number_Lookup.txt"
tar -xzf All_Geographies_Not_Tracts_Block_Groups.tar.gz
tar -xzf Tracts_Block_Groups_Only.tar.gz
unzip -q 2016_ACS_Geography_Files.zip

mv ACS_5yr_Seq_Table_Number_Lookup.txt Sequence_Number_and_Table_Number_Lookup.txt
