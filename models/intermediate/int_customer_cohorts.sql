{{ config(materialized = 'view')}}

with customer_cohorts as(
    select
    customer_id,
    min(transaction_date) as cohort_date -- first purchase date
    from {{ ref('stg_transactions')}}
    group by customer_id
)

select
t.transaction_id,
t.customer_id,
t.transaction_date,
t.total_amount,
c.cohort_date,
datediff('month', c.cohort_date, t.transaction_date) as month_offset -- months since first purchase
from {{ ref('stg_transactions')}} t
left join customer_cohorts c on t.customer_id = c.customer_id