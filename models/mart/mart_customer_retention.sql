{{ config(materialized='table') }}

with cohort_sizes as (
    select
        cohort_month,
        count(distinct customer_id) as cohort_size
    from {{ ref('int_customer_cohorts') }}
    group by cohort_month
),

retention as (
    select
        cohort_month,
        month_offset,
        count(distinct customer_id) as active_customers
    from {{ ref('int_customer_cohorts') }}
    group by cohort_month, month_offset
)

select
    r.cohort_month,
    r.month_offset,
    cs.cohort_size,
    r.active_customers,
    round(r.active_customers::decimal / cs.cohort_size * 100, 2) as retention_rate_pct,
    round((1 - r.active_customers::decimal / cs.cohort_size) * 100, 2) as churn_rate_pct
from retention r
left join cohort_sizes cs on r.cohort_month = cs.cohort_month
order by r.cohort_month, r.month_offset
