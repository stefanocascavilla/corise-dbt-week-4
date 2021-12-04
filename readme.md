1.
    1 -> Total conversion rate is: 36%
    Query is:
        select
            (
                select
                    count(distinct order_id) as total_orders_number
                from dbt_stefano_c.stg_orders
            )::decimal
            /
            (
                select
                    count(*) as unique_sessions_number
                from (
                    select
                        session_id
                    from dbt_stefano_c.stg_events
                    group by
                        session_id
                ) as sub1
            )::decimal

    2 -> Convertion rate per product is:
                name         |              product_id              | product_convertion_rate 
        ---------------------+--------------------------------------+-------------------------
        Alocasia Polly      | 6f3a3072-a24d-4d11-9cef-25b0b5f8a4af |                   42.00
        Aloe Vera           | 615695d3-8ffd-4850-bcf7-944cf6d3685b |                   54.24
        Angel Wings Begonia | 58b575f2-2192-4a53-9d21-df9a0c14fc25 |                   53.33
        Arrow Head          | 74aeb414-e3dd-4e8a-beef-0fa45225214d |                   47.95
        Bamboo              | 689fb64e-a4a2-45c5-b9f2-480c2155624d |                   50.70
        Bird of Paradise    | 05df0866-1a66-41d8-9ed7-e2bbcddd6a3d |                   45.76
        Birds Nest Fern     | bb19d194-e1bd-4358-819e-cd1f1b401c0c |                   52.38
        Boston Fern         | e2e78dfc-f25c-4fec-a002-8e280d61a2f2 |                   49.06
        Cactus              | c17e63f7-0d28-4a95-8248-b01ea354840e |                   49.18
        Calathea Makoyana   | b86ae24b-6f59-47e8-8adc-b17d88cbd367 |                   54.00
        Devil's Ivy         | 35550082-a52d-4301-8f06-05b30f6f3616 |                   36.67
        Dragon Tree         | 37e0062f-bd15-4c3e-b272-558a86d90598 |                   44.62
        Ficus               | 843b6553-dc6a-4fc4-bceb-02cd39af0168 |                   50.00
        Fiddle Leaf Fig     | e706ab70-b396-4d30-a6b2-a1ccf3625b52 |                   57.14
        Jade Plant          | a88a23ef-679c-4743-b151-dc7722040d8c |                   52.38
        Majesty Palm        | 5ceddd13-cf00-481f-9285-8340ab95d06d |                   54.10
        Money Tree          | d3e228db-8ca5-42ad-bb0a-2148e876cc59 |                   46.43
        Monstera            | be49171b-9f72-4fc9-bf7a-9a52e259836b |                   49.02
        Orchid              | c7050c3b-a898-424d-8d98-ab0aaad7bef4 |                   51.52
        Peace Lily          | e5ee99b6-519f-4218-8b41-62f48f59f700 |                   45.00
        Philodendron        | 55c6a062-5f4a-4a8b-a8e5-05ea5e6715a3 |                   51.72
        Pilea Peperomioides | 5b50b820-1d0a-4231-9422-75e7f6b0cecf |                   49.12
        Pink Anthurium      | 80eda933-749d-4fc6-91d5-613d29eb126f |                   55.36
        Ponytail Palm       | e18f33a6-b89a-4fbc-82ad-ccba5bb261cc |                   51.85
        Pothos              | 4cda01b9-62e2-46c5-830f-b7f262a58fb1 |                   42.00
        Rubber Plant        | 579f4cd0-1f45-49d2-af55-9ab2b72c3b35 |                   44.44
        Snake Plant         | e8b6528e-a830-4d03-a027-473b411c7f02 |                   49.15
        Spider Plant        | 64d39754-03e4-4fa0-b1ea-5f4293315f67 |                   45.16
        String of pearls    | fb0e8be7-5ac4-4a76-a1fa-2cc4bf0b2d80 |                   49.37
        ZZ Plant            | b66a7143-c18a-43bb-b5dc-06bb5d1d3160 |                   49.28

        Query is: select * from dbt_stefano_c.dim_products_convertion_rate;


2.
    1 -> I've created the not_null macro that is defined under the macros/ directory.
    2 -> I've created the truncate_tables, which is a macro that truncates all the tables with a given prefix, in order to not have them at the beginning of each dbt run transaction. This will be a on-run-start hook.

3.
    Defined a grant_permissions macro that has been applied as a post-hook to all models (applied in the dbt_project.yml)

4.
    Used the following test/macros from the dbt_utils package:
        - dbt_utils.expression_is_true for the field quantity of the model stg_orders
        - dbt_utils.surrogate_key in the int_user_orders to create a primary key field for the int table
        - dbt_utils.surrogate_key in the int_user_events to create a primary key field for the int table