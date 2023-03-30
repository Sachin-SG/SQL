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

select * ,CUME_DIST() over(partition by Subject order by marks) from STUD;

--GETTNG THE MINIMUM VALUE FROM A COLUMN , By defaut the frame is range between unbounded preceding and current row
select * ,FIRST_VALUE(Marks) over(order by marks DESC) AS MIN_MARKS from STUD;

--GETTNG THE MINIMUM VALUE IN A PARTITION 
select * ,FIRST_VALUE(Marks) over(partition by Subject order by marks) AS MIN_MARKS from STUD;

--GETTNG THE MAXIMUM VALUE FROM A COLUMN
select * ,LAST_VALUE(MARKS) over(order by marks) AS MAX_MARKS from STUD;

--GETTNG THE MAXIMUM VALUE IN A PARTITION
select * ,LAST_VALUE(Marks) over(partition by Subject order by marks) AS MAX_MARKS from STUD;


