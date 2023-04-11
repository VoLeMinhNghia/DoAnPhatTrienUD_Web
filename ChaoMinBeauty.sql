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
	Hotline nvarchar(10) NOT NULL FOREIGN KEY REFERENCES ChuShops(Hotline),
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
INSERT INTO ChuShops VALUES
	( N'Võ Lê Minh', N'Nghĩa', 'admin.png', '0523053534', 'nghia.vlm.62cntt@ntu.edu.vn', CAST(N'2002-06-17' AS date), 0,'17062002'),
	( N'Nguyễn Ngọc Hoài', N'Sang', 'admin.png', '0376354610', 'sang.nnh.62cntt@ntu.edu.vn', CAST(N'2002-10-13' AS date), 1,'13102002')
INSERT INTO ThuongHieus VALUES
	('TH01','Bioderma', N'Chăm Sóc Da', 'thuonghieu.png'),
	('TH02','Bioré', N'Chăm Sóc Da', 'thuonghieu.png'),
	('TH03', 'Lilybyred', N'Mỹ Phẩm', 'thuonghieu.png')
INSERT INTO DanhMucSanPhams VALUES 
	('MP', N'Mỹ Phẩm'),
	('CSD', N'Chăm Sóc Da')
INSERT INTO SanPhams VALUES
	('SP01', N'Lilybyred 08', N'Son tint bóng', 135000, N'Màu son thời thượng và không kén da, Độ bền màu tốt, có thể giữu được từ 6 đến 8 tiếng', 
	CAST(N'2023-06-15' AS date), 'sanpham.png', 133, 'TH03', 'MP', 0)