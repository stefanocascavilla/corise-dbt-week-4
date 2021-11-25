1.
    User repeat rate is 0.80
    Query is:
        with users_orders as (
            select
                u.user_id,
                count(distinct o.order_id) as number_of_orders
            from dbt_stefano_c.stg_users as u
                inner join dbt_stefano_c.stg_orders as o
                on u.user_id = o.user_id
            group by
                u.user_id
        )

        select
            sum(case when number_of_orders > 1 then 1 end)::decimal / count(*) as repeat_rate
        from users_orders;

2.
    Good indicators of a user who will likely purchase again could be: high number of items purchased, frequent purchases, high events generated on the platform
    Good indicators of a user who will likely NOT purchase again could be: low number of items purchased, few activity on the website, updated_at null or long time ago
    If I had more data, I'd look for: likes or engagement made on the products (such as a thumb up or down), time spent on a product and on the platform

3.
    I've created different models in the marts folder. All the explanations are inside each single SQL model.

4.
    All the tests explanations are in the schema.yml files

    Have you found data that didn't respect assumptions?
        - Some order and event records had the created_at null, so I relaxed the test on the created_at field.

5.
    To perform daily tests on data, I'd recommend schedule the dbt run followed by dbt test (or only the dbt build command, to run both at once) every day. That way the models are created/refreshed on a daily base, and also tests are applied. If a test fails, dbt shows the failure. Also, it can be set up an automatic way to store/notify the output of the tests, so in case of failure the responsible is notified.