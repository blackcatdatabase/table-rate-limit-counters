-- Auto-generated from core/joins-mysql.yaml (map@sha1:DA70105A5B799F72A56FEAB71A5171F946A770D2)
-- engine: mysql
-- view:   rate_limit_counters_hotspots

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

-- Auto-generated from core/joins-mysql.yaml (map@sha1:DA70105A5B799F72A56FEAB71A5171F946A770D2)
-- engine: mysql
-- view:   rate_limit_counters_hotspots

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

-- Auto-generated from joins-mysql.yaml (map@sha1:DA70105A5B799F72A56FEAB71A5171F946A770D2)
-- engine: mysql
-- view:   rate_limit_usage

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

