-- Defined this fact model to aggregate the events at the user level (daily) and count how many events the user made each day.

with aggregated_user_events as (
    select
        user_id,
        email,
        date_trunc('day', created_at) as aggregated_day,
        count(*) as total_day_events
    from {{ ref('int_user_events') }}
    group by
        user_id,
        email,
        date_trunc('day', created_at)
)

select *
from aggregated_user_events