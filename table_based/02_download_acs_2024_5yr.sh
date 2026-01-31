#!/bin/bash
DATA_DIR=/home/ubuntu/data/acs2024_5yr
mkdir -p $DATA_DIR
cd $DATA_DIR

# Grab the 2024 ACS 5 year
sudo apt-get -y install unzip curl
curl -L "https://census-backup.b-cdn.net/programs-surveys/acs/summary_file/2024/table-based-SF/data/5YRData/5YRData.zip" \
     -o ${DATA_DIR}/AllTables.zip
curl -L "https://census-backup.b-cdn.net/programs-surveys/acs/summary_file/2024/table-based-SF/documentation/Geos20245YR.txt" \
     -o ${DATA_DIR}/Geos20245YR.txt
curl -L "https://census-backup.b-cdn.net/programs-surveys/acs/summary_file/2024/table-based-SF/documentation/ACS20245YR_Table_Shells.txt" \
     -o ${DATA_DIR}/ACS20245YR_Table_Shells.txt

unzip -q ${DATA_DIR}/AllTables.zip

# The AllTables.zip puts all the files several directories deep, so we need to move them up
mv ${DATA_DIR}/data/prt01/prod/sumfile_new/output/2024/5YRData/* ${DATA_DIR}/
