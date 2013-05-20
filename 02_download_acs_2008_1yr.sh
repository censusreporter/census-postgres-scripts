#!/bin/bash

# Make a data directory in ephemeral stoage
sudo mkdir -p /mnt/tmp
sudo chown ubuntu /mnt/tmp

# Grab the 2008 ACS 1 year
cd /mnt/tmp
mkdir -p acs2008_1yr
cd acs2008_1yr
sudo apt-get -y install unzip
curl -O "http://www2.census.gov/acs2008_1yr/summaryfile/all_ACSSF.zip"
unzip all_ACSSF.zip
curl -O "http://www2.census.gov/acs2008_1yr/summaryfile/merge_5_6.xls"
mv merge_5_6.xls Sequence_Number_and_Table_Number_Lookup.txt
