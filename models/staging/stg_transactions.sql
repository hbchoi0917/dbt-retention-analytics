{{
    config(
        materialized='view'
    )
}}

select 
    "Transaction ID" as transaction_id,
    "Customer ID" as customer_id,
    "Date" as transaction_date,
    "Quantity" as quantity,
    "Price per Unit" as price_per_unit,
    "Total Amount" as total_amount
from {{ ref('raw_transactions') }}
where "Customer ID" is not null
