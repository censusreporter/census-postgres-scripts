# Download census-y TIGER data

mkdir -p /mnt/tmp/tiger2019

wget --recursive --continue --accept=*.zip \
     --no-parent --cut-dirs=3 --no-host-directories \
     -e robots=off \
     --directory-prefix=/mnt/tmp/tiger2019 \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2019/AIANNH/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2019/AITSN/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2019/ANRC/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2019/BG/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2019/CBSA/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2019/CD/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2019/CNECTA/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2019/CONCITY/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2019/COUNTY/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2019/COUSUB/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2019/CSA/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2019/ELSD/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2019/METDIV/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2019/NECTA/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2019/NECTADIV/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2019/PLACE/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2019/PUMA/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2019/SCSD/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2019/SLDL/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2019/SLDU/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2019/STATE/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2019/SUBMCD/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2019/TBG/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2019/TRACT/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2019/TTRACT/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2019/UAC/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2019/UNSD/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2019/ZCTA5/
