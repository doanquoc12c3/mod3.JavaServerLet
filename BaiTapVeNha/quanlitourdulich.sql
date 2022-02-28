create database tourdulich;

use tourdulich;

drop database tourdulich;

create table diemdendulich(
    id int primary key auto_increment,
    tendiemden varchar(50),
    mota varchar(50),
    giadiemdendulich int,
    thanhpho_id int,
    foreign key(thanhpho_id) references thanhpho(id)
);


insert into diemdendulich(tendiemden, mota, giadiemdendulich,thanhpho_id)
values('hn', 'thu do', 100,1),
      ('hcm', 'sai gon', 200,2),
      ('dn', 'quang nam', 300,3),
      ('qn', 'bien', 400,4),
      ('sapa', 'vung cao', 500,5);

create table khachhang(
      id int primary key auto_increment,
      name varchar(50),
      socancuoc varchar(10),
      namsinh int
);
drop table khachhang;
insert into khachhang(name, socancuoc,namsinh)
values('jojo1','1233456781',1997),
      ('jojo2','1233456782',1987),
      ('jojo3','1233456783',1967),
      ('jojo4','1233456784',1957),
      ('jojo6','1233456785',1991),
      ('jojo5','1233456786',1992),
      ('jojo7','1233456787',1993),
      ('jojo8','1233456788',1994),
      ('jojo9','1233456789',1995),
      ('jojo10','1233456780',1996);

create table thanhpho(
    id int primary key auto_increment,
    tenthanhpho varchar(50)
);

insert into thanhpho(tenthanhpho)
values('ha noi'),
        ('ho chi minh'),
        ('da nang'),
        ('quang ninh'),
        ('lao cai');
create table tour(
    id int primary key auto_increment,
    matour int,
    loaitour_id int,
    diemdendulich_id int,
    ngaybatdau datetime,
    ngayketthuc datetime,
    foreign key(loaitour_id) references loaitour(id),
    foreign key(diemdendulich_id) references diemdendulich(id),
    foreign key(matour) references hoadondattour(id)
);
drop table tour;
insert into tour(matour, loaitour_id,diemdendulich_id,ngaybatdau,ngayketthuc)
values (1,1,1,'2022-03-20','2022-04-21'),
       (2,1,2,'2022-04-20','2022-04-21'),
       (3,1,3,'2022-05-20','2022-04-21'),
       (4,1,4,'2022-06-20','2022-04-21'),
       (5,1,5,'2022-07-20','2022-01-21'),
       (6,1,1,'2022-08-20','2022-02-21'),
       (7,1,2,'2022-09-20','2022-03-21'),
       (8,1,3,'2022-10-20','2022-04-21'),
       (9,1,4,'2022-11-20','2022-05-21'),
       (10,1,5,'2022-01-20','2022-06-21'),
       (1,1,1,'2022-02-20','2022-07-21'),
       (1,1,2,'2022-03-20','2022-08-21'),
       (2,1,2,'2022-04-20','2022-09-21'),
       (3,1,3,'2022-05-20','2022-10-21'),
       (4,1,2,'2022-03-20','2022-04-21');


create table loaitour(
    id int primary key auto_increment,
    matour varchar(10),
    tenloai varchar(10)
);

insert into loaitour(matour,tenloai)
values ('one','single'),
       ('two','couple');

create table hoadondattour(
    id int primary key auto_increment,
    matour_id int,
    khachhang_id int,
    trangthai int default(0),
    foreign key (khachhang_id) references khachhang(id),
    foreign key (matour_id) references loaitour(id)
);


insert into hoadondattour(matour_id, khachhang_id, trangthai)
values(1,1,1),
      (1,1,0),
      (1,1,1),
      (2,1,0),
      (2,1,1),
      (1,1,0),
      (2,1,1),
      (1,1,0),
      (2,1,1),
      (1,1,0);

select tp.tenthanhpho, count(tp.tenthanhpho) as soLuongTour from thanhpho tp
join tour t on tp.id =t.diemdendulich_id
group by tp.tenthanhpho;


select count(ngaybatdau) soLuongTour from tour
where date(ngaybatdau) >= '2022-03-01' and date(ngaybatdau) < '2022-04-01';

select count(ngayketthuc) soLuongTour from tour
where  date(ngayketthuc) < '2022-04-29';
