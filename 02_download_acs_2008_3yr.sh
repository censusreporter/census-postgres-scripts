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

rm all_ACSSF.zip
for i in prt03/prod/sumfile/data/2006thru2008/**/20083*.zip; do unzip -n $i; done

rm -rf prt03

# The lookup tables are in XLS only, so they'll be provided in the census-postgres
# package later.
