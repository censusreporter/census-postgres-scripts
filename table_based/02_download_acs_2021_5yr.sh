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

# table-based files have "jam values" which should not be loaded into our database
JAM_VALUES="-222222222|-333333333|-555555555|-666666666|-888888888|-999999999"
TMP_DIR="${DATA_DIR}/tmp"
mkdir $TMP_DIR
for i in `ls ${DATA_DIR}/*.dat`; do
    file_name=`basename $i`
    sed -E "s/${JAM_VALUES}//g" $i > "${TMP_DIR}/${file_name}"
    mv "${TMP_DIR}/${file_name}" $i
done;
rmdir $TMP_DIR
