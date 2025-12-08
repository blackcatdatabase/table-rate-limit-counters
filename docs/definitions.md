# rate_limit_counters

Sliding-window counters for rate limiting enforcement.

## Columns
| Column | Type | Null | Default | Description |
| --- | --- | --- | --- | --- |
| count | INTEGER | NO | 0 | Number of hits recorded during the window. |
| id | BIGINT | NO |  | Surrogate primary key. |
| name |  | NO |  | Rate limiting bucket name. |
| subject_id |  | NO |  | Identifier of the subject (stringified). |
| subject_type | TEXT | NO |  | Entity type being limited (ip,user,api_key,tenant). |
| updated_at | TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | Last update timestamp (UTC). |
| window_size_sec | INTEGER | NO |  | Window length in seconds. |
| window_start | TIMESTAMPTZ(6) | NO |  | Beginning of the measurement window. |

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
| vw_rate_limit_counters | mysql | algorithm=MERGE, security=INVOKER | [packages\rate-limit-counters\schema\040_views.mysql.sql](https://github.com/blackcatacademy/blackcat-database/packages/rate-limit-counters/schema/040_views.mysql.sql) |
| vw_rate_limit_counters_hotspots | mysql | algorithm=TEMPTABLE, security=INVOKER | [packages\rate-limit-counters\schema\040_views_joins.mysql.sql](https://github.com/blackcatacademy/blackcat-database/packages/rate-limit-counters/schema/040_views_joins.mysql.sql) |
| vw_rate_limit_usage | mysql | algorithm=TEMPTABLE, security=INVOKER | [packages\rate-limit-counters\schema\040_views_joins.mysql.sql](https://github.com/blackcatacademy/blackcat-database/packages/rate-limit-counters/schema/040_views_joins.mysql.sql) |
| vw_rate_limit_counters | postgres |  | [packages\rate-limit-counters\schema\040_views.postgres.sql](https://github.com/blackcatacademy/blackcat-database/packages/rate-limit-counters/schema/040_views.postgres.sql) |
| vw_rate_limit_counters_hotspots | postgres |  | [packages\rate-limit-counters\schema\040_views_joins.postgres.sql](https://github.com/blackcatacademy/blackcat-database/packages/rate-limit-counters/schema/040_views_joins.postgres.sql) |
| vw_rate_limit_usage | postgres |  | [packages\rate-limit-counters\schema\040_views_joins.postgres.sql](https://github.com/blackcatacademy/blackcat-database/packages/rate-limit-counters/schema/040_views_joins.postgres.sql) |
