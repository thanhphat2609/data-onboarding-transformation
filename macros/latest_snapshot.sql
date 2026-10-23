{#
  Rows of the most recent ingest day of a snapshot-per-day relation (see ADR-0004 in
  data-onboarding-ingestion: one full snapshot per ingest_date partition).

    select * from {{ latest_snapshot(ref('stg_crm__customers')) }}
#}
{% macro latest_snapshot(relation, date_column='ingest_date') %}
    (
        select *
        from {{ relation }}
        where {{ date_column }} = (select max({{ date_column }}) from {{ relation }})
    )
{% endmacro %}
