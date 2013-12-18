#!/bin/bash

# Make a data directory in ephemeral stoage
sudo mkdir -p /mnt/tmp
sudo chown ubuntu /mnt/tmp

# Grab the 2007 ACS 1 year
cd /mnt/tmp
mkdir -p acs2007_1yr
cd acs2007_1yr
sudo apt-get -y install aria2 unzip
aria2c --dir=/mnt/tmp/acs2007_1yr --max-connection-per-server=5 --force-sequential=true \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Alabama/all_al.zip" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Alabama/g20071al.txt" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Alaska/all_ak.zip" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Alaska/g20071ak.txt" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Arizona/all_az.zip" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Arizona/g20071az.txt" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Arkansas/all_ar.zip" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Arkansas/g20071ar.txt" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/California/all_ca.zip" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/California/g20071ca.txt" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Colorado/all_co.zip" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Colorado/g20071co.txt" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Connecticut/all_ct.zip" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Connecticut/g20071ct.txt" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Delaware/all_de.zip" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Delaware/g20071de.txt" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/DistrictofColumbia/all_dc.zip" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/DistrictofColumbia/g20071dc.txt" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Florida/all_fl.zip" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Florida/g20071fl.txt" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Georgia/all_ga.zip" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Georgia/g20071ga.txt" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Hawaii/all_hi.zip" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Hawaii/g20071hi.txt" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Idaho/all_id.zip" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Idaho/g20071id.txt" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Illinois/all_il.zip" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Illinois/g20071il.txt" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Indiana/all_in.zip" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Indiana/g20071in.txt" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Iowa/all_ia.zip" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Iowa/g20071ia.txt" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Kansas/all_ks.zip" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Kansas/g20071ks.txt" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Kentucky/all_ky.zip" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Kentucky/g20071ky.txt" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Louisiana/all_la.zip" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Louisiana/g20071la.txt" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Maine/all_me.zip" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Maine/g20071me.txt" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Maryland/all_md.zip" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Maryland/g20071md.txt" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Massachusetts/all_ma.zip" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Massachusetts/g20071ma.txt" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Michigan/all_mi.zip" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Michigan/g20071mi.txt" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Minnesota/all_mn.zip" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Minnesota/g20071mn.txt" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Mississippi/all_ms.zip" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Mississippi/g20071ms.txt" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Missouri/all_mo.zip" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Missouri/g20071mo.txt" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Montana/all_mt.zip" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Montana/g20071mt.txt" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Nebraska/all_ne.zip" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Nebraska/g20071ne.txt" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Nevada/all_nv.zip" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Nevada/g20071nv.txt" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/NewHampshire/all_nh.zip" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/NewHampshire/g20071nh.txt" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/NewJersey/all_nj.zip" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/NewJersey/g20071nj.txt" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/NewMexico/all_nm.zip" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/NewMexico/g20071nm.txt" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/NewYork/all_ny.zip" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/NewYork/g20071ny.txt" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/NorthCarolina/all_nc.zip" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/NorthCarolina/g20071nc.txt" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/NorthDakota/all_nd.zip" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/NorthDakota/g20071nd.txt" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Ohio/all_oh.zip" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Ohio/g20071oh.txt" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Oklahoma/all_ok.zip" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Oklahoma/g20071ok.txt" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Oregon/all_or.zip" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Oregon/g20071or.txt" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Pennsylvania/all_pa.zip" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Pennsylvania/g20071pa.txt" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/PuertoRico/all_pr.zip" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/PuertoRico/g20071pr.txt" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/RhodeIsland/all_ri.zip" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/RhodeIsland/g20071ri.txt" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/SouthCarolina/all_sc.zip" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/SouthCarolina/g20071sc.txt" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/SouthDakota/all_sd.zip" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/SouthDakota/g20071sd.txt" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Tennessee/all_tn.zip" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Tennessee/g20071tn.txt" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Texas/all_tx.zip" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Texas/g20071tx.txt" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/UnitedStates/all_us.zip" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/UnitedStates/g20071us.txt" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Utah/all_ut.zip" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Utah/g20071ut.txt" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Vermont/all_vt.zip" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Vermont/g20071vt.txt" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Virginia/all_va.zip" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Virginia/g20071va.txt" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Washington/all_wa.zip" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Washington/g20071wa.txt" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/WestVirginia/all_wv.zip" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/WestVirginia/g20071wv.txt" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Wisconsin/all_wi.zip" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Wisconsin/g20071wi.txt" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Wyoming/all_wy.zip" \
    "http://www2.census.gov/acs2007_1yr/summaryfile/Wyoming/g20071wy.txt"
unzip -q all_al.zip
rm all_al.zip
unzip -q all_ak.zip
rm all_ak.zip
unzip -q all_az.zip
rm all_az.zip
unzip -q all_ar.zip
rm all_ar.zip
unzip -q all_ca.zip
rm all_ca.zip
unzip -q all_co.zip
rm all_co.zip
unzip -q all_ct.zip
rm all_ct.zip
unzip -q all_de.zip
rm all_de.zip
unzip -q all_dc.zip
rm all_dc.zip
unzip -q all_fl.zip
rm all_fl.zip
unzip -q all_ga.zip
rm all_ga.zip
unzip -q all_hi.zip
rm all_hi.zip
unzip -q all_id.zip
rm all_id.zip
unzip -q all_il.zip
rm all_il.zip
unzip -q all_in.zip
rm all_in.zip
unzip -q all_ia.zip
rm all_ia.zip
unzip -q all_ks.zip
rm all_ks.zip
unzip -q all_ky.zip
rm all_ky.zip
unzip -q all_la.zip
rm all_la.zip
unzip -q all_me.zip
rm all_me.zip
unzip -q all_md.zip
rm all_md.zip
unzip -q all_ma.zip
rm all_ma.zip
unzip -q all_mi.zip
rm all_mi.zip
unzip -q all_mn.zip
rm all_mn.zip
unzip -q all_ms.zip
rm all_ms.zip
unzip -q all_mo.zip
rm all_mo.zip
unzip -q all_mt.zip
rm all_mt.zip
unzip -q all_ne.zip
rm all_ne.zip
unzip -q all_nv.zip
rm all_nv.zip
unzip -q all_nh.zip
rm all_nh.zip
unzip -q all_nj.zip
rm all_nj.zip
unzip -q all_nm.zip
rm all_nm.zip
unzip -q all_ny.zip
rm all_ny.zip
unzip -q all_nc.zip
rm all_nc.zip
unzip -q all_nd.zip
rm all_nd.zip
unzip -q all_oh.zip
rm all_oh.zip
unzip -q all_ok.zip
rm all_ok.zip
unzip -q all_or.zip
rm all_or.zip
unzip -q all_pa.zip
rm all_pa.zip
unzip -q all_pr.zip
rm all_pr.zip
unzip -q all_ri.zip
rm all_ri.zip
unzip -q all_sc.zip
rm all_sc.zip
unzip -q all_sd.zip
rm all_sd.zip
unzip -q all_tn.zip
rm all_tn.zip
unzip -q all_tx.zip
rm all_tx.zip
unzip -q all_us.zip
rm all_us.zip
unzip -q all_ut.zip
rm all_ut.zip
unzip -q all_vt.zip
rm all_vt.zip
unzip -q all_va.zip
rm all_va.zip
unzip -q all_wa.zip
rm all_wa.zip
unzip -q all_wv.zip
rm all_wv.zip
unzip -q all_wi.zip
rm all_wi.zip
unzip -q all_wy.zip
rm all_wy.zip

for i in prt03/sumfile/**/20071*.zip; do unzip -qn $i; done

# The lookup tables are in XLS only, so they'll be provided in the census-postgres
# package later.

# Some sequences have "ragged ends"/broken CSV column counts, so fix those:
for i in /mnt/tmp/acs2007_1yr/tab4/sumfile/prod/2007/data/e20071*0043000.txt; do
    python /home/ubuntu/census-postgres/meta-scripts/fix_csv.py $i $i.fixed.txt
    mv $i.fixed.txt $i
done
for i in /mnt/tmp/acs2007_1yr/tab4/sumfile/prod/2007/data/m20071*0043000.txt; do
    python /home/ubuntu/census-postgres/meta-scripts/fix_csv.py $i $i.fixed.txt
    mv $i.fixed.txt $i
done
for i in /mnt/tmp/acs2007_1yr/tab4/sumfile/prod/2007/data/e20071*0141000.txt; do
    python /home/ubuntu/census-postgres/meta-scripts/fix_csv.py --columns 44 $i $i.fixed.txt
    mv $i.fixed.txt $i
done
for i in /mnt/tmp/acs2007_1yr/tab4/sumfile/prod/2007/data/m20071*0141000.txt; do
    python /home/ubuntu/census-postgres/meta-scripts/fix_csv.py --columns 44 $i $i.fixed.txt
    mv $i.fixed.txt $i
done