-- Current state of CRM customers: the latest ingest day only. Written as Parquet to the curated zone.
select
    customer_id,
    full_name,
    segment_id,
    updated_at,
    ingest_date as snapshot_date,
    ingest_run_id
from {{ latest_snapshot(ref('stg_crm__customers')) }}
