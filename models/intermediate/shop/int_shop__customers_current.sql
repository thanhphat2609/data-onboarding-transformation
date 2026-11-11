-- Current shop customers (latest snapshot only) with the email domain split out for the marts.
select
    customer_id,
    full_name,
    email,
    coalesce(nullif(split_part(email, '@', 2), ''), 'unknown') as email_domain,
    updated_at,
    ingest_date as snapshot_date
from {{ latest_snapshot(ref('stg_shop__customers')) }}
