CREATE TABLE Sales.MonthlySales (
    SaleDate DATE,
    Sales INT,
    Region VARCHAR(50),
    ProductCategory VARCHAR(50)
);


-- January
INSERT INTO Sales.MonthlySales (SaleDate, Sales, Region, ProductCategory) VALUES
('2024-01-03', 100, 'North', 'Electronics'),
('2024-01-15', 150, 'South', 'Furniture'),
('2024-01-21', 200, 'East', 'Clothing'),
('2024-01-27', 120, 'West', 'Electronics'),
('2024-01-29', 180, 'North', 'Furniture');

-- February
INSERT INTO Sales.MonthlySales (SaleDate, Sales, Region, ProductCategory) VALUES
('2024-02-05', 110, 'North', 'Electronics'),
('2024-02-12', 140, 'South', 'Furniture'),
('2024-02-19', 190, 'East', 'Clothing'),
('2024-02-23', 120, 'West', 'Electronics'),
('2024-02-28', 160, 'South', 'Furniture');

-- March
INSERT INTO Sales.MonthlySales (SaleDate, Sales, Region, ProductCategory) VALUES
('2024-03-04', 130, 'North', 'Electronics'),
('2024-03-08', 160, 'South', 'Furniture'),
('2024-03-14', 200, 'East', 'Clothing'),
('2024-03-19', 140, 'West', 'Electronics'),
('2024-03-26', 180, 'North', 'Furniture');

-- April
INSERT INTO Sales.MonthlySales (SaleDate, Sales, Region, ProductCategory) VALUES
('2024-04-02', 150, 'North', 'Electronics'),
('2024-04-11', 170, 'South', 'Furniture'),
('2024-04-19', 140, 'East', 'Clothing'),
('2024-04-23', 120, 'West', 'Electronics'),
('2024-04-30', 160, 'North', 'Furniture');

-- May
INSERT INTO Sales.MonthlySales (SaleDate, Sales, Region, ProductCategory) VALUES
('2024-05-01', 140, 'North', 'Electronics'),
('2024-05-07', 150, 'South', 'Furniture'),
('2024-05-13', 180, 'East', 'Clothing'),
('2024-05-19', 160, 'West', 'Electronics'),
('2024-05-25', 170, 'North', 'Furniture');

-- June
INSERT INTO Sales.MonthlySales (SaleDate, Sales, Region, ProductCategory) VALUES
('2024-06-05', 120, 'North', 'Electronics'),
('2024-06-10', 130, 'South', 'Furniture'),
('2024-06-15', 150, 'East', 'Clothing'),
('2024-06-20', 170, 'West', 'Electronics'),
('2024-06-25', 160, 'North', 'Furniture');


select * from Sales.MonthlySales;