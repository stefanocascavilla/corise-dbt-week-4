with products as (
    select
        product_id,
        name,
        price,
        quantity
    from {{ source('data', 'products') }}
)

select *
from products