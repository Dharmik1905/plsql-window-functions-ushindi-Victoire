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

-- ========== SAMPLE DATA: customers ==========
INSERT INTO customers (name, region, created_at) VALUES
('John Doe','Kigali','2024-11-01'),
('Alice Mukasa','Kigali','2025-01-05'),
('Paul Niyonzima','Rubavu','2024-12-10'),
('Marie Uwase','Butare','2025-02-02'),
('Emmanuel Habimana','Kigali','2025-03-01'),
('Claire Irakoze','Rubavu','2025-01-15'),
('David Kamanzi','Gisenyi','2025-02-25'),
('Sandra Karangwa','Butare','2024-11-20');

-- ========== SAMPLE DATA: products ==========
INSERT INTO products (name, category) VALUES
('Coffee Beans 1kg','Beverages'),
('Ground Coffee 250g','Beverages'),
('Black Tea 100g','Beverages'),
('Granola Bar','Snacks'),
('Chocolate Cake Slice','Bakery'),
('Orange Juice 1L','Beverages'),
('Sandwich Ham','Food');

-- ========== SAMPLE DATA: transactions ==========
-- We'll insert multiple months (2025 Jan - 2025 Jun) across regions
INSERT INTO transactions (customer_id, product_id, sale_date, quantity, amount) VALUES
(1,1,'2025-01-15',2,50000.00),
(2,2,'2025-01-20',1,8000.00),
(3,1,'2025-01-25',1,25000.00),
(4,4,'2025-02-03',3,7500.00),
(1,3,'2025-02-10',1,5000.00),
(2,1,'2025-02-12',1,25000.00),
(5,5,'2025-03-01',1,6000.00),
(6,2,'2025-03-05',2,16000.00),
(7,6,'2025-03-10',1,3000.00),
(8,7,'2025-03-12',1,4500.00),
(1,1,'2025-04-02',3,75000.00),
(3,4,'2025-04-10',2,5000.00),
(2,5,'2025-04-18',1,6000.00),
(5,1,'2025-04-25',1,25000.00),
(6,3,'2025-05-03',1,5000.00),
(4,2,'2025-05-11',2,16000.00),
(7,1,'2025-05-20',1,25000.00),
(8,4,'2025-05-28',5,12500.00),
(1,6,'2025-06-06',2,6000.00),
(2,1,'2025-06-15',1,25000.00),
(3,1,'2025-06-18',2,50000.00),
