with addresses as (
    select
       address_id,
       address,
       zipcode,
       state,
       country
    from {{ source('data', 'addresses') }}
)

select *
from addresses