# Download census-y TIGER data

mkdir -p /home/ubuntu/data/tiger2023

wget --recursive --continue --accept=*.zip \
     --no-parent --cut-dirs=3 --no-host-directories \
     -e robots=off \
     --directory-prefix=/home/ubuntu/data/tiger2023 \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2023/AIANNH/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2023/AITSN/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2023/ANRC/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2023/BG/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2023/CD/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2023/CONCITY/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2023/COUNTY/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2023/COUSUB/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2023/ELSD/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2023/PLACE/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2023/PUMA/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2023/SCSD/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2023/SLDL/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2023/SLDU/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2023/STATE/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2023/TBG/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2023/TRACT/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2023/TTRACT/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2023/UAC/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2023/UNSD/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2023/ZCTA520/
