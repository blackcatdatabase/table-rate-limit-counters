-- Auto-generated from joins-postgres.yaml (map@85230ed)
-- engine: postgres
-- view:   rate_limit_counters_usage

-- Rate limit counters per subject/name (last hour window)
CREATE OR REPLACE VIEW vw_rate_limit_usage AS
SELECT
  subject_type,
  subject_id,
  name,
  SUM(count) AS total_count,
  MIN(window_start) AS first_window,
  MAX(window_start) AS last_window
FROM rate_limit_counters
WHERE window_start > now() - interval $$1 hour$$
GROUP BY subject_type, subject_id, name
ORDER BY total_count DESC;

-- Auto-generated from joins-postgres.yaml (map@85230ed)
-- engine: postgres
-- view:   rate_limit_counters_hotspots

-- Hottest rate-limit subjects in the last hour
CREATE OR REPLACE VIEW vw_rate_limit_counters_hotspots AS
SELECT
  subject_type,
  subject_id,
  name,
  SUM(count) AS total_count
FROM rate_limit_counters
WHERE window_start > now() - interval $$1 hour$$
GROUP BY subject_type, subject_id, name
HAVING SUM(count) > 0
ORDER BY total_count DESC, subject_type, subject_id, name;

