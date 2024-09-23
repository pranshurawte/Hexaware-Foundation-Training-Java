-- Task 1 : Initiated

CREATE DATABASE IF NOT EXISTS TechShop;     -- 1 -- database creation
USE TechShop;

CREATE TABLE Customers     -- 2
(   
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    Address TEXT
);

CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(100),
    Description TEXT,
    Price DECIMAL(10, 2)
);

CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE OrderDetails (
    OrderDetailID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Inventory (
    InventoryID INT AUTO_INCREMENT PRIMARY KEY,
    ProductID INT,
    QuantityInStock INT,
    LastStockUpdate DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Customers (FirstName, LastName, Email, Phone, Address)      -- 5
VALUES
('Pranshu', 'Rawte', 'kravate35@gmail.com', '1234567890', 'Ganpati Enclave'),
('Ayush', 'Jain', 'ayushjain@gmail.com', '0987654321', 'Ganpati Enclave'),
('Nihal', 'Puse', 'nihalpuse@gmail.com', '1122334455', 'C Sector'),
('Ankit', 'Patel', 'ankitpatel@gmail.com', '1112223334', 'Lalita Nagar'),
('Vijay', 'Rathor', 'rathorvijay@gmail.com', '55544432', 'Main City'),
('Rishi', 'Rawte', 'rishirawte@gmail.com', '99999999', 'Ganpati Enclave'),
('Aradhana', 'Rawte', 'aradhanarawte@gmail.com', '8888888888', 'Ganpati Enclave'),
('Komal', 'Rawte', 'komalrawte5@gmail.com', '7777777777', 'Ganpati Enclave'),
('Divya', 'Jain', 'divyajian@gmail.com', '6666666666', 'Ganpati Enclave'),
('Krunal', 'Puse', 'krunalpuse@gmail.com', '5555555555', 'C Sector');


INSERT INTO Products (ProductName, Description, Price)
VALUES
('IPhone 16 Pro Max', 'Latest Apple smartphone', 120000.00),
('Asus TUF Gaming F15', 'High-performance laptop', 82000.00),
('Lenovo Pad', '10-inch Android tablet', 32000.00),
('Pebble Cosmos Luxe 2.0', 'Fitness tracker with GPS', 3500.00),
('Cosmic Byte Phobos', 'Noise-cancelling wireless headphones', 3789.00),
('Crown 4k TV', '55-inch Ultra HD Smart TV', 40000.00),
('ClawShoot Wired Gaming Contoller', 'Next-gen gaming console', 999.00),
('1+ Wireless Charger', 'Fast wireless charging pad', 4500.00),
('Wings Gaming Mouse', '6500 DPi Gaming Mouse', 899.00),
('Insta 360 X4', '360 Degree Action camera with 4K video', 59999.00);

INSERT INTO Orders (CustomerID, OrderDate, TotalAmount)
VALUES
(1, '2024-09-01', 120000.00), -- Smartphone
(2, '2024-09-02', 82000.00), -- Laptop
(3, '2024-09-03', 32000.00), -- Tablet
(4, '2024-09-04',  3500.00), -- Smartwatch
(5, '2024-09-05', 3789.00), -- Bluetooth Headphones
(6, '2024-09-06', 40000.00), -- 4K TV
(1, '2024-09-07', 999.00), -- Gaming Console
(3, '2024-09-08', 4500.00), -- Wireless Charger
(2, '2024-09-09', 899.00), -- Gaming Mouse
(4, '2024-09-10', 59999.00); -- Digital Camera

INSERT INTO OrderDetails (OrderID, ProductID, Quantity)
VALUES
(1, 1, 1),  -- iPhone 16 Pro Max 
(2, 2, 1),  -- Asus TUF Gaming F15 
(3, 3, 1),  -- Lenovo Pad 
(4, 4, 1),  -- Pebble Cosmos Luxe 2.0 
(5, 5, 1),  -- Cosmic Byte Phobos 
(6, 6, 1),  -- Crown 4K TV 
(7, 7, 1),  -- ClawShoot Wired Gaming Controller 
(8, 8, 1),  -- 1+ Wireless Charger 
(9, 9, 1),  -- Wings Gaming Mouse
(10, 10, 1);  -- Insta 360 X4 

INSERT INTO Inventory (ProductID, QuantityInStock, LastStockUpdate)
VALUES
(1, 50, '2024-09-01'),  -- iPhone 16 Pro Max
(2, 30, '2024-09-01'),  -- Asus TUF Gaming F15
(3, 100, '2024-09-01'), -- Lenovo Pad
(4, 200, '2024-09-01'), -- Pebble Cosmos Luxe 2.0
(5, 150, '2024-09-01'), -- Cosmic Byte Phobos
(6, 80, '2024-09-01'),  -- Crown 4K TV
(7, 500, '2024-09-01'), -- ClawShoot Wired Gaming Controller
(8, 300, '2024-09-01'), -- 1+ Wireless Charger
(9, 400, '2024-09-01'), -- Wings Gaming Mouse
(10, 60, '2024-09-01'); -- Insta 360 X4

-- Task 1 : Completed


-- Task 2 : Initiated

SELECT FirstName, LastName, Email  -- 1
FROM Customers;

-- 2
-- Write an SQL query to list all orders with their order dates and corresponding customer names.

SELECT 
    o.OrderID,
    o.OrderDate,
    c.FirstName,
    c.LastName
FROM 
    Orders o
JOIN 
    Customers c ON o.CustomerID = c.CustomerID;

INSERT INTO Customers (FirstName, LastName, Email, Phone, Address)   -- 3
VALUES
('Dharmendra','Prajapati','dharmendraprajapati@gmail.com',5555555555,'Lalita Nagar');

UPDATE Products     -- 4
SET Price = Price + (Price * 0.1);

-- 5
-- Modifying the child class i.e. OrderDetails by adding ON DELETE CASCADE to the foreign key so that 
-- when we delete some reord from the parent table ,
-- it automatically gets delted from the child table

SHOW CREATE TABLE OrderDetails;   -- to find the foreign key

ALTER TABLE OrderDetails
DROP FOREIGN KEY fk_orderdetails_orderid;    -- Droping the foreign key

ALTER TABLE OrderDetails       -- new foreign key added
ADD CONSTRAINT fk_orderdetails_orderid
FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) ON DELETE CASCADE ;

-- now deleting the 
DELETE FROM Orders
WHERE OrderID = 10;

-- 6
-- Write an SQL query to insert a new order into the "Orders" table. Include the customer ID, 
-- order date, and any other necessary information.

INSERT INTO Orders(CustomerID,  OrderDate, TotalAmount)
VALUES(4, '2024-09-10', 59999.00);

-- 7
-- Write an SQL query to update the contact information (e.g., email and address) of a specific 
-- customer in the "Customers" table. Allow users to input the customer ID and new contact information.

UPDATE Customers
SET email = 'pranshurawte.2007@gmail.com', address ='Bima Kunj'
WHERE CustomerID = 1;

SELECT * FROM Orders;
SELECT * FROM OrderDetails;
SELECT * FROM Products;
-- 8
-- Write an SQL query to recalculate and update the total cost of each order in the "Orders" 
-- table based on the prices and quantities in the "OrderDetails" table. 
UPDATE Orders  
JOIN ( 
  SELECT OrderDetails.OrderID, SUM(OrderDetails.Quantity * Products.Price) AS TotalCost  
   FROM OrderDetails  
   JOIN Products ON OrderDetails.ProductID = Products.ProductID 
   GROUP BY OrderDetails.OrderID ) 
AS calculatedTotals 
ON Orders.OrderID = calculatedTotals.OrderID 
SET Orders.TotalAmount = calculatedTotals.TotalCost; 

-- 9
-- Write an SQL query to delete all orders and their associated order details for a specific 
-- customer from the "Orders" and "OrderDetails" tables. Allow users to input the customer ID as a parameter. 

DELETE FROM Orders
WHERE CustomerID = 6;

-- SELECT * FROM Orders;
-- SELECT * FROM OrderDetails;

-- 10
-- Write an SQL query to insert a new electronic gadget product into the "Products" table, 
-- including product name, category, price, and any other relevant details.

-- Adding a new field category in the Products table
ALTER TABLE Products
ADD Category VARCHAR(50);

-- Inserting Cateogy values of the pructs
UPDATE Products SET Category = 'Electronics' WHERE ProductName IN ('IPhone 16 Pro Max', 'Asus TUF Gaming F15', 'Lenovo Pad', 'Crown 4K TV', 'Insta 360 X4');
UPDATE Products SET Category = 'Wearables' WHERE ProductName = 'Pebble Cosmos Luxe 2.0';
UPDATE Products SET Category = 'Accessories' WHERE ProductName IN ('Cosmic Byte Phobos', 'ClawShoot Wired Gaming Controller', '1+ Wireless Charger', 'Wings Gaming Mouse');

INSERT INTO Products(ProductName, Description, Price, Category)
VALUES('Apple AirPods Pro', 'Wireless Earphone', 35000.00, 'Wearables');

-- 11
-- Write an SQL query to update the status of a specific order in the "Orders" table (e.g., from 
-- "Pending" to "Shipped"). Allow users to input the order ID and the new status. 

-- Adding a new field status in the Orders table
ALTER TABLE Orders
ADD Status VARCHAR(20);

SELECT * FROM Orders;
UPDATE Orders SET Status = 'Pending' WHERE OrderID IN (1,2,3,4,5,7,8,9,11);
UPDATE Orders SET Status = 'Shipped' WHERE OrderID = 8;

-- 12
-- Write an SQL query to calculate and update the number of orders placed by each customer 
-- in the "Customers" table based on the data in the "Orders" table.

ALTER TABLE Customers ADD NumberOfOrders INT DEFAULT 0;
UPDATE Customers c
SET c.NumberOfOrders = (
    SELECT COUNT(*) 
    FROM Orders o
    WHERE o.CustomerID = c.CustomerID
);


-- TASK 3: Aggregate functions, Having, Order By, GroupBy and Joins:  
-- 1.
--  Write an SQL query to retrieve a list of all orders along with customer information (e.g., 
-- customer name) for each order. 

SELECT c.FirstName, c.LastName, o.OrderID	
FROM Customers c
JOIN Orders o
ON c.CustomerID = o.CustomerID
ORDER BY c.FirstName;

-- 2
-- Write an SQL query to find the total revenue generated by each electronic gadget product. 
-- Include the product name and the total revenue. 

SELECT p.ProductName, SUM(p.Price * od.quantity) AS total_revenue
FROM Products p
JOIN orderdetails od
GROUP BY p.ProductName;

-- 3
-- Write an SQL query to list all customers who have made at least one purchase. Include their 
-- names and contact information.

SELECT c.FirstName, c.LastName, c.Email, c.Phone, COUNT(o.OrderID) AS NumberOfPurchase
FROM Customers c
JOIN Orders o
ON c.CustomerID = o.CustomerID
WHERE NumberOfOrders >= 1
GROUP BY  c.FirstName, c.LastName, c.Email, c.Phone;

-- 4
-- Write an SQL query to find the most popular electronic gadget, which is the one with the highest 
-- total quantity ordered. Include the product name and the total quantity ordered.

SELECT p.ProductName, SUM(od.Quantity) AS total_quantity_ordered
FROM Products p
JOIN OrderDetails od
ON p.ProductID = od.ProductID
GROUP BY p.ProductName
ORDER BY total_quantity_ordered DESC
LIMIT 1 ;

-- 5
-- Write an SQL query to retrieve a list of electronic gadgets along with their corresponding 
-- categories.

SELECT DISTINCT p.ProductName, p.Category
FROM Products p;

-- 6
-- Write an SQL query to calculate the average order value for each customer. Include the 
-- customer's name and their average order value. 

SELECT c.FirstName, c.LastName, AVG(o.TotalAmount) AS AverageOrderValue
FROM Customers c
JOIN Orders o
On c.CustomerID = o.CustomerID
GROUP BY c.FirstName,c.LastName;

-- 7
-- Write an SQL query to find the order with the highest total revenue. Include the order ID, 
-- customer information, and the total revenue.

SELECT c.CustomerID, c.FirstName, c.LastName, o.OrderID, o.TotalAmount AS HighestTotalRevenue
FROM Customers c
JOIN Orders o
ON c.CustomerID = o.CustomerID
ORDER BY HighestTotalRevenue DESC
LIMIT 1;

-- 8
-- Write an SQL query to list electronic gadgets and the number of times each product has been 
-- ordered. 

SELECT p.ProductName, COUNT(od.Quantity) AS NumberOfOrders
FROM Products p
JOIN OrderDetails od
ON p.ProductID = od.ProductID
GROUP BY p.ProductName;

-- 9
-- Write an SQL query to find customers who have purchased a specific electronic gadget product. 
-- Allow users to input the product name as a parameter. 

SELECT c.FirstName, c.LastName, p.ProductName
FROM Customers c
JOIN 
	Orders o ON c.CustomerID = o.CustomerID
JOIN 
	OrderDetails od ON o.OrderId =od.OrderId
JOIN 
	Products p ON p.ProductId = od.ProductID
WHERE
	p.ProductName ='IPhone 16 Pro Max';
    
-- 10
-- Write an SQL query to calculate the total revenue generated by all orders placed within a 
-- specific time period. Allow users to input the start and end dates as parameters.

SELECT o.OrderDate, SUM(o.TotalAmount) AS ToatalRevenueGenerated
FROM Orders o
WHERE '2024-01-01' AND '2024-12-31'
GROUP BY  o.OrderDate;


-- Task 4
-- Subquery and its type

-- 1
-- Write an SQL query to find out which customers have not placed any orders. 

SELECT * FROM Customers
WHERE CustomerID NOT IN (
  SELECT CustomerID
  FROM Orders
);

-- 2
-- Write an SQL query to find the total number of products available for sale. 

SELECT SUM(QuantityInStock)
FROM Inventory;

-- 3
-- Write an SQL query to calculate the total revenue generated by TechShop. 
 SELECT SUM(TotalAmount)
FROM Orders;

-- 4
-- Write an SQL query to calculate the average quantity ordered for products in a specific category.
-- Allow users to input the category name as a parameter.

SELECT AVG(od.Quantity)
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
WHERE p.Category = 'Electronics';

-- 5
-- Write an SQL query to calculate the total revenue generated by a specific customer. 
-- Allow users to input the customer ID as a parameter.

SELECT SUM(TotalAmount) AS revenue_generated
FROM Orders 
WHERE CustomerID = 1;

-- 6
-- Write an SQL query to find the customers who have placed the most orders.
-- List their names and the number of orders they've placed.

SELECT c.FirstName, c.LastName, COUNT(o.OrderID) AS NumberOfOrders	
FROM Customers c 
JOIN Orders o
ON c.CustomerID = o.CustomerID
GROUP BY c.FirstName, c.LastName
ORDER BY NumberOfOrders DESC
LIMIT 1;

-- 7
-- Write an SQL query to find the most popular product category, 
-- which is the one with the highest total quantity ordered across all orders.

SELECT p.Category, SUM(od.Quantity) AS TotalQuantity
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.Category
ORDER BY TotalQuantity DESC
LIMIT 1;

-- SELECT * FROM Products;
-- SELECT * FROM Orderdetails;

-- 8
-- Write an SQL query to find the customer who has spent the 
-- most money (highest total revenue) on electronic gadgets. List their name and total spending.

SELECT c.FirstName, c.LastName, SUM(o.TotalAmount) as highest_total_revenue
FROM Customers c 
JOIN Orders o
WHERE c.CustomerID = o.CustomerID
GROUP BY c.FirstName, c.LastName
ORDER BY highest_total_revenue DESC
LIMIT 1;

-- 9
-- Write an SQL query to calculate the average order value (total revenue divided by the number of 
-- orders) for all customers.

SELECT AVG(TotalAmount) AS AverageOrderValue
FROM Orders;

-- 10
-- Write an SQL query to find the total number of orders placed by each customer and list their 
-- names along with the order count.

SELECT c.FirstName,c.LastName, COUNT(o.OrderID) as Number_of_Orders
FROM Customers c
JOIN Orders o
ON c.CustomerID = o.CustomerID
GROUP BY c.FirstName,c.LastName;









