#!/bin/bash

# Make a data directory in ephemeral stoage
sudo mkdir -p /mnt/tmp
sudo chown ubuntu /mnt/tmp

# Grab the 2008 ACS 3 year
cd /mnt/tmp
mkdir -p acs2007_3yr
cd acs2007_3yr
sudo apt-get -y install unzip
curl -O "http://www2.census.gov/acs2007_3yr/summaryfile/Alabama/all_al.zip"
unzip all_al.zip
rm all_al.zip
curl -O "http://www2.census.gov/acs2007_3yr/summaryfile/Alaska/all_ak.zip"
unzip all_ak.zip
rm all_ak.zip
curl -O "http://www2.census.gov/acs2007_3yr/summaryfile/Arizona/all_az.zip"
unzip all_az.zip
rm all_az.zip
curl -O "http://www2.census.gov/acs2007_3yr/summaryfile/Arkansas/all_ar.zip"
unzip all_ar.zip
rm all_ar.zip
curl -O "http://www2.census.gov/acs2007_3yr/summaryfile/California/all_ca.zip"
unzip all_ca.zip
rm all_ca.zip
curl -O "http://www2.census.gov/acs2007_3yr/summaryfile/Colorado/all_co.zip"
unzip all_co.zip
rm all_co.zip
curl -O "http://www2.census.gov/acs2007_3yr/summaryfile/Connecticut/all_ct.zip"
unzip all_ct.zip
rm all_ct.zip
curl -O "http://www2.census.gov/acs2007_3yr/summaryfile/Delaware/all_de.zip"
unzip all_de.zip
rm all_de.zip
curl -O "http://www2.census.gov/acs2007_3yr/summaryfile/DistrictofColumbia/all_dc.zip"
unzip all_dc.zip
rm all_dc.zip
curl -O "http://www2.census.gov/acs2007_3yr/summaryfile/Florida/all_fl.zip"
unzip all_fl.zip
rm all_fl.zip
curl -O "http://www2.census.gov/acs2007_3yr/summaryfile/Georgia/all_ga.zip"
unzip all_ga.zip
rm all_ga.zip
curl -O "http://www2.census.gov/acs2007_3yr/summaryfile/Hawaii/all_hi.zip"
unzip all_hi.zip
rm all_hi.zip
curl -O "http://www2.census.gov/acs2007_3yr/summaryfile/Idaho/all_id.zip"
unzip all_id.zip
rm all_id.zip
curl -O "http://www2.census.gov/acs2007_3yr/summaryfile/Illinois/all_il.zip"
unzip all_il.zip
rm all_il.zip
curl -O "http://www2.census.gov/acs2007_3yr/summaryfile/Indiana/all_in.zip"
unzip all_in.zip
rm all_in.zip
curl -O "http://www2.census.gov/acs2007_3yr/summaryfile/Iowa/all_ia.zip"
unzip all_ia.zip
rm all_ia.zip
curl -O "http://www2.census.gov/acs2007_3yr/summaryfile/Kansas/all_ks.zip"
unzip all_ks.zip
rm all_ks.zip
curl -O "http://www2.census.gov/acs2007_3yr/summaryfile/Kentucky/all_ky.zip"
unzip all_ky.zip
rm all_ky.zip
curl -O "http://www2.census.gov/acs2007_3yr/summaryfile/Louisiana/all_la.zip"
unzip all_la.zip
rm all_la.zip
curl -O "http://www2.census.gov/acs2007_3yr/summaryfile/Maine/all_me.zip"
unzip all_me.zip
rm all_me.zip
curl -O "http://www2.census.gov/acs2007_3yr/summaryfile/Maryland/all_md.zip"
unzip all_md.zip
rm all_md.zip
curl -O "http://www2.census.gov/acs2007_3yr/summaryfile/Massachusetts/all_ma.zip"
unzip all_ma.zip
rm all_ma.zip
curl -O "http://www2.census.gov/acs2007_3yr/summaryfile/Michigan/all_mi.zip"
unzip all_mi.zip
rm all_mi.zip
curl -O "http://www2.census.gov/acs2007_3yr/summaryfile/Minnesota/all_mn.zip"
unzip all_mn.zip
rm all_mn.zip
curl -O "http://www2.census.gov/acs2007_3yr/summaryfile/Mississippi/all_ms.zip"
unzip all_ms.zip
rm all_ms.zip
curl -O "http://www2.census.gov/acs2007_3yr/summaryfile/Missouri/all_mo.zip"
unzip all_mo.zip
rm all_mo.zip
curl -O "http://www2.census.gov/acs2007_3yr/summaryfile/Montana/all_mt.zip"
unzip all_mt.zip
rm all_mt.zip
curl -O "http://www2.census.gov/acs2007_3yr/summaryfile/Nebraska/all_ne.zip"
unzip all_ne.zip
rm all_ne.zip
curl -O "http://www2.census.gov/acs2007_3yr/summaryfile/Nevada/all_nv.zip"
unzip all_nv.zip
rm all_nv.zip
curl -O "http://www2.census.gov/acs2007_3yr/summaryfile/NewHampshire/all_nh.zip"
unzip all_nh.zip
rm all_nh.zip
curl -O "http://www2.census.gov/acs2007_3yr/summaryfile/NewJersey/all_nj.zip"
unzip all_nj.zip
rm all_nj.zip
curl -O "http://www2.census.gov/acs2007_3yr/summaryfile/NewMexico/all_nm.zip"
unzip all_nm.zip
rm all_nm.zip
curl -O "http://www2.census.gov/acs2007_3yr/summaryfile/NewYork/all_ny.zip"
unzip all_ny.zip
rm all_ny.zip
curl -O "http://www2.census.gov/acs2007_3yr/summaryfile/NorthCarolina/all_nc.zip"
unzip all_nc.zip
rm all_nc.zip
curl -O "http://www2.census.gov/acs2007_3yr/summaryfile/NorthDakota/all_nd.zip"
unzip all_nd.zip
rm all_nd.zip
curl -O "http://www2.census.gov/acs2007_3yr/summaryfile/Ohio/all_oh.zip"
unzip all_oh.zip
rm all_oh.zip
curl -O "http://www2.census.gov/acs2007_3yr/summaryfile/Oklahoma/all_ok.zip"
unzip all_ok.zip
rm all_ok.zip
curl -O "http://www2.census.gov/acs2007_3yr/summaryfile/Oregon/all_or.zip"
unzip all_or.zip
rm all_or.zip
curl -O "http://www2.census.gov/acs2007_3yr/summaryfile/Pennsylvania/all_pa.zip"
unzip all_pa.zip
rm all_pa.zip
curl -O "http://www2.census.gov/acs2007_3yr/summaryfile/PuertoRico/all_pr.zip"
unzip all_pr.zip
rm all_pr.zip
curl -O "http://www2.census.gov/acs2007_3yr/summaryfile/RhodeIsland/all_ri.zip"
unzip all_ri.zip
rm all_ri.zip
curl -O "http://www2.census.gov/acs2007_3yr/summaryfile/SouthCarolina/all_sc.zip"
unzip all_sc.zip
rm all_sc.zip
curl -O "http://www2.census.gov/acs2007_3yr/summaryfile/SouthDakota/all_sd.zip"
unzip all_sd.zip
rm all_sd.zip
curl -O "http://www2.census.gov/acs2007_3yr/summaryfile/Tennessee/all_tn.zip"
unzip all_tn.zip
rm all_tn.zip
curl -O "http://www2.census.gov/acs2007_3yr/summaryfile/Texas/all_tx.zip"
unzip all_tx.zip
rm all_tx.zip
curl -O "http://www2.census.gov/acs2007_3yr/summaryfile/UnitedStates/all_us.zip"
unzip all_us.zip
rm all_us.zip
curl -O "http://www2.census.gov/acs2007_3yr/summaryfile/Utah/all_ut.zip"
unzip all_ut.zip
rm all_ut.zip
curl -O "http://www2.census.gov/acs2007_3yr/summaryfile/Vermont/all_vt.zip"
unzip all_vt.zip
rm all_vt.zip
curl -O "http://www2.census.gov/acs2007_3yr/summaryfile/Virginia/all_va.zip"
unzip all_va.zip
rm all_va.zip
curl -O "http://www2.census.gov/acs2007_3yr/summaryfile/Washington/all_wa.zip"
unzip all_wa.zip
rm all_wa.zip
curl -O "http://www2.census.gov/acs2007_3yr/summaryfile/WestVirginia/all_wv.zip"
unzip all_wv.zip
rm all_wv.zip
curl -O "http://www2.census.gov/acs2007_3yr/summaryfile/Wisconsin/all_wi.zip"
unzip all_wi.zip
rm all_wi.zip
curl -O "http://www2.census.gov/acs2007_3yr/summaryfile/Wyoming/all_wy.zip"
unzip all_wy.zip
rm all_wy.zip

rm all_ACSSF.zip
for i in prt03/prod/sumfile/data/2006thru2008/**/20083*.zip; do unzip -n $i; done

# The lookup tables are in XLS only, so they'll be provided in the census-postgres
# package later.
