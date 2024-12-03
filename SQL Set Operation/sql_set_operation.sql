-- create the column in EmployeeInfo
ALTER TABLE Sales.EmployeeInfo
ADD LastName VARCHAR(255);

-- update the LastName column of EmployeeInfo values from the CustInfo
update e
set e.LastName = c.LastName
from Sales.EmployeeInfo as e
inner join Sales.CustInfo as c
on e.FirstName = c.FirstName;

-- update the LastName for EmployeeInfo where it is NULL
update Sales.EmployeeInfo
set LastName =
case
		when FirstName = 'David' then 'Williams'
		when FirstName = 'Eve' then 'Johnson'
		when FirstName = 'Frank' then 'Smith'
		when FirstName = 'Ivy' then 'Jones'
		when FirstName = 'Jack' then 'Brown'
		else 'Miller'
end;

-----------------------------------------------------------------------
-- UNION
select
	FirstName,
	LastName
from Sales.CustInfo
union
select
	FirstName,
	LastName
from Sales.EmployeeInfo;

-- UNION ALL
select
	FirstName,
	LastName
from Sales.CustInfo
union all
select
	FirstName,
	LastName
from Sales.EmployeeInfo;

-- INTERSECT
select
	FirstName,
	LastName
from Sales.CustInfo
intersect
select
	FirstName,
	LastName
from Sales.EmployeeInfo;

-- except
select
	FirstName,
	LastName
from Sales.CustInfo
except
select
	FirstName,
	LastName
from Sales.EmployeeInfo;

----------------------------------------------------------------
select
	'Orders' as SourceTable,
	OrderID,
	ProductID,
	CustomerID,
	SalesPersonID,
	OrderDate,
	ShipDate,
	OrderStatus,
	ShipAddress,
	BillAddress,
	Quantity,
	Sales,
	CreationTime
from Sales.Orders
union
select
	'OrdersArchive' as SourceTable,
	OrderID,
	ProductID,
	CustomerID,
	SalesPersonID,
	OrderDate,
	ShipDate,
	OrderStatus,
	ShipAddress,
	BillAddress,
	Quantity,
	Sales,
	CreationTime
from Sales.OrdersArchive
order by OrderID;


