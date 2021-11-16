{{ config(materialized='view') }}

{% set regions = ["r1","r2","r3","r4","r5"] %}

with report_group_sales_product_region as (

    select s.product, 
           {% for r in regions %} 
           coalesce(sum(case when s.region ='{{r}}' then s.amount end),0) as {{r}},
           {% endfor %}
           sum(s.amount) as total_sum
    from sales as s
    group by s.product
    order by s.product
)


select rgsm.*
from report_group_sales_product_region as rgsm
