CREATE DATABASE ChaoMinBeauty
GO
USE ChaoMinBeauty
GO
CREATE TABLE ChucVus
(
	MaChucVu nvarchar(10) PRIMARY KEY,
	TenChucVu nvarchar(10) NOT NULL,
	Admin bit DEFAULT(0) NOT NULL /*Mac dinh FALSE*/ 
)
GO
CREATE TABLE NhanViens
(
	MaNhanVien nvarchar(10) PRIMARY KEY,
	MaChucVu nvarchar(10) NOT NULL FOREIGN KEY REFERENCES ChucVus(MaChucVu),
	HoNhanVien nvarchar(50) NOT NULL,
	TenNhanVien nvarchar(10) NOT NULL,
	GioiTinh bit DEFAULT(1) NOT NULL,
	NgaySinh date NOT NULL,
	DiaChi nvarchar(50) NOT NULL,
	Luong int NOT NULL,
	AnhNhanVien nvarchar(50),
	SDT nvarchar(10) NOT NULL,
	Email varchar(50) NOT NULL,
	Password nvarchar(50) NOT NULL
)
GO
CREATE TABLE ThanhViens
(
	MaThanhVien nvarchar(10) PRIMARY KEY,
	HoThanhVien nvarchar(50) NOT NULL,
	TenThanhVien nvarchar(10) NOT NULL,
	NgaySinh date ,
	GioiTinh bit DEFAULT(1), /*Mac dinh NAM*/
	Email nvarchar(50) NOT NULL,
	Password nvarchar(50) NOT NULL,
	AnhThanhVien nvarchar(50),
	DiaChi nvarchar (100) NOT NULL
)
GO
CREATE TABLE ThuongHieus
(
	MaThuongHieu nvarchar(10) PRIMARY KEY,
	TenThuongHieu nvarchar(50) NOT NULL,
	MoTa nvarchar (100),
	AnhThuongHieu nvarchar(50),
)
CREATE TABLE DanhMucSanPhams
(
	MaDanhMucSanPham nvarchar(10) PRIMARY KEY,
	TenDanhMucSanPham nvarchar(20) NOT NULL
)
GO
CREATE TABLE SanPhams
(
	MaSanPham nvarchar(10) PRIMARY KEY,
	TenSanPham nvarchar(50) NOT NULL,
	MoTa nvarchar(100),
	Gia float NOT NULL,
	SoLuong int NOT NULL,
	MaThuongHieu nvarchar(10) NOT NULL FOREIGN KEY REFERENCES ThuongHieus(MaThuongHieu),
	MaDanhMucSanPham nvarchar(10) NOT NULL FOREIGN KEY REFERENCES DanhMucSanPhams(MaDanhMucSanPham)
)
GO
CREATE TABLE DonHangs
(
	MaDonHang nvarchar(10) PRIMARY KEY,
	MaThanhVien nvarchar(10) NOT NULL FOREIGN KEY REFERENCES ThanhViens(MaThanhVien),
	NgayDatHang date NOT NULL
	
)
GO
CREATE TABLE ChiTietDonHang
(
	MaChiTietDoHang nvarchar(10) PRIMARY KEY,
	MaDonHang nvarchar(10) NOT NULL FOREIGN KEY REFERENCES DonHangs(MaDonHang),
	MaSanPham nvarchar(10) NOT NULL FOREIGN KEY REFERENCES SanPhams(MaSanPham),
	MaNhanVien nvarchar(10) NOT NULL FOREIGN KEY REFERENCES NhanViens(MaNhanVien),
	Gia float NOT NULL,
	SoLuong int NOT NULL

)