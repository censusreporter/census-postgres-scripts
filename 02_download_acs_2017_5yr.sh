#!/bin/bash

# Make a data directory in ephemeral stoage
sudo mkdir -p /mnt/tmp
sudo chown ubuntu /mnt/tmp

# Grab the 2017 ACS 5 year
cd /mnt/tmp
mkdir -p acs2017_5yr
cd acs2017_5yr
sudo apt-get -y install unzip aria2
aria2c \
    --allow-overwrite=true \
    --auto-file-renaming=false \
    --dir=/mnt/tmp/acs2017_5yr \
    --max-connection-per-server=5 \
    --force-sequential=true \
    --header='Connection: keep-alive' \
    --header='User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36' \
    --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8' \
    --header='Accept-Encoding: gzip, deflate, br' \
    --header='Accept-Language: en-US,en;q=0.9' \
    "https://www2.census.gov/programs-surveys/acs/summary_file/2017/data/5_year_entire_sf/All_Geographies_Not_Tracts_Block_Groups.tar" \
    "https://www2.census.gov/programs-surveys/acs/summary_file/2017/data/5_year_entire_sf/Tracts_Block_Groups_Only.tar" \
    "https://www2.census.gov/programs-surveys/acs/summary_file/2017/data/5_year_entire_sf/2017_ACS_Geography_Files.zip" \
    "https://www2.census.gov/programs-surveys/acs/summary_file/2017/documentation/user_tools/ACS_5yr_Seq_Table_Number_Lookup.txt"
# 2017 5 year release switched to .tar's of .zip's
tar -xf All_Geographies_Not_Tracts_Block_Groups.tar && rm All_Geographies_Not_Tracts_Block_Groups.tar
tar -xf Tracts_Block_Groups_Only.tar && rm Tracts_Block_Groups_Only.tar

# The .tar contains .zip's for each state, but they need to be placed in their own directory or the contents of the .zips will clobber each other
mkdir -p tracts_block_groups_only all_geographies_not_tracts_block_groups
for i in *_Tracts_Block_Groups_Only.zip; do unzip -q -d tracts_block_groups_only $i && rm $i; done
for i in *_All_Geographies_Not_Tracts_Block_Groups.zip; do unzip -q -d all_geographies_not_tracts_block_groups $i && rm $i; done

mv ACS_5yr_Seq_Table_Number_Lookup.txt Sequence_Number_and_Table_Number_Lookup.txt
