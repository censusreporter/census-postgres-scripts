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

-- Add in the name indexes for autocomplete
ALTER TABLE tiger2012.cbsa ADD COLUMN fulltext_col tsvector;
UPDATE tiger2012.cbsa SET fulltext_col = to_tsvector('english', (
    namelsad || ' ' ||
    '31000US' || geoid));
CREATE INDEX cbsa_idx_fulltext ON tiger2012.cbsa USING gin(fulltext_col);

ALTER TABLE tiger2012.cd ADD COLUMN fulltext_col tsvector;
UPDATE tiger2012.cd o SET fulltext_col = to_tsvector('english', (SELECT
    t.namelsad || ' ' ||
    s.stusps || ' ' ||
    s.name || ' ' ||
    '50000US' || t.geoid FROM tiger2012.cd t JOIN tiger2012.state s USING (statefp) WHERE t.gid=o.gid));
CREATE INDEX cd_idx_fulltext ON tiger2012.cd USING gin(fulltext_col);

ALTER TABLE tiger2012.county ADD COLUMN fulltext_col tsvector;
UPDATE tiger2012.county o SET fulltext_col = to_tsvector('english', (SELECT
    t.name || ' ' ||
    s.stusps || ' ' ||
    s.name || ' ' ||
    '05000US' || t.geoid  FROM tiger2012.county t JOIN tiger2012.state s USING (statefp) WHERE t.gid=o.gid));
CREATE INDEX county_idx_fulltext ON tiger2012.county USING gin(fulltext_col);

ALTER TABLE tiger2012.csa ADD COLUMN fulltext_col tsvector;
UPDATE tiger2012.csa o SET fulltext_col = to_tsvector('english', (
    name || ' ' ||
    '33000US' || geoid));
CREATE INDEX csa_idx_fulltext ON tiger2012.csa USING gin(fulltext_col);

ALTER TABLE tiger2012.place ADD COLUMN fulltext_col tsvector;
UPDATE tiger2012.place o SET fulltext_col = to_tsvector('english', (SELECT
    t.name || ' ' ||
    s.stusps || ' ' ||
    s.name || ' ' ||
    '16000US' || t.geoid  FROM tiger2012.place t JOIN tiger2012.state s USING (statefp) WHERE t.gid=o.gid));
CREATE INDEX place_idx_fulltext ON tiger2012.place USING gin(fulltext_col);

ALTER TABLE tiger2012.state ADD COLUMN fulltext_col tsvector;
UPDATE tiger2012.state o SET fulltext_col = to_tsvector('english', (
    name || ' ' ||
    stusps || ' ' ||
    '04000US' || geoid));
CREATE INDEX state_idx_fulltext ON tiger2012.state USING gin(fulltext_col);

ALTER TABLE tiger2012.elsd ADD COLUMN fulltext_col tsvector;
UPDATE tiger2012.elsd o SET fulltext_col = to_tsvector('english', (SELECT
    t.name || ' ' ||
    s.stusps || ' ' ||
    s.name || ' ' ||
    '95000US' || t.geoid  FROM tiger2012.elsd t JOIN tiger2012.state s USING (statefp) WHERE t.gid=o.gid));
CREATE INDEX elsd_idx_fulltext ON tiger2012.elsd USING gin(fulltext_col);

ALTER TABLE tiger2012.scsd ADD COLUMN fulltext_col tsvector;
UPDATE tiger2012.scsd o SET fulltext_col = to_tsvector('english', (SELECT
    t.name || ' ' ||
    s.stusps || ' ' ||
    s.name || ' ' ||
    '96000US' || t.geoid  FROM tiger2012.scsd t JOIN tiger2012.state s USING (statefp) WHERE t.gid=o.gid));
CREATE INDEX scsd_idx_fulltext ON tiger2012.scsd USING gin(fulltext_col);

ALTER TABLE tiger2012.zcta5 ADD COLUMN fulltext_col tsvector;
UPDATE tiger2012.zcta5 o SET fulltext_col = to_tsvector('english', (
    zcta5ce10 || ' ' ||
    '86000US' || geoid10));
CREATE INDEX zcta5_idx_fulltext ON tiger2012.zcta5 USING gin(fulltext_col);

ALTER TABLE tiger2012.cousub ADD COLUMN fulltext_col tsvector;
UPDATE tiger2012.cousub o SET fulltext_col = to_tsvector('english', (SELECT
    t.name || ' ' ||
    county.name || ' ' ||
    state.name || ' ' ||
    state.stusps || ' ' ||
    '06000US' || t.geoid FROM tiger2012.cousub t JOIN tiger2012.state state USING (statefp) JOIN tiger2012.county county USING (statefp, countyfp) WHERE t.gid=o.gid));
CREATE INDEX cousub_idx_fulltext ON tiger2012.cousub USING gin(fulltext_col);

ALTER TABLE tiger2012.puma ADD COLUMN fulltext_col tsvector;
UPDATE tiger2012.puma o SET fulltext_col = to_tsvector('english', (SELECT
    t.namelsad10 || ' ' ||
    s.stusps || ' ' ||
    s.name || ' ' ||
    '79500US' || t.geoid10 FROM tiger2012.puma t JOIN tiger2012.state s ON (t.statefp10=s.statefp) WHERE t.gid=o.gid));
CREATE INDEX puma_idx_fulltext ON tiger2012.puma USING gin(fulltext_col);

ALTER TABLE tiger2012.sldl ADD COLUMN fulltext_col tsvector;
UPDATE tiger2012.sldl o SET fulltext_col = to_tsvector('english', (SELECT
    t.namelsad || ' ' ||
    s.stusps || ' ' ||
    s.name || ' ' ||
    '62000US' || t.geoid FROM tiger2012.sldl t JOIN tiger2012.state s USING (statefp) WHERE t.gid=o.gid));
CREATE INDEX sldl_idx_fulltext ON tiger2012.sldl USING gin(fulltext_col);

ALTER TABLE tiger2012.sldu ADD COLUMN fulltext_col tsvector;
UPDATE tiger2012.sldu o SET fulltext_col = to_tsvector('english', (SELECT
    t.namelsad || ' ' ||
    s.stusps || ' ' ||
    s.name || ' ' ||
    '61000US' || t.geoid FROM tiger2012.sldu t JOIN tiger2012.state s USING (statefp) WHERE t.gid=o.gid));
CREATE INDEX sldu_idx_fulltext ON tiger2012.sldu USING gin(fulltext_col);

ALTER TABLE tiger2012.aiannh ADD COLUMN fulltext_col tsvector;
UPDATE tiger2012.aiannh o SET fulltext_col = to_tsvector('english', (
    namelsad || ' ' ||
    '25000US' || geoid));
CREATE INDEX aiannh_idx_fulltext ON tiger2012.aiannh USING gin(fulltext_col);

ALTER TABLE tiger2012.aits ADD COLUMN fulltext_col tsvector;
UPDATE tiger2012.aits o SET fulltext_col = to_tsvector('english', (SELECT
    t.namelsad || ' ' ||
    aiannh.namelsad || ' ' ||
    '25100US' || t.geoid FROM tiger2012.aits t JOIN tiger2012.aiannh aiannh USING (aiannhce,classfp) WHERE t.gid=o.gid));
CREATE INDEX aits_idx_fulltext ON tiger2012.aits USING gin(fulltext_col);

ALTER TABLE tiger2012.anrc ADD COLUMN fulltext_col tsvector;
UPDATE tiger2012.anrc o SET fulltext_col = to_tsvector('english', (SELECT
    t.name || ' ' ||
    s.stusps || ' ' ||
    s.name || ' ' ||
    '23000US' || t.geoid FROM tiger2012.anrc t JOIN tiger2012.state s USING (statefp) WHERE t.gid=o.gid));
CREATE INDEX anrc_idx_fulltext ON tiger2012.anrc USING gin(fulltext_col);

ALTER TABLE tiger2012.bg ADD COLUMN fulltext_col tsvector;
UPDATE tiger2012.bg o SET fulltext_col = to_tsvector('english', (
    namelsad || ' ' ||
    '15000US' || geoid));
CREATE INDEX bg_idx_fulltext ON tiger2012.bg USING gin(fulltext_col);

ALTER TABLE tiger2012.cnecta ADD COLUMN fulltext_col tsvector;
UPDATE tiger2012.cnecta o SET fulltext_col = to_tsvector('english', (
    name || ' ' ||
    '33500US' || geoid));
CREATE INDEX cnecta_idx_fulltext ON tiger2012.cnecta USING gin(fulltext_col);

ALTER TABLE tiger2012.concity ADD COLUMN fulltext_col tsvector;
UPDATE tiger2012.concity o SET fulltext_col = to_tsvector('english', (SELECT
    t.name || ' ' ||
    s.stusps || ' ' ||
    s.name || ' ' ||
    '17000US' || t.geoid FROM tiger2012.concity t JOIN tiger2012.state s USING (statefp) WHERE t.gid=o.gid));
CREATE INDEX concity_idx_fulltext ON tiger2012.concity USING gin(fulltext_col);

ALTER TABLE tiger2012.metdiv ADD COLUMN fulltext_col tsvector;
UPDATE tiger2012.metdiv o SET fulltext_col = to_tsvector('english', (
    name || ' ' ||
    '31400US' || geoid));
CREATE INDEX metdiv_idx_fulltext ON tiger2012.metdiv USING gin(fulltext_col);

ALTER TABLE tiger2012.necta ADD COLUMN fulltext_col tsvector;
UPDATE tiger2012.necta o SET fulltext_col = to_tsvector('english', (
    name || ' ' ||
    '35000US' || geoid));
CREATE INDEX necta_idx_fulltext ON tiger2012.necta USING gin(fulltext_col);

ALTER TABLE tiger2012.nectadiv ADD COLUMN fulltext_col tsvector;
UPDATE tiger2012.nectadiv o SET fulltext_col = to_tsvector('english', (
    name || ' ' ||
    '35500US' || geoid));
CREATE INDEX nectadiv_idx_fulltext ON tiger2012.nectadiv USING gin(fulltext_col);

ALTER TABLE tiger2012.submcd ADD COLUMN fulltext_col tsvector;
UPDATE tiger2012.submcd o SET fulltext_col = to_tsvector('english', (SELECT
    t.name || ' ' ||
    county.name || ' ' ||
    state.name || ' ' ||
    state.stusps || ' ' ||
    '06700US' || t.geoid FROM tiger2012.submcd t JOIN tiger2012.state state USING (statefp) JOIN tiger2012.county county USING (statefp, countyfp) WHERE t.gid=o.gid));
CREATE INDEX submcd_idx_fulltext ON tiger2012.submcd USING gin(fulltext_col);

ALTER TABLE tiger2012.tbg ADD COLUMN fulltext_col tsvector;
UPDATE tiger2012.tbg o SET fulltext_col = to_tsvector('english', (SELECT
    t.namelsad || ' ' ||
    aiannh.namelsad || ' ' ||
    '25800US' || t.geoid FROM tiger2012.tbg t JOIN tiger2012.aiannh aiannh ON (t.aiannhce=aiannh.aiannhce AND aiannh.classfp='R') WHERE t.gid=o.gid));
CREATE INDEX tbg_idx_fulltext ON tiger2012.tbg USING gin(fulltext_col);

ALTER TABLE tiger2012.ttract ADD COLUMN fulltext_col tsvector;
UPDATE tiger2012.ttract o SET fulltext_col = to_tsvector('english', (SELECT
    t.name || ' ' ||
    aiannh.namelsad || ' ' ||
    '25600US' || t.geoid FROM tiger2012.ttract t JOIN tiger2012.aiannh aiannh ON (t.aiannhce=aiannh.aiannhce AND aiannh.classfp='R') WHERE t.gid=o.gid));
CREATE INDEX ttract_idx_fulltext ON tiger2012.ttract USING gin(fulltext_col);

-- Not indexing blocks because there are millions of them and very few people will search (in theory)
ALTER TABLE tiger2012.tabblock ADD COLUMN fulltext_col tsvector;
-- UPDATE tiger2012.tabblock o SET fulltext_col = to_tsvector('english', (
--     name || ' ' ||
--     '10100US' || geoid));
-- CREATE INDEX tabblock_idx_fulltext ON tiger2012.tabblock USING gin(fulltext_col);

ALTER TABLE tiger2012.tract ADD COLUMN fulltext_col tsvector;
UPDATE tiger2012.tract o SET fulltext_col = to_tsvector('english', (
    name || ' ' ||
    '14000US' || geoid));
CREATE INDEX tract_idx_fulltext ON tiger2012.tract USING gin(fulltext_col);

ALTER TABLE tiger2012.uac ADD COLUMN fulltext_col tsvector;
UPDATE tiger2012.uac o SET fulltext_col = to_tsvector('english', (
    name10 || ' ' ||
    '40000US' || geoid10));
CREATE INDEX uac_idx_fulltext ON tiger2012.uac USING gin(fulltext_col);

ALTER TABLE tiger2012.unsd ADD COLUMN fulltext_col tsvector;
UPDATE tiger2012.unsd o SET fulltext_col = to_tsvector('english', (SELECT
    t.name || ' ' ||
    s.stusps || ' ' ||
    s.name || ' ' ||
    '97000US' || t.geoid FROM tiger2012.unsd t JOIN tiger2012.state s USING (statefp) WHERE t.gid=o.gid));
CREATE INDEX unsd_idx_fulltext ON tiger2012.unsd USING gin(fulltext_col);

ALTER TABLE tiger2012.vtd ADD COLUMN fulltext_col tsvector;
UPDATE tiger2012.vtd o SET fulltext_col = to_tsvector('english', (SELECT
    t.name10 || ' ' ||
    county.name || ' ' ||
    state.name || ' ' ||
    state.stusps || ' ' ||
    '70000US' || t.geoid10 FROM tiger2012.vtd t JOIN tiger2012.state state ON (t.statefp10=state.statefp) JOIN tiger2012.county county ON (t.statefp10=county.statefp AND t.countyfp10=county.countyfp) WHERE t.gid=o.gid));
CREATE INDEX vtd_idx_fulltext ON tiger2012.vtd USING gin(fulltext_col);

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

-- Create a unified table for all census shapes
DROP VIEW IF EXISTS tiger2012.census_names;
CREATE VIEW tiger2012.census_names AS
SELECT '040' AS sumlevel, geoid, name, aland, awater, intptlat, intptlon, fulltext_col, the_geom FROM tiger2012.state WHERE geoid NOT IN ('60', '66', '69', '78') UNION ALL
SELECT '050' AS sumlevel, geoid, namelsad AS name, aland, awater, intptlat, intptlon, fulltext_col, the_geom FROM tiger2012.county UNION ALL
SELECT '160' AS sumlevel, geoid, name, aland, awater, intptlat, intptlon, fulltext_col, the_geom FROM tiger2012.place UNION ALL
SELECT '060' AS sumlevel, geoid, namelsad AS name, aland, awater, intptlat, intptlon, fulltext_col, the_geom FROM tiger2012.cousub UNION ALL
SELECT '310' AS sumlevel, geoid, namelsad AS name, aland, awater, intptlat, intptlon, fulltext_col, the_geom FROM tiger2012.cbsa UNION ALL
SELECT '500' AS sumlevel, geoid, namelsad AS name, aland, awater, intptlat, intptlon, fulltext_col, the_geom FROM tiger2012.cd UNION ALL
SELECT '330' AS sumlevel, geoid, namelsad AS name, aland, awater, intptlat, intptlon, fulltext_col, the_geom FROM tiger2012.csa UNION ALL
SELECT '950' AS sumlevel, geoid, name, aland, awater, intptlat, intptlon, fulltext_col, the_geom FROM tiger2012.elsd UNION ALL
SELECT '960' AS sumlevel, geoid, name, aland, awater, intptlat, intptlon, fulltext_col, the_geom FROM tiger2012.scsd UNION ALL
SELECT '860' AS sumlevel, geoid10 AS geoid, zcta5ce10 AS name, aland10 AS aland, awater10 AS awater, intptlat10 AS intptlat, intptlon10 AS intptlon, fulltext_col, the_geom FROM tiger2012.zcta5 UNION ALL
SELECT '795' AS sumlevel, geoid10 AS geoid, namelsad10 AS name, aland10 AS aland, awater10 AS awater, intptlat10 AS intptlat, intptlon10 AS intptlon, fulltext_col, the_geom FROM tiger2012.puma UNION ALL
SELECT '620' AS sumlevel, geoid, namelsad AS name, aland, awater, intptlat, intptlon, fulltext_col, the_geom FROM tiger2012.sldl UNION ALL
SELECT '610' AS sumlevel, geoid, namelsad AS name, aland, awater, intptlat, intptlon, fulltext_col, the_geom FROM tiger2012.sldu UNION ALL
SELECT '250' AS sumlevel, geoid, namelsad AS name, aland, awater, intptlat, intptlon, fulltext_col, the_geom FROM tiger2012.aiannh UNION ALL
SELECT '251' AS sumlevel, geoid, namelsad AS name, aland, awater, intptlat, intptlon, fulltext_col, the_geom FROM tiger2012.aits UNION ALL
SELECT '230' AS sumlevel, geoid, namelsad AS name, aland, awater, intptlat, intptlon, fulltext_col, the_geom FROM tiger2012.anrc UNION ALL
SELECT '150' AS sumlevel, geoid, namelsad AS name, aland, awater, intptlat, intptlon, fulltext_col, the_geom FROM tiger2012.bg UNION ALL
SELECT '335' AS sumlevel, geoid, namelsad AS name, aland, awater, intptlat, intptlon, fulltext_col, the_geom FROM tiger2012.cnecta UNION ALL
SELECT '170' AS sumlevel, geoid, namelsad AS name, aland, awater, intptlat, intptlon, fulltext_col, the_geom FROM tiger2012.concity UNION ALL
SELECT '314' AS sumlevel, geoid, namelsad AS name, aland, awater, intptlat, intptlon, fulltext_col, the_geom FROM tiger2012.metdiv UNION ALL
SELECT '350' AS sumlevel, geoid, namelsad AS name, aland, awater, intptlat, intptlon, fulltext_col, the_geom FROM tiger2012.necta UNION ALL
SELECT '355' AS sumlevel, geoid, namelsad AS name, aland, awater, intptlat, intptlon, fulltext_col, the_geom FROM tiger2012.nectadiv UNION ALL
SELECT '067' AS sumlevel, geoid, namelsad AS name, aland, awater, intptlat, intptlon, fulltext_col, the_geom FROM tiger2012.submcd UNION ALL
SELECT '258' AS sumlevel, geoid, namelsad AS name, aland, awater, intptlat, intptlon, fulltext_col, the_geom FROM tiger2012.tbg UNION ALL
SELECT '256' AS sumlevel, geoid, namelsad AS name, aland, awater, intptlat, intptlon, fulltext_col, the_geom FROM tiger2012.ttract UNION ALL
SELECT '101' AS sumlevel, geoid, name, aland, awater, intptlat, intptlon, fulltext_col, the_geom FROM tiger2012.tabblock UNION ALL
SELECT '140' AS sumlevel, geoid, namelsad AS name, aland, awater, intptlat, intptlon, fulltext_col, the_geom FROM tiger2012.tract UNION ALL
SELECT '400' AS sumlevel, geoid10 AS geoid, namelsad10 AS name, aland10 AS aland, awater10 AS awater, intptlat10 AS intptlat, intptlon10 AS intptlon, fulltext_col, the_geom FROM tiger2012.uac UNION ALL
SELECT '970' AS sumlevel, geoid, name, aland, awater, intptlat, intptlon, fulltext_col, the_geom FROM tiger2012.unsd UNION ALL
SELECT '700' AS sumlevel, geoid10 AS geoid, namelsad10 AS name, aland10 AS aland, awater10 AS awater, intptlat10 AS intptlat, intptlon10 AS intptlon, fulltext_col, the_geom FROM tiger2012.vtd UNION ALL
SELECT '010' AS sumlevel, '' AS geoid, 'United States' AS name, 9158687485691 AS aland, 698638462086 AS awater, '+40.0' AS intptlat, '-99.8' AS intptlon, to_tsvector('english', 'united states') AS fulltext_col, null AS the_geom;
ALTER VIEW tiger2012.census_names OWNER TO census;