# Download census-y TIGER data

mkdir -p /mnt/tmp/tiger2014

wget --recursive --continue --accept=*.zip \
     --no-parent --cut-dirs=3 --no-host-directories \
     --directory-prefix=/mnt/tmp/tiger2014 \
    ftp://ftp2.census.gov/geo/tiger/TIGER2014/COUNTY/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2014/STATE/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2014/CBSA/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2014/CD/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2014/CSA/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2014/PLACE/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2014/ELSD/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2014/SCSD/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2014/ZCTA5/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2014/COUSUB/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2014/PUMA/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2014/SLDL/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2014/SLDU/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2014/AIANNH/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2014/AITS/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2014/ANRC/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2014/BG/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2014/CNECTA/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2014/CONCITY/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2014/METDIV/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2014/NECTA/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2014/NECTADIV/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2014/SUBMCD/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2014/TBG/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2014/TTRACT/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2014/TABBLOCK/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2014/TRACT/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2014/UAC/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2014/UNSD/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2014/VTD/
