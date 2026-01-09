{{ config(materialized = 'table') }}

with cohort_sizes as (
    select
        cohort_date,
        count(distinct customer_id) as cohort_size -- customers in cohort
    from {{ ref('int_customer_cohorts') }}
    where cohort_date is not null
    group by cohort_date
),

retention as (
    select
        cohort_date,
        month_offset,
        count(distinct customer_id) as active_customers -- customers with repeat purchases
    from {{ ref('int_customer_cohorts') }}
    where cohort_date is not null
    group by cohort_date, month_offset
)

select
    r.cohort_date,
    r.month_offset,
    cs.cohort_size,
    r.active_customers,
    round((r.active_customers::decimal / cs.cohort_size) * 100, 2) as retention_rate_pct
from retention r
left join cohort_sizes cs on r.cohort_date = cs.cohort_date
order by r.cohort_date, r.month_offset