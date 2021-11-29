2.
    1 -> I've created the not_null macro that is defined under the macros/ directory.
    2 -> I've created the truncate_tables, which is a macro that truncates all the tables with a given prefix, in order to not have them at the beginning of each dbt run transaction. This will be a on-run-start hook.