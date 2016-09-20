census-postgres scripts
=======================

A set of scripts to make it easier to set up [census-postgres](https://github.com/censusreporter/census-postgres) on an Amazon EC2 instance.

## Use Existing Data

If you just want to use American Community Survey data on your own PostgreSQL machine, it's recommended to use the dumps that Census Reporter provides. [Read more about those dumps in our Tumblr post](http://censusreporter.tumblr.com/post/73727555158/easier-access-to-acs-data).

Use the next section only if want to go through the process of rebuilding these data dumps from scratch.

## From Scratch

These are the steps I follow when I want to start from scratch and load all ACS releases into the database.

1. Launch a `c1.xlarge` instance using the [most recent Ubuntu 14.04 image](https://cloud-images.ubuntu.com/locator/), making sure to connect all four of the ephemeral storage to block devices during the setup walkthrough. If you have the [`aws`](http://aws.amazon.com/cli/) command line tool installed and [configured](http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html), this command should do it:

    ```bash
    aws ec2 request-spot-instances --dry-run \
        --spot-price 1.5 \
        --instance-count 1 \
        --launch-specification '{\
            "InstanceType": "c1.xlarge",\
            "ImageId": "ami-xxxxxxx",\
            "BlockDeviceMappings": [\
                {"VirtualName": "ephemeral0", "DeviceName": "/dev/sdb"},\
                {"VirtualName": "ephemeral1", "DeviceName": "/dev/sdc"},\
                {"VirtualName": "ephemeral2", "DeviceName": "/dev/sdd"},\
                {"VirtualName": "ephemeral3", "DeviceName": "/dev/sde"}\
            ]\
        }'
    ```

2. Connect to it and immediately launch `screen`

### Set up disk

(From [this link](http://www.gabrielweinberg.com/blog/2011/05/raid0-ephemeral-storage-on-aws-ec2.html))

    sudo su -
    apt-get update
    apt-get -y install mdadm xfsprogs
    umount /mnt
    yes | mdadm --create /dev/md0 --level=0 -c256 --raid-devices=4 /dev/xvdb /dev/xvdc /dev/xvdd /dev/xvde
    echo 'DEVICE /dev/xvdb /dev/xvdc /dev/xvdd /dev/xvde' > /etc/mdadm/mdadm.conf
    mdadm --detail --scan >> /etc/mdadm/mdadm.conf
    blockdev --setra 65536 /dev/md0
    mkfs.xfs -f /dev/md0
    mkdir -p /mnt && mount -t xfs -o noatime /dev/md0 /mnt
    exit
    cd /mnt

After this `df -h` should indicate that you have 1.7TB of disk available at `/dev/md0`.

### Set up postgres

Installs PostgreSQL 9.1 and puts the data directory on the `/dev/md0` partition we just created above.

    sudo su -
    apt-get install -y postgresql-9.1 postgresql-9.1-postgis
    /etc/init.d/postgresql stop
    mkdir /mnt/postgresql
    sed -i "s/data_directory = '\/var\/lib\/postgresql\/9.1\/main'/data_directory = '\/mnt\/postgresql\/9.1\/main'/" /etc/postgresql/9.1/main/postgresql.conf
    mv /var/lib/postgresql/9.1 /mnt/postgresql/
    chown -R postgres:postgres /mnt/postgresql
    /etc/init.d/postgresql start
    exit

Create a user and database for census data.

    sudo -u postgres psql -c "CREATE ROLE census WITH NOSUPERUSER LOGIN UNENCRYPTED PASSWORD 'censuspassword';"
    sudo -u postgres psql -c "CREATE DATABASE census WITH OWNER census;"

Make login passwordless.

    echo "localhost:5432:census:census:censuspassword" > /home/ubuntu/.pgpass
    chmod 0600 /home/ubuntu/.pgpass

After this you should be able to connect to your empty PostgreSQL database:

    psql -h localhost -U census postgres

### Download Census Bureau ACS data

Downloads the raw data from the Census Bureau to prepare for insert into the database you just created. We'll use [aria2](http://aria2.sourceforge.net/manual/en/html/aria2c.html) to help us download these files as quickly as possible.

    sudo mkdir -p /mnt/tmp
    sudo chown ubuntu /mnt/tmp
    sudo apt-get install -y aria2 git
    cd /home/ubuntu
    git clone https://github.com/censusreporter/census-postgres-scripts.git
    git clone https://github.com/censusreporter/census-postgres.git
    cd census-postgres-scripts

With this stuff set up we can use the scripts I wrote to download the data from the Census Bureau in a relatively consistent manner. It probably makes sense to run at least some of these in parallel across several screen sessions. If a recent ACS release doesn't show up on this list, follow the [new release checklist](#new-acs-release-actions) to create one for the new release before continuing.

    ./02_download_acs_2007_1yr.sh
    ./02_download_acs_2007_3yr.sh
    ./02_download_acs_2008_1yr.sh
    ./02_download_acs_2008_3yr.sh
    ./02_download_acs_2009_1yr.sh
    ./02_download_acs_2009_3yr.sh
    ./02_download_acs_2009_5yr.sh
    ./02_download_acs_2010_1yr.sh
    ./02_download_acs_2010_3yr.sh
    ./02_download_acs_2010_5yr.sh
    ./02_download_acs_2011_1yr.sh
    ./02_download_acs_2011_3yr.sh
    ./02_download_acs_2011_5yr.sh
    ./02_download_acs_2012_1yr.sh
    ./02_download_acs_2012_3yr.sh
    ./02_download_acs_2012_5yr.sh

An hour or two and 279GB later you should have a directory at `/mnt/tmp` full of raw, expanded Census Bureau ACS data.

### Importing ACS Data

Once we have the ACS data downloaded it's time to actually load that data in to PostgreSQL. Again, since each release is slightly different there's a bunch of scripts I hand-crafted to do this import in a consistent way. If a recent ACS release doesn't show up on this list, follow the [new release checklist](#new-acs-release-actions) to create one for the new release before continuing.

    ./03_import_acs_2007_1yr.sh
    ./03_import_acs_2007_3yr.sh
    ./03_import_acs_2008_1yr.sh
    ./03_import_acs_2008_3yr.sh
    ./03_import_acs_2009_1yr.sh
    ./03_import_acs_2009_3yr.sh
    ./03_import_acs_2009_5yr.sh
    ./03_import_acs_2010_1yr.sh
    ./03_import_acs_2010_3yr.sh
    ./03_import_acs_2010_5yr.sh
    ./03_import_acs_2011_1yr.sh
    ./03_import_acs_2011_3yr.sh
    ./03_import_acs_2011_5yr.sh
    ./03_import_acs_2012_1yr.sh
    ./03_import_acs_2012_3yr.sh
    ./03_import_acs_2012_5yr.sh

### Importing ACS Metadata

We just imported the estimate/error values for the ACS data. We also rely on tables that describe what the various Census tables and columns mean and how they relate to each other. We'll load that information here.

    cd /home/ubuntu
    git clone https://github.com/censusreporter/census-table-metadata.git
    cd census-table-metadata
    psql -U census -d census -h localhost -f census_metadata.sql
    sudo -u postgres psql -d census -f census_metadata_load.sql

### Setting up PostGIS and Importing TIGER Geodata

The geodata part of our APIs comes from the Census Bureau's TIGER 2012 dataset. Let's download and import it.

    cd /home/ubuntu/census-postgres-scripts
    ./11_set_up_postgis.sh
    ./12_download_tiger_2012.sh
    ./13_import_tiger_2012.sh
    psql -U census -d census -h localhost -f 13_index_tiger_2012.sql

## New ACS Release Actions

What to do when the Census Bureau [releases](http://www.census.gov/acs/www/data_documentation/data_main/) a new set of ACS data.

