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
