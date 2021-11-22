-- Defined the dimension that contains the countries along with the number of users (of the platform). This could be interesting for a marketing campaing purpose.

with country_inhabitants as (
    select
        address.country,
        address.state,
        count(*) as country_inhabitants
    from {{ ref('stg_addresses') }} as address
        right join {{ ref('stg_users') }} as u
        on address.address_id = u.address_id
    group by
        address.country,
        address.state
)

select *
from country_inhabitants