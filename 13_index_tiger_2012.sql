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

-- Add in geoid indexes
CREATE INDEX cbsa_idx_geoid ON tiger2012.cbsa (geoid);
CREATE INDEX cd_idx_geoid ON tiger2012.cd (geoid);
CREATE INDEX county_idx_geoid ON tiger2012.county (geoid);
CREATE INDEX csa_idx_geoid ON tiger2012.csa (geoid);
CREATE INDEX place_idx_geoid ON tiger2012.place (geoid);
CREATE INDEX state_idx_geoid ON tiger2012.state (geoid);
CREATE INDEX elsd_idx_geoid ON tiger2012.elsd (geoid);
CREATE INDEX scsd_idx_geoid ON tiger2012.scsd (geoid);
CREATE INDEX zcta5_idx_geoid10 ON tiger2012.zcta5 (geoid10);
CREATE INDEX cousub_idx_geoid ON tiger2012.cousub (geoid);
CREATE INDEX puma_idx_geoid10 ON tiger2012.puma (geoid10);
CREATE INDEX sldl_idx_geoid ON tiger2012.sldl (geoid);
CREATE INDEX sldu_idx_geoid ON tiger2012.sldu (geoid);
CREATE INDEX aiannh_idx_geoid ON tiger2012.aiannh (geoid);
CREATE INDEX aits_idx_geoid ON tiger2012.aits (geoid);
CREATE INDEX anrc_idx_geoid ON tiger2012.anrc (geoid);
CREATE INDEX bg_idx_geoid ON tiger2012.bg (geoid);
CREATE INDEX cnecta_idx_geoid ON tiger2012.cnecta (geoid);
CREATE INDEX concity_idx_geoid ON tiger2012.concity (geoid);
CREATE INDEX metdiv_idx_geoid ON tiger2012.metdiv (geoid);
CREATE INDEX necta_idx_geoid ON tiger2012.necta (geoid);
CREATE INDEX nectadiv_idx_geoid ON tiger2012.nectadiv (geoid);
CREATE INDEX submcd_idx_geoid ON tiger2012.submcd (geoid);
CREATE INDEX tbg_idx_geoid ON tiger2012.tbg (geoid);
CREATE INDEX ttract_idx_geoid ON tiger2012.ttract (geoid);
CREATE INDEX tabblock_idx_geoid ON tiger2012.tabblock (geoid);
CREATE INDEX tract_idx_geoid ON tiger2012.tract (geoid);
CREATE INDEX uac_idx_geoid10 ON tiger2012.uac (geoid10);
CREATE INDEX unsd_idx_geoid ON tiger2012.unsd (geoid);
CREATE INDEX vtd_idx_geoid10 ON tiger2012.vtd (geoid10);

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
    prefix_match_name varchar,
    sumlevel varchar(3),
    geoid varchar,
    full_geoid varchar(20)
);

INSERT INTO tiger2012.census_name_lookup
    SELECT
        name,
        name,
        '040',
        geoid,
        '04000US' || geoid
    FROM tiger2012.state WHERE geoid NOT IN ('60', '66', '69', '78');
INSERT INTO tiger2012.census_name_lookup
    SELECT
        county.name || ', ' || state.stusps,
        county.name || ' ' || state.stusps,
        '050',
        county.geoid,
        '05000US' || county.geoid
    FROM tiger2012.county JOIN tiger2012.state USING (statefp);
INSERT INTO tiger2012.census_name_lookup
    SELECT
        place.name || ', ' || state.stusps,
        place.name || ' ' || state.stusps,
        '160',
        place.geoid,
        '16000US' || place.geoid
    FROM tiger2012.place JOIN tiger2012.state USING (statefp);
INSERT INTO tiger2012.census_name_lookup
    SELECT
        cousub.namelsad || ', ' || county.name || ', ' || state.stusps,
        cousub.name || ' ' || state.stusps,
        '060',
        cousub.geoid,
        '06000US' || cousub.geoid
    FROM tiger2012.cousub JOIN tiger2012.county USING (statefp, countyfp) JOIN tiger2012.state USING (statefp);
INSERT INTO tiger2012.census_name_lookup
    SELECT
        zcta5.zcta5ce10,
        zcta5.zcta5ce10,
        '860',
        zcta5.geoid10,
        '86000US' || zcta5.geoid10
    FROM tiger2012.zcta5;
CREATE INDEX census_name_lookup_idx_lower ON tiger2012.census_name_lookup ((lower(prefix_match_name)) text_pattern_ops);

-- Create a unified view for all census shapes
DROP VIEW IF EXISTS tiger2012.census_names;
CREATE VIEW tiger2012.census_names AS
SELECT '040' AS sumlevel, geoid, name, aland, awater, intptlat, intptlon, the_geom FROM tiger2012.state WHERE geoid NOT IN ('60', '66', '69', '78') UNION ALL
SELECT '050' AS sumlevel, geoid, name, aland, awater, intptlat, intptlon, the_geom FROM tiger2012.county UNION ALL
SELECT '160' AS sumlevel, geoid, name, aland, awater, intptlat, intptlon, the_geom FROM tiger2012.place UNION ALL
SELECT '060' AS sumlevel, geoid, name, aland, awater, intptlat, intptlon, the_geom FROM tiger2012.cousub UNION ALL
SELECT '310' AS sumlevel, geoid, name, aland, awater, intptlat, intptlon, the_geom FROM tiger2012.cbsa UNION ALL
SELECT '500' AS sumlevel, geoid, namelsad AS name, aland, awater, intptlat, intptlon, the_geom FROM tiger2012.cd UNION ALL
SELECT '330' AS sumlevel, geoid, name, aland, awater, intptlat, intptlon, the_geom FROM tiger2012.csa UNION ALL
SELECT '950' AS sumlevel, geoid, name, aland, awater, intptlat, intptlon, the_geom FROM tiger2012.elsd UNION ALL
SELECT '960' AS sumlevel, geoid, name, aland, awater, intptlat, intptlon, the_geom FROM tiger2012.scsd UNION ALL
SELECT '860' AS sumlevel, geoid10 AS geoid, zcta5ce10 AS name, aland10 AS aland, awater10 AS awater, intptlat10 AS intptlat, intptlon10 AS intptlon, the_geom FROM tiger2012.zcta5 UNION ALL
SELECT '795' AS sumlevel, geoid10 AS geoid, namelsad10 AS name, aland10 AS aland, awater10 AS awater, intptlat10 AS intptlat, intptlon10 AS intptlon, the_geom FROM tiger2012.puma UNION ALL
SELECT '620' AS sumlevel, geoid, namelsad AS name, aland, awater, intptlat, intptlon, the_geom FROM tiger2012.sldl UNION ALL
SELECT '610' AS sumlevel, geoid, namelsad AS name, aland, awater, intptlat, intptlon, the_geom FROM tiger2012.sldu UNION ALL
SELECT '250' AS sumlevel, geoid, namelsad AS name, aland, awater, intptlat, intptlon, the_geom FROM tiger2012.aiannh UNION ALL
SELECT '251' AS sumlevel, geoid, namelsad AS name, aland, awater, intptlat, intptlon, the_geom FROM tiger2012.aits UNION ALL
SELECT '230' AS sumlevel, geoid, namelsad AS name, aland, awater, intptlat, intptlon, the_geom FROM tiger2012.anrc UNION ALL
SELECT '150' AS sumlevel, geoid, namelsad AS name, aland, awater, intptlat, intptlon, the_geom FROM tiger2012.bg UNION ALL
SELECT '335' AS sumlevel, geoid, namelsad AS name, aland, awater, intptlat, intptlon, the_geom FROM tiger2012.cnecta UNION ALL
SELECT '170' AS sumlevel, geoid, namelsad AS name, aland, awater, intptlat, intptlon, the_geom FROM tiger2012.concity UNION ALL
SELECT '314' AS sumlevel, geoid, namelsad AS name, aland, awater, intptlat, intptlon, the_geom FROM tiger2012.metdiv UNION ALL
SELECT '350' AS sumlevel, geoid, namelsad AS name, aland, awater, intptlat, intptlon, the_geom FROM tiger2012.necta UNION ALL
SELECT '355' AS sumlevel, geoid, namelsad AS name, aland, awater, intptlat, intptlon, the_geom FROM tiger2012.nectadiv UNION ALL
SELECT '067' AS sumlevel, geoid, namelsad AS name, aland, awater, intptlat, intptlon, the_geom FROM tiger2012.submcd UNION ALL
SELECT '258' AS sumlevel, geoid, namelsad AS name, aland, awater, intptlat, intptlon, the_geom FROM tiger2012.tbg UNION ALL
SELECT '256' AS sumlevel, geoid, namelsad AS name, aland, awater, intptlat, intptlon, the_geom FROM tiger2012.ttract UNION ALL
SELECT '101' AS sumlevel, geoid, name, aland, awater, intptlat, intptlon, the_geom FROM tiger2012.tabblock UNION ALL
SELECT '140' AS sumlevel, geoid, namelsad AS name, aland, awater, intptlat, intptlon, the_geom FROM tiger2012.tract UNION ALL
SELECT '400' AS sumlevel, geoid10 AS geoid, namelsad10 AS name, aland10 AS aland, awater10 AS awater, intptlat10 AS intptlat, intptlon10 AS intptlon, the_geom FROM tiger2012.uac UNION ALL
SELECT '970' AS sumlevel, geoid, name, aland, awater, intptlat, intptlon, the_geom FROM tiger2012.unsd UNION ALL
SELECT '700' AS sumlevel, geoid10 AS geoid, namelsad10 AS name, aland10 AS aland, awater10 AS awater, intptlat10 AS intptlat, intptlon10 AS intptlon, the_geom FROM tiger2012.vtd UNION ALL
SELECT '010' AS sumlevel, '' AS geoid, 'United States' AS name, 9158687485691 AS aland, 698638462086 AS awater, '+40.0' AS intptlat, '-99.8' AS intptlon, null AS the_geom;
ALTER VIEW tiger2012.census_names OWNER TO census;