-- Defined this intermediate model to join the users with the orders they made on the platform.

with user_orders as (
    select
        {{ dbt_utils.surrogate_key(['u.user_id', 'o.created_at']) }} as record_key,
        u.user_id,
        u.email,
        o.order_id,
        o.created_at
    from {{ ref('stg_users') }} as u
        inner join {{ ref('stg_orders') }} as o
        on u.user_id = o.user_id
    {{ not_null(field_name='o.created_at') }}
)

select *
from user_orders