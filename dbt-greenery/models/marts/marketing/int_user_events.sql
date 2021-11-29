-- Defined the intermediate model that stores the events along with the info of the user that made them.

with user_events as (
    select
        {{ dbt_utils.surrogate_key(['event_id', 'event.created_at']) }} as record_key,
        event.event_id,
        event.created_at,
        event.page_url,
        u.user_id,
        u.email
    from {{ ref('stg_events') }} as event
        inner join {{ ref('stg_users') }} as u
        on event.user_id = u.user_id
    {{ not_null(field_name='event.created_at') }}
)

select *
from user_events