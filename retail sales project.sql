CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50),
    join_date DATE
);
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);
CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    sale_date DATE,
    quantity INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
INSERT INTO Customers VALUES
(1, 'Alice', 'New York', '2023-01-15'),
(2, 'Bob', 'Chicago', '2023-02-10'),
(3, 'Charlie', 'Los Angeles', '2023-03-05'),
(4, 'David', 'Houston', '2023-04-12');
INSERT INTO Products VALUES
(101, 'Laptop', 'Electronics', 900),
(102, 'Phone', 'Electronics', 600),
(103, 'Shoes', 'Fashion', 80),
(104, 'Watch', 'Fashion', 120);
INSERT INTO Sales VALUES
(1001, 1, 101, '2023-05-01', 1),
(1002, 2, 103, '2023-05-02', 2),
(1003, 1, 104, '2023-05-05', 1),
(1004, 3, 102, '2023-05-10', 1),
(1005, 4, 103, '2023-05-11', 3);
show tables;
select * from customers;
select * from sales;
select * from sales 
where sale_id=1004;
#total revenue
SELECT SUM(p.price * s.quantity) AS total_revenue
FROM Sales s
JOIN Products p ON s.product_id = p.product_id;
#best selling products
SELECT p.product_name, SUM(s.quantity) AS total_sold
FROM Sales s
JOIN Products p ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC;
#revenue by category
SELECT p.category, SUM(p.price * s.quantity) AS category_revenue
FROM Sales s
JOIN Products p ON s.product_id = p.product_id
GROUP BY p.category
ORDER BY category_revenue DESC;
#total customers
SELECT c.name, SUM(p.price * s.quantity) AS total_spent
FROM Sales s
JOIN Customers c ON s.customer_id = c.customer_id
JOIN Products p ON s.product_id = p.product_id
GROUP BY c.name
ORDER BY total_spent DESC;
#monthly sales trend
SELECT DATE_FORMAT(s.sale_date, '%Y-%m') AS month,
       SUM(p.price * s.quantity) AS monthly_sales
FROM Sales s
JOIN Products p ON s.product_id = p.product_id
GROUP BY month
ORDER BY month;







