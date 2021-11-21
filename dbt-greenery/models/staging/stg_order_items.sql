with order_items as (
    select
        order_id,
        product_id,
        quantity
    from {{ source('data', 'order_items') }}
)

select *
from order_items