# Download census-y TIGER data

mkdir -p /mnt/tmp/tiger2017

wget --recursive --continue --accept=*.zip \
     --no-parent --cut-dirs=3 --no-host-directories \
     -e robots=off \
     --directory-prefix=/mnt/tmp/tiger2017 \
    https://www2.census.gov/geo/tiger/TIGER2017/AIANNH/ \
    https://www2.census.gov/geo/tiger/TIGER2017/AITSN/ \
    https://www2.census.gov/geo/tiger/TIGER2017/ANRC/ \
    https://www2.census.gov/geo/tiger/TIGER2017/BG/ \
    https://www2.census.gov/geo/tiger/TIGER2017/CBSA/ \
    https://www2.census.gov/geo/tiger/TIGER2017/CD/ \
    https://www2.census.gov/geo/tiger/TIGER2017/CNECTA/ \
    https://www2.census.gov/geo/tiger/TIGER2017/CONCITY/ \
    https://www2.census.gov/geo/tiger/TIGER2017/COUNTY/ \
    https://www2.census.gov/geo/tiger/TIGER2017/COUSUB/ \
    https://www2.census.gov/geo/tiger/TIGER2017/CSA/ \
    https://www2.census.gov/geo/tiger/TIGER2017/ELSD/ \
    https://www2.census.gov/geo/tiger/TIGER2017/METDIV/ \
    https://www2.census.gov/geo/tiger/TIGER2017/NECTA/ \
    https://www2.census.gov/geo/tiger/TIGER2017/NECTADIV/ \
    https://www2.census.gov/geo/tiger/TIGER2017/PLACE/ \
    https://www2.census.gov/geo/tiger/TIGER2017/PUMA/ \
    https://www2.census.gov/geo/tiger/TIGER2017/SCSD/ \
    https://www2.census.gov/geo/tiger/TIGER2017/SLDL/ \
    https://www2.census.gov/geo/tiger/TIGER2017/SLDU/ \
    https://www2.census.gov/geo/tiger/TIGER2017/STATE/ \
    https://www2.census.gov/geo/tiger/TIGER2017/SUBMCD/ \
    https://www2.census.gov/geo/tiger/TIGER2017/TBG/ \
    https://www2.census.gov/geo/tiger/TIGER2017/TRACT/ \
    https://www2.census.gov/geo/tiger/TIGER2017/TTRACT/ \
    https://www2.census.gov/geo/tiger/TIGER2017/UAC/ \
    https://www2.census.gov/geo/tiger/TIGER2017/UNSD/ \
    https://www2.census.gov/geo/tiger/TIGER2017/VTD/ \
    https://www2.census.gov/geo/tiger/TIGER2017/ZCTA5/
