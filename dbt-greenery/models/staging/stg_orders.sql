with orders as (
    select
        order_id,
        user_id,
        promo_id,
        address_id,
        created_at,
        order_cost,
        shipping_cost,
        order_total,
        tracking_id,
        shipping_service,
        estimated_delivery_at,
        delivered_at,
        status
    from {{ source('data', 'orders') }}
)

select *
from orders



with users_orders as (
    select
        u.user_id,
        count(distinct o.order_id) as number_of_orders
    from dbt_stefano_c.stg_users as u
        inner join dbt_stefano_c.stg_orders as o
        on u.user_id = o.user_id
    group by
        u.user_id
)

select
    sum(case when number_of_orders > 1 then 1 end)::decimal / count(*) as repeat_rate
from users_orders;