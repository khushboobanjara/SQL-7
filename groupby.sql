
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID VARCHAR(50) NOT NULL,
    Category VARCHAR(50) CHECK (Category IN ('Electronics', 'Home', 'Apparel')),
    OrderDate DATE,
    OrderValue DECIMAL(10,2)
);
INSERT INTO Orders (OrderID, CustomerID, Category, OrderDate, OrderValue) VALUES
(1001, 'C201', 'Electronics', '2024-01-05', 12500),
(1002, 'C203', 'Apparel', '2024-01-07', 3200),
(1003, 'C205', 'Home', '2024-01-10', 5800),
(1004, 'C201', 'Electronics', '2024-01-15', 8900),
(1005, 'C207', 'Apparel', '2024-01-18', 2100),
(1006, 'C210', 'Home', '2024-01-22', 4700),
(1007, 'C203', 'Electronics', '2024-02-01', 15300),
(1008, 'C212', 'Apparel', '2024-02-05', 1800),
(1009, 'C205', 'Home', '2024-02-08', 6200),
(1010, 'C214', 'Electronics', '2024-02-12', 9400),
(1011, 'C207', 'Apparel', '2024-02-17', 2900),
(1012, 'C210', 'Electronics', '2024-02-20', 11000),
(1013, 'C212', 'Home', '2024-03-01', 3500),
(1014, 'C201', 'Apparel', '2024-03-05', 4100),
(1015, 'C214', 'Home', '2024-03-10', 7800);

select * from Orders;


-- Q1. Calculate the total revenue (sum of OrderValue) for each product Category.
select sum(OrderValue), Category from Orders group by Category;

-- Q2. Count the total number of orders placed in each Category.
select count(category) , Category from Orders group by Category;

-- Q3. Find the highest (maximum) single OrderValue within each Category.
select Category ,max(OrderValue) from Orders group by Category;

-- Q4. List all unique product Categories that appear in the Sales_Data table.
select distinct Category from orders; 

-- Q5. List all unique CustomerIDs who have placed at least one order.
select distinct CustomerId from orders;

-- Q6. Find all unique combinations of CustomerID and Category (i.e., which customers bought from which categories).
select distinct CustomerId, Category from orders;

-- Q7. Revenue by CustomerID and Category
select Category, sum(OrderValue) from orders group by Category;

-- Q8. Order Count by CustomerID and Category
select Category ,count(*) from orders group by Category;

-- Q9. Max Order Value per Category
select Category, max(OrderValue) from orders group by category;

-- Q10. Order Count by CustomerID and Category
select  Category,CustomerID, count(*) as order_count from orders group by category, CustomerID;

-- Q11. Revenue by Category and Month
select Category, month(orderdate) as Order_month, sum(OrderValue) as Total_revenue 
from orders
group by Category , month(orderdate);

-- Q12. Categories with Revenue > $20,000
select Category, sum(ordervalue) as Total_revenue from orders
group by Category 
having sum(OrderValue)>20000 ;


-- Q13. Customer + Category Combinations Spending > $10,000
select CustomerId , Category , sum(ordervalue) as Total_spent from orders
group by CustomerID, Category
having sum(ordervalue)>10000;

-- Q14. Category Summary (Avg Order Value > $5,000, sorted by Revenue)
select Category, count(*) as total_Orders, sum(ordervalue) as total_revenue, 
avg(ordervalue) as avg_order from orders
group by Category
having avg(OrderValue)>5000 ;

-- Q15. High-Value Repeat Customers (>1 order, Avg OrderValue > $6,000)
select CustomerId, count(OrderID) as Order_count, round(avg(ordervalue),2) as avg_ordervalue 
from orders
group by CustomerID
having count(OrderID)>1 and avg(ordervalue)>6000;

-- Q16. Category-Month Summary (Min 2 Orders, Sorted by Month then Revenue)
select Category, month(orderdate), count(OrderId) as orders, sum(ordervalue) as total_revenue,
avg(ordervalue) as avg_ordervalue from orders
group by Category, month(OrderDate)
having count(OrderID)>1;