CREATE DATABASE QuanLyCuaHangSach
GO

USE QuanLyCuaHangSach
GO

CREATE TABLE ChiNhanh(
	MaCN VARCHAR(50) PRIMARY KEY,
	TenCN NVARCHAR(50),
	DiaChi NVARCHAR(50),
	SoDT INT
)

CREATE TABLE NhanVien(
	MaNV VARCHAR(50) PRIMARY KEY,
	TenNV NVARCHAR(50),
	DiaChi NVARCHAR(100),
	TenChiNhanh NVARCHAR(50),
	MaCN VARCHAR(50)
)

CREATE TABLE Sach(
	MaSach VARCHAR(50) PRIMARY KEY,
	TenSach NVARCHAR(50),
	MaTheLoai VARCHAR(50),
	MaTacGia VARCHAR(50),
	MaNXB VARCHAR(50),
	NamXuatBan DATE
)

CREATE TABLE TacGia(
	MaTG VARCHAR(50) PRIMARY KEY,
	TenTG NVARCHAR(100),
	GhiChu NVARCHAR(100)
)

CREATE TABLE TheLoai(
	MaTheLoai VARCHAR(50) PRIMARY KEY,
	TenTheLoai NVARCHAR(100)
)

CREATE TABLE NhaXuatBan(
	MaNXB VARCHAR(50) PRIMARY KEY,
	TenNXB NVARCHAR(100),
	DiaChi NVARCHAR(100)
)

CREATE TABLE KhachHang(
	MaKH VARCHAR(50) PRIMARY KEY,
	TenKH NVARCHAR(100),
	DiaChi NVARCHAR(100),
	MaCN VARCHAR(50)
)

CREATE TABLE HoaDon(
	MaHD VARCHAR(50) PRIMARY KEY,
	MaKH VARCHAR(50),
	MaNV VARCHAR(50),
	NgayLapHoaDon DATE
)

CREATE TABLE CT_HoaDon(
	MaHD VARCHAR(50),
	MaSach VARCHAR(50)
	PRIMARY KEY(MaHD,MaSach)
)


ALTER TABLE dbo.Sach ADD CONSTRAINT fk_sach FOREIGN KEY (MaTacGia) REFERENCES dbo.TacGia (MaTG)
ALTER TABLE dbo.Sach ADD CONSTRAINT fk_sack2 FOREIGN KEY (MaTheLoai) REFERENCES dbo.TheLoai(MaTheLoai)
ALTER TABLE dbo.Sach ADD CONSTRAINT fk_sach3 FOREIGN KEY (MaNXB) REFERENCES dbo.NhaXuatBan (MaNXB)
ALTER TABLE dbo.NhanVien ADD CONSTRAINT fk_nv FOREIGN KEY (MaCN) REFERENCES dbo.ChiNhanh(MaCN)
ALTER TABLE dbo.KhachHang ADD CONSTRAINT fk_KH FOREIGN KEY (MaCN) REFERENCES dbo.ChiNhanh(MaCN)
ALTER TABLE dbo.HoaDon ADD CONSTRAINT fk_HD1 FOREIGN KEY (MaKH) REFERENCES dbo.KhachHang(MaKH)
ALTER TABLE dbo.HoaDon ADD CONSTRAINT fk_HD2 FOREIGN KEY (MaNV) REFERENCES dbo.NhanVien(MaNV)
ALTER TABLE dbo.CT_HoaDon ADD CONSTRAINT fk_CTHD1 FOREIGN KEY (MaHD) REFERENCES dbo.HoaDon(MaHD)
ALTER TABLE dbo.CT_HoaDon ADD CONSTRAINT fk_CTHD2 FOREIGN KEY (MaSach) REFERENCES dbo.Sach(MaSach)

INSERT [dbo].[ChiNhanh] ([MaCN], [TenCN], [DiaChi], [SoDT]) VALUES (N'CN1', N'Chi Nh??nh 1', N'???? N???ng', 545644)
INSERT [dbo].[ChiNhanh] ([MaCN], [TenCN], [DiaChi], [SoDT]) VALUES (N'CN2', N'Chi Nh??nh 2 ', N'H??? Ch?? Minh', 321231)

INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [MaCN]) VALUES (N'KH1', N'Nguy???n V??n A', N'H?? N???i', N'CN1')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [MaCN]) VALUES (N'KH2', N'Nguy???n V??n B', N'???? N???ng', N'CN2')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [MaCN]) VALUES (N'KH3', N'Nguy???n V??n C', N'S??i G??n', N'CN2')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [MaCN]) VALUES (N'KH4', N'Nguy???n V??n D', N'H?? N???i', N'CN1')

INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [DiaChi], [TenChiNhanh], [MaCN]) VALUES (N'NV1', N'H?? Th??? Nga', N'Hu???', N'???? N???ng', N'CN1')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [DiaChi], [TenChiNhanh], [MaCN]) VALUES (N'NV2', N'Hu???nh V??n Ph??', N'???? N???ng', N'H??? Ch?? Minh', N'CN2')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [DiaChi], [TenChiNhanh], [MaCN]) VALUES (N'NV3', N'Ng?? L?? Th???y Tien', N'???? N???ng', N'???? N???ng', N'CN1')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [DiaChi], [TenChiNhanh], [MaCN]) VALUES (N'NV4', N'T?????ng L??', N'S??i G??n', N'H??? Ch?? Minh', N'CN2')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [DiaChi], [TenChiNhanh], [MaCN]) VALUES (N'NV5 ', N'Ph???m Th??? Uy??n', N'Hu???', N'???? N???ng', N'CN1')

INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChi]) VALUES (N'NXB1', N'Kim ?????ng', N'H?? N???i')
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChi]) VALUES (N'NXB2', N'Thanh Ni??n', N'???? N???ng')

INSERT [dbo].[TacGia] ([MaTG], [TenTG], [GhiChu]) VALUES (N'TG1', N'GoSho Aoyama', N'Trinh Th??m')
INSERT [dbo].[TacGia] ([MaTG], [TenTG], [GhiChu]) VALUES (N'TG2', N'Nguy???n Linh', N'Th???n ?????ng VN')
INSERT [dbo].[TacGia] ([MaTG], [TenTG], [GhiChu]) VALUES (N'TG3', N'Fumiko', N'Doremon')

INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (N'TL1', N'Trinh Th??m')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (N'TL2', N'Thi???u Nhi')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (N'TL3', N'Truy???n D??n Gian')

INSERT [dbo].[Sach] ([MaSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXuatBan]) VALUES (N'MS1', N'Th??m T??? Conan', N'TL1', N'TG1', N'NXB1', CAST(N'2021-12-31' AS Date))
INSERT [dbo].[Sach] ([MaSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXuatBan]) VALUES (N'MS2', N'Doremon', N'TL2', N'TG2', N'NXB2', CAST(N'2021-12-20' AS Date))
INSERT [dbo].[Sach] ([MaSach], [TenSach], [MaTheLoai], [MaTacGia], [MaNXB], [NamXuatBan]) VALUES (N'MS3', N'Th???n ?????ng ?????t Vi???t', N'TL3', N'TG3', N'NXB2', CAST(N'2021-12-21' AS Date))

INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [MaNV], [NgayLapHoaDon]) VALUES (N'HD1', N'KH1', N'NV1', CAST(N'2021-12-31' AS Date))
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [MaNV], [NgayLapHoaDon]) VALUES (N'HD2', N'KH2', N'NV2', CAST(N'2021-12-31' AS Date))
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [MaNV], [NgayLapHoaDon]) VALUES (N'HD3', N'KH1', N'NV3', CAST(N'2021-12-31' AS Date))
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [MaNV], [NgayLapHoaDon]) VALUES (N'HD4', N'KH3', N'NV4', CAST(N'2021-12-31' AS Date))
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [MaNV], [NgayLapHoaDon]) VALUES (N'HD5', N'KH4', N'NV5', CAST(N'2021-12-31' AS Date))

INSERT [dbo].[CT_HoaDon] ([MaHD], [MaSach]) VALUES (N'HD1', N'MS1')
INSERT [dbo].[CT_HoaDon] ([MaHD], [MaSach]) VALUES (N'HD1', N'MS3')
INSERT [dbo].[CT_HoaDon] ([MaHD], [MaSach]) VALUES (N'HD2', N'MS2')
INSERT [dbo].[CT_HoaDon] ([MaHD], [MaSach]) VALUES (N'HD3', N'MS3')
INSERT [dbo].[CT_HoaDon] ([MaHD], [MaSach]) VALUES (N'HD4', N'MS1')
INSERT [dbo].[CT_HoaDon] ([MaHD], [MaSach]) VALUES (N'HD4', N'MS3')
INSERT [dbo].[CT_HoaDon] ([MaHD], [MaSach]) VALUES (N'HD5', N'MS2')
INSERT [dbo].[CT_HoaDon] ([MaHD], [MaSach]) VALUES (N'HD5', N'MS3')
