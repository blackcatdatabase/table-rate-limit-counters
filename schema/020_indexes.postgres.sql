-- Auto-generated from schema-map-postgres.yaml (map@sha1:621FDD3D99B768B6A8AD92061FB029414184F4B3)
-- engine: postgres
-- table:  rate_limit_counters

CREATE INDEX IF NOT EXISTS idx_rlc_window ON rate_limit_counters (name, window_start);

CREATE INDEX IF NOT EXISTS idx_rlc_subject ON rate_limit_counters (subject_type, subject_id);
