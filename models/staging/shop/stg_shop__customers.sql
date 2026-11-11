-- Every daily snapshot of shop.customers, typed, with one row per customer per ingest day.
with source as (
    select * from {{ source('shop', 'customers') }}
)

select
    cast(customer_id as integer) as customer_id,
    full_name,
    lower(trim(email)) as email,
    cast(updated_at as timestamp) as updated_at,
    cast(ingest_date as date) as ingest_date,
    _ingest_run_id as ingest_run_id,
    cast(_ingested_at as timestamp) as ingested_at
from source
-- A re-run replaces the whole partition, so duplicates should not exist; guard anyway.
qualify row_number() over (
    partition by customer_id, ingest_date
    order by _ingested_at desc, updated_at desc
) = 1
