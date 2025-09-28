-- Query B2: Running total using RANGE frame (range of values)
SELECT
  month_start,
  region,
  month_sales,
  SUM(month_sales) OVER (
    PARTITION BY region
    ORDER BY month_start
    RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
  ) AS running_total_range
FROM (
  SELECT date_trunc('month', sale_date)::date AS month_start,
         c.region,
         SUM(amount) AS month_sales
  FROM transactions t
  JOIN customers c ON t.customer_id = c.customer_id
  GROUP BY date_trunc('month', sale_date)::date, c.region
) s
ORDER BY region, month_start;