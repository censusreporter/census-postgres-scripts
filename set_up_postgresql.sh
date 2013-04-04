#!/bin/bash

# This should be run as root.

apt-get update && sudo apt-get install -y postgresql-9.1
/etc/init.d/postgresql stop
mkdir /mnt/postgresql
sed -i "s/data_directory = '\/var\/lib\/postgresql\/9.1\/main'/data_directory = '\/mnt\/postgresql\/9.1\/main'/" /etc/postgresql/9.1/main/postgresql.conf
mv /var/lib/postgresql/9.1 /mnt/postgresql/
chown -R postgres:postgres /mnt/postgresql
/etc/init.d/postgresql start