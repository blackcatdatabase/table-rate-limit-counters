-- Auto-generated from joins-postgres.yaml (map@sha1:29CF395A3A4C8964482083733F8E613ABFBEF5CC)
-- engine: postgres
-- view:   rate_limit_usage

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
