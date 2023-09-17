#!/bin/bash
DATA_DIR=/home/ubuntu/data/acs2022_1yr
DATA_SERVER="https://census-backup.b-cdn.net"
mkdir -p $DATA_DIR
sudo apt-get -y install unzip

# Grab the 2022 ACS 1 year
curl -L "${DATA_SERVER}/programs-surveys/acs/summary_file/2022/table-based-SF/data/1YRData/1YRData.zip" -o ${DATA_DIR}/All_Tables.zip
curl -L "${DATA_SERVER}/programs-surveys/acs/summary_file/2022/table-based-SF/documentation/Geos20221YR.txt" -o ${DATA_DIR}/Geos20221YR.txt
curl -L "${DATA_SERVER}/programs-surveys/acs/summary_file/2022/table-based-SF/documentation/ACS20221YR_Table_Shells.txt" -o ${DATA_DIR}/ACS20221YR_Table_Shells.txt

unzip -q -j -d $DATA_DIR $DATA_DIR/All_Tables.zip
