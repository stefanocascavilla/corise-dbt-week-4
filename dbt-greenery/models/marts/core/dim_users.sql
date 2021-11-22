-- Created a dimension for the users of the platform. This could be helpful to all the company.

with dim_users as (
    select
        user_id,
        first_name,
        last_name,
        email,
        phone_number,
        address_id
    from {{ ref('stg_users') }}
)

select *
from dim_users