<!-- Auto-generated from schema-map-postgres.psd1 @ 62c9c93 (2025-11-20T21:38:11+01:00) -->
# Definition – rate_limit_counters

Sliding-window counters for rate limiting enforcement.

## Columns
| Column | Type | Null | Default | Description | Notes |
|-------:|:-----|:----:|:--------|:------------|:------|
| id | BIGINT | — | AS | Surrogate primary key. |  |
| subject_type | TEXT | NO | — | Entity type being limited (ip,user,api_key,tenant). |  |
| subject_id | VARCHAR(128) | NO | — | Identifier of the subject (stringified). |  |
| name | VARCHAR(120) | NO | — | Rate limiting bucket name. |  |
| window_start | TIMESTAMPTZ(6) | NO | — | Beginning of the measurement window. |  |
| window_size_sec | INTEGER | NO | — | Window length in seconds. |  |
| count | INTEGER | NO | 0 | Number of hits recorded during the window. |  |
| updated_at | TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | Last update timestamp (UTC). |  |