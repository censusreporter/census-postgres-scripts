-- Drop old indexes if they're there
DROP INDEX IF EXISTS tiger2012.cbsa_idx_namelsad_lower;
DROP INDEX IF EXISTS tiger2012.cd_idx_namelsad_lower;
DROP INDEX IF EXISTS tiger2012.county_idx_namelsad_lower;
DROP INDEX IF EXISTS tiger2012.csa_idx_namelsad_lower;
DROP INDEX IF EXISTS tiger2012.place_idx_namelsad_lower;
DROP INDEX IF EXISTS tiger2012.state_idx_name_lower;
DROP INDEX IF EXISTS tiger2012.elsd_idx_name_lower;
DROP INDEX IF EXISTS tiger2012.scsd_idx_name_lower;
DROP INDEX IF EXISTS tiger2012.zcta5_idx_zcta5ce10_lower;
DROP INDEX IF EXISTS tiger2012.cousub_idx_namelsad_lower;
DROP INDEX IF EXISTS tiger2012.puma_idx_namelsad10_lower;
DROP INDEX IF EXISTS tiger2012.sldl_idx_namelsad_lower;
DROP INDEX IF EXISTS tiger2012.sldu_idx_namelsad_lower;
DROP INDEX IF EXISTS tiger2012.aiannh_idx_namelsad_lower;
DROP INDEX IF EXISTS tiger2012.aits_idx_namelsad_lower;
DROP INDEX IF EXISTS tiger2012.anrc_idx_namelsad_lower;
DROP INDEX IF EXISTS tiger2012.bg_idx_namelsad_lower;
DROP INDEX IF EXISTS tiger2012.cnecta_idx_namelsad_lower;
DROP INDEX IF EXISTS tiger2012.concity_idx_namelsad_lower;
DROP INDEX IF EXISTS tiger2012.metdiv_idx_namelsad_lower;
DROP INDEX IF EXISTS tiger2012.necta_idx_namelsad_lower;
DROP INDEX IF EXISTS tiger2012.nectadiv_idx_namelsad_lower;
DROP INDEX IF EXISTS tiger2012.submcd_idx_namelsad_lower;
DROP INDEX IF EXISTS tiger2012.tbg_idx_namelsad_lower;
DROP INDEX IF EXISTS tiger2012.ttract_idx_namelsad_lower;
DROP INDEX IF EXISTS tiger2012.tabblock_idx_name_lower;
DROP INDEX IF EXISTS tiger2012.tract_idx_namelsad_lower;
DROP INDEX IF EXISTS tiger2012.uac_idx_namelsad10_lower;
DROP INDEX IF EXISTS tiger2012.unsd_idx_name_lower;
DROP INDEX IF EXISTS tiger2012.vtd_idx_namelsad10_lower;

DROP INDEX IF EXISTS tiger2012.cbsa_idx_lower;
DROP INDEX IF EXISTS tiger2012.cd_idx_lower;
DROP INDEX IF EXISTS tiger2012.county_idx_lower;
DROP INDEX IF EXISTS tiger2012.csa_idx_lower;
DROP INDEX IF EXISTS tiger2012.place_idx_lower;
DROP INDEX IF EXISTS tiger2012.state_idx_lower;
DROP INDEX IF EXISTS tiger2012.elsd_idx_lower;
DROP INDEX IF EXISTS tiger2012.scsd_idx_lower;
DROP INDEX IF EXISTS tiger2012.zcta5_idx_lower;
DROP INDEX IF EXISTS tiger2012.cousub_idx_lower;
DROP INDEX IF EXISTS tiger2012.puma_idx_lower;
DROP INDEX IF EXISTS tiger2012.sldl_idx_lower;
DROP INDEX IF EXISTS tiger2012.sldu_idx_lower;
DROP INDEX IF EXISTS tiger2012.aiannh_idx_lower;
DROP INDEX IF EXISTS tiger2012.aits_idx_lower;
DROP INDEX IF EXISTS tiger2012.anrc_idx_lower;
DROP INDEX IF EXISTS tiger2012.bg_idx_lower;
DROP INDEX IF EXISTS tiger2012.cnecta_idx_lower;
DROP INDEX IF EXISTS tiger2012.concity_idx_lower;
DROP INDEX IF EXISTS tiger2012.metdiv_idx_lower;
DROP INDEX IF EXISTS tiger2012.necta_idx_lower;
DROP INDEX IF EXISTS tiger2012.nectadiv_idx_lower;
DROP INDEX IF EXISTS tiger2012.submcd_idx_lower;
DROP INDEX IF EXISTS tiger2012.tbg_idx_lower;
DROP INDEX IF EXISTS tiger2012.ttract_idx_lower;
DROP INDEX IF EXISTS tiger2012.tabblock_idx_lower;
DROP INDEX IF EXISTS tiger2012.tract_idx_lower;
DROP INDEX IF EXISTS tiger2012.uac_idx_lower;
DROP INDEX IF EXISTS tiger2012.unsd_idx_lower;
DROP INDEX IF EXISTS tiger2012.vtd_idx_lower;

DROP INDEX IF EXISTS tiger2012.cbsa_idx_fulltext;
DROP INDEX IF EXISTS tiger2012.cd_idx_fulltext;
DROP INDEX IF EXISTS tiger2012.county_idx_fulltext;
DROP INDEX IF EXISTS tiger2012.csa_idx_fulltext;
DROP INDEX IF EXISTS tiger2012.place_idx_fulltext;
DROP INDEX IF EXISTS tiger2012.state_idx_fulltext;
DROP INDEX IF EXISTS tiger2012.elsd_idx_fulltext;
DROP INDEX IF EXISTS tiger2012.scsd_idx_fulltext;
DROP INDEX IF EXISTS tiger2012.zcta5_idx_fulltext;
DROP INDEX IF EXISTS tiger2012.cousub_idx_fulltext;
DROP INDEX IF EXISTS tiger2012.puma_idx_fulltext;
DROP INDEX IF EXISTS tiger2012.sldl_idx_fulltext;
DROP INDEX IF EXISTS tiger2012.sldu_idx_fulltext;
DROP INDEX IF EXISTS tiger2012.aiannh_idx_fulltext;
DROP INDEX IF EXISTS tiger2012.aits_idx_fulltext;
DROP INDEX IF EXISTS tiger2012.anrc_idx_fulltext;
DROP INDEX IF EXISTS tiger2012.bg_idx_fulltext;
DROP INDEX IF EXISTS tiger2012.cnecta_idx_fulltext;
DROP INDEX IF EXISTS tiger2012.concity_idx_fulltext;
DROP INDEX IF EXISTS tiger2012.metdiv_idx_fulltext;
DROP INDEX IF EXISTS tiger2012.necta_idx_fulltext;
DROP INDEX IF EXISTS tiger2012.nectadiv_idx_fulltext;
DROP INDEX IF EXISTS tiger2012.submcd_idx_fulltext;
DROP INDEX IF EXISTS tiger2012.tbg_idx_fulltext;
DROP INDEX IF EXISTS tiger2012.ttract_idx_fulltext;
DROP INDEX IF EXISTS tiger2012.tabblock_idx_fulltext;
DROP INDEX IF EXISTS tiger2012.tract_idx_fulltext;
DROP INDEX IF EXISTS tiger2012.uac_idx_fulltext;
DROP INDEX IF EXISTS tiger2012.unsd_idx_fulltext;
DROP INDEX IF EXISTS tiger2012.vtd_idx_fulltext;

-- Drop fulltext_col columns
ALTER TABLE tiger2012.cbsa DROP COLUMN IF EXISTS fulltext_col CASCADE;
ALTER TABLE tiger2012.cd DROP COLUMN IF EXISTS fulltext_col CASCADE;
ALTER TABLE tiger2012.county DROP COLUMN IF EXISTS fulltext_col CASCADE;
ALTER TABLE tiger2012.csa DROP COLUMN IF EXISTS fulltext_col CASCADE;
ALTER TABLE tiger2012.place DROP COLUMN IF EXISTS fulltext_col CASCADE;
ALTER TABLE tiger2012.state DROP COLUMN IF EXISTS fulltext_col CASCADE;
ALTER TABLE tiger2012.elsd DROP COLUMN IF EXISTS fulltext_col CASCADE;
ALTER TABLE tiger2012.scsd DROP COLUMN IF EXISTS fulltext_col CASCADE;
ALTER TABLE tiger2012.zcta5 DROP COLUMN IF EXISTS fulltext_col CASCADE;
ALTER TABLE tiger2012.cousub DROP COLUMN IF EXISTS fulltext_col CASCADE;
ALTER TABLE tiger2012.puma DROP COLUMN IF EXISTS fulltext_col CASCADE;
ALTER TABLE tiger2012.sldl DROP COLUMN IF EXISTS fulltext_col CASCADE;
ALTER TABLE tiger2012.sldu DROP COLUMN IF EXISTS fulltext_col CASCADE;
ALTER TABLE tiger2012.aiannh DROP COLUMN IF EXISTS fulltext_col CASCADE;
ALTER TABLE tiger2012.aits DROP COLUMN IF EXISTS fulltext_col CASCADE;
ALTER TABLE tiger2012.anrc DROP COLUMN IF EXISTS fulltext_col CASCADE;
ALTER TABLE tiger2012.bg DROP COLUMN IF EXISTS fulltext_col CASCADE;
ALTER TABLE tiger2012.cnecta DROP COLUMN IF EXISTS fulltext_col CASCADE;
ALTER TABLE tiger2012.concity DROP COLUMN IF EXISTS fulltext_col CASCADE;
ALTER TABLE tiger2012.metdiv DROP COLUMN IF EXISTS fulltext_col CASCADE;
ALTER TABLE tiger2012.necta DROP COLUMN IF EXISTS fulltext_col CASCADE;
ALTER TABLE tiger2012.nectadiv DROP COLUMN IF EXISTS fulltext_col CASCADE;
ALTER TABLE tiger2012.submcd DROP COLUMN IF EXISTS fulltext_col CASCADE;
ALTER TABLE tiger2012.tbg DROP COLUMN IF EXISTS fulltext_col CASCADE;
ALTER TABLE tiger2012.ttract DROP COLUMN IF EXISTS fulltext_col CASCADE;
ALTER TABLE tiger2012.tabblock DROP COLUMN IF EXISTS fulltext_col CASCADE;
ALTER TABLE tiger2012.tract DROP COLUMN IF EXISTS fulltext_col CASCADE;
ALTER TABLE tiger2012.uac DROP COLUMN IF EXISTS fulltext_col CASCADE;
ALTER TABLE tiger2012.unsd DROP COLUMN IF EXISTS fulltext_col CASCADE;
ALTER TABLE tiger2012.vtd DROP COLUMN IF EXISTS fulltext_col CASCADE;

-- Change ownership on the TIGER tables
ALTER TABLE tiger2012.cbsa OWNER TO census;
ALTER TABLE tiger2012.cd OWNER TO census;
ALTER TABLE tiger2012.county OWNER TO census;
ALTER TABLE tiger2012.csa OWNER TO census;
ALTER TABLE tiger2012.place OWNER TO census;
ALTER TABLE tiger2012.state OWNER TO census;
ALTER TABLE tiger2012.elsd OWNER TO census;
ALTER TABLE tiger2012.scsd OWNER TO census;
ALTER TABLE tiger2012.zcta5 OWNER TO census;
ALTER TABLE tiger2012.cousub OWNER TO census;
ALTER TABLE tiger2012.puma OWNER TO census;
ALTER TABLE tiger2012.sldl OWNER TO census;
ALTER TABLE tiger2012.sldu OWNER TO census;
ALTER TABLE tiger2012.aiannh OWNER TO census;
ALTER TABLE tiger2012.aits OWNER TO census;
ALTER TABLE tiger2012.anrc OWNER TO census;
ALTER TABLE tiger2012.bg OWNER TO census;
ALTER TABLE tiger2012.cnecta OWNER TO census;
ALTER TABLE tiger2012.concity OWNER TO census;
ALTER TABLE tiger2012.metdiv OWNER TO census;
ALTER TABLE tiger2012.necta OWNER TO census;
ALTER TABLE tiger2012.nectadiv OWNER TO census;
ALTER TABLE tiger2012.submcd OWNER TO census;
ALTER TABLE tiger2012.tbg OWNER TO census;
ALTER TABLE tiger2012.ttract OWNER TO census;
ALTER TABLE tiger2012.tabblock OWNER TO census;
ALTER TABLE tiger2012.tract OWNER TO census;
ALTER TABLE tiger2012.uac OWNER TO census;
ALTER TABLE tiger2012.unsd OWNER TO census;
ALTER TABLE tiger2012.vtd OWNER TO census;

-- Create a unified table for all census names -> geoid
DROP TABLE IF EXISTS tiger2012.census_name_lookup;
CREATE TABLE tiger2012.census_name_lookup (
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
SELECT AddGeometryColumn('tiger2012', 'census_name_lookup', 'the_geom', 4326, 'MULTIPOLYGON', 2);

INSERT INTO tiger2012.census_name_lookup
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
        state.the_geom
    FROM tiger2012.state LEFT OUTER JOIN acs2012_5yr.b01003 ON (('04000US' || state.geoid) = b01003.geoid)
    WHERE state.geoid NOT IN ('60', '66', '69', '78');
INSERT INTO tiger2012.census_name_lookup
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
        place.the_geom
    FROM tiger2012.place LEFT OUTER JOIN acs2012_5yr.b01003 ON (('16000US' || place.geoid) = b01003.geoid) JOIN tiger2012.state USING (statefp)
    WHERE state.geoid NOT IN ('60', '66', '69', '78');
INSERT INTO tiger2012.census_name_lookup VALUES (
        'New York city, NY', 'New York city', 'new york city ny', '160', '3651000', '16000US3651000', 20, 8128980, 783934135, 429462763, null);
INSERT INTO tiger2012.census_name_lookup
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
        county.the_geom
    FROM tiger2012.county LEFT OUTER JOIN acs2012_5yr.b01003 ON (('05000US' || county.geoid) = b01003.geoid) JOIN tiger2012.state USING (statefp)
    WHERE state.geoid NOT IN ('60', '66', '69', '78');
INSERT INTO tiger2012.census_name_lookup
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
        cousub.the_geom
    FROM tiger2012.cousub LEFT OUTER JOIN acs2012_5yr.b01003 ON (('06000US' || cousub.geoid) = b01003.geoid) JOIN tiger2012.county USING (statefp, countyfp) JOIN tiger2012.state USING (statefp)
    WHERE state.geoid NOT IN ('60', '66', '69', '78');
INSERT INTO tiger2012.census_name_lookup
    SELECT
        zcta5.zcta5ce10,
        zcta5.zcta5ce10,
        zcta5.zcta5ce10,
        '860',
        zcta5.geoid10,
        '86000US' || zcta5.geoid10,
        50,
        b01003.b01003001,
        zcta5.aland10,
        zcta5.awater10,
        zcta5.the_geom
    FROM tiger2012.zcta5 LEFT OUTER JOIN acs2012_5yr.b01003 ON (('86000US' || zcta5.geoid10) = b01003.geoid);
INSERT INTO tiger2012.census_name_lookup
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
        cbsa.the_geom
    FROM tiger2012.cbsa LEFT OUTER JOIN acs2012_5yr.b01003 ON (('31000US' || cbsa.geoid) = b01003.geoid);
INSERT INTO tiger2012.census_name_lookup
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
        cd.the_geom
    FROM tiger2012.cd LEFT OUTER JOIN acs2012_5yr.b01003 ON (('50000US' || cd.geoid) = b01003.geoid) JOIN tiger2012.state USING (statefp)
    WHERE state.geoid NOT IN ('60', '66', '69', '78');
INSERT INTO tiger2012.census_name_lookup
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
        csa.the_geom
    FROM tiger2012.csa LEFT OUTER JOIN acs2012_5yr.b01003 ON (('33000US' || csa.geoid) = b01003.geoid);
INSERT INTO tiger2012.census_name_lookup
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
        elsd.the_geom
    FROM tiger2012.elsd LEFT OUTER JOIN acs2012_5yr.b01003 ON (('95000US' || elsd.geoid) = b01003.geoid) JOIN tiger2012.state USING (statefp);
INSERT INTO tiger2012.census_name_lookup
    SELECT
        scsd.name || ', ' || state.stusps,
        scsd.name,
        scsd.name,
        '960',
        scsd.geoid,
        '96000US' || scsd.geoid,
        100,
        b01003.b01003001,
        scsd.aland,
        scsd.awater,
        scsd.the_geom
    FROM tiger2012.scsd LEFT OUTER JOIN acs2012_5yr.b01003 ON (('96000US' || scsd.geoid) = b01003.geoid) JOIN tiger2012.state USING (statefp);
INSERT INTO tiger2012.census_name_lookup
    SELECT
        puma.namelsad10 || ', ' || state.stusps,
        puma.namelsad10,
        puma.namelsad10,
        '795',
        puma.geoid10,
        '79500US' || puma.geoid10,
        110,
        b01003.b01003001,
        puma.aland10,
        puma.awater10,
        puma.the_geom
    FROM tiger2012.puma LEFT OUTER JOIN acs2012_5yr.b01003 ON (('79500US' || puma.geoid10) = b01003.geoid) JOIN tiger2012.state ON (puma.statefp10=state.statefp);
INSERT INTO tiger2012.census_name_lookup
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
        sldl.the_geom
    FROM tiger2012.sldl LEFT OUTER JOIN acs2012_5yr.b01003 ON (('62000US' || sldl.geoid) = b01003.geoid) JOIN tiger2012.state USING (statefp);
INSERT INTO tiger2012.census_name_lookup
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
        sldu.the_geom
    FROM tiger2012.sldu LEFT OUTER JOIN acs2012_5yr.b01003 ON (('61000US' || sldu.geoid) = b01003.geoid) JOIN tiger2012.state USING (statefp);
INSERT INTO tiger2012.census_name_lookup
    SELECT
        aiannh.namelsad,
        aiannh.namelsad,
        aiannh.namelsad,
        '250',
        aiannh.geoid,
        '25000US' || aiannh.geoid,
        140,
        b01003.b01003001,
        aiannh.aland,
        aiannh.awater,
        aiannh.the_geom
    FROM tiger2012.aiannh LEFT OUTER JOIN acs2012_5yr.b01003 ON (('25000US' || aiannh.geoid) = b01003.geoid);
INSERT INTO tiger2012.census_name_lookup
    SELECT
        aits.namelsad,
        aits.namelsad,
        aits.namelsad,
        '251',
        aits.geoid,
        '25100US' || aits.geoid,
        150,
        b01003.b01003001,
        aits.aland,
        aits.awater,
        aits.the_geom
    FROM tiger2012.aits LEFT OUTER JOIN acs2012_5yr.b01003 ON (('25100US' || aits.geoid) = b01003.geoid);
INSERT INTO tiger2012.census_name_lookup
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
        anrc.the_geom
    FROM tiger2012.anrc LEFT OUTER JOIN acs2012_5yr.b01003 ON (('23000US' || anrc.geoid) = b01003.geoid);
INSERT INTO tiger2012.census_name_lookup
    SELECT
        bg.namelsad || ', ' || county.name || ', ' || state.stusps,
        bg.namelsad,
        null,
        '150',
        bg.geoid,
        '15000US' || bg.geoid,
        170,
        b01003.b01003001,
        bg.aland,
        bg.awater,
        bg.the_geom
    FROM tiger2012.bg LEFT OUTER JOIN acs2012_5yr.b01003 ON (('15000US' || bg.geoid) = b01003.geoid) JOIN tiger2012.county USING (statefp, countyfp) JOIN tiger2012.state USING (statefp);
INSERT INTO tiger2012.census_name_lookup
    SELECT
        cnecta.namelsad,
        cnecta.namelsad,
        cnecta.namelsad,
        '335',
        cnecta.geoid,
        '33500US' || cnecta.geoid,
        180,
        b01003.b01003001,
        cnecta.aland,
        cnecta.awater,
        cnecta.the_geom
    FROM tiger2012.cnecta LEFT OUTER JOIN acs2012_5yr.b01003 ON (('33500US' || cnecta.geoid) = b01003.geoid);
INSERT INTO tiger2012.census_name_lookup
    SELECT
        concity.namelsad || ', ' || state.stusps,
        concity.namelsad,
        concity.name || ' ' || state.stusps,
        '170',
        concity.geoid,
        '17000US' || concity.geoid,
        190,
        b01003.b01003001,
        concity.aland,
        concity.awater,
        concity.the_geom
    FROM tiger2012.concity LEFT OUTER JOIN acs2012_5yr.b01003 ON (('17000US' || concity.geoid) = b01003.geoid) JOIN tiger2012.state USING (statefp);
INSERT INTO tiger2012.census_name_lookup
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
        metdiv.the_geom
    FROM tiger2012.metdiv LEFT OUTER JOIN acs2012_5yr.b01003 ON (('31400US' || metdiv.geoid) = b01003.geoid);
INSERT INTO tiger2012.census_name_lookup
    SELECT
        necta.namelsad,
        necta.namelsad,
        necta.name,
        '350',
        necta.geoid,
        '35000US' || necta.geoid,
        210,
        b01003.b01003001,
        necta.aland,
        necta.awater,
        necta.the_geom
    FROM tiger2012.necta LEFT OUTER JOIN acs2012_5yr.b01003 ON (('35000US' || necta.geoid) = b01003.geoid);
INSERT INTO tiger2012.census_name_lookup
    SELECT
        nectadiv.namelsad,
        nectadiv.namelsad,
        nectadiv.name,
        '355',
        nectadiv.geoid,
        '35500US' || nectadiv.geoid,
        220,
        b01003.b01003001,
        nectadiv.aland,
        nectadiv.awater,
        nectadiv.the_geom
    FROM tiger2012.nectadiv LEFT OUTER JOIN acs2012_5yr.b01003 ON (('35500US' || nectadiv.geoid) = b01003.geoid);
INSERT INTO tiger2012.census_name_lookup
    SELECT
        submcd.namelsad,
        submcd.namelsad,
        submcd.name,
        '067',
        submcd.geoid,
        '06700US' || submcd.geoid,
        230,
        b01003.b01003001,
        submcd.aland,
        submcd.awater,
        submcd.the_geom
    FROM tiger2012.submcd LEFT OUTER JOIN acs2012_5yr.b01003 ON (('06700US' || submcd.geoid) = b01003.geoid);
INSERT INTO tiger2012.census_name_lookup
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
        tbg.the_geom
    FROM tiger2012.tbg LEFT OUTER JOIN acs2012_5yr.b01003 ON (('25800US' || tbg.geoid) = b01003.geoid);
INSERT INTO tiger2012.census_name_lookup
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
        ttract.the_geom
    FROM tiger2012.ttract LEFT OUTER JOIN acs2012_5yr.b01003 ON (('25600US' || ttract.geoid) = b01003.geoid);
-- Don't include blocks because there's no ACS data for it.
-- INSERT INTO tiger2012.census_name_lookup
--     SELECT
--         tabblock.name || ', ' || county.name || ', ' || state.stusps,
--         null,
--         '101',
--         tabblock.geoid,
--         '10100US' || tabblock.geoid,
--         260,
--         NULL,
--         NULL,
--         NULL,
--         tabblock.the_geom
--     FROM tiger2012.tabblock JOIN tiger2012.county USING (statefp, countyfp) JOIN tiger2012.state USING (statefp);
INSERT INTO tiger2012.census_name_lookup
    SELECT
        tract.namelsad || ', ' || county.name || ', ' || state.stusps,
        tract.namelsad,
        null,
        '140',
        tract.geoid,
        '14000US' || tract.geoid,
        270,
        b01003.b01003001,
        tract.aland,
        tract.awater,
        tract.the_geom
    FROM tiger2012.tract LEFT OUTER JOIN acs2012_5yr.b01003 ON (('14000US' || tract.geoid) = b01003.geoid) JOIN tiger2012.county USING (statefp, countyfp) JOIN tiger2012.state USING (statefp);
INSERT INTO tiger2012.census_name_lookup
    SELECT
        uac.namelsad10,
        uac.name10,
        uac.name10,
        '400',
        uac.geoid10,
        '40000US' || uac.geoid10,
        280,
        b01003.b01003001,
        uac.aland10,
        uac.awater10,
        uac.the_geom
    FROM tiger2012.uac LEFT OUTER JOIN acs2012_5yr.b01003 ON (('40000US' || uac.geoid10) = b01003.geoid);
INSERT INTO tiger2012.census_name_lookup
    SELECT
        unsd.name || ', ' || state.stusps,
        unsd.name,
        unsd.name || ' ' || state.stusps,
        '970',
        unsd.geoid,
        '97000US' || unsd.geoid,
        290,
        b01003.b01003001,
        unsd.aland,
        unsd.awater,
        unsd.the_geom
    FROM tiger2012.unsd LEFT OUTER JOIN acs2012_5yr.b01003 ON (('97000US' || unsd.geoid) = b01003.geoid) JOIN tiger2012.state USING (statefp);
INSERT INTO tiger2012.census_name_lookup
    SELECT
        vtd.name10 || ', ' || state.stusps,
        vtd.name10,
        vtd.name10 || ' ' || state.stusps,
        '700',
        vtd.geoid10,
        '70000US' || vtd.geoid10,
        300,
        b01003.b01003001,
        vtd.aland10,
        vtd.awater10,
        vtd.the_geom
    FROM tiger2012.vtd LEFT OUTER JOIN acs2012_5yr.b01003 ON (('70000US' || vtd.geoid10) = b01003.geoid) JOIN tiger2012.state ON (vtd.statefp10=state.statefp);
INSERT INTO tiger2012.census_name_lookup
    SELECT
        'United States',
        'United States',
        'united states',
        '010',
        '',
        '01000US',
        5,
        (SELECT b01003.b01003001 FROM acs2012_5yr.b01003 WHERE geoid='01000US'),
        (SELECT SUM(aland) FROM tiger2012.state),
        (SELECT SUM(awater) FROM tiger2012.state),
        (SELECT ST_Simplify(ST_Union(the_geom), 0.01) FROM tiger2012.state);

---- Divisions
-- Division 1
INSERT INTO tiger2012.census_name_lookup
    SELECT
        'New England Division',
        'New England Division',
        'new england division',
        '030',
        '',
        '03000US1',
        310,
        (SELECT b01003.b01003001 FROM acs2012_5yr.b01003 WHERE geoid = '03000US1'),
        (SELECT SUM(aland) FROM tiger2012.state WHERE division='1'),
        (SELECT SUM(awater) FROM tiger2012.state WHERE division='1'),
        (SELECT ST_Union(the_geom) FROM tiger2012.census_name_lookup WHERE full_geoid IN ('04000US09', '04000US23', '04000US25', '04000US33', '04000US44', '04000US50'));
-- Division 2
INSERT INTO tiger2012.census_name_lookup
    SELECT
        'Middle Atlantic Division',
        'Middle Atlantic Division',
        'middle atlantic division',
        '030',
        '',
        '03000US2',
        310,
        (SELECT b01003.b01003001 FROM acs2012_5yr.b01003 WHERE geoid = '03000US2'),
        (SELECT SUM(aland) FROM tiger2012.state WHERE division='2'),
        (SELECT SUM(awater) FROM tiger2012.state WHERE division='2'),
        (SELECT ST_Multi(ST_Union(the_geom)) FROM tiger2012.census_name_lookup WHERE full_geoid IN ('04000US34', '04000US36', '04000US42'));
-- Division 3
INSERT INTO tiger2012.census_name_lookup
    SELECT
        'East North Central Division',
        'East North Central Division',
        'east north central division',
        '030',
        '',
        '03000US3',
        310,
        (SELECT b01003.b01003001 FROM acs2012_5yr.b01003 WHERE geoid = '03000US3'),
        (SELECT SUM(aland) FROM tiger2012.state WHERE division='3'),
        (SELECT SUM(awater) FROM tiger2012.state WHERE division='3'),
        (SELECT ST_Multi(ST_Union(the_geom)) FROM tiger2012.census_name_lookup WHERE full_geoid IN ('04000US18', '04000US17', '04000US26', '04000US39', '04000US55'));
-- Division 4
INSERT INTO tiger2012.census_name_lookup
    SELECT
        'West North Central Division',
        'West North Central Division',
        'west north central division',
        '030',
        '',
        '03000US4',
        310,
        (SELECT b01003.b01003001 FROM acs2012_5yr.b01003 WHERE geoid = '03000US4'),
        (SELECT SUM(aland) FROM tiger2012.state WHERE division='4'),
        (SELECT SUM(awater) FROM tiger2012.state WHERE division='4'),
        (SELECT ST_Multi(ST_Union(the_geom)) FROM tiger2012.census_name_lookup WHERE full_geoid IN ('04000US19', '04000US20', '04000US27', '04000US29', '04000US31', '04000US38', '04000US46'));
-- Division 5
INSERT INTO tiger2012.census_name_lookup
    SELECT
        'South Atlantic Division',
        'South Atlantic Division',
        'south atlantic division',
        '030',
        '',
        '03000US5',
        310,
        (SELECT b01003.b01003001 FROM acs2012_5yr.b01003 WHERE geoid = '03000US5'),
        (SELECT SUM(aland) FROM tiger2012.state WHERE division='5'),
        (SELECT SUM(awater) FROM tiger2012.state WHERE division='5'),
        (SELECT ST_Multi(ST_Union(the_geom)) FROM tiger2012.census_name_lookup WHERE full_geoid IN ('04000US10', '04000US11', '04000US12', '04000US13', '04000US24', '04000US37', '04000US45', '04000US51', '04000US54'));
-- Division 6
INSERT INTO tiger2012.census_name_lookup
    SELECT
        'East South Central Division',
        'East South Central Division',
        'east south central division',
        '030',
        '',
        '03000US6',
        310,
        (SELECT b01003.b01003001 FROM acs2012_5yr.b01003 WHERE geoid = '03000US6'),
        (SELECT SUM(aland) FROM tiger2012.state WHERE division='6'),
        (SELECT SUM(awater) FROM tiger2012.state WHERE division='6'),
        (SELECT ST_Multi(ST_Union(the_geom)) FROM tiger2012.census_name_lookup WHERE full_geoid IN ('04000US01', '04000US21', '04000US28', '04000US47'));
-- Division 7
INSERT INTO tiger2012.census_name_lookup
    SELECT
        'West South Central Division',
        'West South Central Division',
        'west south central division',
        '030',
        '',
        '03000US7',
        310,
        (SELECT b01003.b01003001 FROM acs2012_5yr.b01003 WHERE geoid = '03000US7'),
        (SELECT SUM(aland) FROM tiger2012.state WHERE division='7'),
        (SELECT SUM(awater) FROM tiger2012.state WHERE division='7'),
        (SELECT ST_Multi(ST_Union(the_geom)) FROM tiger2012.census_name_lookup WHERE full_geoid IN ('04000US05', '04000US22', '04000US40', '04000US48'));
-- Division 8
INSERT INTO tiger2012.census_name_lookup
    SELECT
        'Mountain Division',
        'Mountain Division',
        'mountain division',
        '030',
        '',
        '03000US8',
        310,
        (SELECT b01003.b01003001 FROM acs2012_5yr.b01003 WHERE geoid = '03000US8'),
        (SELECT SUM(aland) FROM tiger2012.state WHERE division='8'),
        (SELECT SUM(awater) FROM tiger2012.state WHERE division='8'),
        (SELECT ST_Multi(ST_Union(the_geom)) FROM tiger2012.census_name_lookup WHERE full_geoid IN ('04000US04', '04000US08', '04000US16', '04000US35', '04000US30', '04000US49', '04000US32', '04000US56'));
-- Division 9
INSERT INTO tiger2012.census_name_lookup
    SELECT
        'Pacific Division',
        'Pacific Division',
        'pacific division',
        '030',
        '',
        '03000US9',
        310,
        (SELECT b01003.b01003001 FROM acs2012_5yr.b01003 WHERE geoid = '03000US9'),
        (SELECT SUM(aland) FROM tiger2012.state WHERE division='9'),
        (SELECT SUM(awater) FROM tiger2012.state WHERE division='9'),
        (SELECT ST_Multi(ST_Union(the_geom)) FROM tiger2012.census_name_lookup WHERE full_geoid IN ('04000US02', '04000US06', '04000US15', '04000US41', '04000US53'));

---- Regions
-- Region 1
INSERT INTO tiger2012.census_name_lookup
    SELECT
        'Northeast Region',
        'Northeast Region',
        'northeast region',
        '020',
        '',
        '02000US1',
        320,
        (SELECT b01003.b01003001 FROM acs2012_5yr.b01003 WHERE geoid = '02000US1'),
        (SELECT SUM(aland) FROM tiger2012.state WHERE region='1'),
        (SELECT SUM(awater) FROM tiger2012.state WHERE region='1'),
        (SELECT ST_Multi(ST_Union(the_geom)) FROM tiger2012.census_name_lookup WHERE full_geoid IN ('03000US1', '03000US2'));
-- Region 2
INSERT INTO tiger2012.census_name_lookup
    SELECT
        'Midwest Region',
        'Midwest Region',
        'midwest region',
        '020',
        '',
        '02000US2',
        320,
        (SELECT b01003.b01003001 FROM acs2012_5yr.b01003 WHERE geoid = '02000US2'),
        (SELECT SUM(aland) FROM tiger2012.state WHERE region='2'),
        (SELECT SUM(awater) FROM tiger2012.state WHERE region='2'),
        (SELECT ST_Multi(ST_Union(the_geom)) FROM tiger2012.census_name_lookup WHERE full_geoid IN ('03000US3', '03000US4'));
-- Region 3
INSERT INTO tiger2012.census_name_lookup
    SELECT
        'South Region',
        'South Region',
        'south region',
        '020',
        '',
        '02000US3',
        320,
        (SELECT b01003.b01003001 FROM acs2012_5yr.b01003 WHERE geoid = '02000US3'),
        (SELECT SUM(aland) FROM tiger2012.state WHERE region='3'),
        (SELECT SUM(awater) FROM tiger2012.state WHERE region='3'),
        (SELECT ST_Multi(ST_Union(the_geom)) FROM tiger2012.census_name_lookup WHERE full_geoid IN ('03000US5', '03000US6', '03000US7'));
-- Region 4
INSERT INTO tiger2012.census_name_lookup
    SELECT
        'West Region',
        'West Region',
        'west region',
        '020',
        '',
        '02000US4',
        320,
        (SELECT b01003.b01003001 FROM acs2012_5yr.b01003 WHERE geoid = '02000US4'),
        (SELECT SUM(aland) FROM tiger2012.state WHERE region='4'),
        (SELECT SUM(awater) FROM tiger2012.state WHERE region='4'),
        (SELECT ST_Multi(ST_Union(the_geom)) FROM tiger2012.census_name_lookup WHERE full_geoid IN ('03000US8', '03000US9'));

CREATE INDEX census_name_lookup_idx_lower ON tiger2012.census_name_lookup ((lower(prefix_match_name)) text_pattern_ops);
CREATE INDEX census_name_lookup_idx_geom ON tiger2012.census_name_lookup USING GIST(the_geom);
CREATE INDEX census_name_lookup_idx_geoid ON tiger2012.census_name_lookup (full_geoid);
