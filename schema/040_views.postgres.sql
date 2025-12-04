-- Auto-generated from schema-views-postgres.yaml (map@74ce4f4)
-- engine: postgres
-- table:  rate_limit_counters

-- Contract view for [rate_limit_counters]
CREATE OR REPLACE VIEW vw_rate_limit_counters AS
SELECT
  id,
  subject_type,
  subject_id,
  name,
  window_start,
  window_size_sec,
  "count",
  updated_at
FROM rate_limit_counters;
