select 
    lineitem.order_item_key,
    lineitem.linenumber,
    lineitem.quantity,    
    lineitem.extendedprice,
    orders.orderkey,
    orders.custkey,
    orders.totalprice,
    orders.orderdate,
    {{discounted_price('lineitem.extendedprice', 'lineitem.discount')}} as discounted_price
from {{ref('stg_orders')}} as orders
join {{ref('stg_lineitem')}} as lineitem 
    on lineitem.orderkey = orders.orderkey
join {{ref('stg_customer')}} as customers
    on customers.custkey = orders.custkey
order by orders.orderdate