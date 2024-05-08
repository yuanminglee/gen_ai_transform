{{ config(materialized='table') }}

with source_data as (
    select serving_date, id from {{ source('atlas', 'orders') }}
)

select
    date_trunc(serving_date, month) as month,
    count(*) as num_orders
from source_data
group by 1