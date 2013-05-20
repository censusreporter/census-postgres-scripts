#!/bin/bash

# Make a data directory in ephemeral stoage
sudo mkdir -p /mnt/tmp
sudo chown ubuntu /mnt/tmp

# Grab the 2008 ACS 3 year
cd /mnt/tmp
mkdir -p acs2008_3yr
cd acs2008_3yr
sudo apt-get -y install unzip
curl -O "http://www2.census.gov/acs2008_3yr/summaryfile/all_ACSSF.zip"
unzip all_ACSSF.zip
curl -O "http://www2.census.gov/acs2008_3yr/summaryfile/merge_5_6.xls"
mv merge_5_6.xls Sequence_Number_and_Table_Number_Lookup.txt
