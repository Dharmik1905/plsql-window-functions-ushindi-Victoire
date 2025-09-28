-- Query D: Customer segmentation using NTILE(4) and CUME_DIST()
WITH cust_revenue AS (
  SELECT
    c.customer_id,
    c.name,
    c.region,
    COALESCE(SUM(t.amount), 0) AS total_revenue
  FROM customers c
  LEFT JOIN transactions t ON c.customer_id = t.customer_id
  GROUP BY c.customer_id, c.name, c.region
)
SELECT
  customer_id,
  name,
  region,
  total_revenue,
  NTILE(4) OVER (ORDER BY total_revenue DESC) AS revenue_quartile,
  CUME_DIST() OVER (ORDER BY total_revenue DESC) AS cum_dist
FROM cust_revenue
ORDER BY total_revenue DESC;