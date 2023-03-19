CREATE DATABASE ChaoMinBeauty
GO
USE ChaoMinBeauty
GO
CREATE TABLE ChuShops
(
	Ho nvarchar(50) NOT NULL,
	Ten nvarchar(10) NOT NULL,
	AnhChuShop nvarchar(50),
	Hotline nvarchar(10) PRIMARY KEY,
	Email varchar(50) NOT NULL,
	NgaySinh date NOT NULL,
	GioiTinh bit DEFAULT(1) NOT NULL,
	Password nvarchar(50) NOT NULL,

)
GO
CREATE TABLE ThanhViens
(
	MaThanhVien nvarchar(10) PRIMARY KEY,
	HoThanhVien nvarchar(50) NOT NULL,
	TenThanhVien nvarchar(10) NOT NULL,
	NgaySinh date NOT NULL,
	GioiTinh bit DEFAULT(1) NOT NULL, /*Mac dinh NAM*/
	SDT nvarchar(10) NOT NULL,
	Email nvarchar(50) NOT NULL,
	Password nvarchar(50) NOT NULL,
	AnhThanhVien nvarchar(50) NOT NULL,
	DiaChi nvarchar (100) NOT NULL,

)
GO
CREATE TABLE ThuongHieus
(
	MaThuongHieu nvarchar(10) PRIMARY KEY,
	TenThuongHieu nvarchar(50) NOT NULL,
	MoTa nvarchar (100)NOT NULL,
	AnhThuongHieu nvarchar(50) NOT NULL

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
	MoTa nvarchar(100) NOT NULL,
	Gia float NOT NULL,
	ThongTin NVARCHAR(100) NOT NULL,
	NgayCapNhat date NOT NULL,
	AnhSanPham NVARCHAR(50) NOT NULL,
	SoLuongTon int NOT NULL,
	MaThuongHieu nvarchar(10) NOT NULL FOREIGN KEY REFERENCES ThuongHieus(MaThuongHieu),
	MaDanhMucSanPham nvarchar(10) NOT NULL FOREIGN KEY REFERENCES DanhMucSanPhams(MaDanhMucSanPham),
	DaXoa bit DEFAULT(0) NOT NULL

)
GO
CREATE TABLE DonHangs
(
	MaDonHang nvarchar(10) PRIMARY KEY,
	MaThanhVien nvarchar(10) NOT NULL FOREIGN KEY REFERENCES ThanhViens(MaThanhVien),
	NgayDatHang date NOT NULL,
	TinhTrangGiaohang bit DEFAULT(0) NOT NULL,
	NgayGiao date NOT NULL,
	DaThanhToan bit DEFAULT(0) NOT NULL,
	UuDai int NOT NULL,
	DaHuy bit DEFAULT(0) NOT NULL,
	DaXoa bit DEFAULT(0) NOT NULL

)
GO
CREATE TABLE ChiTietDonHang
(
	MaChiTietDonHang nvarchar(10) PRIMARY KEY,
	MaDonHang nvarchar(10) NOT NULL FOREIGN KEY REFERENCES DonHangs(MaDonHang),
	MaSanPham nvarchar(10) NOT NULL FOREIGN KEY REFERENCES SanPhams(MaSanPham),
	Hotline nvarchar(10) NOT NULL FOREIGN KEY REFERENCES ChuShops(SDT),
	TenSanPham nvarchar(50) NOT NULL,
	Gia float NOT NULL,
	SoLuong int NOT NULL

)
GO
CREATE TABLE PhieuNhaps
(
	MaPhieuNhap nvarchar(10) PRIMARY KEY,
	MaThuongHieu nvarchar(10) NOT NULL FOREIGN KEY REFERENCES ThuongHieus(MaThuongHieu),
	NgayNhap date NOT NULL,
	DaXoa bit DEFAULT(0) NOT NULL

)
GO
CREATE TABLE ChiTietPhieuNhaps
(
	MaChiTietPhieuNhap nvarchar(10) PRIMARY KEY,
	MaPhieuNhap nvarchar(10) NOT NULL FOREIGN KEY REFERENCES PhieuNhaps(MaPhieuNhap),
	MaSanPham nvarchar(10) NOT NULL FOREIGN KEY REFERENCES SanPhams(MaSanPham),
	DonGiaNhap int NOT NULL,
	SoLuongNhap int NOT NULL

)