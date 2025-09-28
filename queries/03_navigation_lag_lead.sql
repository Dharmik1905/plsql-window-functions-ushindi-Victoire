-- Query C: Month-over-month growth per region using LAG()
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
  LAG(month_sales) OVER (PARTITION BY region ORDER BY month_start) AS prev_month_sales,
  CASE
    WHEN LAG(month_sales) OVER (PARTITION BY region ORDER BY month_start) IS NULL THEN NULL
    WHEN LAG(month_sales) OVER (PARTITION BY region ORDER BY month_start) = 0 THEN NULL
    ELSE ROUND( (month_sales - LAG(month_sales) OVER (PARTITION BY region ORDER BY month_start)) * 100.0 / LAG(month_sales) OVER (PARTITION BY region ORDER BY month_start), 2)
  END AS pct_growth_vs_prev_month
FROM monthly_region
ORDER BY region, month_start;