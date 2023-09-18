-- TODO: In the future, consider breaking out the CREATE TABLE components
-- and running them before 13_index_tiger_2022.sql and then moving the
-- census_name_lookup indexing to live alongside the related code in 13_index_tiger_2022
CREATE TABLE tiger2022.aiannh252 AS (
    SELECT gid, aiannhce, aiannhns, geoid, name, namelsad, lsad, classfp,
           comptyp, aiannhr, mtfcc, funcstat, aland, awater,
           intptlat, intptlon, geom
    FROM tiger2022.aiannh
    WHERE comptyp = 'R'
);

CREATE TABLE tiger2022.aiannh254 AS (
    SELECT gid, aiannhce, aiannhns, geoid, name, namelsad, lsad, classfp,
           comptyp, aiannhr, mtfcc, funcstat, aland, awater,
           intptlat, intptlon, geom
    FROM tiger2022.aiannh
    WHERE comptyp = 'T'
);

-- The text concatenation stuff takes the 'R' and 'T' names, which are
-- generally something like 'Name Reservation' and 'Name Off-Reservation Trust',
-- and turns them into 'Name Reservation and Off-Reservation Trust'. It does
-- this by getting the simple name (r.name), stripping it from the complex
-- name (r.namelsad, t.namelsad) to get the other information, and
-- concatenating all the pieces together.
--
-- The three parts of the query (separated by UNIONs) get areas for which there
-- is both an 'R' and a 'T' (and combines their entries), areas for which
-- there is only an 'R', and areas for which there is only a 'T', in order.
CREATE TABLE tiger2022.aiannh250 AS (
    SELECT r.aiannhce as aiannhce,
           r.aiannhns as aiannhns,
           r.aiannhce as geoid,
           r.name as name,
           r.name || ' ' || trim(replace(r.namelsad, r.name, '')) || ' and '
                  || trim(replace(t.namelsad, t.name, '')) as namelsad,
           'C'::VARCHAR(1) as comptyp,
           r.aiannhr as aiannhr,
           r.funcstat as funcstat,
           r.aland + t.aland as aland,
           r.awater + t.awater as awater,
           ST_Y(ST_Centroid(ST_Union(r.geom, t.geom)))::VARCHAR as intptlat,
           ST_X(ST_Centroid(ST_Union(r.geom, t.geom)))::VARCHAR as intptlon,
           ST_Multi(ST_Union(r.geom, t.geom)) as geom
    FROM
        (SELECT * FROM tiger2022.aiannh WHERE comptyp = 'R') r,
        (SELECT * FROM tiger2022.aiannh WHERE comptyp = 'T') t
        WHERE r.aiannhce = t.aiannhce

    UNION

    SELECT aiannhce, aiannhns, aiannhce as geoid, name, namelsad, comptyp,
           aiannhr, funcstat, aland, awater, intptlat, intptlon, geom
    FROM tiger2022.aiannh
    WHERE comptyp = 'R'
    AND aiannhce NOT IN (
        SELECT aiannhce FROM tiger2022.aiannh WHERE comptyp = 'T'
        )

    UNION

    SELECT aiannhce, aiannhns, aiannhce as geoid, name, namelsad, comptyp,
           aiannhr, funcstat, aland, awater, intptlat, intptlon, geom
    FROM tiger2022.aiannh
    WHERE comptyp = 'T'
    AND aiannhce NOT IN (
        SELECT aiannhce FROM tiger2022.aiannh WHERE comptyp = 'R'
        )
);

-- One row gives problems with the matching; fix that name manually
UPDATE tiger2022.aiannh250
SET namelsad = 'Pojoaque Pueblo and Off-Reservation Trust Land'
WHERE name = 'Pojoaque';

-- Remove old entries
DELETE FROM tiger2022.census_name_lookup
WHERE sumlevel in ('250', '251', '252', '254');

-- Add the 250 sumlevel entries
INSERT INTO tiger2022.census_name_lookup
    SELECT aiannh250.namelsad AS display_name,
           aiannh250.namelsad AS simple_name,
           aiannh250.namelsad AS prefix_match_name,
           '250' AS sumlevel,
           aiannh250.geoid AS geoid,
           '25000US' || aiannh250.geoid AS full_geoid,
           140 AS priority,
           b01003.b01003001 AS population,
           aiannh250.aland AS aland,
           aiannh250.awater AS awater,
           aiannh250.geom AS geom
    FROM tiger2022.aiannh250
    LEFT OUTER JOIN acs2021_5yr.b01003
    ON ('25000US' || aiannh250.geoid) = b01003.geoid;

-- Add the 251 sumlevel entries
INSERT INTO tiger2022.census_name_lookup
    SELECT
        aitsn.namelsad,
        aitsn.namelsad,
        aitsn.namelsad,
        '251',
        aitsn.geoid,
        '25100US' || aitsn.geoid,
        150,
        b01003.b01003001,
        aitsn.aland,
        aitsn.awater,
        aitsn.geom
    FROM tiger2022.aitsn LEFT OUTER JOIN acs2021_5yr.b01003 ON (('25100US' || aitsn.geoid) = b01003.geoid);


-- Add the 252 sumlevel entries
INSERT INTO tiger2022.census_name_lookup
    SELECT aiannh252.namelsad AS display_name,
           aiannh252.namelsad AS simple_name,
           aiannh252.namelsad AS prefix_match_name,
           '252' AS sumlevel,
           aiannh252.geoid AS geoid,
           '25200US' || aiannh252.geoid AS full_geoid,
           140 AS priority,
           b01003.b01003001 AS population,
           aiannh252.aland AS aland,
           aiannh252.awater AS awater,
           aiannh252.geom AS geom
    FROM tiger2022.aiannh252
    LEFT OUTER JOIN acs2021_5yr.b01003
    ON ('25200US' || aiannh252.geoid) = b01003.geoid;

-- Add the 254 sumlevel entries
INSERT INTO tiger2022.census_name_lookup
    SELECT aiannh254.namelsad AS display_name,
           aiannh254.namelsad AS simple_name,
           aiannh254.namelsad AS prefix_match_name,
           '254' AS sumlevel,
           aiannh254.geoid AS geoid,
           '25400US' || aiannh254.geoid AS full_geoid,
           140 AS priority,
           b01003.b01003001 AS population,
           aiannh254.aland AS aland,
           aiannh254.awater AS awater,
           aiannh254.geom AS geom
    FROM tiger2022.aiannh254
    LEFT OUTER JOIN acs2021_5yr.b01003
    ON ('25400US' || aiannh254.geoid) = b01003.geoid;
