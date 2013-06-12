sudo apt-get -y install postgresql-9.1-postgis
sudo -u postgres psql -f /usr/share/postgresql/9.1/contrib/postgis-1.5/postgis.sql
sudo -u postgres psql -f /usr/share/postgresql/9.1/contrib/postgis-1.5/spatial_ref_sys.sql
sudo -u postgres psql -f /usr/share/postgresql/9.1/contrib/postgis_comments.sql
sudo -u postgres psql -c "GRANT SELECT ON spatial_ref_sys TO PUBLIC;"
sudo -u postgres psql -c "GRANT ALL ON geometry_columns TO census;"
