{{ config(materialized='view') }}

with group_sales_manager as (

      select s.manager, 
             sum(s.amount) as total_sum,
             sum({{ percent('amount')}}) as percent
      from sales as s
      group by s.manager
      order by sum(s.amount) desc

)

select gsm.*
from group_sales_manager as gsm