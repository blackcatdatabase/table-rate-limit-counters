-- Auto-generated from joins-mysql.psd1 (map@mtime:2025-11-27T17:49:37Z)
-- engine: mysql
-- view:   rate_limit_counters_usage
-- Rate limit counters per subject/name (last hour window)
CREATE OR REPLACE ALGORITHM=TEMPTABLE SQL SECURITY INVOKER VIEW vw_rate_limit_usage AS
SELECT
  subject_type,
  subject_id,
  name,
  SUM(`count`) AS total_count,
  MIN(window_start) AS first_window,
  MAX(window_start) AS last_window
FROM rate_limit_counters
WHERE window_start > NOW() - INTERVAL 1 HOUR
GROUP BY subject_type, subject_id, name
ORDER BY total_count DESC;

-- Auto-generated from joins-mysql.psd1 (map@mtime:2025-11-27T17:49:37Z)
-- engine: mysql
-- view:   rate_limit_counters_hotspots
-- Hottest rate-limit subjects in the last hour
CREATE OR REPLACE ALGORITHM=TEMPTABLE SQL SECURITY INVOKER VIEW vw_rate_limit_counters_hotspots AS
SELECT
  subject_type,
  subject_id,
  name,
  SUM(`count`) AS total_count
FROM rate_limit_counters
WHERE window_start > NOW() - INTERVAL 1 HOUR
GROUP BY subject_type, subject_id, name
HAVING SUM(`count`) > 0
ORDER BY total_count DESC, subject_type, subject_id, name;

