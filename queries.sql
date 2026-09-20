# assignment1_KEZAChristaClea_29570
 SUNRISE SUPERMARKET ASSIGNMENT 1
 DBMS: PostgreSQL

* 1. CREATE TABLES

CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE products (
    product_id INTEGER PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price NUMERIC(10,2)
);

CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER REFERENCES customers(customer_id),
    order_date DATE
);

CREATE TABLE order_items (
    order_item_id INTEGER PRIMARY KEY,
    order_id INTEGER REFERENCES orders(order_id),
    product_id INTEGER REFERENCES products(product_id),
    quantity INTEGER
);

INSERTIONS 

1.INSERT INTO customers (customer_id, customer_name, email, city)
VALUES
(1, 'Alice Mukamana', 'alice@gmail.com', 'Kigali'),
(2, 'John Niyonzima', 'john@gmail.com', 'Huye'),
(3, 'Peter Uwimana', 'peter@gmail.com', 'Musanze'),
(4, 'Sarah Ingabire', 'sarah@gmail.com', 'Kigali'),
(5, 'David Habimana', 'david@gmail.com', 'Rubavu');

2.INSERT INTO products (product_id, product_name, category, price)
VALUES
(1, 'Rice', 'Food', 2500.00),
(2, 'Sugar', 'Food', 1800.00),
(3, 'Bread', 'Bakery', 1200.00),
(4, 'Cake', 'Bakery', 5000.00),
(5, 'Milk', 'Dairy', 1500.00),
(6, 'Yogurt', 'Dairy', 2000.00),
(7, 'Soap', 'Household', 1000.00),
(8, 'Juice', 'Drinks', 2000.00);

3.INSERT INTO orders (order_id, customer_id, order_date)
VALUES
(101, 1, '2026-09-01'),
(102, 2, '2026-09-02'),
(103, 3, '2026-09-03'),
(104, 4, '2026-09-04'),
(105, 5, '2026-09-05'),
(106, 1, '2026-09-07'),
(107, 2, '2026-09-08'),
(108, 3, '2026-09-10'),
(109, 4, '2026-09-11'),
(110, 5, '2026-09-12'),
(111, 1, '2026-09-14'),
(112, 2, '2026-09-15'),
(113, 3, '2026-09-17'),
(114, 4, '2026-09-18'),
(115, 5, '2026-09-20');

4.INSERT INTO order_items (order_item_id, order_id, product_id, quantity)
VALUES
(1, 101, 1, 3),
(2, 101, 5, 2),
(3, 102, 2, 2),
(4, 102, 3, 3),
(5, 103, 4, 1),
(6, 103, 6, 2),
(7, 104, 1, 4),
(8, 104, 7, 3),
(9, 105, 8, 2),
(10, 105, 5, 3),
(11, 106, 3, 5),
(12, 106, 2, 2),
(13, 107, 1, 2),
(14, 107, 6, 3),
(15, 108, 4, 2),
(16, 108, 8, 4),
(17, 109, 5, 5),
(18, 109, 7, 2),
(19, 110, 2, 3),
(20, 110, 3, 4),
(21, 111, 1, 5),
(22, 111, 4, 1),
(23, 112, 6, 3),
(24, 112, 8, 2),
(25, 113, 7, 4);
