create database btvn20072023;
use btvn2072023;

create table KhachHang(
MaKH nvarchar(4) primary key not null,
TenKH nvarchar(30) not null,
Diachi nvarchar(50),
NgaySinh datetime,
SoDT nvarchar(15) unique
);

create table NhanVien(
MaNv nvarchar(4) primary key not null,
HoTen varchar(100) not null,
GioiTinh bit not null,
DiaChi varchar(255) not null,
NgaySinh varchar(50) not null,
DienThoai varchar(11),
Email varchar(50),
NoiSinh varchar(100) not null,
NgayVaoLam datetime,
MaNQL nvarchar(4)
); 

create table NhaCungCap(
MaNCC nvarchar(5) primary key not null,
TenNCC varchar(100) not null,
DiaChi varchar(255) not null,
DienThoai varchar(11) not null,
Email varchar(100) not null,
Website varchar(100)
);

create table LoaiSp(
MaLoaiSp nvarchar(4) primary key not null  not null,
TenloaiSp nvarchar(30) not null,
Ghichu nvarchar(100) not null
);

create table SanPham(
MaSp nvarchar(4) primary key not null ,
MaloaiSp nvarchar(4) not null,
TenSp nvarchar(50) not null,
Donvitinh nvarchar(10) not null,
Ghichu nvarchar(100),
foreign key (MaloaiSP) references LoaiSp(MaLoaiSp)
);


create table PhieuNhap(
SoPN nvarchar(5) primary key not null, 
MaNv nvarchar(4) not null,
MaNCC nvarchar(5) not null,
NgayNhap datetime default(now()) not null,
GhiChu varchar(100),
foreign key(MaNv) references NhanVien(MaNv),
foreign key(MaNCC) references NhaCungCap(MaNCC)
);

create table CTPHIEUNHAP(
MaSP nvarchar(4) not null,
SoPN nvarchar(5) not null,
primary key (MaSP, SoPN),
Soluong smallint default 0 not null,
Gianhap real not null default 0,
foreign key (MaSP) references SanPham(MaSp),
foreign key (SoPN) references PhieuNhap(SoPN)
);


create table PHIEUXUAT (
SoPX nvarchar(5) primary key not null,
MaNv nvarchar(4) not null,
MaKH nvarchar(4) not null,
NgayBan datetime not null,
NgayHienTai datetime default(now()) not null,
check(NgayBan >= NgayHienTai),
GhiChu text,
foreign key (MaNv) references NhanVien(MaNv),
foreign key (MaKH) references KhachHang(MaKH)
);

create table CTPHIEUXUAT(
SoPX nvarchar(5) not null,
MaSP nvarchar(4) not null,
primary key (SoPX, MaSP),
SoLuong smallint not null,
GiaBan real not null,
foreign key (SoPX) references PHIEUXUAT(SoPX),
foreign key(MaSP) references SanPham(MaSp)
);



INSERT INTO NhanVien (MaNv, HoTen, GioiTinh, DiaChi, NgaySinh, DienThoai, Email, NoiSinh, NgayVaoLam, MaNQL)
VALUES
  ('NV01', 'Nguyen Van A', 1, '123 Nguyen Hue, TP.HCM', '1990-01-15', '0901234567', 'nv.a@example.com', 'TP.HCM', '2020-01-01 08:00:00', null),
  ('NV02', 'Tran Thi B', 0, '456 Le Loi, TP.HCM', '1995-05-20', '0912345678', 'tt.b@example.com', 'TP.HCM', '2021-03-15 09:30:00', 'NV02'),
  ('NV03', 'Pham Van C', 1, '789 Vo Van Tan, TP.HCM', '1988-11-02', '0987654321', 'pv.c@example.com', 'TP.HCM', '2019-10-10 07:45:00', 'NV02');
INSERT INTO KhachHang (MaKH, TenKH, Diachi, NgaySinh, SoDT)
VALUES
  ('KH01', 'Nguyen Thi D', '101 Nguyen Trai, TP.HCM', '1985-12-25', '0978123456'),
  ('KH02', 'Tran Van E', '202 Le Lai, TP.HCM', '1992-08-10', '0987123456'),
  ('KH03', 'Le Thi F', '303 Vo Van Tan, TP.HCM', '1989-06-18', '0918123456');
INSERT INTO NhaCungCap (MaNCC, TenNCC, DiaChi, DienThoai, Email, Website)
VALUES
  ('NCC01', 'Cong ty A', '15 Le Duan, TP.HCM', '0909123456', 'info@ncc-a.com', 'www.ncc-a.com'),
  ('NCC02', 'Cong ty B', '25 Nguyen Thi Minh Khai, TP.HCM', '0918234567', 'info@ncc-b.com', 'www.ncc-b.com'),
  ('NCC03', 'Cong ty C', '35 Tran Hung Dao, TP.HCM', '0987654321', 'info@ncc-c.com', 'www.ncc-c.com');
INSERT INTO LoaiSp (MaLoaiSp, TenloaiSp, Ghichu)
VALUES
  ('LSP1', 'Điện thoại di động', 'Các sản phẩm điện thoại di động'),
  ('LSP2', 'Laptop', 'Các sản phẩm laptop'),
  ('LSP3', 'Phụ kiện điện tử', 'Các phụ kiện điện tử');
INSERT INTO SanPham (MaSp, MaloaiSp, TenSp, Donvitinh, Ghichu)
VALUES
  ('SP01', 'LSP1', 'iPhone 12', 'cái', 'Màu đen, bộ nhớ 128GB'),
  ('SP02', 'LSP1', 'Samsung Galaxy S21', 'cái', 'Màu xanh, bộ nhớ 256GB'),
  ('SP03', 'LSP2', 'Dell XPS 13', 'cái', 'Core i7, RAM 16GB');
INSERT INTO PhieuNhap (SoPN, MaNv, MaNCC, NgayNhap, GhiChu)
VALUES
  ('PN01', 'NV01', 'NCC01', '2023-07-10 10:30:00', 'Phiếu nhập số 1'),
  ('PN02', 'NV02', 'NCC02', '2023-07-15 15:45:00', 'Phiếu nhập số 2'),
  ('PN03', 'NV03', 'NCC03', '2023-07-20 09:00:00', 'Phiếu nhập số 3');
INSERT INTO CTPHIEUNHAP (MaSP, SoPN, Soluong, Gianhap)
VALUES
  ('SP01', 'PN01', 50, 15000000),
  ('SP02', 'PN01', 30, 13000000),
  ('SP03', 'PN02', 20, 18000000),
  ('SP01', 'PN03', 40, 14500000);
INSERT INTO PHIEUXUAT (SoPX, MaNv, MaKH, NgayBan, GhiChu)
VALUES
  ('PX01', 'NV01', 'KH01', '2023-08-12 14:30:00', 'Phiếu xuất số 1'),
  ('PX02', 'NV02', 'KH02', '2023-08-18 10:15:00', 'Phiếu xuất số 2'),
  ('PX03', 'NV03', 'KH03', '2023-08-20 16:00:00', 'Phiếu xuất số 3');
INSERT INTO ctphieuxuat (SoPX, MaSP, SoLuong, GiaBan)
VALUES
  ('PX01', 'SP01', 10, 20000000),
  ('PX01', 'SP02', 20, 18000000),
  ('PX02', 'SP03', 5, 22000000),
  ('PX03', 'SP01', 15, 19500000);


-- Cập nhật lại số điện thoại mới cho khách hàng mã KH10.
-- (Tùy chọn các thông tin liên quan)

update KhachHang set SoDT = '0986943933' where MaKH = 'KH01' ;

-- Cập nhật lại địa chỉ mới của nhân viên mã NV05
update KhachHang set Diachi = 'Hai Duong' where MaKH = 'KH01' ;

-- Xóa nhân viên mới vừa thêm tại yêu cầu C.3
-- delete from NhanVien where MaNv = 'NV03';


-- 1. Dùng lệnh SELECT lấy dữ liệu từ các bảng
-- Liệt kê thông tin về nhân viên trong cửa hàng, gồm: 
-- mã nhân viên, họ tên nhân viên, giới tính, ngày sinh, địa chỉ, số điện thoại, tuổi.
-- Kết quả sắp xếp theo tuổi.


select NhanVien.MaNv, NhanVien.HoTen, NhanVien.GioiTinh, NhanVien.NgaySinh, NhanVien.DiaChi, NhanVien.DienThoai, NhanVien.NgaySinh  from NhanVien  order by NhanVien.NgaySinh;


-- 2. Liệt kê các hóa đơn nhập hàng trong tháng 7/2023, 
-- gồm thông tin số phiếu nhập, mã nhân viên nhập hàng, họ tên nhân viên, họ tên nhà cung cấp, ngày nhập hàng, ghi chú.

select PhieuNhap.SoPN, PhieuNhap.MaNv, NhanVien.HoTen, NhaCungCap.TenNCC, PhieuNhap.NgayNhap, PhieuNhap.GhiChu 
from PhieuNhap join NhanVien on NhanVien.MaNv = PhieuNhap.MaNv 
join NhaCungCap on NhaCungCap.MaNCC = PhieuNhap.MaNCC
 where Day(PhieuNhap.NgayNhap)=10;
 
 
 -- 3. Liệt kê tất cả sản phẩm có đơn vị tính là chai, gồm tất cả thông tin về sản phẩm.
 select * from SanPham where SanPham.Donvitinh = 'Chai';  
 select *  from SanPham where SanPham.Donvitinh = 'cái';  
 
 -- 4. Liệt kê chi tiết nhập hàng trong tháng hiện hành gồm thông tin: 
 -- số phiếu nhập, mã sản phẩm, tên sản phẩm, loại sản phẩm, đơn vị tính, số lượng, giá nhập, thành tiền.

select  PhieuNhap.SoPN, SanPham.MaSp, SanPham.TenSp, LoaiSp.TenloaiSp, SanPham.Donvitinh, CTPHIEUNHAP.Soluong, CTPHIEUNHAP.Gianhap, CTPHIEUNHAP.Soluong *CTPHIEUNHAP.Gianhap
 from PhieuNhap 
 join CTPHIEUNHAP on CTPHIEUNHAP.SoPN = PhieuNhap.SoPN 
join SanPham on SanPham.MaSp = CTPHIEUNHAP.MaSP
join LoaiSp on SanPham.MaloaiSp = LoaiSp.MaLoaiSp
 where month(PhieuNhap.NgayNhap)= 07;

-- 5. Liệt kê các nhà cung cấp có giao dịch mua bán trong tháng hiện hành, gồm thông tin:
-- mã nhà cung cấp, họ tên nhà cung cấp, địa chỉ, số điện thoại,
-- email, số phiếu nhập, ngày nhập. Sắp xếp thứ tự theo ngày nhập hàng.

select NhaCungCap.MaNCC, NhaCungCap.TenNCC, NhaCungCap.DiaChi, NhaCungCap.DienThoai, NhaCungCap.Email, PhieuNhap.SoPN, PhieuNhap.NgayNhap
from NhaCungCap join PhieuNhap on PhieuNhap.MaNCC = NhaCungCap.MaNCC
where month(PhieuNhap.NgayNhap) = 07 order by PhieuNhap.NgayNhap desc;

-- 6. Liệt kê chi tiết hóa đơn bán hàng trong 6 tháng đầu năm 2018 gồm thông tin:
-- số phiếu xuất, nhân viên bán hàng, ngày bán, mã sản phẩm, tên sản phẩm, đơn vị tính, số lượng, giá bán, doanh thu.
select PHIEUXUAT.SoPX, NhanVien.HoTen, PHIEUXUAT.NgayBan, SanPham.MaSp, SanPham.TenSp, SanPham.Donvitinh,
CTPHIEUXUAT.SoLuong, CTPHIEUXUAT.GiaBan, CTPHIEUXUAT.SoLuong*CTPHIEUXUAT.GiaBan `Doanh thu` 
from NhanVien 
join PHIEUXUAT on PHIEUXUAT.MaNv = NhanVien.MaNv  
join CTPHIEUXUAT on CTPHIEUXUAT.SoPX = PHIEUXUAT.SoPX 
join SanPham on CTPHIEUXUAT.MaSP = SanPham.MaSp
where month(PHIEUXUAT.NgayBan) = 08;



-- 7. Hãy in danh sách khách hàng có ngày sinh nhật trong tháng hiện hành
-- (gồm tất cả thông tin của khách hàng)

select KhachHang.TenKH from KhachHang where month (KhachHang.NgaySinh) = 12;

-- 8. Liệt kê các hóa đơn bán hàng từ ngày 15/04/2018 đến 15/05/2018 gồm các thông tin:
-- số phiếu xuất, nhân viên bán hàng, ngày bán, mã sản phẩm, tên sản phẩm, đơn vị tính, số lượng, giá bán, doanh thu.
select PHIEUXUAT.SoPX, NhanVien.HoTen, PHIEUXUAT.NgayBan, SanPham.MaSp, SanPham.TenSp, SanPham.Donvitinh,
CTPHIEUXUAT.SoLuong, CTPHIEUXUAT.GiaBan, CTPHIEUXUAT.SoLuong*CTPHIEUXUAT.GiaBan `Doanh thu` 
from NhanVien 
join PHIEUXUAT on PHIEUXUAT.MaNv = NhanVien.MaNv  
join CTPHIEUXUAT on CTPHIEUXUAT.SoPX = PHIEUXUAT.SoPX 
join SanPham on CTPHIEUXUAT.MaSP = SanPham.MaSp
where  PHIEUXUAT.NgayBan between '2023-08-11' and '2023-08-20';


-- 9.  Liệt kê các hóa đơn mua hàng theo từng khách hàng, gồm các thông tin: 
-- số phiếu xuất, ngày bán, mã khách hàng, tên khách hàng, trị giá.

select PHIEUXUAT.SoPX, PHIEUXUAT.NgayBan, PHIEUXUAT.MaKH, KhachHang.TenKH, CTPHIEUXUAT.SoLuong*CTPHIEUXUAT.GiaBan `tri gia`
 from PHIEUXUAT 
 join KhachHang on PHIEUXUAT.MaKH = KhachHang.MaKH 
 join CTPHIEUXUAT on CTPHIEUXUAT.SoPX = PHIEUXUAT.SoPX;
 
 -- 10.Cho biết tổng số chai nước xả vải Comfort đã bán trong 6 tháng đầu năm 2018. 
 -- Thông tin hiển thị: tổng số lượng.

SELECT SoPX, SUM(SoLuong) AS TongSoLuong
FROM CTPHIEUXUAT
GROUP BY SoPX;
-- 11. select SoPX, CTPHIEUXUAT.SoLuong
-- from CTPHIEUXUAT 
-- where PHIEUXUAT.NgayBan between '2023-08-11' and '2023-08-20';

-- .Tổng kết doanh thu theo từng khách hàng theo tháng, gồm các thông tin:
-- tháng, mã khách hàng, tên khách hàng, địa chỉ, tổng tiền.

select month(PHIEUXUAT.NgayBan)`Thang`, KhachHang.MaKH, KhachHang.TenKH, KhachHang.Diachi, (CTPHIEUXUAT.SoLuong*CTPHIEUXUAT.GiaBan) `Tong tien` 
from KhachHang
join PHIEUXUAT on KhachHang.MaKH = PHIEUXUAT.MaKH
join CTPHIEUXUAT on CTPHIEUXUAT.SoPX = PHIEUXUAT.SoPX
where  PHIEUXUAT.NgayBan between '2023-08-1' and '2023-09-1';

-- 12. Thống kê tổng số lượng sản phẩm đã bán theo từng tháng trong năm, gồm thông tin:
--  năm, tháng, mã sản phẩm, tên sản phẩm, đơn vị tính, tổng số lượng.
select year(PHIEUXUAT.NgayBan)`Nam`, KhachHang.MaKH, KhachHang.TenKH, KhachHang.Diachi, (CTPHIEUXUAT.SoLuong*CTPHIEUXUAT.GiaBan) `Tong tien` 
from KhachHang
join PHIEUXUAT on KhachHang.MaKH = PHIEUXUAT.MaKH
join CTPHIEUXUAT on CTPHIEUXUAT.SoPX = PHIEUXUAT.SoPX
where  PHIEUXUAT.NgayBan between '2023-01-1' and '2024-01-1';


-- 13. Thống kê doanh thu bán hàng trong trong 6 tháng đầu năm 2018, 
-- thông tin hiển thị gồm: tháng, doanh thu.
select PHIEUXUAT.NgayBan, CTPHIEUXUAT.SoLuong*CTPHIEUXUAT.GiaBan `Doanh Thu` from CTPHIEUXUAT
join PHIEUXUAT on PHIEUXUAT.SoPX = CTPHIEUXUAT.SoPX
where PHIEUXUAT.NgayBan between '2023-07-31' and '2023-08-31';

-- 14. .Liệt kê các hóa đơn bán hàng của tháng 5 và tháng 6 năm 2018, 
-- gồm các thông tin: số phiếu, ngày bán, họ tên nhân viên bán hàng, họ tên khách hàng, tổng trị giá.

select PHIEUXUAT.SoPX, PHIEUXUAT.NgayBan, NhanVien.HoTen, KhachHang.TenKH, CTPHIEUXUAT.SoLuong*CTPHIEUXUAT.GiaBan `Doanh Thu` 
from CTPHIEUXUAT
join PHIEUXUAT on PHIEUXUAT.SoPX = CTPHIEUXUAT.SoPX
join KhachHang on KhachHang.MaKH = PHIEUXUAT.MaKH
join NhanVien on NhanVien.MaNv = PHIEUXUAT.MaNv
where PHIEUXUAT.NgayBan between '2023-07-31' and '2023-08-31';