use analytics;

select * from employees;
select * from ItemMaster;
select * from OrderMaster;

create table master1(	
	EmployeeId int,
	EmployeeName varchar(50),
	OrderId int,
	ItemName varchar(50));

INSERT INTO master1
SELECT e.employeeid,e.employeename,o.orderid,i.itemname FROM employees e inner join Ordermaster o on e.employeeid = o.employeeid
inner join itemmaster i on o.itemid = i.itemid;

select * from master1;

ALTER TABLE Master1 ADD ID INT IDENTITY(1,1);