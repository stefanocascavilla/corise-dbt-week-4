with dim_products as (
    select
        product_id,
        name,
        price,
        quantity
    from {{ ref('stg_products') }}
)

select *
from dim_products