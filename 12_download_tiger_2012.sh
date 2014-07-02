# Download census-y TIGER data

mkdir -p /mnt/tmp/tiger2012

wget --recursive --continue --accept=*.zip \
     --no-parent --cut-dirs=3 --no-host-directories \
     --directory-prefix=/mnt/tmp/tiger2012 \
    ftp://ftp2.census.gov/geo/tiger/TIGER2012/COUNTY/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2012/STATE/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2012/CBSA/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2013/CD/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2012/CSA/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2012/PLACE/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2012/ELSD/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2012/SCSD/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2012/ZCTA5/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2012/COUSUB/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2012/PUMA/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2013/SLDL/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2013/SLDU/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2012/AIANNH/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2012/AITS/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2012/ANRC/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2012/BG/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2012/CNECTA/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2012/CONCITY/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2012/METDIV/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2012/NECTA/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2012/NECTADIV/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2012/SUBMCD/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2012/TBG/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2012/TTRACT/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2012/TABBLOCK/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2012/TRACT/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2012/UAC/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2012/UNSD/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2012/VTD/
