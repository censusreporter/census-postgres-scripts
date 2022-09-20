#!/bin/bash

# Make a data directory in ephemeral stoage
sudo mkdir -p /mnt/tmp
sudo chown ubuntu /mnt/tmp

# Grab the 2021 ACS 1 year
cd /mnt/tmp
mkdir -p acs2021_1yr
cd acs2021_1yr
sudo apt-get -y install unzip
curl -L "https://census-backup.b-cdn.net/programs-surveys/acs/summary_file/2021/sequence-based-SF/data/1_year_entire_sf/All_Geographies.zip" -o /mnt/tmp/acs2021_1yr/All_Geographies.zip
curl -L "https://census-backup.b-cdn.net/programs-surveys/acs/summary_file/2021/sequence-based-SF/documentation/user_tools/ACS_1yr_Seq_Table_Number_Lookup.txt" -o /mnt/tmp/acs2021_1yr/Sequence_Number_and_Table_Number_Lookup.txt
unzip -q All_Geographies.zip
