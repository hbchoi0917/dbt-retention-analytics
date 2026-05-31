{{ config(materialized='view') }}

select
    "Customer ID"  as customer_id,
    "Gender"       as customer_gender,
    "Age"          as customer_age
from {{ ref('raw_transactions') }}
where "Customer ID" is not null
qualify row_number() over (partition by "Customer ID" order by "Date") = 1
