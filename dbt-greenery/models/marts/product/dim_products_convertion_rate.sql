with products_convertion_rate as (
    select
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
    group by
        o_items.product_id
)

select *
from products_convertion_rate