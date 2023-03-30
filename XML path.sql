use analytics;
CREATE TABLE Employees
(
	EmployeeId int,
	EmployeeName varchar(50)
);

INSERT INTO Employees Values (1,'Jignesh'),
(2,'Tejas'),
(3,'Rakesh'),
(4,'Ganesh');

CREATE TABLE ItemMaster
(
	ItemId int,
	ItemName varchar(50)
)

INSERT INTO ItemMaster VALUES (1,'key Board'),
(2,'Mouse'),
(3,'Monitor'),
(4, 'Processor')


CREATE TABLE OrderMaster
(
	OrderId int,
	EmployeeId int,
	ItemId int
)

INSERT INTO OrderMaster VALUES
(1,1,1),
(1,1,2),
(2,2,4),
(2,2,3),
(2,2,4),
(3,3,1),
(3,4,1),
(3,4,4),
(3,1,4)

select * from Employees;
select * from ItemMaster;
select * from OrderMaster;

SELECT ',' + ItemName from ItemMaster
for XML PATH('');

with ii
as(
select o.EmployeeId,i.ItemName from ItemMaster i inner join OrderMaster o on
i.ItemId= o.ItemId
)
SELECT t2.EmployeeId,  abc = STUFF(
             (SELECT ',  ' + t1.itemname
              FROM ii t1
              WHERE t1.EmployeeId = t2.EmployeeId
              FOR XML PATH (''))
             , 1, 1, '') from  ii t2
group by t2.employeeid;