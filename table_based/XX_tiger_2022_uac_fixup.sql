-- some shell stuff ...
-- curl -O https://www2.census.gov/geo/tiger/TIGER2022/UAC/tl_2022_us_uac20.zip
-- unzip tl_2022_us_uac20.zip
-- export PGURL=... 
-- shp2pgsql -W "utf8" -s 4326 -p -I tl_2022_us_uac20.shp tiger2022.uac20 | sed --expression='s/varchar(0)/varchar/g' | psql $PGURL -v ON_ERROR_STOP=1 -q
-- shp2pgsql -W "utf8" -s 4326 -a tl_2022_us_uac20.shp tiger2022.uac20 | psql $PGURL -v ON_ERROR_STOP=1 -q
-- then below:
ALTER TABLE tiger2022.uac rename to uac10;
ALTER TABLE tiger2022.uac20 rename to uac;

-- adapt fragments from index_tiger and metadata_script to only operate on sumlevel 400
DELETE FROM tiger2022.census_name_lookup WHERE sumlevel = '400';

INSERT INTO tiger2022.census_name_lookup
    SELECT
        uac.namelsad20,
        uac.name20,
        uac.name20,
        '400',
        uac.geoid20,
        '40000US' || uac.geoid20,
        280,
        b01003.b01003001,
        uac.aland20,
        uac.awater20,
        uac.geom
    FROM tiger2022.uac LEFT OUTER JOIN acs2021_5yr.b01003 ON (('40000US' || uac.geoid20) = b01003.geoid)
    WHERE RIGHT(uac.name20,2) not IN ('AS','MP','GU','VI');
-- doesn't get any geocontainment
-- metadata without dropping it?
delete from search_metadata where text2 = '400' and type = 'profile';

insert into search_metadata 
    SELECT CAST(display_name as text) AS text1,
           CAST(sumlevel as text) AS text2,
           'urban area' AS text3,
           CAST(full_geoid as text) as text4,
           CAST(population as text) as text5,
           CAST(priority as text) as text6,
           'profile' AS type,
           document AS document -- add conditional and document || to tsvector
    FROM (
        SELECT display_name, sumlevel, full_geoid, population, priority,
               setweight(to_tsvector('simple', coalesce(display_name, ' ')), 'A') ||
               setweight(to_tsvector('simple', coalesce(full_geoid, ' ')), 'A')
               AS document
        FROM (
            SELECT DISTINCT display_name, sumlevel, full_geoid,
                            population, priority
            FROM tiger2022.census_name_lookup
            WHERE sumlevel = '400'
            ) profile_search
        ) profile_documents;

UPDATE search_metadata SET document = document || to_tsvector('simple', coalesce('saint', ' ')) WHERE text1 LIKE '%St.%' AND type = 'profile' AND text2 = '400';
UPDATE search_metadata SET document = document || to_tsvector('simple', coalesce('st', ' ')) WHERE text1 LIKE '%Saint%' AND type = 'profile' AND text2 = '400';
UPDATE search_metadata SET document = document || to_tsvector('simple', coalesce('fort', ' ')) WHERE text1 LIKE '%Ft%' AND type = 'profile' AND text2 = '400';
UPDATE search_metadata SET document = document || to_tsvector('simple', coalesce('ft', ' ')) WHERE text1 LIKE '%Fort%' AND type = 'profile' AND text2 = '400';
UPDATE search_metadata SET document = document || to_tsvector('simple', coalesce('number', ' ')) WHERE text1 LIKE '%No.%' AND type = 'profile' AND text2 = '400';
UPDATE search_metadata SET document = document || to_tsvector('simple', coalesce('no', ' ')) WHERE text1 LIKE '%Number%' AND type = 'profile' AND text2 = '400';
UPDATE search_metadata SET document = document || to_tsvector('simple', coalesce('isd', ' ')) WHERE lower(text1) LIKE '%independent school district%' AND type = 'profile' AND text2 = '400';
