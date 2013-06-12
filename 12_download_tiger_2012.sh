# Download census-y TIGER data

cd /mnt

wget --mirror --continue \
    ftp://ftp2.census.gov/geo/tiger/TIGER2012/COUNTY/*.zip \
    ftp://ftp2.census.gov/geo/tiger/TIGER2012/STATE/*.zip \
    ftp://ftp2.census.gov/geo/tiger/TIGER2012/CBSA/*.zip \
    ftp://ftp2.census.gov/geo/tiger/TIGER2012/CD/*.zip \
    ftp://ftp2.census.gov/geo/tiger/TIGER2012/CSA/*.zip \
    ftp://ftp2.census.gov/geo/tiger/TIGER2012/PLACE/*.zip \
    ftp://ftp2.census.gov/geo/tiger/TIGER2012/ELSD/*.zip \
    ftp://ftp2.census.gov/geo/tiger/TIGER2012/SCSD/*.zip \
    ftp://ftp2.census.gov/geo/tiger/TIGER2012/ZCTA5/*.zip \
    ftp://ftp2.census.gov/geo/tiger/TIGER2012/COUSUB/*.zip \
    ftp://ftp2.census.gov/geo/tiger/TIGER2012/PUMA/*.zip \
    ftp://ftp2.census.gov/geo/tiger/TIGER2012/SLDL/*.zip \
    ftp://ftp2.census.gov/geo/tiger/TIGER2012/SLDU/*.zip \
    ftp://ftp2.census.gov/geo/tiger/TIGER2012/AIANNH/*.zip \
    ftp://ftp2.census.gov/geo/tiger/TIGER2012/AITS/*.zip \
    ftp://ftp2.census.gov/geo/tiger/TIGER2012/ANRC/*.zip \
    ftp://ftp2.census.gov/geo/tiger/TIGER2012/BG/*.zip \
    ftp://ftp2.census.gov/geo/tiger/TIGER2012/CNECTA/*.zip \
    ftp://ftp2.census.gov/geo/tiger/TIGER2012/CONCITY/*.zip \
    ftp://ftp2.census.gov/geo/tiger/TIGER2012/METDIV/*.zip \
    ftp://ftp2.census.gov/geo/tiger/TIGER2012/NECTA/*.zip \
    ftp://ftp2.census.gov/geo/tiger/TIGER2012/NECTADIV/*.zip \
    ftp://ftp2.census.gov/geo/tiger/TIGER2012/SUBMCD/*.zip \
    ftp://ftp2.census.gov/geo/tiger/TIGER2012/TBG/*.zip \
    ftp://ftp2.census.gov/geo/tiger/TIGER2012/TTRACT/*.zip \
    ftp://ftp2.census.gov/geo/tiger/TIGER2012/TABBLOCK/*.zip \
    ftp://ftp2.census.gov/geo/tiger/TIGER2012/TRACT/*.zip \
    ftp://ftp2.census.gov/geo/tiger/TIGER2012/UAC/*.zip \
    ftp://ftp2.census.gov/geo/tiger/TIGER2012/UNSD/*.zip \
    ftp://ftp2.census.gov/geo/tiger/TIGER2012/VTD/*.zip
