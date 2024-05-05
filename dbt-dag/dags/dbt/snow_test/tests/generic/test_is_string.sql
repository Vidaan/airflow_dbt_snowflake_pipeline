{% test is_string(model, column_name) %}

with validation as (
    select 
        {{column_name}} as string_field
    from {{model}}
),

validation_error as (
    select 
        string_field
    from validation
    where is_integer(string_field) = 0
)

select 
    *
from validation_error

{% endtest %}