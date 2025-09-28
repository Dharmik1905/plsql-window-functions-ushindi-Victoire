-- Query 1: Total revenue across all customers
SELECT 
    SUM(amount) AS total_revenue
FROM transactions;

-- ----------------------------------------------------------

-- Query 2: Revenue per customer
SELECT 
    c.customer_id,
    c.name,
    c.region,
    SUM(t.amount) AS total_revenue
FROM customers c
LEFT JOIN transactions t 
    ON c.customer_id = t.customer_id
GROUP BY c.customer_id, c.name, c.region
ORDER BY total_revenue DESC;

-- ----------------------------------------------------------

-- Query 3: Identify quartiles using NTILE
WITH cust_revenue AS (
    SELECT 
        c.customer_id,
        c.name,
        c.region,
        COALESCE(SUM(t.amount), 0) AS total_revenue
    FROM customers c
    LEFT JOIN transactions t 
        ON c.customer_id = t.customer_id
    GROUP BY c.customer_id, c.name, c.region
)
SELECT 
    customer_id,
    name,
    region,
    total_revenue,
    NTILE(4) OVER (ORDER BY total_revenue DESC) AS revenue_quartile
FROM cust_revenue
ORDER BY total_revenue DESC;

-- ----------------------------------------------------------

-- Query 4: Top quartile revenue and percentage of total
WITH cust_revenue AS (
    SELECT 
        c.customer_id,
        c.name,
        c.region,
        COALESCE(SUM(t.amount), 0) AS total_revenue
    FROM customers c
    LEFT JOIN transactions t 
        ON c.customer_id = t.customer_id
    GROUP BY c.customer_id, c.name, c.region
),
ranked AS (
    SELECT 
        customer_id,
        name,
        region,
        total_revenue,
        NTILE(4) OVER (ORDER BY total_revenue DESC) AS revenue_quartile
    FROM cust_revenue
)
SELECT
    SUM(CASE WHEN revenue_quartile = 1 THEN total_revenue ELSE 0 END) AS top_quartile_revenue,
    SUM(total_revenue) AS total_revenue,
    ROUND(
        (SUM(CASE WHEN revenue_quartile = 1 THEN total_revenue ELSE 0 END) * 100.0) 
        / SUM(total_revenue), 2
    ) AS pct_top_quartile
FROM ranked;
