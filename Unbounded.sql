use Student;
select * from STUD;

--Take all above rows and all below rows of a current column
select Marks,sum(marks) over(order by Marks rows between unbounded preceding and unbounded following) from stud;

--Take all above rows and 1 below row of a current column
select Marks, sum(marks) over(order by Marks rows between unbounded preceding and 1 following) from stud;

--Take 1 above row and all below row of a current column
select Marks, sum(marks) over(order by Marks asc rows between 1 preceding and unbounded following) from stud
order by marks asc;

--Take 1 above row and 1 below row of a current column
select Marks, sum(marks) over(order by Marks asc rows between 1 preceding and 1 following) from stud
order by marks asc;

-- Running Total
select Marks, sum(marks) over(order by Marks) from stud;

--Running Total by not considering duplicate value and this is the default frame
select Marks, sum(marks) over(order by Marks asc range between unbounded preceding and current row) from stud;

--Running Total by considering duplicate value
select Marks, sum(marks) over(order by Marks asc rows between unbounded preceding and current row) from stud;

--Same as Normal
select Marks, sum(marks) over(order by Marks asc rows between current row and current row) from stud;

select * ,FIRST_VALUE(Marks) over(partition by Subject order by marks) AS MIN_MARKS from STUD;

--Range VS Rows    Duplication is based on the order by clause
select Marks, sum(marks) over(order by Marks asc range between unbounded preceding and current row) as Range_Sum,
sum(marks) over(order by Marks asc rows between unbounded preceding and current row) as Row_Sum from stud;

select *, sum(marks) over(order by subject asc range between unbounded preceding and current row) as Range_Sum,
sum(marks) over(order by subject asc rows between unbounded preceding and current row) as Row_Sum from stud;