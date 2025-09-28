CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    region TEXT NOT NULL,
    created_at DATE DEFAULT CURRENT_DATE
);

CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    category TEXT NOT NULL
);

CREATE TABLE transactions (
    transaction_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL REFERENCES customers(customer_id),
    product_id INT NOT NULL REFERENCES products(product_id),
    sale_date DATE NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    amount NUMERIC(12,2) NOT NULL CHECK (amount >= 0)
);

CREATE INDEX idx_transactions_sale_date ON transactions(sale_date);
CREATE INDEX idx_transactions_customer ON transactions(customer_id);
CREATE INDEX idx_transactions_product ON transactions(product_id);

SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM transactions;