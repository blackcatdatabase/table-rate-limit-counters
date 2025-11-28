-- Auto-generated from schema-views-mysql.psd1 (map@mtime:2025-11-27T15:35:35Z)
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
