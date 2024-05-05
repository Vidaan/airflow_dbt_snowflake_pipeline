select
    custkey,
    sum(extendedprice) as initial_sale_price,
    sum(discounted_price) as discounted_sale_price
from {{ref('dim_orderitems')}} 
group by custkey