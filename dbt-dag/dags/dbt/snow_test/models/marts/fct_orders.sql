select 
    orders.*,
    ord_summ.initial_sale_price,    
    ord_summ.discounted_sale_price
from {{ref('stg_orders')}} as orders
inner join {{ref('dim_order_summary')}} as ord_summ on ord_summ.orderkey = orders.orderkey
order by orderdate