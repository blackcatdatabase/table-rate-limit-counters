-- Auto-generated from schema-views-mysql.yaml (map@sha1:FFA9A9D6FA9EE079B0DAEBB6FEE023C138E8FFA1)
-- engine: mysql
-- table:  rate_limit_counters

-- Contract view for [rate_limit_counters]
CREATE OR REPLACE ALGORITHM=MERGE SQL SECURITY INVOKER VIEW vw_rate_limit_counters AS
SELECT
  id,
  subject_type,
  subject_id,
  name,
  window_start,
  window_size_sec,
  `count`,
  updated_at
FROM rate_limit_counters;
