#!/bin/bash

# Make a data directory in ephemeral stoage
sudo mkdir -p /mnt/tmp
sudo chown ubuntu /mnt/tmp

# Grab the 2014 ACS 1 year
cd /mnt/tmp
mkdir -p acs2014_5yr
cd acs2014_5yr
sudo apt-get -y install unzip
aria2c --dir=/mnt/tmp/acs2014_5yr --max-connection-per-server=5 --force-sequential=true \
    "http://www2.census.gov/programs-surveys/acs/summary_file/2014/data/5_year_entire_sf/All_Geographies_Not_Tracts_Block_Groups.tar.gz" \
    "http://www2.census.gov/programs-surveys/acs/summary_file/2014/data/5_year_entire_sf/Tracts_Block_Groups_Only.tar.gz" \
    "http://www2.census.gov/programs-surveys/acs/summary_file/2014/data/5_year_entire_sf/2014_ACS_Geography_Files.zip" \
    "http://www2.census.gov/programs-surveys/acs/summary_file/2014/documentation/user_tools/ACS_5yr_Seq_Table_Number_Lookup.txt"
tar -xzf All_Geographies_Not_Tracts_Block_Groups.tar.gz
tar -xzf Tracts_Block_Groups_Only.tar.gz
unzip -q 2014_ACS_Geography_Files.zip

mv ACS_5yr_Seq_Table_Number_Lookup.txt Sequence_Number_and_Table_Number_Lookup.txt
