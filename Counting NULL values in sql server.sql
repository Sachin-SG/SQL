use analytics;
select * from Ecommerce;

--Display Table information
EXEC sp_help Ecommerce;

--Count total Rows
select count(CustomerID) from Ecommerce;


--Displaying Non NULL Values in CustomerID column
select * from Ecommerce
where CustomerID is not null;

--Displaying NULL Values in CustomerID column
select * from Ecommerce
where CustomerID is null;

--Counting NULL and Non NULL values in CustomerID column

--In SQL Server, NULL value indicates an unavailable or unassigned value. The value NULL does not equal zero (0), nor does it equal a space (' '). Because the NULL value cannot be equal or unequal to any value, you cannot perform any comparison on this value by using operators such as '=' or '<>'.

select count(CustomerID) from Ecommerce
where CustomerID = NULL;--This will return 0

select count(*) from Ecommerce
where CustomerID = NULL;--This will return 0

--We can use the IS NULL function instead,But here Count Function which is an aggregate function will ignore the null values
-- and we will get the answer as 0 but Count(*) will condider the NULL values and we will get desired results.
select count(CustomerID) from Ecommerce
where CustomerID is null;--This will also return 0

select count(*) from Ecommerce
where CustomerID is null;--This will work

--ALternate solution for counting NULL values
--count(*) (all rows) -  count(CustomerID) Non NULl rows = NULL rows
select count(*) - count(CustomerID) from Ecommerce;


--Counting NULL and Non NULL values in a column
SELECT count(*)  FROM Ecommerce WHERE CustomerID IS NULL 
UNION ALL
SELECT count(*) FROM Ecommerce WHERE CustomerID IS NOT NULL
