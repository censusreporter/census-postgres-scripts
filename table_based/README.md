Adapting to the new ACS table-based summary file format
=======================================================
After working through this, we chose to change the geoids given in table-based to match 
Census Reporter's pattern (5 char + US prefix, instead of 7 char + US), because
it would be difficult to match the 7 char prefixes to TIGER data.

So, the only specific changes are to the download and import ACS; the tiger changes and AIANNH 
are not changed.


existing 2021-specific scripts:
* 02_download_acs_2021_1yr.sh
* 02_download_acs_2021_5yr.sh
* 03_import_acs_2021_1yr.sh
* 03_import_acs_2021_5yr.sh
* 12_download_tiger_2021.sh
* 13_import_tiger_2021.sh
* 13_index_tiger_2021.sql
* 14_aiannh_tables_2021.sql

other scripts:
* 01_set_up_postgresql.sh
* 05_create_ebs_snapshot.sh
* 15_cbsa_geocontainment_2020.sql (year specific but none for 2021)
