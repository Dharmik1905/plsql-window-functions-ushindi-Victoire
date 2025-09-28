-- Query B: Monthly region sales and running total using ROWS frame
WITH monthly_region AS (
  SELECT
    date_trunc('month', sale_date)::date AS month_start,
    c.region,
    SUM(amount) AS month_sales
  FROM transactions t
  JOIN customers c ON t.customer_id = c.customer_id
  GROUP BY date_trunc('month', sale_date)::date, c.region
)
SELECT
  month_start,
  region,
  month_sales,
  SUM(month_sales) OVER (
    PARTITION BY region
    ORDER BY month_start
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
  ) AS running_total_rows
FROM monthly_region
ORDER BY region, month_start;