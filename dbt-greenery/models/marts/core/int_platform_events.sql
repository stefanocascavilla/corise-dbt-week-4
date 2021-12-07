with int_platform_events as (
    select
        event_id,
        session_id,
        user_id,
        event_type,
        created_at
    from {{ ref('stg_events') }}
)

select *
from int_platform_events