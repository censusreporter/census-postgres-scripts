CREATE TABLE tiger2014.aiannh252 AS (
    SELECT gid, aiannhce, aiannhns, geoid, name, namelsad, lsad, classfp,
           comptyp, aiannhr, mtfcc, funcstat, aland, awater,
           intptlat, intptlon, geom
    FROM tiger2014.aiannh
    WHERE comptyp = 'R'
);

CREATE TABLE tiger2014.aiannh254 AS (
    SELECT gid, aiannhce, aiannhns, geoid, name, namelsad, lsad, classfp,
           comptyp, aiannhr, mtfcc, funcstat, aland, awater,
           intptlat, intptlon, geom
    FROM tiger2014.aiannh
    WHERE comptyp = 'T'
);

CREATE TABLE tiger2014.aiannh250 AS (
    SELECT r.aiannhce as aiannhce,
           r.aiannhns as aiannhns,
           r.aiannhce as geoid,
           r.name as name,
           r.name || ' ' || trim(replace(r.namelsad, r.name, '')) || ' and '
                  || trim(replace(t.namelsad, t.name, '')) as namelsad,
           'C' as comptyp,
           r.aiannhr as aiannhr,
           r.funcstat as funcstat,
           r.aland + t.aland as aland,
           r.awater + t.awater as awater,
           ST_Y(ST_Centroid(ST_Union(r.geom, t.geom))) as intptlat,
           ST_X(ST_Centroid(ST_Union(r.geom, t.geom))) as intptlon,
           ST_Union(r.geom, t.geom) as geom
    FROM
        (SELECT * from tiger2014.aiannh where comptyp = 'R') r,
        (SELECT * from tiger2014.aiannh where comptyp = 'T') t
        WHERE r.aiannhce = t.aiannhce
);

-- One row gives problems with the matching; fix that name manually
UPDATE TABLE tiger2014.aiannh250 
SET namelsad = 'Pojoaque Pueblo and Off-Reservation Trust Land'
WHERE name = 'Pojoaque';

CREATE TABLE tiger2014.census_name_lookup_backup AS (
    SELECT * FROM tiger2014.census_name_lookup
);

DELETE FROM tiger2014.census_name_lookup
WHERE sumlevel = '250';

INSERT INTO tiger2014.census_name_lookup
    SELECT aiannh.namelsad AS display_name,
           aiannh.namelsad AS simple_name,
           aiannh.namelsad AS prefix_match_name,
           '250' AS sumlevel,
           aiannh.geoid AS geoid,
           '25000US' || aiannh.geoid AS full_geoid,
           140 AS priority,
           b01003.b01003001 AS population,
           aiannh.aland AS aland,
           aiannh.awater AS awater,
           aiannh.geom AS geom
    FROM tiger2014.aiannh250
    LEFT OUTER JOIN acs2014_5yr.b01003
    ON ('25000US' || aiannh.geoid) == b01003.geoid;