/****** Script for SelectTopNRows command from SSMS  ******/

use emp;

SELECT TOP (1000) [EMPNO]
      ,[ENAME]
      ,[JOB]
      ,[MGR]
      ,[HIREDATE]
      ,[SAL]
      ,[COMM]
      ,[DEPTNO]
  FROM [emp].[dbo].[EMP];

--Display numbers from 1 to 10 using while loop , for loop does not exist in sql
DECLARE @cnt INT = 0;

WHILE @cnt < 10
BEGIN
   SET @cnt = @cnt + 1;
   print(@cnt)
END

--Displaying hierarchy of employee
with e as (select empno,ename,mgr from emp where MGR IS NULL
			union all
			select emp.empno,emp.Ename,emp.mgr from emp inner join e on e.EMPNO = emp.MGR)
select * from e;

--Finding managers of employess using recursive cte
with e as (select empno,ename,mgr from emp where MGR IS NULL
			union all
			select emp.empno,emp.Ename,emp.mgr from emp inner join e on e.EMPNO = emp.MGR)
select e.empno,e.ename,e.mgr,emp.ename  from e left join emp  on emp.empno = e.mgr



