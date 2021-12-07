{% set total_sessions = dbt_utils.get_query_results_as_dict(
    "select count(*) as sessions_number from ( select session_id from " ~ ref('int_platform_events') ~ " group by session_id  ) as q"
) %}

{% set event_types = ['page_view', 'add_to_cart', 'checkout'] %}


with fact_general_funnel as (
    select
        {{ total_sessions['sessions_number'][0] }} as total_sessions,

        {% for event_item in event_types %}
            round((
                select count(distinct session_id)
                from {{ ref('int_platform_events') }}
                where event_type = '{{ event_item }}'
            )::decimal / {{ total_sessions['sessions_number'][0] }}, 2) * 100 as {{ event_item }}_sessions
            {%- if not loop.last -%}
                , 
            {%- endif -%}
        {% endfor %}
)

select *
from fact_general_funnel