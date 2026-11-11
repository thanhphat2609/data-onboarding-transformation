{% docs __overview__ %}
# data-onboarding-transformation

dbt models (dbt-duckdb) that turn the raw Parquet landed by
[data-onboarding-ingestion](https://github.com/thanhphat2609/data-onboarding-ingestion) in ADLS Gen2
into deduplicated, tested, analytics-ready Parquet in the transformation container.

- **Sources** read `raw/parquet/<system>/<schema>/<table>/ingest_date=*/part-*` directly; each
  `ingest_date` partition is one full snapshot.
- **Staging** (`stg_<system>__<table>`): views, typed, one row per key per ingest day.
- **Marts**: external Parquet files in the transformation container.
{% enddocs %}
