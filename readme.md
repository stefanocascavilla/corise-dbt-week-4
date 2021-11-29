2.
    1 -> I've created the not_null macro that is defined under the macros/ directory.
    2 -> I've created the truncate_tables, which is a macro that truncates all the tables with a given prefix, in order to not have them at the beginning of each dbt run transaction. This will be a on-run-start hook.

3.
    Defined a grant_permissions macro that has been applied as a post-hook to all models

4.
    Used the following test/macros from the dbt_utils package:
        - dbt_utils.expression_is_true for the field quantity of the model stg_orders
        - dbt_utils.surrogate_key in the int_user_orders to create a primary key field for the int table
        - dbt_utils.surrogate_key in the int_user_events to create a primary key field for the int table