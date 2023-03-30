use Student;

select * from stud;

--where function cannot contain aggregation functions 
select * from stud
where marks = min(marks); -- ERROR

--We can use the subquery to achieve the above results
select * from stud
where marks = (select min(marks) from stud);

--Group by
select studentname,sum(marks) as Total_Marks from stud
group by studentname

-- Rows are filtered as per condition given in where clause and then grouping happens
select studentname,sum(marks) as Total_Marks from stud
where marks > 60
group by studentname;

select studentname,sum(marks) as Total_Marks from stud
where studentname != 'lily'
group by studentname;

--Having clause is used to filter after the group by is executed
select studentname,sum(marks) as Total_Marks from stud
where studentname != 'lily'
group by studentname
having sum(marks) > 250;

select studentname,sum(marks) as Total_Marks from stud
where studentname != 'lily'
group by studentname
having StudentName = 'isabella';

