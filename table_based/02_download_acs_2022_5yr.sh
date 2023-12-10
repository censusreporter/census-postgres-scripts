#!/bin/bash
DATA_DIR=/home/ubuntu/data/acs2022_5yr_tables
mkdir -p $DATA_DIR
cd $DATA_DIR

# Grab the 2022 ACS 5 year
sudo apt-get -y install unzip curl
curl -L "https://census-backup.b-cdn.net/programs-surveys/acs/summary_file/2022/table-based-SF/data/5YRData/5YRData.zip" \
     -o ${DATA_DIR}/AllTables.zip
curl -L "https://census-backup.b-cdn.net/programs-surveys/acs/summary_file/2022/table-based-SF/documentation/Geos20225YR.txt" \
     -o ${DATA_DIR}/Geos20225YR.txt
curl -L "https://census-backup.b-cdn.net/programs-surveys/acs/summary_file/2022/table-based-SF/documentation/ACS20225YR_Table_Shells.txt" \
     -o ${DATA_DIR}/ACS20225YR_Table_Shells.txt

unzip -q ${DATA_DIR}/AllTables.zip
