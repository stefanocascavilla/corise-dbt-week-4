with promos as (
    select
        promo_id,
        discout,
        status
    from {{ source('data', 'promos') }}
)

select *
from promos