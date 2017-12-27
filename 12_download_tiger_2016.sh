# Download census-y TIGER data

mkdir -p /mnt/tmp/tiger2016

wget --recursive --continue --accept=*.zip \
     --no-parent --cut-dirs=3 --no-host-directories \
     --directory-prefix=/mnt/tmp/tiger2016 \
    ftp://ftp2.census.gov/geo/tiger/TIGER2016/COUNTY/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2016/STATE/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2016/CBSA/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2016/CD/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2016/CSA/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2016/PLACE/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2016/ELSD/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2016/SCSD/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2016/ZCTA5/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2016/COUSUB/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2016/PUMA/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2016/SLDL/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2016/SLDU/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2016/AIANNH/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2016/AITS/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2016/ANRC/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2016/BG/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2016/CNECTA/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2016/CONCITY/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2016/METDIV/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2016/NECTA/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2016/NECTADIV/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2016/SUBMCD/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2016/TBG/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2016/TTRACT/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2016/TABBLOCK/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2016/TRACT/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2016/UAC/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2016/UNSD/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2016/VTD/
