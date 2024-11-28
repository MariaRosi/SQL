CREATE TABLE Sales.OrderInfo (
    OrderID INT PRIMARY KEY,
    ProductID INT,
    CustomerID INT,
    SalesPersonID INT,
    OrderDate DATE,
    ShipDate DATE,
    OrderStatus VARCHAR(50),
    ShipAddress VARCHAR(255),
    BillAddress VARCHAR(255),
    Quantity INT,
    Sales INT,
    CreationTime DATETIME2
);

INSERT INTO Sales.OrderInfo (OrderID, ProductID, CustomerID, SalesPersonID, OrderDate, ShipDate, OrderStatus, ShipAddress, BillAddress, Quantity, Sales, CreationTime) VALUES
(1, 101, 2, 3, '2024-01-01', '2024-01-05', 'Delivered', '9833 Mt. Dias Blvd.', '1226 Shoe St.', 1, 10, '2024-01-01 12:34:56.0000000'),
(2, 102, 3, 5, '2024-01-10', '2024-01-15', 'Shipped', '250 Race Court', NULL, 1, 15, '2024-01-10 23:22:04.0000000'),
(3, 101, 1, 3, '2024-01-20', '2024-01-25', 'Delivered', '8157 W. Book', '8157 W. Book', 2, 20, '2024-01-20 18:24:08.0000000'),
(4, 104, 2, 5, '2024-02-01', '2024-02-05', 'Shipped', '5724 Victory Lane', NULL, 2, 60, '2024-02-01 05:50:33.0000000'),
(5, 104, 3, 5, '2024-02-10', '2024-02-15', 'Delivered', NULL, NULL, 1, 25, '2024-02-10 14:02:41.0000000'),
(6, 104, 3, 5, '2024-02-20', '2024-02-25', 'Delivered', '1792 Belmont Rd.', NULL, 2, 50, '2024-02-20 15:34:57.0000000'),
(7, 102, 2, 3, '2024-03-01', '2024-03-05', 'Delivered', '136 Balboa Court', NULL, 3, 30, '2024-03-01 16:22:01.0000000'),
(8, 101, 1, 3, '2024-03-10', '2024-03-15', 'Shipped', '2947 Vine Lane', '4311 Clay Rd', 3, 90, '2024-03-10 10:45:22.0000000'),
(9, 104, 2, 5, '2024-03-20', '2024-03-25', 'Shipped', '3768 Door Way', NULL, 2, 20, '2024-03-20 12:59:04.0000000'),
(10, 102, 3, 5, '2024-04-01', '2024-04-05', 'Shipped', NULL, NULL, 2, 60, '2024-04-01 23:25:15.0000000'),
(11, 103, 2, 4, '2024-04-10', '2024-04-15', 'Delivered', '9876 Granite St.', '7654 Pebble Dr.', 1, 35, '2024-04-10 11:00:00.0000000'),
(12, 105, 1, 3, '2024-04-20', '2024-04-25', 'Shipped', '4567 Oak Ave.', '4567 Oak Ave.', 4, 120, '2024-04-20 08:30:00.0000000'),
(13, 106, 3, 5, '2024-05-01', '2024-05-05', 'Delivered', '1234 Maple St.', NULL, 2, 70, '2024-05-01 09:45:00.0000000'),
(14, 107, 2, 4, '2024-05-10', '2024-05-15', 'Shipped', '7890 Pine Rd.', NULL, 3, 95, '2024-05-10 14:20:00.0000000'),
(15, 108, 3, 5, '2024-05-20', '2024-05-25', 'Delivered', NULL, NULL, 1, 50, '2024-05-20 17:30:00.0000000');


select * from Sales.OrderInfo;