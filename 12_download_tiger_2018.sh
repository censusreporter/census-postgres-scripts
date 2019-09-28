# Download census-y TIGER data

mkdir -p /mnt/tmp/tiger2018

wget --recursive --continue --accept=*.zip \
     --no-parent --cut-dirs=3 --no-host-directories \
     -e robots=off \
     --directory-prefix=/mnt/tmp/tiger2018 \
    https://www2.census.gov/geo/tiger/TIGER2018/AIANNH/ \
    https://www2.census.gov/geo/tiger/TIGER2018/AITSN/ \
    https://www2.census.gov/geo/tiger/TIGER2018/ANRC/ \
    https://www2.census.gov/geo/tiger/TIGER2018/BG/ \
    https://www2.census.gov/geo/tiger/TIGER2018/CBSA/ \
    https://www2.census.gov/geo/tiger/TIGER2018/CD/ \
    https://www2.census.gov/geo/tiger/TIGER2018/CNECTA/ \
    https://www2.census.gov/geo/tiger/TIGER2018/CONCITY/ \
    https://www2.census.gov/geo/tiger/TIGER2018/COUNTY/ \
    https://www2.census.gov/geo/tiger/TIGER2018/COUSUB/ \
    https://www2.census.gov/geo/tiger/TIGER2018/CSA/ \
    https://www2.census.gov/geo/tiger/TIGER2018/ELSD/ \
    https://www2.census.gov/geo/tiger/TIGER2018/METDIV/ \
    https://www2.census.gov/geo/tiger/TIGER2018/NECTA/ \
    https://www2.census.gov/geo/tiger/TIGER2018/NECTADIV/ \
    https://www2.census.gov/geo/tiger/TIGER2018/PLACE/ \
    https://www2.census.gov/geo/tiger/TIGER2018/PUMA/ \
    https://www2.census.gov/geo/tiger/TIGER2018/SCSD/ \
    https://www2.census.gov/geo/tiger/TIGER2018/SLDL/ \
    https://www2.census.gov/geo/tiger/TIGER2018/SLDU/ \
    https://www2.census.gov/geo/tiger/TIGER2018/STATE/ \
    https://www2.census.gov/geo/tiger/TIGER2018/SUBMCD/ \
    https://www2.census.gov/geo/tiger/TIGER2018/TBG/ \
    https://www2.census.gov/geo/tiger/TIGER2018/TRACT/ \
    https://www2.census.gov/geo/tiger/TIGER2018/TTRACT/ \
    https://www2.census.gov/geo/tiger/TIGER2018/UAC/ \
    https://www2.census.gov/geo/tiger/TIGER2018/UNSD/ \
    https://www2.census.gov/geo/tiger/TIGER2018/VTD/ \
    https://www2.census.gov/geo/tiger/TIGER2018/ZCTA5/
