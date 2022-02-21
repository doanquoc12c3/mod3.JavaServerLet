use `QuanLiSinhVien`;

select * from Student;

select * from Student
Where Status = true;

select * from Subject 
where Credit<10;

select S.StudentID, S.StudentName as 'tenHocSinh', C.ClassName
from Student S
join Class C on S.ClassID = C.ClassID;

SELECT S.StudentId, S.StudentName, Sub.SubName, M.Mark
FROM Student S join Mark M on S.StudentId = M.StudentId join Subject Sub on M.SubId = Sub.SubId;

SELECT S.StudentId, S.StudentName, Sub.SubName, M.Mark
FROM Student S join Mark M on S.StudentId = M.StudentId join Subject Sub on M.SubId = Sub.SubId
WHERE Sub.SubName = 'CF';


