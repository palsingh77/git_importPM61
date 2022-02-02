WITH select_step1 as (
  SELECT
    "mysql"."customer_demo"."Issue"."Call_date" AS "Call_date",
    "mysql"."customer_demo"."Issue"."Caller_id" AS "Caller_id",
    "mysql"."customer_demo"."Issue"."Taken_by" AS "Taken_by"
  FROM
    "mysql"."customer_demo"."Issue"
),
join_step2 as (
  SELECT
    select_step1."Call_date" AS "Call_date",
    select_step1."Caller_id" AS "Caller_id",
    select_step1."Taken_by" AS "Taken_by",
    "mysql"."customer_demo"."Caller"."First_name" AS "Caller_First_name",
    "mysql"."customer_demo"."Caller"."Last_name" AS "Caller_Last_name"
  FROM
    select_step1
    LEFT OUTER JOIN "mysql"."customer_demo"."Caller" ON (
      select_step1."Caller_id" = "mysql"."customer_demo"."Caller"."Caller_id"
    )
),
join_step3 as (
  SELECT
    join_step2."Call_date" AS "Call_date",
    join_step2."Caller_id" AS "Caller_id",
    join_step2."Caller_First_name" AS "Caller_First_name",
    join_step2."Caller_Last_name" AS "Caller_Last_name",
    "mysql"."customer_demo"."Staff"."Staff_code" AS "Staff_code",
    "mysql"."customer_demo"."Staff"."First_name" AS "Staff_first_name",
    "mysql"."customer_demo"."Staff"."Last_name" AS "Staff_last_name"
  FROM
    join_step2
    LEFT OUTER JOIN "mysql"."customer_demo"."Staff" ON (
      join_step2."Taken_by" = "mysql"."customer_demo"."Staff"."Staff_code"
    )
),
order_by_step4 as (
  SELECT
    *
  FROM
    join_step3
  ORDER BY
    join_step3."Caller_id" ASC
)
SELECT
  *
FROM
  order_by_step4
LIMIT
  750
