use Student;
--IF ELSE
declare @m int = 10
IF @m = 10
 print 'hello';
else 
	print 'welcome';

--SINCE WE CANNOT USE IF ELSE STATEMENT IN SELECT, WE USE CASE STATEMENT INSTEAD
 select * , 
 case 
	when marks > 80 then 'A'
	when marks > 70 then 'B'
	when marks > 50 then 'C' 
	else 'Pass'
end
from stud;

select * ,
Grade =  case 
	when marks > 80 then 'A'
	when marks > 70 then 'B'
	when marks > 50 then 'C' 
	else 'Pass'
end
from stud;