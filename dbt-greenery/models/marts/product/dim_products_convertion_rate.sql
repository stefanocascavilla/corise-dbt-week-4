with products_convertion_rate as (
    select
        prod.name,
        o_items.product_id,
        round((
            count(distinct order_id)::decimal
            /
            (
                select count(distinct session_id)
                from {{ ref('stg_events') }}
                where split_part(page_url, '/', 5) = o_items.product_id
            )::decimal
        ) * 100, 2) as product_convertion_rate
    from {{ ref('stg_order_items') }} as o_items
        inner join {{ ref('dim_products') }} as prod
        on o_items.product_id = prod.product_id
    group by
        prod.name,
        o_items.product_id
)

select *
from products_convertion_rate