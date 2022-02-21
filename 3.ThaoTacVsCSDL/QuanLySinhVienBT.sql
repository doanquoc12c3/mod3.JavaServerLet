use QuanLiSinhVien;

insert into Student(StudentName, Address, Phone,Status,ClassID)
values('Hung', 'hn', 12343, 1, 1);

select * from Student;

select * from Student
where StudentName like "h%";

select * from Class
where StartDate like "_____12%";

select * from Subject
where Credit >=3 and Credit <=5;

alter table Student
modify ClassID = 2 where StudentName = 'Hung';

update Student
set ClassID = "2"
where StudentName = 'Hung';



