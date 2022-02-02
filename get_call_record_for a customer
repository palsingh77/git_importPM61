WITH select_step1 as (
  SELECT
    "mysql"."customer_demo"."Caller"."Caller_id" AS "Caller_id",
    "mysql"."customer_demo"."Caller"."Company_ref" AS "Company_ref",
    "mysql"."customer_demo"."Caller"."First_name" AS "First_name",
    "mysql"."customer_demo"."Caller"."Last_name" AS "Last_name"
  FROM
    "mysql"."customer_demo"."Caller"
),
join_step2 as (
  SELECT
    select_step1."Caller_id" AS "Caller_id",
    select_step1."Company_ref" AS "Company_ref",
    select_step1."First_name" AS "First_name",
    select_step1."Last_name" AS "Last_name",
    "mysql"."customer_demo"."Issue"."Call_date" AS "Call_date"
  FROM
    select_step1
    LEFT OUTER JOIN "mysql"."customer_demo"."Issue" ON (
      select_step1."Caller_id" = "mysql"."customer_demo"."Issue"."Caller_id"
    )
),
filter_step3 as (
  SELECT
    *
  FROM
    join_step2
  WHERE
    (
      join_step2."Last_name" = 'Gritten'
      AND join_step2."Call_date" IS NOT NULL
    )
)
SELECT
  *
FROM
  filter_step3
LIMIT
  10000
