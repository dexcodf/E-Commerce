DROP TABLE IF EXISTS order_items, orders, products, categories, customers;
CREATE TABLE customers (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    created_at DATE
);
CREATE TABLE categories (
    id INT PRIMARY KEY,
    name VARCHAR(100)
);
CREATE TABLE products (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    category_id INT,
    price DECIMAL(10,2),
    stock INT,
    FOREIGN KEY (category_id) REFERENCES categories(id)
);
CREATE TABLE orders (
    id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);
CREATE TABLE order_items (
    id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);
INSERT INTO customers VALUES
(1, 'Alice', 'alice@example.com', '2023-01-10'),
(2, 'Bob', 'bob@example.com', '2023-02-15'),
(3, 'Charlie', 'charlie@example.com', '2023-03-20');
INSERT INTO categories VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Books');
INSERT INTO products VALUES
(1, 'Smartphone', 1, 699.99, 50),
(2, 'Laptop', 1, 1299.99, 30),
(3, 'T-Shirt', 2, 19.99, 100),
(4, 'Novel', 3, 9.99, 200);
INSERT INTO orders VALUES
(1, 1, '2023-04-01', 719.98),
(2, 2, '2023-04-02', 1319.98),
(3, 3, '2023-04-05', 29.98);
INSERT INTO order_items VALUES
(1, 1, 1, 1, 699.99),
(2, 1, 3, 1, 19.99),
(3, 2, 2, 1, 1299.99),
(4, 2, 3, 1, 19.99),
(5, 3, 3, 1, 19.99),
(6, 3, 4, 1, 9.99);