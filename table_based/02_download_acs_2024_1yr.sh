#!/bin/bash
DATA_DIR=/home/ubuntu/data/acs2024_1yr
DATA_SERVER="https://census-backup.b-cdn.net"
mkdir -p $DATA_DIR
sudo apt-get -y install unzip

# Grab the 2024 ACS 1 year
curl -L "${DATA_SERVER}/programs-surveys/acs/summary_file/2024/table-based-SF/data/1YRData/1YRData.zip" -o ${DATA_DIR}/All_Tables.zip
curl -L "${DATA_SERVER}/programs-surveys/acs/summary_file/2024/table-based-SF/documentation/Geos20241YR.txt" -o ${DATA_DIR}/Geos20241YR.txt
curl -L "${DATA_SERVER}/programs-surveys/acs/summary_file/2024/table-based-SF/documentation/ACS20241YR_Table_Shells.txt" -o ${DATA_DIR}/ACS20241YR_Table_Shells.txt

unzip -q -j -d $DATA_DIR $DATA_DIR/All_Tables.zip
