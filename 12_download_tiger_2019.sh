# Download census-y TIGER data

mkdir -p /mnt/tmp/tiger2019

wget --recursive --continue --accept=*.zip \
     --no-parent --cut-dirs=3 --no-host-directories \
     -e robots=off \
     --directory-prefix=/mnt/tmp/tiger2019 \
    https://www2.census.gov/geo/tiger/TIGER2019/AIANNH/ \
    https://www2.census.gov/geo/tiger/TIGER2019/AITSN/ \
    https://www2.census.gov/geo/tiger/TIGER2019/ANRC/ \
    https://www2.census.gov/geo/tiger/TIGER2019/BG/ \
    https://www2.census.gov/geo/tiger/TIGER2019/CBSA/ \
    https://www2.census.gov/geo/tiger/TIGER2019/CD/ \
    https://www2.census.gov/geo/tiger/TIGER2019/CNECTA/ \
    https://www2.census.gov/geo/tiger/TIGER2019/CONCITY/ \
    https://www2.census.gov/geo/tiger/TIGER2019/COUNTY/ \
    https://www2.census.gov/geo/tiger/TIGER2019/COUSUB/ \
    https://www2.census.gov/geo/tiger/TIGER2019/CSA/ \
    https://www2.census.gov/geo/tiger/TIGER2019/ELSD/ \
    https://www2.census.gov/geo/tiger/TIGER2019/METDIV/ \
    https://www2.census.gov/geo/tiger/TIGER2019/NECTA/ \
    https://www2.census.gov/geo/tiger/TIGER2019/NECTADIV/ \
    https://www2.census.gov/geo/tiger/TIGER2019/PLACE/ \
    https://www2.census.gov/geo/tiger/TIGER2019/PUMA/ \
    https://www2.census.gov/geo/tiger/TIGER2019/SCSD/ \
    https://www2.census.gov/geo/tiger/TIGER2019/SLDL/ \
    https://www2.census.gov/geo/tiger/TIGER2019/SLDU/ \
    https://www2.census.gov/geo/tiger/TIGER2019/STATE/ \
    https://www2.census.gov/geo/tiger/TIGER2019/SUBMCD/ \
    https://www2.census.gov/geo/tiger/TIGER2019/TBG/ \
    https://www2.census.gov/geo/tiger/TIGER2019/TRACT/ \
    https://www2.census.gov/geo/tiger/TIGER2019/TTRACT/ \
    https://www2.census.gov/geo/tiger/TIGER2019/UAC/ \
    https://www2.census.gov/geo/tiger/TIGER2019/UNSD/ \
    https://www2.census.gov/geo/tiger/TIGER2019/VTD/ \
    https://www2.census.gov/geo/tiger/TIGER2019/ZCTA5/
