#!/bin/bash

mkdir -p /home/ubuntu/data/acs2019_5yr
cd /home/ubuntu/data/acs2019_5yr

# Grab the 2019 ACS 5 year
sudo apt-get -y install unzip curl
curl -L "https://census-backup.b-cdn.net/programs-surveys/acs/summary_file/2019/data/5_year_entire_sf/All_Geographies_Not_Tracts_Block_Groups.zip" \
     -o /home/ubuntu/data/acs2019_5yr/All_Geographies_Not_Tracts_Block_Groups.zip
curl -L "https://census-backup.b-cdn.net/programs-surveys/acs/summary_file/2019/data/5_year_entire_sf/Tracts_Block_Groups_Only.zip" \
     -o /home/ubuntu/data/acs2019_5yr/Tracts_Block_Groups_Only.zip
curl -L "https://census-backup.b-cdn.net/programs-surveys/acs/summary_file/2019/data/5_year_entire_sf/2019_ACS_Geography_Files.zip" \
     -o /home/ubuntu/data/acs2019_5yr/2019_ACS_Geography_Files.zip
curl -L "https://census-backup.b-cdn.net/programs-surveys/acs/summary_file/2019/documentation/user_tools/ACS_5yr_Seq_Table_Number_Lookup.txt" \
     -o /home/ubuntu/data/acs2019_5yr/ACS_5yr_Seq_Table_Number_Lookup.txt

unzip -q /home/ubuntu/data/acs2019_5yr/All_Geographies_Not_Tracts_Block_Groups.zip
unzip -q /home/ubuntu/data/acs2019_5yr/Tracts_Block_Groups_Only.zip

# The .zip's contains .zip's for each state, but they need to be placed in their own directory or the contents of the .zips will clobber each other
mkdir -p tracts_block_groups_only all_geographies_not_tracts_block_groups
for i in *_Tracts_Block_Groups_Only.zip; do unzip -q -d tracts_block_groups_only $i && rm $i; done
for i in *_All_Geographies_Not_Tracts_Block_Groups.zip; do unzip -q -d all_geographies_not_tracts_block_groups $i && rm $i; done

unzip -q /home/ubuntu/data/acs2019_5yr/2019_ACS_Geography_Files.zip

mv ACS_5yr_Seq_Table_Number_Lookup.txt Sequence_Number_and_Table_Number_Lookup.txt
