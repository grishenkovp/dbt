{{ config(materialized='view') }}

with group_sales as (

    select s.manager, s.region, s.product, sum(s.amount) as total_sum
    from sales as s
    group by s.manager, s.region, s.product
    order by s.manager, s.region, s.product

)

select gs.*
from group_sales as gs


