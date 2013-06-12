cd /mnt/tiger2012
for i in **/*.zip; do unzip $i -d `dirname $i`; rm $i; done

sudo -u postgres psql -c "DROP SCHEMA IF EXISTS tiger2012; CREATE SCHEMA tiger2012;"

for i in AIANNH AITS ANRC BG CBSA CD COUNTY COUSUB CSA ELSD PLACE PUMA SCSD SLDL SLDU STATE ZCTA5
do
    # Start by preparing the table
    shp2pgsql -W "latin1" -s 4326 -p `ls -a $i/*.shp | head -n 1` tiger2012.$i >> $i.sql
    
    # Then append all the geometries
    shp2pgsql -W "latin1" -s 4326 -a -I $i/*.shp tiger2012.$i >> $i.sql
    
    # Then load them in to postgres
    sudo -u postgres psql -f $i.sql
    
    if [ $? -eq 0 ]
    then
        echo "Couldn't import $i.sql."
        exit 1
    fi
done
