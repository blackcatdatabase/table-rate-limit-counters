-- Auto-generated from schema-map-postgres.yaml (map@sha1:6D9B52237D942B2B3855FD0F5500331B935A7C62)
-- engine: postgres
-- table:  rate_limit_counters

CREATE INDEX IF NOT EXISTS idx_rlc_window ON rate_limit_counters (name, window_start);

CREATE INDEX IF NOT EXISTS idx_rlc_subject ON rate_limit_counters (subject_type, subject_id);
