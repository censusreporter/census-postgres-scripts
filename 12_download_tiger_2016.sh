# Download census-y TIGER data

mkdir -p /mnt/tmp/tiger2015

wget --recursive --continue --accept=*.zip \
     --no-parent --cut-dirs=3 --no-host-directories \
     --directory-prefix=/mnt/tmp/tiger2015 \
    ftp://ftp2.census.gov/geo/tiger/TIGER2015/COUNTY/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2015/STATE/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2015/CBSA/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2015/CD/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2015/CSA/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2015/PLACE/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2015/ELSD/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2015/SCSD/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2015/ZCTA5/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2015/COUSUB/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2015/PUMA/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2015/SLDL/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2015/SLDU/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2015/AIANNH/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2015/AITS/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2015/ANRC/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2015/BG/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2015/CNECTA/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2015/CONCITY/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2015/METDIV/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2015/NECTA/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2015/NECTADIV/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2015/SUBMCD/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2015/TBG/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2015/TTRACT/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2015/TABBLOCK/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2015/TRACT/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2015/UAC/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2015/UNSD/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2015/VTD/
