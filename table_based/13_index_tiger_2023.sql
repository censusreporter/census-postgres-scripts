-- Change ownership on the TIGER tables
-- Not using 'census' user since we moved to dokku
-- ALTER TABLE tiger2023.aiannh OWNER TO census;
-- ALTER TABLE tiger2023.aitsn OWNER TO census;
-- ALTER TABLE tiger2023.anrc OWNER TO census;
-- ALTER TABLE tiger2023.bg OWNER TO census;
-- ALTER TABLE tiger2023.cbsa OWNER TO census;
-- ALTER TABLE tiger2023.cd OWNER TO census;
-- ALTER TABLE tiger2023.concity OWNER TO census;
-- ALTER TABLE tiger2023.county OWNER TO census;
-- ALTER TABLE tiger2023.cousub OWNER TO census;
-- ALTER TABLE tiger2023.csa OWNER TO census;
-- ALTER TABLE tiger2023.elsd OWNER TO census;
-- ALTER TABLE tiger2023.metdiv OWNER TO census;
-- ALTER TABLE tiger2023.place OWNER TO census;
-- ALTER TABLE tiger2023.puma OWNER TO census;
-- ALTER TABLE tiger2023.scsd OWNER TO census;
-- ALTER TABLE tiger2023.sldl OWNER TO census;
-- ALTER TABLE tiger2023.sldu OWNER TO census;
-- ALTER TABLE tiger2023.state OWNER TO census;
-- ALTER TABLE tiger2023.tbg OWNER TO census;
-- ALTER TABLE tiger2023.tract OWNER TO census;
-- ALTER TABLE tiger2023.ttract OWNER TO census;
-- ALTER TABLE tiger2023.uac OWNER TO census;
-- ALTER TABLE tiger2023.unsd OWNER TO census;
-- ALTER TABLE tiger2023.zcta520 OWNER TO census;

-- OGR needs select on geography_columns to do it's thing
-- GRANT SELECT ON geography_columns TO census;

BEGIN;

-- Create a unified table for all census names -> geoid
DROP TABLE IF EXISTS tiger2023.census_name_lookup;
CREATE TABLE tiger2023.census_name_lookup (
    display_name varchar,
    simple_name varchar,
    prefix_match_name varchar,
    sumlevel varchar(3),
    geoid varchar,
    full_geoid varchar(40),
    priority smallint,
    population int,
    aland decimal(15),
    awater decimal(15)
);
SELECT AddGeometryColumn('tiger2023', 'census_name_lookup', 'geom', 4326, 'MULTIPOLYGON', 2);

INSERT INTO tiger2023.census_name_lookup
    SELECT
        state.name,
        state.name,
        state.name,
        '040',
        state.geoid,
        '04000US' || state.geoid,
        10,
        b01003.b01003001,
        state.aland,
        state.awater,
        state.geom
    FROM tiger2023.state LEFT OUTER JOIN acs2022_5yr.b01003 ON (('04000US' || state.geoid) = b01003.geoid)
    WHERE state.geoid NOT IN ('60', '66', '69', '78');
INSERT INTO tiger2023.census_name_lookup
    SELECT
        place.name || ', ' || state.stusps,
        place.name,
        place.name || ' ' || state.stusps,
        '160',
        place.geoid,
        '16000US' || place.geoid,
        20,
        b01003.b01003001,
        place.aland,
        place.awater,
        place.geom
    FROM tiger2023.place LEFT OUTER JOIN acs2022_5yr.b01003 ON (('16000US' || place.geoid) = b01003.geoid) JOIN tiger2023.state USING (statefp)
    WHERE state.geoid NOT IN ('60', '66', '69', '78');

INSERT INTO tiger2023.census_name_lookup
    SELECT
        county.namelsad || ', ' || state.stusps,
        county.namelsad,
        county.namelsad || ' ' || state.stusps,
        '050',
        county.geoid,
        '05000US' || county.geoid,
        30,
        b01003.b01003001,
        county.aland,
        county.awater,
        county.geom
    FROM tiger2023.county LEFT OUTER JOIN acs2022_5yr.b01003 ON (('05000US' || county.geoid) = b01003.geoid) JOIN tiger2023.state USING (statefp)
    WHERE state.geoid NOT IN ('60', '66', '69', '78');
INSERT INTO tiger2023.census_name_lookup
    SELECT
        cousub.namelsad || ', ' || county.namelsad || ', ' || state.stusps,
        cousub.name,
        cousub.name || ' ' || state.stusps,
        '060',
        cousub.geoid,
        '06000US' || cousub.geoid,
        40,
        b01003.b01003001,
        cousub.aland,
        cousub.awater,
        cousub.geom
    FROM tiger2023.cousub LEFT OUTER JOIN acs2022_5yr.b01003 ON (('06000US' || cousub.geoid) = b01003.geoid) JOIN tiger2023.county USING (statefp, countyfp) JOIN tiger2023.state USING (statefp)
    WHERE state.geoid NOT IN ('60', '66', '69', '78');
INSERT INTO tiger2023.census_name_lookup
    SELECT
        zcta520.zcta5ce20,
        zcta520.zcta5ce20,
        zcta520.zcta5ce20,
        '860',
        zcta520.geoid20,
        '86000US' || zcta520.geoid20,
        50,
        b01003.b01003001,
        zcta520.aland20,
        zcta520.awater20,
        zcta520.geom
    FROM tiger2023.zcta520 LEFT OUTER JOIN acs2022_5yr.b01003 ON (('86000US' || zcta520.geoid20) = b01003.geoid);
INSERT INTO tiger2023.census_name_lookup
    SELECT
        cbsa.namelsad,
        cbsa.name,
        cbsa.name,
        '310',
        cbsa.geoid,
        '31000US' || cbsa.geoid,
        60,
        b01003.b01003001,
        cbsa.aland,
        cbsa.awater,
        cbsa.geom
    FROM tiger2023.cbsa LEFT OUTER JOIN acs2022_5yr.b01003 ON (('31000US' || cbsa.geoid) = b01003.geoid);

INSERT INTO tiger2023.census_name_lookup
    SELECT
        cd.namelsad || ', ' || state.stusps,
        cd.namelsad,
        cd.namelsad,
        '500',
        cd.geoid,
        '50000US' || cd.geoid,
        70,
        b01003.b01003001,
        cd.aland,
        cd.awater,
        cd.geom
    FROM tiger2023.cd LEFT OUTER JOIN acs2022_5yr.b01003 ON (('50000US' || cd.geoid) = b01003.geoid) JOIN tiger2023.state on cd.statefp = state.statefp
    WHERE state.geoid NOT IN ('60', '66', '69', '78');

INSERT INTO tiger2023.census_name_lookup
    SELECT
        csa.namelsad,
        csa.name,
        csa.name,
        '330',
        csa.geoid,
        '33000US' || csa.geoid,
        80,
        b01003.b01003001,
        csa.aland,
        csa.awater,
        csa.geom
    FROM tiger2023.csa LEFT OUTER JOIN acs2022_5yr.b01003 ON (('33000US' || csa.geoid) = b01003.geoid);
INSERT INTO tiger2023.census_name_lookup
    SELECT
        elsd.name || ', ' || state.stusps,
        elsd.name,
        elsd.name,
        '950',
        elsd.geoid,
        '95000US' || elsd.geoid,
        90,
        b01003.b01003001,
        elsd.aland,
        elsd.awater,
        elsd.geom
    FROM tiger2023.elsd LEFT OUTER JOIN acs2022_5yr.b01003 ON (('95000US' || elsd.geoid) = b01003.geoid) JOIN tiger2023.state USING (statefp);
INSERT INTO tiger2023.census_name_lookup
    SELECT
        scsd.name || ', ' || state.stusps,
        scsd.name,
        scsd.name,
        '960',
        scsd.geoid,
        '96000US' || scsd.geoid,
        90,
        b01003.b01003001,
        scsd.aland,
        scsd.awater,
        scsd.geom
    FROM tiger2023.scsd LEFT OUTER JOIN acs2022_5yr.b01003 ON (('96000US' || scsd.geoid) = b01003.geoid) JOIN tiger2023.state USING (statefp);
INSERT INTO tiger2023.census_name_lookup
    SELECT
        puma.namelsad20 || ', ' || state.stusps,
        puma.namelsad20,
        puma.namelsad20,
        '795',
        puma.geoid20,
        '79500US' || puma.geoid20,
        110,
        b01003.b01003001,
        puma.aland20,
        puma.awater20,
        puma.geom
    FROM tiger2023.puma LEFT OUTER JOIN acs2022_5yr.b01003 ON (('79500US' || puma.geoid20) = b01003.geoid) JOIN tiger2023.state ON (puma.statefp20=state.statefp)
    WHERE statefp NOT IN ('60', '66', '69', '78');
INSERT INTO tiger2023.census_name_lookup
    SELECT
        sldl.namelsad || ', ' || state.stusps,
        sldl.namelsad,
        sldl.namelsad,
        '620',
        sldl.geoid,
        '62000US' || sldl.geoid,
        120,
        b01003.b01003001,
        sldl.aland,
        sldl.awater,
        sldl.geom
    FROM tiger2023.sldl LEFT OUTER JOIN acs2022_5yr.b01003 ON (('62000US' || sldl.geoid) = b01003.geoid) JOIN tiger2023.state USING (statefp);
INSERT INTO tiger2023.census_name_lookup
    SELECT
        sldu.namelsad || ', ' || state.stusps,
        sldu.namelsad,
        sldu.namelsad,
        '610',
        sldu.geoid,
        '61000US' || sldu.geoid,
        130,
        b01003.b01003001,
        sldu.aland,
        sldu.awater,
        sldu.geom
    FROM tiger2023.sldu LEFT OUTER JOIN acs2022_5yr.b01003 ON (('61000US' || sldu.geoid) = b01003.geoid) JOIN tiger2023.state USING (statefp);

-- skip AIAN levels 250 and 251
-- The TIGER AIANNH shapefile conflates sumlevels 252 and 254
-- and true 250 is the union of two kinds of rows in AIANNH
-- and 251 depends upon the corrected 250 for clear names.
-- this is handled/corrected in 14_aiannh_tables_2023.sql

INSERT INTO tiger2023.census_name_lookup
    SELECT
        anrc.namelsad,
        anrc.namelsad,
        anrc.namelsad,
        '230',
        anrc.geoid,
        '23000US' || anrc.geoid,
        160,
        b01003.b01003001,
        anrc.aland,
        anrc.awater,
        anrc.geom
    FROM tiger2023.anrc LEFT OUTER JOIN acs2022_5yr.b01003 ON (('23000US' || anrc.geoid) = b01003.geoid);
INSERT INTO tiger2023.census_name_lookup
    SELECT
        'BG ' || bg.blkgrpce  || ', Tract ' || tract.name || ', ' || county.name || ', ' || state.stusps,
        bg.namelsad,
        null,
        '150',
        bg.geoid,
        '15000US' || bg.geoid,
        120,
        b01003.b01003001,
        bg.aland,
        bg.awater,
        bg.geom
    FROM tiger2023.bg
    LEFT OUTER JOIN acs2022_5yr.b01003 ON (('15000US' || bg.geoid) = b01003.geoid)
    JOIN tiger2023.county USING (statefp, countyfp)
    JOIN tiger2023.state USING (statefp)
    JOIN tiger2023.tract USING (statefp, countyfp, tractce)
    WHERE statefp NOT IN ('60', '66', '69', '78');


INSERT INTO tiger2023.census_name_lookup
    SELECT
        concity.namelsad || ', ' || state.stusps,
        concity.namelsad,
        concity.name || ' ' || state.stusps,
        '170',
        concity.geoid,
        '17000US' || concity.geoid,
        170,
        b01003.b01003001,
        concity.aland,
        concity.awater,
        concity.geom
    FROM tiger2023.concity LEFT OUTER JOIN acs2022_5yr.b01003 ON (('17000US' || concity.geoid) = b01003.geoid) JOIN tiger2023.state USING (statefp);
INSERT INTO tiger2023.census_name_lookup
    SELECT
        metdiv.namelsad,
        metdiv.namelsad,
        metdiv.name,
        '314',
        metdiv.geoid,
        '31400US' || metdiv.geoid,
        200,
        b01003.b01003001,
        metdiv.aland,
        metdiv.awater,
        metdiv.geom
    FROM tiger2023.metdiv LEFT OUTER JOIN acs2022_5yr.b01003 ON (('31400US' || metdiv.geoid) = b01003.geoid);
INSERT INTO tiger2023.census_name_lookup
    SELECT
        tbg.namelsad,
        tbg.namelsad,
        null,
        '258',
        tbg.geoid,
        '25800US' || tbg.geoid,
        240,
        b01003.b01003001,
        tbg.aland,
        tbg.awater,
        tbg.geom
    FROM tiger2023.tbg LEFT OUTER JOIN acs2022_5yr.b01003 ON (('25800US' || tbg.geoid) = b01003.geoid);
INSERT INTO tiger2023.census_name_lookup
    SELECT
        ttract.namelsad,
        ttract.namelsad,
        null,
        '256',
        ttract.geoid,
        '25600US' || ttract.geoid,
        250,
        b01003.b01003001,
        ttract.aland,
        ttract.awater,
        ttract.geom
    FROM tiger2023.ttract LEFT OUTER JOIN acs2022_5yr.b01003 ON (('25600US' || ttract.geoid) = b01003.geoid);
INSERT INTO tiger2023.census_name_lookup
    SELECT
        tract.namelsad || ', ' || county.name || ', ' || state.stusps,
        tract.namelsad,
        null,
        '140',
        tract.geoid,
        '14000US' || tract.geoid,
        100,
        b01003.b01003001,
        tract.aland,
        tract.awater,
        tract.geom
    FROM tiger2023.tract LEFT OUTER JOIN acs2022_5yr.b01003 ON (('14000US' || tract.geoid) = b01003.geoid) JOIN tiger2023.county USING (statefp, countyfp) JOIN tiger2023.state USING (statefp)
    WHERE statefp NOT IN ('60', '66', '69', '78');
INSERT INTO tiger2023.census_name_lookup
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
    FROM tiger2023.uac LEFT OUTER JOIN acs2022_5yr.b01003 ON (('40000US' || uac.geoid20) = b01003.geoid)
    WHERE RIGHT(uac.name20,2) not IN ('AS','MP','GU','VI');
INSERT INTO tiger2023.census_name_lookup
    SELECT
        unsd.name || ', ' || state.stusps,
        unsd.name,
        unsd.name || ' ' || state.stusps,
        '970',
        unsd.geoid,
        '97000US' || unsd.geoid,
        90,
        b01003.b01003001,
        unsd.aland,
        unsd.awater,
        unsd.geom
    FROM tiger2023.unsd LEFT OUTER JOIN acs2022_5yr.b01003 ON (('97000US' || unsd.geoid) = b01003.geoid) JOIN tiger2023.state USING (statefp)
    WHERE statefp NOT IN ('60', '66', '69', '78');
INSERT INTO tiger2023.census_name_lookup
    SELECT
        'United States',
        'United States',
        'united states',
        '010',
        '',
        '01000US',
        5,
        (SELECT b01003.b01003001 FROM acs2022_5yr.b01003 WHERE geoid='01000US'),
        (SELECT SUM(aland) FROM tiger2023.state),
        (SELECT SUM(awater) FROM tiger2023.state),
        (SELECT ST_Simplify(ST_Union(geom), 0.01) FROM tiger2023.state);

---- Divisions
-- Division 1
INSERT INTO tiger2023.census_name_lookup
    SELECT
        'New England Division',
        'New England Division',
        'new england division',
        '030',
        '',
        '03000US1',
        310,
        (SELECT b01003.b01003001 FROM acs2022_5yr.b01003 WHERE geoid = '03000US1'),
        (SELECT SUM(aland) FROM tiger2023.state WHERE division='1'),
        (SELECT SUM(awater) FROM tiger2023.state WHERE division='1'),
        (SELECT ST_Union(geom) FROM tiger2023.census_name_lookup WHERE full_geoid IN ('04000US09', '04000US23', '04000US25', '04000US33', '04000US44', '04000US50'));
-- Division 2
INSERT INTO tiger2023.census_name_lookup
    SELECT
        'Middle Atlantic Division',
        'Middle Atlantic Division',
        'middle atlantic division',
        '030',
        '',
        '03000US2',
        310,
        (SELECT b01003.b01003001 FROM acs2022_5yr.b01003 WHERE geoid = '03000US2'),
        (SELECT SUM(aland) FROM tiger2023.state WHERE division='2'),
        (SELECT SUM(awater) FROM tiger2023.state WHERE division='2'),
        (SELECT ST_Multi(ST_Union(geom)) FROM tiger2023.census_name_lookup WHERE full_geoid IN ('04000US34', '04000US36', '04000US42'));
-- Division 3
INSERT INTO tiger2023.census_name_lookup
    SELECT
        'East North Central Division',
        'East North Central Division',
        'east north central division',
        '030',
        '',
        '03000US3',
        310,
        (SELECT b01003.b01003001 FROM acs2022_5yr.b01003 WHERE geoid = '03000US3'),
        (SELECT SUM(aland) FROM tiger2023.state WHERE division='3'),
        (SELECT SUM(awater) FROM tiger2023.state WHERE division='3'),
        (SELECT ST_Multi(ST_Union(geom)) FROM tiger2023.census_name_lookup WHERE full_geoid IN ('04000US17', '04000US18', '04000US26', '04000US39', '04000US55'));
-- Division 4
INSERT INTO tiger2023.census_name_lookup
    SELECT
        'West North Central Division',
        'West North Central Division',
        'west north central division',
        '030',
        '',
        '03000US4',
        310,
        (SELECT b01003.b01003001 FROM acs2022_5yr.b01003 WHERE geoid = '03000US4'),
        (SELECT SUM(aland) FROM tiger2023.state WHERE division='4'),
        (SELECT SUM(awater) FROM tiger2023.state WHERE division='4'),
        (SELECT ST_Multi(ST_Union(geom)) FROM tiger2023.census_name_lookup WHERE full_geoid IN ('04000US19', '04000US20', '04000US27', '04000US29', '04000US31', '04000US38', '04000US46'));
-- Division 5
INSERT INTO tiger2023.census_name_lookup
    SELECT
        'South Atlantic Division',
        'South Atlantic Division',
        'south atlantic division',
        '030',
        '',
        '03000US5',
        310,
        (SELECT b01003.b01003001 FROM acs2022_5yr.b01003 WHERE geoid = '03000US5'),
        (SELECT SUM(aland) FROM tiger2023.state WHERE division='5'),
        (SELECT SUM(awater) FROM tiger2023.state WHERE division='5'),
        (SELECT ST_Multi(ST_Union(geom)) FROM tiger2023.census_name_lookup WHERE full_geoid IN ('04000US10', '04000US11', '04000US12', '04000US13', '04000US24', '04000US37', '04000US45', '04000US51', '04000US54'));
-- Division 6
INSERT INTO tiger2023.census_name_lookup
    SELECT
        'East South Central Division',
        'East South Central Division',
        'east south central division',
        '030',
        '',
        '03000US6',
        310,
        (SELECT b01003.b01003001 FROM acs2022_5yr.b01003 WHERE geoid = '03000US6'),
        (SELECT SUM(aland) FROM tiger2023.state WHERE division='6'),
        (SELECT SUM(awater) FROM tiger2023.state WHERE division='6'),
        (SELECT ST_Multi(ST_Union(geom)) FROM tiger2023.census_name_lookup WHERE full_geoid IN ('04000US01', '04000US21', '04000US28', '04000US47'));
-- Division 7
INSERT INTO tiger2023.census_name_lookup
    SELECT
        'West South Central Division',
        'West South Central Division',
        'west south central division',
        '030',
        '',
        '03000US7',
        310,
        (SELECT b01003.b01003001 FROM acs2022_5yr.b01003 WHERE geoid = '03000US7'),
        (SELECT SUM(aland) FROM tiger2023.state WHERE division='7'),
        (SELECT SUM(awater) FROM tiger2023.state WHERE division='7'),
        (SELECT ST_Multi(ST_Union(geom)) FROM tiger2023.census_name_lookup WHERE full_geoid IN ('04000US05', '04000US22', '04000US40', '04000US48'));
-- Division 8
INSERT INTO tiger2023.census_name_lookup
    SELECT
        'Mountain Division',
        'Mountain Division',
        'mountain division',
        '030',
        '',
        '03000US8',
        310,
        (SELECT b01003.b01003001 FROM acs2022_5yr.b01003 WHERE geoid = '03000US8'),
        (SELECT SUM(aland) FROM tiger2023.state WHERE division='8'),
        (SELECT SUM(awater) FROM tiger2023.state WHERE division='8'),
        (SELECT ST_Multi(ST_Union(geom)) FROM tiger2023.census_name_lookup WHERE full_geoid IN ('04000US04', '04000US08', '04000US16', '04000US35', '04000US30', '04000US49', '04000US32', '04000US56'));
-- Division 9
INSERT INTO tiger2023.census_name_lookup
    SELECT
        'Pacific Division',
        'Pacific Division',
        'pacific division',
        '030',
        '',
        '03000US9',
        310,
        (SELECT b01003.b01003001 FROM acs2022_5yr.b01003 WHERE geoid = '03000US9'),
        (SELECT SUM(aland) FROM tiger2023.state WHERE division='9'),
        (SELECT SUM(awater) FROM tiger2023.state WHERE division='9'),
        (SELECT ST_Multi(ST_Union(geom)) FROM tiger2023.census_name_lookup WHERE full_geoid IN ('04000US02', '04000US06', '04000US15', '04000US41', '04000US53'));

---- Regions
-- Region 1
INSERT INTO tiger2023.census_name_lookup
    SELECT
        'Northeast Region',
        'Northeast Region',
        'northeast region',
        '020',
        '',
        '02000US1',
        320,
        (SELECT b01003.b01003001 FROM acs2022_5yr.b01003 WHERE geoid = '02000US1'),
        (SELECT SUM(aland) FROM tiger2023.state WHERE region='1'),
        (SELECT SUM(awater) FROM tiger2023.state WHERE region='1'),
        (SELECT ST_Multi(ST_Union(geom)) FROM tiger2023.census_name_lookup WHERE full_geoid IN ('03000US1', '03000US2'));
-- Region 2
INSERT INTO tiger2023.census_name_lookup
    SELECT
        'Midwest Region',
        'Midwest Region',
        'midwest region',
        '020',
        '',
        '02000US2',
        320,
        (SELECT b01003.b01003001 FROM acs2022_5yr.b01003 WHERE geoid = '02000US2'),
        (SELECT SUM(aland) FROM tiger2023.state WHERE region='2'),
        (SELECT SUM(awater) FROM tiger2023.state WHERE region='2'),
        (SELECT ST_Multi(ST_Union(geom)) FROM tiger2023.census_name_lookup WHERE full_geoid IN ('03000US3', '03000US4'));
-- Region 3
INSERT INTO tiger2023.census_name_lookup
    SELECT
        'South Region',
        'South Region',
        'south region',
        '020',
        '',
        '02000US3',
        320,
        (SELECT b01003.b01003001 FROM acs2022_5yr.b01003 WHERE geoid = '02000US3'),
        (SELECT SUM(aland) FROM tiger2023.state WHERE region='3'),
        (SELECT SUM(awater) FROM tiger2023.state WHERE region='3'),
        (SELECT ST_Multi(ST_Union(geom)) FROM tiger2023.census_name_lookup WHERE full_geoid IN ('03000US5', '03000US6', '03000US7'));
-- Region 4
INSERT INTO tiger2023.census_name_lookup
    SELECT
        'West Region',
        'West Region',
        'west region',
        '020',
        '',
        '02000US4',
        320,
        (SELECT b01003.b01003001 FROM acs2022_5yr.b01003 WHERE geoid = '02000US4'),
        (SELECT SUM(aland) FROM tiger2023.state WHERE region='4'),
        (SELECT SUM(awater) FROM tiger2023.state WHERE region='4'),
        (SELECT ST_Multi(ST_Union(geom)) FROM tiger2023.census_name_lookup WHERE full_geoid IN ('03000US8', '03000US9'));

CREATE INDEX census_name_lookup_idx_lower ON tiger2023.census_name_lookup ((lower(prefix_match_name)) text_pattern_ops);
CREATE INDEX census_name_lookup_idx_geom ON tiger2023.census_name_lookup USING GIST(geom);
CREATE INDEX census_name_lookup_idx_geoid ON tiger2023.census_name_lookup (full_geoid);
CREATE INDEX census_name_lookup_idx_sumlevel ON tiger2023.census_name_lookup(sumlevel);

DROP TABLE IF EXISTS tiger2023.census_geo_containment;
CREATE TABLE tiger2023.census_geo_containment (
    child_geoid varchar(40),
    parent_geoid varchar(40),
    percent_covered real
);
-- Places (160) in Counties (050)
INSERT INTO tiger2023.census_geo_containment (
    SELECT
        '16000US' || place.geoid AS child_geoid,
        '05000US' || county.geoid AS parent_geoid,
        ST_Area(ST_Intersection(place.geom,county.geom))/ST_Area(place.geom)*100 as percent_covered
    FROM tiger2023.place
    JOIN tiger2023.county ON ST_Intersects(place.geom, county.geom)
    WHERE
        ST_Area(ST_Intersection(place.geom,county.geom))/ST_Area(place.geom) > 0
    ORDER BY
        child_geoid ASC,
        ST_Area(ST_Intersection(place.geom,county.geom)) DESC
);
-- ZCTA5s (860) in Counties (050)
INSERT INTO tiger2023.census_geo_containment (
    SELECT
        '86000US' || zcta520.geoid20 AS child_geoid,
        '05000US' || county.geoid AS parent_geoid,
        ST_Area(ST_Intersection(zcta520.geom,county.geom))/ST_Area(zcta520.geom)*100 as percent_covered
    FROM tiger2023.zcta520
    JOIN tiger2023.county ON ST_Intersects(zcta520.geom, county.geom)
    WHERE
        ST_IsValid(zcta520.geom) AND
        ST_Area(ST_Intersection(zcta520.geom,county.geom))/ST_Area(zcta520.geom) > 0
    ORDER BY
        child_geoid ASC,
        ST_Area(ST_Intersection(zcta520.geom,county.geom)) DESC
);
-- Elementary school districts (950) in Counties (050)
INSERT INTO tiger2023.census_geo_containment (
    SELECT
        '95000US' || elsd.geoid AS child_geoid,
        '05000US' || county.geoid AS parent_geoid,
        ST_Area(ST_Intersection(elsd.geom,county.geom))/ST_Area(elsd.geom)*100 as percent_covered
    FROM tiger2023.elsd
    JOIN tiger2023.county ON ST_Intersects(elsd.geom, county.geom)
    WHERE
        ST_IsValid(elsd.geom) AND
        ST_Area(ST_Intersection(elsd.geom,county.geom))/ST_Area(elsd.geom) > 0
    ORDER BY
        child_geoid ASC,
        ST_Area(ST_Intersection(elsd.geom,county.geom)) DESC
);
-- Secondary school districts (960) in Counties (050)
INSERT INTO tiger2023.census_geo_containment (
    SELECT
        '96000US' || scsd.geoid AS child_geoid,
        '05000US' || county.geoid AS parent_geoid,
        ST_Area(ST_Intersection(scsd.geom,county.geom))/ST_Area(scsd.geom)*100 as percent_covered
    FROM tiger2023.scsd
    JOIN tiger2023.county ON ST_Intersects(scsd.geom, county.geom)
    WHERE
        ST_IsValid(scsd.geom) AND
        ST_Area(ST_Intersection(scsd.geom,county.geom))/ST_Area(scsd.geom) > 0
    ORDER BY
        child_geoid ASC,
        ST_Area(ST_Intersection(scsd.geom,county.geom)) DESC
);
-- Unified school districts (970) in Counties (050)
INSERT INTO tiger2023.census_geo_containment (
    SELECT
        '97000US' || unsd.geoid AS child_geoid,
        '05000US' || county.geoid AS parent_geoid,
        ST_Area(ST_Intersection(unsd.geom,county.geom))/ST_Area(unsd.geom)*100 as percent_covered
    FROM tiger2023.unsd
    JOIN tiger2023.county ON ST_Intersects(unsd.geom, county.geom)
    WHERE
        ST_IsValid(unsd.geom) AND
        ST_Area(ST_Intersection(unsd.geom,county.geom))/ST_Area(unsd.geom) > 0
    ORDER BY
        child_geoid ASC,
        ST_Area(ST_Intersection(unsd.geom,county.geom)) DESC
);
-- Places (160) in CBSA (310)
INSERT INTO tiger2023.census_geo_containment (
    SELECT
        '16000US' || place.geoid AS child_geoid,
        '31000US' || cbsa.geoid AS parent_geoid,
        ST_Area(ST_Intersection(place.geom,cbsa.geom))/ST_Area(place.geom)*100 as percent_covered
    FROM tiger2023.place
    JOIN tiger2023.cbsa ON ST_Intersects(place.geom, cbsa.geom)
    WHERE
        ST_IsValid(place.geom) AND
        ST_Area(ST_Intersection(place.geom,cbsa.geom))/ST_Area(place.geom) > 0
    ORDER BY
        child_geoid ASC,
        ST_Area(ST_Intersection(place.geom,cbsa.geom)) DESC
);
-- ZCTA5s (860) in CBSA (310)
INSERT INTO tiger2023.census_geo_containment (
    SELECT
        '86000US' || zcta520.geoid20 AS child_geoid,
        '31000US' || cbsa.geoid AS parent_geoid,
        ST_Area(ST_Intersection(zcta520.geom,cbsa.geom))/ST_Area(zcta520.geom)*100 as percent_covered
    FROM tiger2023.zcta520
    JOIN tiger2023.cbsa ON ST_Intersects(zcta520.geom, cbsa.geom)
    WHERE
        ST_IsValid(zcta520.geom) AND
        ST_Area(ST_Intersection(zcta520.geom,cbsa.geom))/ST_Area(zcta520.geom) > 0
    ORDER BY
        child_geoid ASC,
        ST_Area(ST_Intersection(zcta520.geom,cbsa.geom)) DESC
);
-- ZCTA5s (860) in States (040)
INSERT INTO tiger2023.census_geo_containment (
    SELECT
        '86000US' || zcta520.geoid20 AS child_geoid,
        '04000US' || state.geoid AS parent_geoid,
        ST_Area(ST_Intersection(zcta520.geom,state.geom))/ST_Area(zcta520.geom)*100 as percent_covered
    FROM tiger2023.zcta520
    JOIN tiger2023.state ON ST_Intersects(zcta520.geom, state.geom)
    WHERE
        ST_IsValid(zcta520.geom) AND
        ST_Area(ST_Intersection(zcta520.geom,state.geom))/ST_Area(zcta520.geom) > 0
    ORDER BY
        child_geoid ASC,
        ST_Area(ST_Intersection(zcta520.geom,state.geom)) DESC
);
-- Tracts (140) in Places (160)
INSERT INTO tiger2023.census_geo_containment (
    SELECT
        '14000US' || tract.geoid AS child_geoid,
        '16000US' || place.geoid AS parent_geoid,
        ST_Area(ST_Intersection(tract.geom,place.geom))/ST_Area(tract.geom)*100 as percent_covered
    FROM tiger2023.tract
    JOIN tiger2023.place ON ST_Intersects(tract.geom, place.geom)
    WHERE
        ST_IsValid(tract.geom) AND
        ST_Area(ST_Intersection(tract.geom,place.geom))/ST_Area(tract.geom) > 0
    ORDER BY
        child_geoid ASC,
        ST_Area(ST_Intersection(tract.geom,place.geom)) DESC
);
-- Block Groups (150) in Places (160)
INSERT INTO tiger2023.census_geo_containment (
    SELECT
        '15000US' || bg.geoid AS child_geoid,
        '16000US' || place.geoid AS parent_geoid,
        ST_Area(ST_Intersection(bg.geom,place.geom))/ST_Area(bg.geom)*100 as percent_covered
    FROM tiger2023.bg
    JOIN tiger2023.place ON ST_Intersects(bg.geom, place.geom)
    WHERE
        ST_IsValid(bg.geom) AND
        ST_Area(ST_Intersection(bg.geom,place.geom))/ST_Area(bg.geom) > 0
    ORDER BY
        child_geoid ASC,
        ST_Area(ST_Intersection(bg.geom,place.geom)) DESC
);

CREATE INDEX census_geo_containment_idx_child_geoid ON tiger2023.census_geo_containment (child_geoid);
CREATE INDEX census_geo_containment_idx_parent_geoid ON tiger2023.census_geo_containment (parent_geoid);

COMMIT;
