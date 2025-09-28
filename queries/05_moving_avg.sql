-- Query E: 3-month moving average of monthly sales per region
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
  AVG(month_sales) OVER (
    PARTITION BY region
    ORDER BY month_start
    ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
  ) AS moving_avg_3_months
FROM monthly_region
ORDER BY region, month_start;
