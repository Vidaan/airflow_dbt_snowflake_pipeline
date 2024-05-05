select 
    orderkey,
    sum(extendedprice) as initial_sale_price,    
    sum(discounted_price) as discounted_sale_price
from {{ref('dim_orderitems')}}
group by orderkey
having discounted_sale_price < 0