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

--Differene b/w Count(*) and  count(1) --------> No Difference

SELECT count(*)  FROM Ecommerce
SELECT count(1)  FROM Ecommerce
SELECT count(-123)  FROM Ecommerce

--Above 3  statements will give the same results ,the argument for the count function that we are providing is just used as
-- value to assign the to each row by the count function for example -123 will be assigned to each row and the same will be counted  to give the result.

--Differene b/w Count(column) and  count(1) --------> Yes there is a Difference
SELECT count(*)  FROM Ecommerce -- Null values are also counted
SELECT count(CustomerID)  FROM Ecommerce -- Null values are not counted

--Countng null values from all columns
select 
  sum(case when CustomerID is null then 1 else 0 end) CustomerID_NULL_COUNT,
  sum(case when Description is null then 1 else 0 end) Description_NULL_COUNT,
  sum(case when InvoiceNo is null then 1 else 0 end) InvoiceNo_NULL_COUNT,
  sum(case when StockCode is null then 1 else 0 end) StockCode_NULL_COUNT,
  sum(case when Quantity is null then 1 else 0 end) Quantity_NULL_COUNT,
  sum(case when UnitPrice is null then 1 else 0 end) UnitPrice_NULL_COUNT,
  sum(case when InvoiceDate is null then 1 else 0 end) InvoiceDate_NULL_COUNT,
  sum(case when Country is null then 1 else 0 end) Country_NULL_COUNT
from Ecommerce;

-- Replacing NULL values 
Update Ecommerce
set CustomerID = 'NA'
where CustomerID is null; 

