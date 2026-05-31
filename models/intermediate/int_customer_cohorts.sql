{{ config(materialized='view') }}

with customer_cohorts as (
    select
        customer_id,
        date_trunc('month', min(transaction_date)) as cohort_month
    from {{ ref('stg_transactions') }}
    group by customer_id
)

select
    t.transaction_id,
    t.customer_id,
    t.transaction_date,
    t.product_category,
    t.total_amount,
    c.cohort_month,
    datediff('month', c.cohort_month, date_trunc('month', t.transaction_date)) as month_offset
from {{ ref('stg_transactions') }} t
left join customer_cohorts c on t.customer_id = c.customer_id
