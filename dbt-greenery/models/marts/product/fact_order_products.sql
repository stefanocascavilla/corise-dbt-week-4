-- Defined the fact table that represents each order along with the creation date, the total spent, and the total number of products associated.

with order_products as (
    select
        o.order_id,
        o.created_at,
        o.order_total,
        count(*) as total_products
    from {{ ref('stg_orders') }} as o
        inner join {{ ref('stg_order_items') }} as o_item
        on o.order_id = o_item.order_id
    {{ not_null(field_name='o.created_at') }}
    group by
        o.order_id,
        o.created_at,
        o.order_total
)

select *
from order_products