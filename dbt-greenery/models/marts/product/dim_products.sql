-- Defined the dimension for products. This could be helpful for info about products to the product team.

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