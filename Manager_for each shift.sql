WITH select_step1 as (
  SELECT
    "mysql"."customer_demo"."Shift"."Shift_date" AS "Shift_date",
    "mysql"."customer_demo"."Shift"."Shift_type" AS "Shift_type",
    "mysql"."customer_demo"."Shift"."Manager" AS "Manager"
  FROM
    "mysql"."customer_demo"."Shift"
),
join_step2 as (
  SELECT
    select_step1."Shift_date" AS "Shift_date",
    select_step1."Shift_type" AS "Shift_type",
    select_step1."Manager" AS "Manager",
    "mysql"."customer_demo"."Staff"."First_name" AS "First_name",
    "mysql"."customer_demo"."Staff"."Last_name" AS "Last_name"
  FROM
    select_step1
    LEFT OUTER JOIN "mysql"."customer_demo"."Staff" ON (
      select_step1."Manager" = "mysql"."customer_demo"."Staff"."Staff_code"
    )
),
order_by_step3 as (
  SELECT
    *
  FROM
    join_step2
  ORDER BY
    join_step2."Shift_type" ASC
)
SELECT
  *
FROM
  order_by_step3
LIMIT
  100
