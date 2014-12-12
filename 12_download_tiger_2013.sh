# Download census-y TIGER data

mkdir -p /mnt/tmp/tiger2013

wget --recursive --continue --accept=*.zip \
     --no-parent --cut-dirs=3 --no-host-directories \
     --directory-prefix=/mnt/tmp/tiger2013 \
    ftp://ftp2.census.gov/geo/tiger/TIGER2013/COUNTY/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2013/STATE/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2013/CBSA/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2013/CD/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2013/CSA/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2013/PLACE/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2013/ELSD/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2013/SCSD/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2013/ZCTA5/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2013/COUSUB/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2013/PUMA/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2013/SLDL/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2013/SLDU/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2013/AIANNH/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2013/AITS/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2013/ANRC/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2013/BG/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2013/CNECTA/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2013/CONCITY/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2013/METDIV/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2013/NECTA/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2013/NECTADIV/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2013/SUBMCD/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2013/TBG/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2013/TTRACT/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2013/TABBLOCK/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2013/TRACT/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2013/UAC/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2013/UNSD/ \
    ftp://ftp2.census.gov/geo/tiger/TIGER2013/VTD/
