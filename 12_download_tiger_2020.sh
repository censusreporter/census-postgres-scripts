# Download census-y TIGER data

mkdir -p /home/ubuntu/data/tiger2020

wget --recursive --continue --accept=*.zip \
     --no-parent --cut-dirs=3 --no-host-directories \
     -e robots=off \
     --directory-prefix=/home/ubuntu/data/tiger2020 \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2020/AIANNH/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2020/AITSN/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2020/ANRC/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2020/BG/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2020/CBSA/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2020/CD/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2020/CNECTA/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2020/CONCITY/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2020/COUNTY/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2020/COUSUB/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2020/CSA/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2020/ELSD/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2020/METDIV/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2020/NECTA/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2020/NECTADIV/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2020/PLACE/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2020/PUMA/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2020/SCSD/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2020/SLDL/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2020/SLDU/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2020/STATE/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2020/SUBMCD/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2020/TBG/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2020/TRACT/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2020/TTRACT/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2020/UAC/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2020/UNSD/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2020/ZCTA5/
