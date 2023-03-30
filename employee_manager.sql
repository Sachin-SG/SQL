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

with em as
( select empno,ename,mgr from EMP)
select e.empno,e.ename,m.ename as manager_name from em as e inner join em as m on e.mgr = m.empno;
