

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10,2)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    product_id INT,
    quantity INT,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO products VALUES (1, 'Laptop', 50000), (2, 'Mouse', 500);
INSERT INTO orders VALUES (1,1,2), (2,2,10);
SELECT p.product_name, SUM(o.quantity * p.price) as revenue
FROM products p
JOIN orders o ON p.product_id = o.product_id
GROUP BY p.product_name
ORDER BY revenue DESC;
