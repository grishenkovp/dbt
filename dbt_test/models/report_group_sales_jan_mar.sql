{{ config(materialized='view') }}

with group_sales_jan_mar as (

    select s.manager, s.region, s.product, sum(s.amount) as total_sum
    from sales as s
    where s.dt >= '{{ var("start_date") }}' and s.dt<='{{ var("finish_date") }}'
    group by s.manager, s.region, s.product
    order by s.manager, s.region, s.product

)

select gsm.*
from group_sales_jan_mar as gsm
