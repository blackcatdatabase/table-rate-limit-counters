-- Auto-generated from schema-map-mysql.yaml (map@sha1:5E62933580349BE7C623D119AC9D1301A62F03EF)
-- engine: mysql
-- table:  rate_limit_counters

CREATE TABLE IF NOT EXISTS rate_limit_counters (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  subject_type ENUM('ip','user','api_key','tenant') NOT NULL,
  subject_id VARCHAR(128) NOT NULL,
  name VARCHAR(120) NOT NULL,
  window_start DATETIME(6) NOT NULL,
  window_size_sec INT NOT NULL,
  `count` INT NOT NULL DEFAULT 0,
  updated_at DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  UNIQUE KEY uq_rlc (subject_type, subject_id, name, window_start, window_size_sec),
  INDEX idx_rlc_window  (name, window_start),
  INDEX idx_rlc_subject (subject_type, subject_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
