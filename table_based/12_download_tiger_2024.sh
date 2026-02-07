# Download census-y TIGER data

mkdir -p /home/ubuntu/data/tiger2024

wget --recursive --continue --accept=*.zip \
     --no-parent --cut-dirs=3 --no-host-directories \
     -e robots=off \
     --directory-prefix=/home/ubuntu/data/tiger2024 \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2024/AIANNH/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2024/AITSN/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2024/ANRC/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2024/BG/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2024/CBSA/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2024/CD/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2024/CONCITY/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2024/COUNTY/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2024/COUSUB/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2024/CSA/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2024/ELSD/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2024/METDIV/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2024/PLACE/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2024/PUMA20/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2024/SCSD/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2024/SLDL/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2024/SLDU/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2024/STATE/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2024/TBG/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2024/TRACT/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2024/TTRACT/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2024/UAC20/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2024/UNSD/ \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2024/ZCTA520/
