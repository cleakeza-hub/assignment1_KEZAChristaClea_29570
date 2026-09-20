-- ============================================================
-- Sunrise Supermarket — Query Set
-- ============================================================

-- ------------------------------------------------------------
-- JOIN 1: Every order with customer name, city, and order date
-- (INNER JOIN: orders + customers)
-- ------------------------------------------------------------
SELECT o.order_id,c.customer_name,c.city, o.order_date FROM orders o INNER JOIN customers c ON o.customer_id = c.customer_id;
-- ------------------------------------------------------------
-- JOIN 2: Every order item with product name, category, price,
-- and quantity (JOIN: order_items + products)
-- ------------------------------------------------------------
SELECT oi.order_item_id,p.product_name,p.category,p.price,oi.quantity FROM order_items oi INNER JOIN products p ON oi.product_id = p.product_id;

-- ------------------------------------------------------------
-- JOIN 3: All customers and their orders where they exist,
-- including customers with no orders (LEFT JOIN)
-- ------------------------------------------------------------
SELECT c.customer_id,c.customer_name,c.city,o.order_id,o.order_date FROM customers c LEFT JOIN orders o ON c.customer_id = o.customer_id;

-- ------------------------------------------------------------
-- CTE: Each customer's total spend (quantity x price); return
-- customers whose spend is above the average customer spend
-- ------------------------------------------------------------
WITH customer_totals AS ( SELECT c.customer_id, c.customer_name, SUM(oi.quantity * p.price) AS total_spend FROM customers c JOIN orders o ON c.customer_id = o.customer_id JOIN order_items oi ON o.order_id = oi.order_id JOIN products p ON oi.product_id = p.product_id GROUP BY c.customer_id,c.customer_name) SELECT customer_id,customer_name,total_spend FROM customer_totals WHERE total_spend > (SELECT AVG(total_spend) FROM customer_totals);
-- ------------------------------------------------------------
-- WINDOW 1: Rank customers by total amount spent, highest first
-- ------------------------------------------------------------
SELECT c.customer_name, SUM(oi.quantity * p.price) AS total_spend, RANK() OVER ( ORDER BY SUM(oi.quantity * p.price) DESC ) AS spending_rank FROM customers c JOIN orders o ON c.customer_id = o.customer_id JOIN order_items oi ON o.order_id = oi.order_id JOIN products p ON oi.product_id = p.product_id GROUP BY c.customer_id, c.customer_name ORDER BY spending_rank;

-- ------------------------------------------------------------
-- WINDOW 2: Number each customer's orders in the order placed
-- ------------------------------------------------------------
SELECT order_id, customer_id,order_date, ROW_NUMBER() OVER ( PARTITION BY customer_id ORDER BY order_date ) AS order_number FROM orders ORDER BY customer_id, order_date;


-- ------------------------------------------------------------
-- WINDOW 3: Running total of revenue over time, ordered by
-- order date
-- ------------------------------------------------------------
SELECT o.order_id, o.order_date, SUM(oi.quantity * p.price) AS revenue, SUM(SUM(oi.quantity * p.price)) OVER ( ORDER BY o.order_date, o.order_id ) AS running_total FROM orders o JOIN order_items oi ON o.order_id = oi.order_id JOIN products p ON oi.product_id = p.product_id GROUP BY o.order_id, o.order_date ORDER BY o.order_date, o.order_id;

-- ------------------------------------------------------------
-- WINDOW 4: For each customer with more than one order, show
-- days between the current and previous order
-- ------------------------------------------------------------
SELECT customer_id, order_id, order_date, LAG(order_date) OVER ( PARTITION BY customer_id ORDER BY order_date ) AS previous_order_date, order_date - LAG(order_date) OVER ( PARTITION BY customer_id ORDER BY order_date ) AS days_between_orders FROM orders ORDER BY customer_id, order_date;
