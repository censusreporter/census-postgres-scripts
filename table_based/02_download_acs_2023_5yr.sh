#!/bin/bash
DATA_DIR=/home/ubuntu/data/acs2023_5yr
mkdir -p $DATA_DIR
cd $DATA_DIR

# Grab the 2023 ACS 5 year
sudo apt-get -y install unzip curl
curl -L "https://census-backup.b-cdn.net/programs-surveys/acs/summary_file/2023/table-based-SF/data/5YRData/5YRData.zip" \
     -o ${DATA_DIR}/AllTables.zip
curl -L "https://census-backup.b-cdn.net/programs-surveys/acs/summary_file/2023/table-based-SF/documentation/Geos20235YR.txt" \
     -o ${DATA_DIR}/Geos20235YR.txt
curl -L "https://census-backup.b-cdn.net/programs-surveys/acs/summary_file/2023/table-based-SF/documentation/ACS20235YR_Table_Shells.txt" \
     -o ${DATA_DIR}/ACS20235YR_Table_Shells.txt

unzip -q ${DATA_DIR}/AllTables.zip
