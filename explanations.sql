# Sunrise Supermarket Assignment 1
Name:KEZA Christa Clea  
Student ID:29570 
Database Management System:PostgreSQL  
Database Name:sunrise_supermarket  
  1. Project Summary

This project is a SQL database assignment for a supermarket called **Sunrise Supermarket**.

The database was created using PostgreSQL to manage customers, products, orders, and order items.

The project includes:

- 5 customers
- 8 products from 4 different categories
- 15 orders
- 25 order items
- JOIN queries
- A Common Table Expression (CTE)
- Window-function queries

The queries are used to analyze customer orders, product purchases, customer spending, order sequences, revenue, and the number of days between customer orders.

 2. Database Tables

The database contains four main tables:

### Customers
Stores information about supermarket customers, including their name, email, and city.

### Products
Stores product information such as product name, category, and price.

### Orders
Stores customer orders and the dates when the orders were placed.

### Order Items
Stores the products included in each order and their quantities.

## 3. SQL Techniques Used

### JOIN Queries

I used JOIN queries to:

1. List orders together with customer names, cities, and order dates.
2. List order items together with product names, categories, prices, and quantities.
3. Display all customers and their orders, including customers who have no orders.

### CTE Query

A Common Table Expression (CTE) was used to calculate the total amount spent by each customer and identify customers whose spending is above the average customer spending.

### Window Functions

Window functions were used to:

1. Rank customers according to their total spending.
2. Number each customer's orders according to the order date.
3. Calculate a running total of supermarket revenue over time.
4. Calculate the number of days between a customer's current and previous orders.

## 4. How to Run the Project

### Step 1: Create the Database

Open PostgreSQL and create the database:

```sql
CREATE DATABASE sunrise_supermarket;
\c sunrise_supermarket
Step 4: Insert the Data

Run the INSERT statements in the SQL file to populate the tables with customers, products, orders, and order items.

Step 5: Run the Queries

Execute the JOIN, CTE, and window-function queries included in the SQL file.

Step 6: Check the Results

The results can be viewed in PostgreSQL/pgAdmin. Screenshots of the query results are included in the screenshots folder.

5. Business Scenario

Sunrise Supermarket needs a database system to keep track of its customers, products, and orders.

The SQL queries help the supermarket understand customer purchasing behavior, identify high-spending customers, track revenue, and analyze ordering patterns.

6. Challenges and Solutions

One challenge was understanding how JOINs connect information from different tables.

I solved this by using primary keys and foreign keys to connect customers with orders and products with order items.

Another challenge was understanding window functions such as RANK(), ROW_NUMBER(), and LAG(). I used these functions to analyze customer rankings, order sequences, running revenue, and the time between orders.

7. Conclusion

This project demonstrates how PostgreSQL can be used to manage and analyze supermarket data. The use of JOINs, CTEs, and window functions makes it possible to obtain useful business information from the database.
