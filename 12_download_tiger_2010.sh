# Download census-y TIGER data
# newest files for 2010 blocks are in https://census-backup.b-cdn.net/geo/tiger/TIGER2020/TABBLOCK/
# Includes "Island areas" blocks which aren't relevant to our project but we'll take 'em for now
# 2020 are in https://census-backup.b-cdn.net/geo/tiger/TIGER2020/TABBLOCK20/
mkdir -p /home/ubuntu/data/tiger2010

wget --recursive --continue --accept=tl_2010_??_tabblock10.zip \
    --no-parent --cut-dirs=3 --no-host-directories \
     -e robots=off \
     --directory-prefix=/home/ubuntu/data/tiger2010 \
    https://census-backup.b-cdn.net/geo/tiger/TIGER2010/TABBLOCK/2010/

mv /home/ubuntu/data/tiger2010/TABBLOCK/2010/*.zip /home/ubuntu/data/tiger2010/TABBLOCK
rmdir /home/ubuntu/data/tiger2010/TABBLOCK/2010
