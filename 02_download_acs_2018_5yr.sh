#!/bin/bash

# Make a data directory in ephemeral stoage
sudo mkdir -p /mnt/tmp
sudo chown ubuntu /mnt/tmp

# Grab the 2018 ACS 5 year
cd /mnt/tmp
mkdir -p acs2018_5yr
cd acs2018_5yr
sudo apt-get -y install unzip curl
curl -L "https://www2.census.gov/programs-surveys/acs/summary_file/2018/data/5_year_entire_sf/All_Geographies_Not_Tracts_Block_Groups.zip" \
     -o /mnt/tmp/acs2018_5yr/All_Geographies_Not_Tracts_Block_Groups.zip
curl -L "https://www2.census.gov/programs-surveys/acs/summary_file/2018/data/5_year_entire_sf/Tracts_Block_Groups_Only.zip" \
     -o /mnt/tmp/acs2018_5yr/Tracts_Block_Groups_Only.zip
curl -L "https://www2.census.gov/programs-surveys/acs/summary_file/2018/data/5_year_entire_sf/2018_ACS_Geography_Files.zip" \
     -o /mnt/tmp/acs2018_5yr/2018_ACS_Geography_Files.zip
curl -L "https://www2.census.gov/programs-surveys/acs/summary_file/2018/documentation/user_tools/ACS_5yr_Seq_Table_Number_Lookup.txt" \
     -o /mnt/tmp/acs2018_5yr/ACS_5yr_Seq_Table_Number_Lookup.txt

unzip -q /mnt/tmp/acs2018_5yr/All_Geographies_Not_Tracts_Block_Groups.zip
unzip -q /mnt/tmp/acs2018_5yr/Tracts_Block_Groups_Only.zip
unzip -q /mnt/tmp/acs2018_5yr/2018_ACS_Geography_Files.zip

mv ACS_5yr_Seq_Table_Number_Lookup.txt Sequence_Number_and_Table_Number_Lookup.txt
