-- Current CRM customers (latest snapshot only), with the columns the marts need.
select
    customer_id,
    full_name,
    email,
    segment_id,
    is_deleted,
    created_at,
    updated_at,
    ingest_date as snapshot_date,
    ingest_run_id
from {{ latest_snapshot(ref('stg_crm__customers')) }}
