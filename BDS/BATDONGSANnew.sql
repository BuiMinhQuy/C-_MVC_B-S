--DROP DATABASE BATDONGSAN 
--GO
CREATE DATABASE BATDONGSAN
GO
USE BATDONGSAN
GO
CREATE TABLE PhanQuyen
(
MaPQ int check(MaPQ in(1,2)) primary key not null,
TenPQ nvarchar(10)
)
GO
CREATE TABLE QuanTri
(
UserName varchar(50) primary key not null,
Pw varchar(50) not null,
MaPQ int foreign key references PhanQuyen(MaPQ) 
)
GO
CREATE TABLE NhanVien
(
MaNV int identity primary key not null,
HoTenNV nvarchar(50) not null,
ChucVu nvarchar(50) not null,
DienThoai char(12),
GioiTinh  nvarchar(6) check (GioiTinh in('Male','Female','Unk')) not null,
DiaChi nvarchar(50),
Email nvarchar(50),
UserName varchar(50) foreign key references QuanTri(UserName)  not null,
Facebook varchar(255),
Googleplus varchar(255),
Twitter varchar(255),
Instagram varchar(255)
)
GO
CREATE TABLE KhachHang
(
MaKH int identity primary key not null,
HoTenKH nvarchar(50) not null,
DienThoai char(12),
DiaChi nvarchar(50),
Email nvarchar(50),
)

GO
CREATE TABLE ThanhVien
(
MaTV int identity primary key not null,
UserName varchar(50),
Pw varchar(50),
HoTenTV nvarchar(50) not null,
DienThoai char(12),
GioiTinh  nvarchar(6) check (GioiTinh in('Male','Female','Unk')) not null,
DiaChi nvarchar(50),
Email nvarchar(50),
NgayDK date default getdate()
)
GO
CREATE TABLE LoaiBatDongSan
(
MaLoaiBDS int identity primary key not null,
TenLoaiBDS nvarchar(50) not null,
)
GO
CREATE TABLE NhomLoai
(
MaNhom int identity primary key not null,
TenNhom nvarchar(50) not null,
)
GO
CREATE TABLE BatDongSan
(
MaBDS int identity primary key not null,
TenBDS nvarchar(1000) not null,
MaNhom int foreign key references NhomLoai(MaNhom) ,
MaLoaiBDS int foreign key references LoaiBatDongSan(MaLoaiBDS) ,
UserName varchar(50) foreign key references QuanTri(UserName) not null,
NgayDang date default getdate(),
Duyet int check (Duyet in (1,0)) default 0
)
GO
CREATE TABLE ChiTietBatDongSan
(
STT int identity primary key not null,
MaBDS int foreign key references BatDongSan(MaBDS) on delete cascade ,
Gia decimal(18,2),
DienTich nvarchar(50),
DiaChiBDS nvarchar(50),
Mota nvarchar(1000),
KhuVuc nvarchar(50),
Anh varchar(255),
PhongTam int,
PhongNgu int,
Paking varchar(10)  check (Paking in('Yes','No'))
)
GO
CREATE TABLE QuanLyDatThue
(
MaDat int identity primary key not null,
MaKH int foreign key references ThanhVien(MaTV) ,
MaBDS int foreign key references BatDongSan(MaBDS) ,
NgayDat date default getdate(),
GhiChu nvarchar(50),
ThanhToan int check (ThanhToan in(1,0)) default 0 not null, /* yes/no 1/0 */
)
GO
CREATE TABLE QuanLyDatThueKhachHang
(
MaDat int identity primary key not null,
MaKH int foreign key references KhachHang(MaKH) ,
MaBDS int foreign key references BatDongSan(MaBDS) ,
NgayDat date default getdate(),
GhiChu nvarchar(50),
ThanhToan int check (ThanhToan in(1,0)) default 0 not null, /* yes/no 1/0 */
)
GO
CREATE TABLE HoaDon
(
MaHD int identity primary key not null,
MaKH int foreign key references ThanhVien(MaTV) ,
MaNV int foreign key references NhanVien(MaNV) ,
MaBDS int foreign key references BatDongSan(MaBDS) ,
TongTien decimal(18,2),
NgayThanhToan date default getdate()
)
GO
CREATE TABLE HoaDonKhachHang
(
MaHD int identity primary key not null,
MaKH int foreign key references KhachHang(MaKH) ,
MaNV int foreign key references NhanVien(MaNV) ,
MaBDS int foreign key references BatDongSan(MaBDS),
TongTien decimal(18,2),
NgayThanhToan date default getdate()
)
GO
CREATE TABLE BinhLuan
(
MaBL int identity primary key not null,
TenBL nvarchar(50),
NoiDungBL nvarchar(1000),
MaBDS int foreign key references BatDongSan(MaBDS) ,
NgayBL date default getdate(),
Duyet int check(Duyet in (1,0)) default 0
)
GO
CREATE TABLE LienHe
(
MaLienHe int identity primary key not null,
HoTen nvarchar(100),
Email varchar(100),
TieuDe nvarchar(255),
LoiNhan nvarchar(1000)
)
GO

INSERT INTO PhanQuyen
VALUES
(1,'Admin'),
(2,'Member')

GO
INSERT INTO QuanTri
VALUES
('congduy','123',1),
('minhquy','123',2),
('viettue','123',2),
('khactrung','123',2)

GO

INSERT INTO NhanVien
VALUES
(N'Phan Công Duy','CEO','01227957819','Male',N'55/7 lê văn việt','congduy21@gmail.com','congduy','','','',''),
(N'Đỗ Viết Tuế','Manager','089215725','Male',N'51 lê văn việt','viettue37@gmail.com','viettue','','','','')

INSERT INTO KhachHang
VALUES
(N'Trần Quang Phú','01227893217',N'45 lê văn việt','tranquangphu1997@gmail.com'),
(N'Trần Tiên','0977158458',N'Trường trinh','trantien21@gmail.com'),
(N'Trần Đình Khanh','0913456411',N'47 Hàm Nghi','khanhtrandinh@gmail.com'),
(N'Nguyễn Như Quỳnh','0977156485',N'56 Nguyễn Văn Linh','nhuquynh@gmail.com')


GO
INSERT INTO ThanhVien
VALUES
('minhquy','123',N'Bùi Minh Quý','0932428759',N'Male',N'52 Nguyễn Văn Linh','minhquy@gmail.com','04-28-2018'),
('viettue','123',N'Võ Trần Hữu Đạt','01235284967',N'Male',N'35 Nguyễn Xuân Nguyên - TP BMT','viettue@gmail.com','04-28-2018'),
('khactrung','123',N'Trần Hải Anh','0895412574',N'Male',N'32 Trần Phú - Nha Trang','khactrung@gmail.com','04-28-2018')


GO


INSERT INTO LoaiBatDongSan
VALUES
(N'Căn hộ'),
(N'Đất'),
(N'Khu nghĩ dưỡng/khách sạn'),
(N'Mặt bằng kinh doanh'),
(N'Mặt bằng văn phòng'),
(N'Nhà'),
(N'Biệt thự')

INSERT INTO NhomLoai
VALUES
(N'Bán'),
(N'Cho Thuê'),
(N'Mua')

GO
INSERT INTO BatDongSan
VALUES
(N'INDOCHINA Đà Nẵng',1,2,'minhquy','06/06/2018',1),
(N'AZURA ĐÀ NẴNG',1,2,'viettue','06/06/2018',1),
(N'Căn hộ Mỹ An',1,2,'khactrung','06/06/2018',1)
select * from BatDongSan
GO
INSERT INTO ChiTietBatDongSan
VALUES
(1,450,'110m2',N'74 Bạch Đằng',N'Nằm trong tòa nhà Indochina River Towers, gần sông Hàn. Dễ dàng đi đến các cửa hàng, nhà hàng và chợ gần đó.
Đầy đủ nội thất. Wi-Fi và truyền hình cáp đã được trang bị.',N'Q.Hải Châu','',2,2,'Yes'),
(2,990,'188m2',N'',N'Từ khu vực Trung tâm thành phố Đà Nẵng, Azura nằm ngay cạnh sông Hàn và chỉ cách 5 phút lái xe đến sân bay quốc tế của thành phố. Azura kiêu hãnh nằm ngay tại trung tâm thành phố.',
N'Q.Sơn Trà','',3,3,'Yes'),
(3,370,'55m2',N'',N'Nằm ở khu vực Mỹ An – rất gần bãi biển, rất thuận tiện để đi đến siêu thị mini, nhà hàng, cửa hàng, vv',
N'Q.Ngũ Hành Sơn','',3,3,'Yes')


GO
select * from BatDongSan
INSERT INTO QuanLyDatThue
VALUES
(1,1,'6/5/2018',N'Đặt thuê',0), /* mm/dd/yyyy */
(2,2,'6/5/2018',N'Đặt thuê',0)

GO
select * from HoaDon
INSERT INTO HoaDon
VALUES
(1,1,1,450,'06/06/2018')
GO
INSERT INTO BinhLuan
VALUES
(N'Bình luận BDS',N'Đẹp, rộng, có thể nhìn ra biển',1,'06-02-2018',0)

Go
DBCC Checkident('KhachHang',Reseed,0)
DBCC Checkident ('QuanLyDatThue',Reseed,0)
DBCC Checkident('QuanLyDatThueKhachHang',Reseed,0)
go
DBCC Checkident('HoaDon',Reseed,0)
go
DBCC Checkident('HoaDonKhachHang',Reseed,0)
go
DBCC Checkident('LienHe',Reseed,0)

SELECT MAX(MaBDS) FROM ChiTietBatDongSan;

delete from BatDongSan
where TenBDS = 'INDOCHINA Đà Nẵng';