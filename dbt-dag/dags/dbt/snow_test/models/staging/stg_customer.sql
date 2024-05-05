select 
    c_custkey as custkey,
    c_name as cust_name,
    c_address as cust_address
from {{ source('tpch', 'customer') }}