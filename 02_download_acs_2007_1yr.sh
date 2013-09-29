#!/bin/bash

# Make a data directory in ephemeral stoage
sudo mkdir -p /mnt/tmp
sudo chown ubuntu /mnt/tmp

# Grab the 2007 ACS 1 year
cd /mnt/tmp
mkdir -p acs2007_1yr
cd acs2007_1yr
sudo apt-get -y install unzip
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Alabama/all_al.zip"
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Alabama/g20071al.txt"
unzip all_al.zip
rm all_al.zip
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Alaska/all_ak.zip"
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Alaska/g20071ak.txt"
unzip all_ak.zip
rm all_ak.zip
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Arizona/all_az.zip"
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Arizona/g20071az.txt"
unzip all_az.zip
rm all_az.zip
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Arkansas/all_ar.zip"
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Arkansas/g20071ar.txt"
unzip all_ar.zip
rm all_ar.zip
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/California/all_ca.zip"
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/California/g20071ca.txt"
unzip all_ca.zip
rm all_ca.zip
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Colorado/all_co.zip"
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Colorado/g20071co.txt"
unzip all_co.zip
rm all_co.zip
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Connecticut/all_ct.zip"
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Connecticut/g20071ct.txt"
unzip all_ct.zip
rm all_ct.zip
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Delaware/all_de.zip"
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Delaware/g20071de.txt"
unzip all_de.zip
rm all_de.zip
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/DistrictofColumbia/all_dc.zip"
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/DistrictofColumbia/g20071dc.txt"
unzip all_dc.zip
rm all_dc.zip
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Florida/all_fl.zip"
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Florida/g20071fl.txt"
unzip all_fl.zip
rm all_fl.zip
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Georgia/all_ga.zip"
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Georgia/g20071ga.txt"
unzip all_ga.zip
rm all_ga.zip
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Hawaii/all_hi.zip"
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Hawaii/g20071hi.txt"
unzip all_hi.zip
rm all_hi.zip
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Idaho/all_id.zip"
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Idaho/g20071id.txt"
unzip all_id.zip
rm all_id.zip
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Illinois/all_il.zip"
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Illinois/g20071il.txt"
unzip all_il.zip
rm all_il.zip
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Indiana/all_in.zip"
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Indiana/g20071in.txt"
unzip all_in.zip
rm all_in.zip
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Iowa/all_ia.zip"
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Iowa/g20071ia.txt"
unzip all_ia.zip
rm all_ia.zip
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Kansas/all_ks.zip"
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Kansas/g20071ks.txt"
unzip all_ks.zip
rm all_ks.zip
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Kentucky/all_ky.zip"
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Kentucky/g20071ky.txt"
unzip all_ky.zip
rm all_ky.zip
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Louisiana/all_la.zip"
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Louisiana/g20071la.txt"
unzip all_la.zip
rm all_la.zip
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Maine/all_me.zip"
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Maine/g20071me.txt"
unzip all_me.zip
rm all_me.zip
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Maryland/all_md.zip"
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Maryland/g20071md.txt"
unzip all_md.zip
rm all_md.zip
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Massachusetts/all_ma.zip"
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Massachusetts/g20071ma.txt"
unzip all_ma.zip
rm all_ma.zip
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Michigan/all_mi.zip"
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Michigan/g20071mi.txt"
unzip all_mi.zip
rm all_mi.zip
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Minnesota/all_mn.zip"
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Minnesota/g20071mn.txt"
unzip all_mn.zip
rm all_mn.zip
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Mississippi/all_ms.zip"
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Mississippi/g20071ms.txt"
unzip all_ms.zip
rm all_ms.zip
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Missouri/all_mo.zip"
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Missouri/g20071mo.txt"
unzip all_mo.zip
rm all_mo.zip
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Montana/all_mt.zip"
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Montana/g20071mt.txt"
unzip all_mt.zip
rm all_mt.zip
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Nebraska/all_ne.zip"
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Nebraska/g20071ne.txt"
unzip all_ne.zip
rm all_ne.zip
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Nevada/all_nv.zip"
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Nevada/g20071nv.txt"
unzip all_nv.zip
rm all_nv.zip
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/NewHampshire/all_nh.zip"
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/NewHampshire/g20071nh.txt"
unzip all_nh.zip
rm all_nh.zip
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/NewJersey/all_nj.zip"
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/NewJersey/g20071nj.txt"
unzip all_nj.zip
rm all_nj.zip
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/NewMexico/all_nm.zip"
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/NewMexico/g20071nm.txt"
unzip all_nm.zip
rm all_nm.zip
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/NewYork/all_ny.zip"
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/NewYork/g20071ny.txt"
unzip all_ny.zip
rm all_ny.zip
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/NorthCarolina/all_nc.zip"
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/NorthCarolina/g20071nc.txt"
unzip all_nc.zip
rm all_nc.zip
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/NorthDakota/all_nd.zip"
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/NorthDakota/g20071nd.txt"
unzip all_nd.zip
rm all_nd.zip
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Ohio/all_oh.zip"
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Ohio/g20071oh.txt"
unzip all_oh.zip
rm all_oh.zip
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Oklahoma/all_ok.zip"
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Oklahoma/g20071ok.txt"
unzip all_ok.zip
rm all_ok.zip
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Oregon/all_or.zip"
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Oregon/g20071or.txt"
unzip all_or.zip
rm all_or.zip
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Pennsylvania/all_pa.zip"
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Pennsylvania/g20071pa.txt"
unzip all_pa.zip
rm all_pa.zip
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/PuertoRico/all_pr.zip"
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/PuertoRico/g20071pr.txt"
unzip all_pr.zip
rm all_pr.zip
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/RhodeIsland/all_ri.zip"
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/RhodeIsland/g20071ri.txt"
unzip all_ri.zip
rm all_ri.zip
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/SouthCarolina/all_sc.zip"
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/SouthCarolina/g20071sc.txt"
unzip all_sc.zip
rm all_sc.zip
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/SouthDakota/all_sd.zip"
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/SouthDakota/g20071sd.txt"
unzip all_sd.zip
rm all_sd.zip
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Tennessee/all_tn.zip"
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Tennessee/g20071tn.txt"
unzip all_tn.zip
rm all_tn.zip
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Texas/all_tx.zip"
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Texas/g20071tx.txt"
unzip all_tx.zip
rm all_tx.zip
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/UnitedStates/all_us.zip"
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/UnitedStates/g20071us.txt"
unzip all_us.zip
rm all_us.zip
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Utah/all_ut.zip"
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Utah/g20071ut.txt"
unzip all_ut.zip
rm all_ut.zip
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Vermont/all_vt.zip"
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Vermont/g20071vt.txt"
unzip all_vt.zip
rm all_vt.zip
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Virginia/all_va.zip"
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Virginia/g20071va.txt"
unzip all_va.zip
rm all_va.zip
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Washington/all_wa.zip"
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Washington/g20071wa.txt"
unzip all_wa.zip
rm all_wa.zip
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/WestVirginia/all_wv.zip"
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/WestVirginia/g20071wv.txt"
unzip all_wv.zip
rm all_wv.zip
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Wisconsin/all_wi.zip"
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Wisconsin/g20071wi.txt"
unzip all_wi.zip
rm all_wi.zip
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Wyoming/all_wy.zip"
curl -O "http://www2.census.gov/acs2007_1yr/summaryfile/Wyoming/g20071wy.txt"
unzip all_wy.zip
rm all_wy.zip

for i in prt03/sumfile/**/20071*.zip; do unzip -n $i; done

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