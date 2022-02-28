create database quanliphanphoi;
use quanliphanphoi;

create table vattu(
    id int primary key auto_increment,
    mavattu varchar(10),
    tenvattu varchar(10),
    donvitinh varchar(10),
    giatien int
);

create table tonkho(
    id int primary key auto_increment,
    vattu_id int,
    soluongdau int,
    tongsoluongnhap int,
    tongsoluongxuat int
);

create table nhacungcap(
    id int primary key auto_increment,
    manhacungcap varchar(10),
    tennhacungcap varchar(10),
    diachi varchar(50),
    sodienthoai varchar(10)
);

create table dondathang(
    id int primary key auto_increment,
    madonhang varchar(10),
    ngaydat datetime,
    nhacungcap_id int
);

create table phieunhap(
    id          int primary key auto_increment,
    maphieunhap varchar(10),
    ngaynhap    datetime,
    donhang_id  int
);

create table phieuxuat(
    id int primary key auto_increment,
    maphieuxuat varchar(10),
    ngayxuat datetime,
    tenkhachhang varchar(10)
);

create table chitietdonhang(
    id int primary key auto_increment,
    donhang_id int,
    vattu_id int,
    soluongdat int,

);

create table chitietphieunhap(
    id int primary key auto_increment,
    phieunhap_id int,
    vattu_id int,
    soluongnhap int,
    dongianhap int,
    ghichu varchar(50),
    foreign key (phieunhap_id) references phieunhap(id),
    foreign key (vattu_id) references vattu(id)
);

create table chitietphieuxuat(
    id int primary key auto_increment,
    phieuxuat_id int,
    vattu_id int,
    soluongxuat int,
    dongiaxuat int,
    ghichu varchar(50)

);


alter table chitietphieuxuat
add   foreign key(phieuxuat_id) references phieuxuat(id);

alter table chitietphieuxuat
add foreign key(vattu_id) references vattu(id);

alter table chitietphieunhap
add  foreign key(phieunhap_id) references phieunhap(id);

alter table chitietphieunhap
add foreign key(vattu_id) references vattu(id);


alter table chitietdonhang
add foreign key(donhang_id) references dondathang(id);

alter table chitietdonhang
add foreign key(vattu_id) references vattu(id);

alter table phieunhap
add foreign key(donhang_id) references dondathang(id);

alter table dondathang
add foreign key (nhacungcap_id) references nhacungcap(id);

alter table tonkho
add foreign key (vattu_id) references vattu(id);


insert into vattu( mavattu, tenvattu, donvitinh, giatien)
values
       ('1234D','sat','kg',100100100),
       ('123D','thep','kg',100100100),
       ('12D','nhom','m',100100100),
       ('1D','ximang','bao',100100100),
       ('12345D','xang','lit',100100100);

update vattu
set tenvattu='nhom'
where id=2;

insert into tonkho(vattu_id, soluongdau, tongsoluongnhap, tongsoluongxuat)
values
    (1,100200,200200, 100100),
    (2,100200,200200, 100100),
    (3,100200,200200, 100100),
    (4,100200,200200, 100100),
    (5,100200,200200, 100100),
    (1,100200,200200, 100100),
    (2,100200,200200, 100100),
    (3,100200,200200, 100100),
    (4,100200,200200, 100100),
    (3,100200,200200, 100100),
    (4,100200,200200, 100100);

insert into nhacungcap( manhacungcap, tennhacungcap, diachi, sodienthoai)
values
       ('X1','HoaPhat','Quang nam','102939380'),
       ('X2','Vin','Hai Phong','103339380'),
       ('X3','Massan','Quang ninh','888939380');

insert into dondathang(madonhang, ngaydat, nhacungcap_id)
values
       ('B1','2022-05-01',1),
       ('B2','2022-02-01',2),
       ('B3','2022-03-01',3);

insert into phieunhap (maphieunhap, ngaynhap, donhang_id)
values
       ('nhap1','2022-01-01',1),
       ('nhap2','2022-03-01',3),
       ('nhap3','2022-02-01',2);


insert into phieuxuat(maphieuxuat, ngayxuat, tenkhachhang)
values
    ('xuat1','2022-01-01',1),
    ('xuat2','2022-03-01',3),
    ('xuat3','2022-02-01',2);

insert into chitietphieunhap( phieunhap_id, vattu_id, soluongnhap, dongianhap, ghichu)
values
    (3,1,100,100100,'ton tien'),
    (1,5,100,100200,'ton tien1'),
    (2,3,100,100300,'ton tien2'),
    (3,1,100,100400,'ton tien3'),
    (1,2,100,100500,'ton tien4'),
    (1,4,100,100600,'ton tien5'),
    (2,1,100,100700,'ton tien6');

insert into chitietphieuxuat( phieuxuat_id, vattu_id, soluongxuat, dongiaxuat, ghichu)
values
    (1,3,200,200100,'ton tien'),
    (2,4,300,200200,'ton tien1'),
    (3,5,400,300300,'ton tien2'),
    (1,1,500,100400,'ton tien3'),
    (3,2,200,300500,'ton tien4'),
    (2,1,300,200600,'ton tien5'),
    (1,1,100,100700,'ton tien6');

insert into chitietdonhang( donhang_id, vattu_id, soluongdat)
values
    (1,1,10),
    (2,2,11),
    (3,3,12),
    (1,4,13),
    (2,5,14),
    (1,1,21);


select phieunhap.maphieunhap,v.mavattu, c.soluongnhap,c.dongianhap, c.soluongnhap*c.dongianhap as thanhtien from phieunhap
join chitietphieunhap c on phieunhap.id = c.phieunhap_id
join vattu v on c.vattu_id = v.id;

select * from vattu;


select * from chitietphieunhap;

