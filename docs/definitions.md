# rate_limit_counters

Sliding-window counters for rate limiting enforcement.

## Columns
| Column | Type | Null | Default | Description |
| --- | --- | --- | --- | --- |
| count | mysql: INT / postgres: INTEGER | NO | 0 | Number of hits recorded during the window. |
| id | BIGINT | NO |  | Surrogate primary key. |
| name | VARCHAR(120) | NO |  | Rate limiting bucket name. |
| subject_id | VARCHAR(128) | NO |  | Identifier of the subject (stringified). |
| subject_type | mysql: ENUM('ip','user','api_key','tenant') / postgres: TEXT | NO |  | Entity type being limited (ip,user,api_key,tenant). |
| updated_at | mysql: DATETIME(6) / postgres: TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | Last update timestamp (UTC). |
| window_size_sec | mysql: INT / postgres: INTEGER | NO |  | Window length in seconds. |
| window_start | mysql: DATETIME(6) / postgres: TIMESTAMPTZ(6) | NO |  | Beginning of the measurement window. |

## Engine Details

### mysql

Unique keys:
| Name | Columns |
| --- | --- |
| uq_rlc | subject_type, subject_id, name, window_start, window_size_sec |

Indexes:
| Name | Columns | SQL |
| --- | --- | --- |
| idx_rlc_subject | subject_type,subject_id | INDEX idx_rlc_subject (subject_type, subject_id) |
| idx_rlc_window | name,window_start | INDEX idx_rlc_window  (name, window_start) |
| uq_rlc | subject_type,subject_id,name,window_start,window_size_sec | UNIQUE KEY uq_rlc (subject_type, subject_id, name, window_start, window_size_sec) |

### postgres

Unique keys:
| Name | Columns |
| --- | --- |
| uq_rlc | subject_type, subject_id, name, window_start, window_size_sec |

Indexes:
| Name | Columns | SQL |
| --- | --- | --- |
| idx_rlc_subject | subject_type,subject_id | CREATE INDEX IF NOT EXISTS idx_rlc_subject ON rate_limit_counters (subject_type, subject_id) |
| idx_rlc_window | name,window_start | CREATE INDEX IF NOT EXISTS idx_rlc_window ON rate_limit_counters (name, window_start) |
| uq_rlc | subject_type,subject_id,name,window_start,window_size_sec | CONSTRAINT uq_rlc UNIQUE (subject_type, subject_id, name, window_start, window_size_sec) |

## Engine differences

## Views
| View | Engine | Flags | File |
| --- | --- | --- | --- |
| vw_rate_limit_counters | mysql | algorithm=MERGE, security=INVOKER | [schema\040_views.mysql.sql](schema\040_views.mysql.sql) |
| vw_rate_limit_counters_hotspots | mysql | algorithm=TEMPTABLE, security=INVOKER | [schema\040_views_joins.mysql.sql](schema\040_views_joins.mysql.sql) |
| vw_rate_limit_usage | mysql | algorithm=TEMPTABLE, security=INVOKER | [schema\040_views_joins.mysql.sql](schema\040_views_joins.mysql.sql) |
| vw_rate_limit_counters | postgres |  | [schema\040_views.postgres.sql](schema\040_views.postgres.sql) |
| vw_rate_limit_counters_hotspots | postgres |  | [schema\040_views_joins.postgres.sql](schema\040_views_joins.postgres.sql) |
| vw_rate_limit_usage | postgres |  | [schema\040_views_joins.postgres.sql](schema\040_views_joins.postgres.sql) |
