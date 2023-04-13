use EMP;

--Displaying  all the records
SELECT * FROM EMP;

--Cross product
SELECT * FROM EMP AS A,EMP AS B;

--Displaying manager name using   self join (Cross Product)
SELECT A.EMPNO,A.NAME,B.NAME  FROM EMP AS A,EMP AS B
WHERE A.MGR = B.EMPNO;

--Displaying manager name using   self join (Inner join)
SELECT A.EMPNO,A.NAME,B.NAME AS MANAGER_NAME  FROM EMP AS A INNER JOIN EMP AS B
ON A.MGR = B.EMPNO;
