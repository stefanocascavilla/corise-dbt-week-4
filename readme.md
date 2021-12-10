1.
    1 -> Most of the users that make a "page_view" activity then perform an add to cart and then purchase an item.
    ```sql
     total_sessions | page_view_sessions | add_to_cart_sessions | checkout_sessions 
    ----------------+--------------------+----------------------+-------------------
           1108 |              48.00 |                43.00 |             36.00
    ```
    ```sql
    select * from dbt_stefano_c.fact_general_funnel;
    ```

    2 -> The convertions between the *page view* and the *add to cart* are going very well.

    3 -> I think we could improve the part of the funnel where a user decides to view a product by performing a *page view* operation, and also we could improve the checkout experience.

2A.
       1 -> I'd say that dbt is a very powerful tool that would allow us to model and transform raw data into cleaned, useful and tested data without the need of building a legacy solution.
       2 -> I'd start using intermediate models (currently we only use staging, dimensions and facts), and I'd start leveraging macros using operations.
       3 -> I've picked skills in leveraging macros, tests, and defining a good project structure.