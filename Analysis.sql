-- Total revenue per customer
SELECT c.name, SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o ON c.id = o.customer_id
GROUP BY c.id
ORDER BY total_spent DESC;

-- Most sold products
SELECT p.name, SUM(oi.quantity) AS total_sold
FROM products p
JOIN order_items oi ON p.id = oi.product_id
GROUP BY p.id
ORDER BY total_sold DESC;

-- Average order value
SELECT AVG(total_amount) AS avg_order_value
FROM orders;

-- View: Top customers
CREATE VIEW top_customers AS
SELECT c.name, SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o ON c.id = o.customer_id
GROUP BY c.id
HAVING total_spent > 500;

-- Subquery example
SELECT name FROM products
WHERE id IN (
    SELECT product_id FROM order_items
    GROUP BY product_id
    HAVING SUM(quantity) > 1
);