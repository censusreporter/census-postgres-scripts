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

rm all_ACSSF.zip
for i in prt03/prod/sumfile/data/2008/**/20081*.zip; do unzip -n $i; done

# The lookup tables are in XLS only, so they'll be provided in the census-postgres
# package later.
