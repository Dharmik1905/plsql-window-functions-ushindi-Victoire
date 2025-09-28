-- Query A: Calculate lifetime revenue per customer and rank them
WITH cust_revenue AS (
  SELECT
    c.customer_id,
    c.name,
    c.region,
    SUM(t.amount) AS total_revenue
  FROM customers c
  LEFT JOIN transactions t ON c.customer_id = t.customer_id
  GROUP BY c.customer_id, c.name, c.region
)
SELECT
  customer_id,
  name,
  region,
  total_revenue,
  ROW_NUMBER()    OVER (ORDER BY total_revenue DESC)   AS rn_rownum,
  RANK()          OVER (ORDER BY total_revenue DESC)   AS rn_rank,
  DENSE_RANK()    OVER (ORDER BY total_revenue DESC)   AS rn_dense,
  PERCENT_RANK()  OVER (ORDER BY total_revenue DESC)   AS pct_rank
FROM cust_revenue
ORDER BY total_revenue DESC
LIMIT 5; 
