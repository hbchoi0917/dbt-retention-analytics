{{
    config(
        materialized='view'
    )
}}

select 
    "Customer ID" as customer_id,
    "Gender" as customer_gender,
    "Age" as customer_age
from {{ ref('raw_transactions') }}
where "Customer ID" is not null
group by 1,2,3
