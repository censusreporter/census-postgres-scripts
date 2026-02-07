# Download census-y TIGER data

mkdir -p /home/ubuntu/data/tiger2024

wget --recursive --continue --accept=*.zip \
     --no-parent --cut-dirs=3 --no-host-directories \
     -e robots=off \
     --directory-prefix=/home/ubuntu/data/tiger2024 \
    https://www2.census.gov/geo/tiger/TIGER2024/AIANNH/ \
    https://www2.census.gov/geo/tiger/TIGER2024/AITSN/ \
    https://www2.census.gov/geo/tiger/TIGER2024/ANRC/ \
    https://www2.census.gov/geo/tiger/TIGER2024/BG/ \
    https://www2.census.gov/geo/tiger/TIGER2024/CBSA/ \
    https://www2.census.gov/geo/tiger/TIGER2024/CD/ \
    https://www2.census.gov/geo/tiger/TIGER2024/CONCITY/ \
    https://www2.census.gov/geo/tiger/TIGER2024/COUNTY/ \
    https://www2.census.gov/geo/tiger/TIGER2024/COUSUB/ \
    https://www2.census.gov/geo/tiger/TIGER2024/CSA/ \
    https://www2.census.gov/geo/tiger/TIGER2024/ELSD/ \
    https://www2.census.gov/geo/tiger/TIGER2024/METDIV/ \
    https://www2.census.gov/geo/tiger/TIGER2024/PLACE/ \
    https://www2.census.gov/geo/tiger/TIGER2024/PUMA/ \
    https://www2.census.gov/geo/tiger/TIGER2024/SCSD/ \
    https://www2.census.gov/geo/tiger/TIGER2024/SLDL/ \
    https://www2.census.gov/geo/tiger/TIGER2024/SLDU/ \
    https://www2.census.gov/geo/tiger/TIGER2024/STATE/ \
    https://www2.census.gov/geo/tiger/TIGER2024/TBG/ \
    https://www2.census.gov/geo/tiger/TIGER2024/TRACT/ \
    https://www2.census.gov/geo/tiger/TIGER2024/TTRACT/ \
    https://www2.census.gov/geo/tiger/TIGER2024/UAC/ \
    https://www2.census.gov/geo/tiger/TIGER2024/UNSD/ \
    https://www2.census.gov/geo/tiger/TIGER2024/ZCTA520/
