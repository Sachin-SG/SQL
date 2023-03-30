/*create database Student;*/

use student;


CREATE TABLE ExamResult
(StudentName VARCHAR(70), 
 Subject     VARCHAR(20), 
 Marks       INT
);
INSERT INTO ExamResult
VALUES
('Lily', 
 'Maths', 
 65
);
INSERT INTO ExamResult
VALUES
('Lily', 
 'Science', 
 80
);
INSERT INTO ExamResult
VALUES
('Lily', 
 'english', 
 70
);
INSERT INTO ExamResult
VALUES
('Isabella', 
 'Maths', 
 50
);
INSERT INTO ExamResult
VALUES
('Isabella', 
 'Science', 
 70
);
INSERT INTO ExamResult
VALUES
('Isabella', 
 'english', 
 90
);
INSERT INTO ExamResult
VALUES
('Olivia', 
 'Maths', 
 55
);
INSERT INTO ExamResult
VALUES
('Olivia', 
 'Science', 
 60
);
INSERT INTO ExamResult
VALUES
('Olivia', 
 'english', 
 89
);


select * from ExamResult;

SELECT Studentname, Subject, Marks, 
       ROW_NUMBER() OVER(partition by subject order by Marks desc) as RowNumber
FROM ExamResult;

SELECT Studentname, Subject, Marks, 
       ROW_NUMBER() OVER(order by Marks desc) as RowNumber
FROM ExamResult;

SELECT Studentname, Subject, Marks, 
       ROW_NUMBER() OVER(order by Marks desc) as RowNumber
FROM ExamResult
where Subject = 'english';

SELECT Studentname, Subject, Marks, 
       RANK() OVER(order by Marks desc) as Ranks
FROM ExamResult;

SELECT Studentname, Subject, Marks, 
       ROW_NUMBER() OVER(order by Studentname) as RowNumber
FROM ExamResult;

SELECT Studentname, Subject, Marks, 
       RANK() OVER(order by Studentname ) as Ranks
FROM ExamResult;

SELECT Studentname, Subject, Marks, 
       DENSE_RANK() OVER(order by marks desc) as Dense_Ranks
FROM ExamResult;

SELECT Studentname, Subject, Marks, 
       Row_number() OVER(order by marks desc) as Dense_Ranks
FROM ExamResult;



