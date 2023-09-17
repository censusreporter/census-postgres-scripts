#!/bin/bash
DATA_DIR=/home/ubuntu/data/acs2021_1yr
DATA_SERVER="https://census-backup.b-cdn.net"
# Make a data directory in ephemeral stoage
mkdir -p $DATA_DIR

# Grab the 2021 ACS 1 year
cd $DATA_DIR
sudo apt-get -y install unzip

curl -L "${DATA_SERVER}/programs-surveys/acs/summary_file/2021/table-based-SF/data/1YRData/1YRData.zip" -o ${DATA_DIR}/All_Tables.zip
curl -L "${DATA_SERVER}/programs-surveys/acs/summary_file/2021/table-based-SF/documentation/Geos20211YR.txt" -o ${DATA_DIR}/Geos20211YR.txt
curl -L "${DATA_SERVER}/programs-surveys/acs/summary_file/2021/table-based-SF/documentation/ACS20211YR_Table_Shells.txt" -o ${DATA_DIR}/ACS20211YR_Table_Shells.txt

unzip -q -j All_Tables.zip
