-- Current state of CRM customers: the latest ingest day only. Written as Parquet to the transformation container.
select
    customer_id,
    full_name,
    segment_id,
    updated_at,
    snapshot_date,
    ingest_run_id
from {{ ref('int_crm__customers_current') }}
