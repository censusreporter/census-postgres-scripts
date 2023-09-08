# Download census-y TIGER data

mkdir -p /home/ubuntu/data/tiger2021

wget --recursive --continue --accept=*.zip \
     --no-parent --cut-dirs=3 --no-host-directories \
     -e robots=off \
     --directory-prefix=/home/ubuntu/data/tiger2021 \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2021/AIANNH/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2021/AITSN/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2021/ANRC/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2021/BG/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2021/CBSA/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2021/CD/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2021/CNECTA/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2021/CONCITY/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2021/COUNTY/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2021/COUSUB/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2021/CSA/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2021/ELSD/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2021/METDIV/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2021/NECTA/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2021/NECTADIV/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2021/PLACE/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2021/PUMA/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2021/SCSD/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2021/SLDL/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2021/SLDU/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2021/STATE/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2021/SUBMCD/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2021/TBG/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2021/TRACT/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2021/TTRACT/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2021/UAC/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2021/UNSD/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2021/ZCTA520/
