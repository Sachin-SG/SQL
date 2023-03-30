use student;

select * from STUD;

-----LAG--------

select *,lag(Marks,1,0) over(order by Marks) as lagvalue,lag(Marks,2,0) over(order by Marks) as lag_value2 from STUD;


select *,lag(Marks,1,0) over(order by Marks)  + Marks from STUD;

-----LEAD--------

select *,lead(Marks,1,0) over(order by Marks) as leadvalue,lead(Marks,2,0) over(order by Marks) as lead_value2 from STUD;


select *,lead(Marks,1,0) over(order by Marks)  + Marks from STUD;

--Cumulative distribution = Number rows having greater than equal to the present value divided by the total number of rows
select * ,CUME_DIST() over(order by marks) from STUD;

--FIRST VAL AND LAST VAL DEFAULT FRAMES
/*if you incorrectly believe that these functions operate on the entire window partition, which is the belief of many people who use these functions for the first time, you naturally expect FIRST_VALUE to return the order value of the customer’s first order, and LAST_VALUE to return the order value of the customer’s last order. In practice, though, these functions support a frame. As a reminder, with functions that support a frame, when you specify the window order clause but not the window frame unit and its associated extent, you get RANGE UNBOUNDED PRECEDING by default. With the FIRST_VALUE function, you will get the expected result, but if your query gets optimized with row-mode operators, you will pay the penalty of using the on-disk spool. With the LAST_VALUE function it’s even worse. Not only that you will pay the penalty of the on-disk spool, but instead of getting the value from the last row in the partition, you will get the value from the current row!
Often when people see such output for the first time, they think that SQL Server has a bug. But of course, it doesn’t; it’s simply the SQL standard’s default. There’s a bug in the query. Realizing that there’s a frame involved, you want to be explicit about the frame specification, and use the minimum frame that captures the row that you’re after. Also, make sure that you use the ROWS unit. So, to get the first row in the partition, use the FIRST_VALUE function with the frame ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW. To get the last row in the partition, use the LAST_VALUE function with the frame ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING.

*/

select * ,CUME_DIST() over(partition by Subject order by marks) from STUD;

--GETTNG THE first VALUE FROM A COLUMN , By defaut the frame is range between unbounded preceding and current row
select * ,FIRST_VALUE(Marks) over(order by marks DESC) AS MIN_MARKS from STUD;

--GETTNG THE first VALUE IN A PARTITION 
select * ,FIRST_VALUE(Marks) over(partition by Subject order by marks) AS MIN_MARKS from STUD;

--GETTNG THE last VALUE FROM A COLUMN
select * ,LAST_VALUE(MARKS) over(order by marks desc) AS MAX_MARKS from STUD;--This will not work

--Trick using firsvalue GETTNG THE last VALUE FROM A COLUMN
select * ,firsT_VALUE(MARKS) over(order by marks desc) AS MAX_MARKS from STUD;

--GETTNG THE last VALUE IN A PARTITION

select * ,LAST_VALUE(MARKS) over(order by marks range between current row and unbounded following ) AS MAX_MARKS from STUD;

--Trick using firstvalue GETTNG THE last VALUE FROM A COLUMN
select * ,firsT_VALUE(MARKS) over(partition by subject order by marks desc) AS MAX_MARKS from STUD;

select * ,LAST_VALUE(MARKS) over(order by marks range between unbounded preceding  and unbounded following ) AS MAX_MARKS from STUD;

select * ,LAST_VALUE(Marks) over(partition by Subject order by marks range between current row and unbounded following) AS MAX_MARKS from STUD;

--Percentile Rank
select * ,PERCENT_RANK() over(order by marks) AS precentrank from STUD;

select * ,PERCENT_RANK() over(partition by Subject order by marks) AS precentrank from STUD;

--Percentile continous - Lower Quartile

select * ,PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY Marks) over () AS precentrank from STUD;

--Upper Quartile

select * ,PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY Marks) over () AS precentrank from STUD;

--percentile discrete lower quartile it gives the value which are present in the column but PERCENT_CONT can give the value which isnot present in the column 

select * ,PERCENTILE_disc(0.25) WITHIN GROUP (ORDER BY Marks) over () AS precentrank from STUD;

--Median
select * ,PERCENTILE_disc(0.5) WITHIN GROUP (ORDER BY Marks) over () AS precentrank from STUD;

--Upper Quartile
select * ,PERCENTILE_disc(0.75) WITHIN GROUP (ORDER BY Marks) over () AS precentrank from STUD;




--HACKER RANK SOLUTION
/*
Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.

SELECT DISTINCT T.CITY_FIRST, LEN(T.CITY_FIRST) FROM (SELECT TEMP.CITY , TEMP.CITY_LEN , DENSE_RANK() OVER (ORDER BY CITY_LEN) AS CITYRANK,
FIRST_VALUE(CITY) OVER(PARTITION BY CITY_LEN ORDER BY CITY) AS CITY_FIRST
FROM (SELECT CITY, LEN(CITY) AS CITY_LEN FROM STATION
WHERE LEN(CITY) =(SELECT MIN(LEN(CITY)) FROM STATION) OR
      LEN(CITY) =(SELECT MAX(LEN(CITY)) FROM STATION))TEMP)T;
*/


