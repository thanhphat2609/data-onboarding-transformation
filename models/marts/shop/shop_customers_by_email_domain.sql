-- Customers per email domain in the latest snapshot. Written as Parquet to the curated zone.
select
    email_domain,
    count(*) as customer_count,
    min(updated_at) as first_updated_at,
    max(updated_at) as last_updated_at,
    max(snapshot_date) as snapshot_date
from {{ ref('int_shop__customers_current') }}
group by email_domain
