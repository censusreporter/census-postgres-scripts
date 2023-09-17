# Download census-y TIGER data

mkdir -p /home/ubuntu/data/tiger2022

wget --recursive --continue --accept=*.zip \
     --no-parent --cut-dirs=3 --no-host-directories \
     -e robots=off \
     --directory-prefix=/home/ubuntu/data/tiger2022 \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2022/AIANNH/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2022/AITSN/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2022/ANRC/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2022/BG/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2022/CD/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2022/CONCITY/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2022/COUNTY/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2022/COUSUB/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2022/ELSD/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2022/PLACE/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2022/PUMA/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2022/SCSD/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2022/SLDL/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2022/SLDU/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2022/STATE/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2022/TBG/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2022/TRACT/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2022/TTRACT/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2022/UAC/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2022/UNSD/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2022/ZCTA520/
