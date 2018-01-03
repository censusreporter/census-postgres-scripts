# Download census-y TIGER data

mkdir -p /mnt/tmp/tiger2016

wget --recursive --continue --accept=*.zip \
     --no-parent --cut-dirs=3 --no-host-directories \
     -e robots=off \
     --directory-prefix=/mnt/tmp/tiger2016 \
    https://www2.census.gov/geo/tiger/TIGER2016/AIANNH/ \
    https://www2.census.gov/geo/tiger/TIGER2016/AITS/ \
    https://www2.census.gov/geo/tiger/TIGER2016/ANRC/ \
    https://www2.census.gov/geo/tiger/TIGER2016/BG/ \
    https://www2.census.gov/geo/tiger/TIGER2016/CBSA/ \
    https://www2.census.gov/geo/tiger/TIGER2016/CD/ \
    https://www2.census.gov/geo/tiger/TIGER2016/CNECTA/ \
    https://www2.census.gov/geo/tiger/TIGER2016/CONCITY/ \
    https://www2.census.gov/geo/tiger/TIGER2016/COUNTY/ \
    https://www2.census.gov/geo/tiger/TIGER2016/COUSUB/ \
    https://www2.census.gov/geo/tiger/TIGER2016/CSA/ \
    https://www2.census.gov/geo/tiger/TIGER2016/ELSD/ \
    https://www2.census.gov/geo/tiger/TIGER2016/METDIV/ \
    https://www2.census.gov/geo/tiger/TIGER2016/NECTA/ \
    https://www2.census.gov/geo/tiger/TIGER2016/NECTADIV/ \
    https://www2.census.gov/geo/tiger/TIGER2016/PLACE/ \
    https://www2.census.gov/geo/tiger/TIGER2016/PUMA/ \
    https://www2.census.gov/geo/tiger/TIGER2016/SCSD/ \
    https://www2.census.gov/geo/tiger/TIGER2016/SLDL/ \
    https://www2.census.gov/geo/tiger/TIGER2016/SLDU/ \
    https://www2.census.gov/geo/tiger/TIGER2016/STATE/ \
    https://www2.census.gov/geo/tiger/TIGER2016/SUBMCD/ \
    https://www2.census.gov/geo/tiger/TIGER2016/TBG/ \
    https://www2.census.gov/geo/tiger/TIGER2016/TRACT/ \
    https://www2.census.gov/geo/tiger/TIGER2016/TTRACT/ \
    https://www2.census.gov/geo/tiger/TIGER2016/UAC/ \
    https://www2.census.gov/geo/tiger/TIGER2016/UNSD/ \
    https://www2.census.gov/geo/tiger/TIGER2016/VTD/ \
    https://www2.census.gov/geo/tiger/TIGER2016/ZCTA5/
