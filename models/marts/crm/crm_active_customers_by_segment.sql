-- Active (non-deleted) customers per segment in the latest snapshot. Written as Parquet to the transformation
-- container.
select
    segment_id,
    count(*) as customer_count,
    min(created_at) as first_created_at,
    max(updated_at) as last_updated_at,
    max(snapshot_date) as snapshot_date
from {{ ref('int_crm__customers_current') }}
where not is_deleted
group by segment_id
