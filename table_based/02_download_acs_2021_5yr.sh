#!/bin/bash
DATA_DIR=/home/ubuntu/data/acs2021_5yr_tables
mkdir -p $DATA_DIR
cd $DATA_DIR

# Grab the 2021 ACS 5 year
sudo apt-get -y install unzip curl
curl -L "https://census-backup.b-cdn.net/programs-surveys/acs/summary_file/2021/table-based-SF/data/5YRData/5YRData.zip" \
     -o ${DATA_DIR}/AllTables.zip
curl -L "https://census-backup.b-cdn.net/programs-surveys/acs/summary_file/2021/table-based-SF/documentation/Geos20215YR.txt" \
     -o ${DATA_DIR}/Geos20215YR.txt
curl -L "https://census-backup.b-cdn.net/programs-surveys/acs/summary_file/2021/table-based-SF/documentation/ACS20215YR_Table_Shells.txt" \
     -o ${DATA_DIR}/ACS20215YR_Table_Shells.txt

unzip -q ${DATA_DIR}/AllTables.zip
