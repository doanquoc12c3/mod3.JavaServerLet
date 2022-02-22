use QuanLiSinhVien;


select * from Subject;  
select * from Student;
select * from Mark;

select * from Subject
group by SubID
having max(Credit);

select s.SubID,s.SubName, max(m.Mark) as 'maxMark' from Mark m
left join Subject s on m.SubID = s.SubID
group by SubID;

select s.StudentName, avg(Mark) as avgMark from Student s
left join Mark m on m.StudentID = s.StudentID
group by StudentName
order by avgMark;

