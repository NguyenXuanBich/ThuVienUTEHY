
CREATE DATABASE [ELib] 

USE [ELib]

/****** Object:  UserDefinedTableType [dbo].[TableType]    Script Date: 5/7/2016 10:07:38 PM ******/
CREATE TYPE [dbo].[TableType] AS TABLE(
	[LocationName] [nvarchar](100) NULL
)
GO
/****** Object:  UserDefinedFunction [dbo].[SinhMa]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[SinhMa]( @TableName TableType READONLY)
RETURNS VARCHAR(50)
AS
BEGIN
    DECLARE @name int

  SET @name = (select top 1 STT from 
(Select ROW_NUMBER() over(order by LocationName) as STT,* from @TableName  )
 as emp 
 where STT<LocationName)
 if(@name is null)
Set @name=(select Max(LocationName)from @TableName)+1
if not exists(Select * from @TableName)
set @name=1
    RETURN @name
END

GO
/****** Object:  Table [dbo].[tblCanBo]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCanBo](
	[MaCanBo] [nvarchar](30) NOT NULL,
	[HoVaTen] [nvarchar](30) NOT NULL,
	[QueQuan] [nvarchar](150) NULL,
	[NgaySinh] [date] NULL,
	[urlPhoto] [nvarchar](300) NULL,
	[MaDonVi] [nvarchar](30) NULL,
	[GioiTinh] [bit] NULL,
	[SoDienThoai] [nvarchar](30) NULL,
	[DiaChiEMail] [nvarchar](30) NULL,
	[GhiChu] [nvarchar](100) NULL,
	[MatKhau] [nvarchar](30) NULL,
	[TrangThai] [bit] NULL,
 CONSTRAINT [PK_tblDocGia] PRIMARY KEY CLUSTERED 
(
	[MaCanBo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblChiTietMuonTra]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblChiTietMuonTra](
	[MaQuaTrinhTraSach] [int] NOT NULL,
	[MaSach] [nvarchar](30) NOT NULL,
	[TinhTrang] [nvarchar](30) NULL,
	[MaSoCaBiet] [nvarchar](30) NOT NULL,
	[MuonHayTra] [bit] NOT NULL,
 CONSTRAINT [PK_tblChiTietTraSach] PRIMARY KEY CLUSTERED 
(
	[MaQuaTrinhTraSach] ASC,
	[MaSach] ASC,
	[MaSoCaBiet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblDonVi]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDonVi](
	[MaDonVi] [nvarchar](30) NOT NULL,
	[TenDonVI] [nvarchar](30) NOT NULL,
	[DiaChi] [nvarchar](50) NULL,
	[SoDienThoai] [nvarchar](30) NULL,
	[TruongDonVI] [nvarchar](30) NULL,
	[EMail] [nvarchar](40) NULL,
	[Website] [nvarchar](40) NULL,
 CONSTRAINT [PK_tblKhoa] PRIMARY KEY CLUSTERED 
(
	[MaDonVi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblHSSV]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHSSV](
	[MaHSSV] [nvarchar](30) NOT NULL,
	[HoTen] [nvarchar](30) NOT NULL,
	[MaLop] [nvarchar](30) NULL,
	[GioiTinh] [bit] NULL,
	[NgaySinh] [date] NULL,
	[NoiSinh] [nvarchar](100) NULL,
	[QueQuan] [nvarchar](100) NULL,
	[NoiOHienNay] [nvarchar](100) NULL,
	[DienThoai] [nvarchar](30) NULL,
	[EMail] [nvarchar](30) NULL,
	[urlPhoto] [nvarchar](150) NULL,
	[GhiChu] [nvarchar](max) NULL,
	[MatKhau] [nvarchar](30) NULL,
	[TrangThai] [bit] NULL,
 CONSTRAINT [PK_tblHSSV] PRIMARY KEY CLUSTERED 
(
	[MaHSSV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblLinhVuc]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLinhVuc](
	[MaLinhVuc] [nvarchar](30) NOT NULL,
	[TenLinhVuc] [nvarchar](50) NOT NULL,
	[GhiChu] [nvarchar](100) NULL,
 CONSTRAINT [PK_tblLinhVuc_1] PRIMARY KEY CLUSTERED 
(
	[MaLinhVuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblLopHoc]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLopHoc](
	[MaLop] [nvarchar](30) NOT NULL,
	[MaKhoa] [nvarchar](30) NOT NULL,
	[TenLop] [nvarchar](30) NOT NULL,
	[HeDaoTao] [nvarchar](30) NULL,
	[Khoa] [nvarchar](30) NULL,
 CONSTRAINT [PK_tblLopHoc] PRIMARY KEY CLUSTERED 
(
	[MaLop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblNgonNgu]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNgonNgu](
	[MaNgonNgu] [nvarchar](30) NOT NULL,
	[TenNgonNgu] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_tblNgonNgu] PRIMARY KEY CLUSTERED 
(
	[MaNgonNgu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblNhaXuatBan]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNhaXuatBan](
	[MaNXB] [nvarchar](30) NOT NULL,
	[TenNXB] [nvarchar](50) NULL,
	[urlLogo] [nvarchar](150) NULL,
	[GhiChu] [nvarchar](200) NULL,
 CONSTRAINT [PK_tblNhaXuatBan] PRIMARY KEY CLUSTERED 
(
	[MaNXB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblQuaTrinhMuonTra]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblQuaTrinhMuonTra](
	[MaQuaTrinhMuonTra] [int] IDENTITY(1,1) NOT NULL,
	[MaCanBo_HSSV] [nvarchar](30) NOT NULL,
	[MaThuThu] [nvarchar](30) NULL,
	[ThoiGianMuonTra] [date] NULL,
	[TienNhanVe] [int] NULL,
	[TienDatCoc] [int] NULL,
	[XuPhatNeuCo] [nvarchar](max) NULL,
	[GhiChu] [nvarchar](max) NULL,
 CONSTRAINT [PK_tblQuaTrinhTraSach_1] PRIMARY KEY CLUSTERED 
(
	[MaQuaTrinhMuonTra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblSach]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblSach](
	[MaSach] [nvarchar](30) NOT NULL,
	[MaPhanLoai] [varchar](15) NULL,
	[TenSach] [nvarchar](150) NULL,
	[MaNXB] [nvarchar](30) NULL,
	[LanXuatBan] [smallint] NULL,
	[ISBN_ISSN] [nvarchar](20) NULL,
	[SoTrang] [int] NULL,
	[Tap] [smallint] NULL,
	[NamXuatBan] [int] NULL,
	[NuocXuatBan] [nvarchar](30) NULL,
	[KichThuoc] [nvarchar](10) NULL,
	[urlAnhBia] [nvarchar](200) NULL,
	[DuongDanBanScan] [nchar](10) NULL,
	[GiaBia] [float] NULL,
	[MaNgonNgu] [nvarchar](30) NULL,
	[TomTatNoiDung] [nvarchar](max) NULL,
	[TuKhoa] [nvarchar](50) NULL,
	[SachDichHayKhong] [bit] NULL CONSTRAINT [DF_tblSach_SachDichHayKhong]  DEFAULT ((0)),
	[NgonNguBanDau] [nvarchar](30) NULL,
	[TinhTrang] [bit] NULL,
	[GhiChu] [nvarchar](max) NULL,
 CONSTRAINT [PK_tblSach] PRIMARY KEY CLUSTERED 
(
	[MaSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblSach_CaBiet]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSach_CaBiet](
	[MaSach] [nvarchar](30) NOT NULL,
	[MaSoCaBiet] [nvarchar](30) NOT NULL,
	[TinhTrang] [bit] NOT NULL,
	[GhiChu] [nvarchar](max) NULL,
 CONSTRAINT [PK_tblSach_CaBiet] PRIMARY KEY CLUSTERED 
(
	[MaSach] ASC,
	[MaSoCaBiet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblSach_LinhVuc]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSach_LinhVuc](
	[MaSach] [nvarchar](30) NOT NULL,
	[MaLinhVuc] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_tblSach_LinhVuc] PRIMARY KEY CLUSTERED 
(
	[MaSach] ASC,
	[MaLinhVuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblSach_TacGia]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSach_TacGia](
	[MaSach] [nvarchar](30) NOT NULL,
	[MaTacGia] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_tblSach_TacGia] PRIMARY KEY CLUSTERED 
(
	[MaSach] ASC,
	[MaTacGia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblSach_TheLoai]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSach_TheLoai](
	[MaSach] [nvarchar](30) NOT NULL,
	[MaTheLoai] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_tblSach_TheLoai] PRIMARY KEY CLUSTERED 
(
	[MaSach] ASC,
	[MaTheLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblTacGia]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTacGia](
	[MaTacGia] [nvarchar](30) NOT NULL,
	[HoTenTacGia] [nvarchar](30) NOT NULL,
	[MoTa] [nvarchar](100) NULL,
 CONSTRAINT [PK_tblTacGia] PRIMARY KEY CLUSTERED 
(
	[MaTacGia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblTaiKhoan]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTaiKhoan](
	[TenDangNhap] [nvarchar](30) NOT NULL,
	[HoVaTen] [nvarchar](30) NOT NULL,
	[MatKhau] [nvarchar](30) NOT NULL,
	[QuyenHan] [smallint] NULL CONSTRAINT [DF_tblTaiKhoan_QuyenHan]  DEFAULT ((0)),
	[TrangThai] [bit] NULL CONSTRAINT [DF_tblTaiKhoan_TrangThai]  DEFAULT ((0)),
	[MoTa] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblTaiKhoan] PRIMARY KEY CLUSTERED 
(
	[TenDangNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblTheLoai]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTheLoai](
	[MaTheLoai] [nvarchar](30) NOT NULL,
	[TenTheLoai] [nvarchar](50) NOT NULL,
	[MoTa] [nvarchar](100) NULL,
 CONSTRAINT [PK_tblTheLoai_1] PRIMARY KEY CLUSTERED 
(
	[MaTheLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblThuThu]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblThuThu](
	[MaThuThu] [nvarchar](30) NOT NULL,
	[HoTen] [nvarchar](30) NOT NULL,
	[MatKhau] [nvarchar](30) NULL,
	[DiaChiEmail] [nvarchar](30) NULL,
	[DienThoai] [nvarchar](30) NULL,
	[TrangThai] [bit] NULL,
	[urlPhoto] [nvarchar](150) NULL,
	[GhiChu] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblThuThu] PRIMARY KEY CLUSTERED 
(
	[MaThuThu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[tblCanBo] ([MaCanBo], [HoVaTen], [QueQuan], [NgaySinh], [urlPhoto], [MaDonVi], [GioiTinh], [SoDienThoai], [DiaChiEMail], [GhiChu], [MatKhau], [TrangThai]) VALUES (N'MCB000001', N'Trần Văn Chiến', N'Hưng Yên', CAST(N'1995-02-04' AS Date), NULL, N'MDV000001', 1, N'01699934056', N'vanchien@gmail.com', N'Cán bộ Tổ Chức', N'756453', 1)
INSERT [dbo].[tblCanBo] ([MaCanBo], [HoVaTen], [QueQuan], [NgaySinh], [urlPhoto], [MaDonVi], [GioiTinh], [SoDienThoai], [DiaChiEMail], [GhiChu], [MatKhau], [TrangThai]) VALUES (N'MCB000002', N'Hoàng Văn Thuận Dương', N'Hưng Yên', CAST(N'1995-04-05' AS Date), NULL, N'MDV000002', 1, N'01655545636', N'thuanduong@gmail.com', N'Cán bộ quản trị', N'456123', 1)
INSERT [dbo].[tblCanBo] ([MaCanBo], [HoVaTen], [QueQuan], [NgaySinh], [urlPhoto], [MaDonVi], [GioiTinh], [SoDienThoai], [DiaChiEMail], [GhiChu], [MatKhau], [TrangThai]) VALUES (N'MCB000003', N'Đặng Xuân Bách', N'Hưng Yên', CAST(N'1995-05-05' AS Date), NULL, N'MDV000003', 1, N'01634537325', N'xuanbach@gmail.com', N'Cán bộ tài vụ', N'332213', 1)
INSERT [dbo].[tblCanBo] ([MaCanBo], [HoVaTen], [QueQuan], [NgaySinh], [urlPhoto], [MaDonVi], [GioiTinh], [SoDienThoai], [DiaChiEMail], [GhiChu], [MatKhau], [TrangThai]) VALUES (N'MCB000004', N'Đào Quang Hiếu', N'Hưng Yên', CAST(N'1995-02-04' AS Date), NULL, N'MDV000004', 1, N'01632664331', N'quanghieu@gmail.com', N'Cán bộ quản lý thiết bị', N'325233', 1)
INSERT [dbo].[tblCanBo] ([MaCanBo], [HoVaTen], [QueQuan], [NgaySinh], [urlPhoto], [MaDonVi], [GioiTinh], [SoDienThoai], [DiaChiEMail], [GhiChu], [MatKhau], [TrangThai]) VALUES (N'MCB000005', N'Vũ Đức Hiến', N'Hưng Yên', CAST(N'1995-05-07' AS Date), NULL, N'MDV000005', 1, N'0904945432', N'duchien@gmail.com', N'Cán bộ đào tạo', N'787656', 1)
INSERT [dbo].[tblCanBo] ([MaCanBo], [HoVaTen], [QueQuan], [NgaySinh], [urlPhoto], [MaDonVi], [GioiTinh], [SoDienThoai], [DiaChiEMail], [GhiChu], [MatKhau], [TrangThai]) VALUES (N'MCB000006', N'Nguyễn Xuân Bích', N'Hưng Yên', CAST(N'1994-05-08' AS Date), NULL, N'MDV000006', 1, N'01645663234', N'xuanbich@gmail.com', N'Cán bộ đoàn thanh niên', N'646453', 1)
INSERT [dbo].[tblCanBo] ([MaCanBo], [HoVaTen], [QueQuan], [NgaySinh], [urlPhoto], [MaDonVi], [GioiTinh], [SoDienThoai], [DiaChiEMail], [GhiChu], [MatKhau], [TrangThai]) VALUES (N'MCB000007', N'Bàn Văn Ước', N'Quảng Ninh', CAST(N'1995-06-07' AS Date), NULL, N'MDV000007', 1, N'01688546592', N'vanuoc@gmail.com', N'Cán bộ công đoàn trường', N'366556', 1)
INSERT [dbo].[tblCanBo] ([MaCanBo], [HoVaTen], [QueQuan], [NgaySinh], [urlPhoto], [MaDonVi], [GioiTinh], [SoDienThoai], [DiaChiEMail], [GhiChu], [MatKhau], [TrangThai]) VALUES (N'MCB000008', N'Nguyễn Trung Anh', N'Hà Nội', CAST(N'1994-04-04' AS Date), NULL, N'MDV000008', 1, N'0973284933', N'trunganh@gmail.com', N'Quản lý thư viện', N'356546', 1)
INSERT [dbo].[tblCanBo] ([MaCanBo], [HoVaTen], [QueQuan], [NgaySinh], [urlPhoto], [MaDonVi], [GioiTinh], [SoDienThoai], [DiaChiEMail], [GhiChu], [MatKhau], [TrangThai]) VALUES (N'MCB000009', N'Đỗ Thị Hiền', N'Thái Bình', CAST(N'1994-01-24' AS Date), NULL, N'MDV000009', 0, N'01665434456', N'dohien@gmail.com', N'Cán bộ phòng khoa học và công nghệ', N'324234', 1)
INSERT [dbo].[tblCanBo] ([MaCanBo], [HoVaTen], [QueQuan], [NgaySinh], [urlPhoto], [MaDonVi], [GioiTinh], [SoDienThoai], [DiaChiEMail], [GhiChu], [MatKhau], [TrangThai]) VALUES (N'MCB000010', N'Nguyễn Thị Nga', N'Bắc Ninh', CAST(N'1994-09-25' AS Date), NULL, N'MDV000010', 0, N'01644122563', N'nguyennga@gmail.com', N'Cán bộ biên tập do nhà suất bản ban hành', N'345461', 1)
INSERT [dbo].[tblCanBo] ([MaCanBo], [HoVaTen], [QueQuan], [NgaySinh], [urlPhoto], [MaDonVi], [GioiTinh], [SoDienThoai], [DiaChiEMail], [GhiChu], [MatKhau], [TrangThai]) VALUES (N'MCB000021', N'Nguyễn Văn Dũng', N'Quận Hà Đông, Hà Nội', CAST(N'1995-09-12' AS Date), N' ', N'MDV000021', 1, N'01652269986', N'Vandung@gmail.com', N'khong co', N'123456789', 1)
INSERT [dbo].[tblCanBo] ([MaCanBo], [HoVaTen], [QueQuan], [NgaySinh], [urlPhoto], [MaDonVi], [GioiTinh], [SoDienThoai], [DiaChiEMail], [GhiChu], [MatKhau], [TrangThai]) VALUES (N'MCB000022', N'Nguyễn Xuân Bích', N'Thành Phố Hưng Yên', CAST(N'1993-09-02' AS Date), NULL, N'MDV000022', 1, N'0972409205', N'canhbuomphieudutk111@gmail.com', N'Admin', N'0972409205', 1)
INSERT [dbo].[tblCanBo] ([MaCanBo], [HoVaTen], [QueQuan], [NgaySinh], [urlPhoto], [MaDonVi], [GioiTinh], [SoDienThoai], [DiaChiEMail], [GhiChu], [MatKhau], [TrangThai]) VALUES (N'MCB000023', N'Nguyễn Như Cường', N'Mỹ Hào Hưng Yên', CAST(N'1995-09-08' AS Date), NULL, N'MDV000023', 0, N'0123652656', N'nhucuong@gmail.com', N'khong co', N'123456789', 1)
INSERT [dbo].[tblCanBo] ([MaCanBo], [HoVaTen], [QueQuan], [NgaySinh], [urlPhoto], [MaDonVi], [GioiTinh], [SoDienThoai], [DiaChiEMail], [GhiChu], [MatKhau], [TrangThai]) VALUES (N'MCB000024', N'Bàn Văn Ước ', N'Quảng Ninh', CAST(N'1993-02-12' AS Date), NULL, N'MDV000024', 1, N'0123659856', N'banuoc@gmail.com', N'Admin', N'1234567890', 1)
INSERT [dbo].[tblCanBo] ([MaCanBo], [HoVaTen], [QueQuan], [NgaySinh], [urlPhoto], [MaDonVi], [GioiTinh], [SoDienThoai], [DiaChiEMail], [GhiChu], [MatKhau], [TrangThai]) VALUES (N'MCB000025', N'Trần Văn Hòa', N'Hà Nội', CAST(N'1995-12-12' AS Date), NULL, N'MDV000025', 1, N'0126523656', N'Tranhoa@gmail.com', N'khong co', N'1234567890', 1)
INSERT [dbo].[tblCanBo] ([MaCanBo], [HoVaTen], [QueQuan], [NgaySinh], [urlPhoto], [MaDonVi], [GioiTinh], [SoDienThoai], [DiaChiEMail], [GhiChu], [MatKhau], [TrangThai]) VALUES (N'MCB000026', N'Nguyễn Văn Phong', N'Hưng Yên', CAST(N'1995-09-03' AS Date), NULL, N'MDV000026', 1, N'0321525252', N'phong@gmail.com', N'khong co', N'1234567890', 1)
INSERT [dbo].[tblCanBo] ([MaCanBo], [HoVaTen], [QueQuan], [NgaySinh], [urlPhoto], [MaDonVi], [GioiTinh], [SoDienThoai], [DiaChiEMail], [GhiChu], [MatKhau], [TrangThai]) VALUES (N'MCB000027', N'Lương Xuân Hòa', N'Hải Phòng', CAST(N'1996-05-04' AS Date), NULL, N'MDV000027', 1, N'0986565645', N'XuanHoa@yahoo.com', N'khong co', N'1234567892', 1)
INSERT [dbo].[tblCanBo] ([MaCanBo], [HoVaTen], [QueQuan], [NgaySinh], [urlPhoto], [MaDonVi], [GioiTinh], [SoDienThoai], [DiaChiEMail], [GhiChu], [MatKhau], [TrangThai]) VALUES (N'MCB000028', N'Lương Văn Quân', N'Hưng yên', CAST(N'1996-05-08' AS Date), NULL, N'MDV000028', 1, N'01665232545', N'Vanquan@gmail.com', N'khong co', N'123456789', 1)
INSERT [dbo].[tblCanBo] ([MaCanBo], [HoVaTen], [QueQuan], [NgaySinh], [urlPhoto], [MaDonVi], [GioiTinh], [SoDienThoai], [DiaChiEMail], [GhiChu], [MatKhau], [TrangThai]) VALUES (N'MCB000029', N'Phạm Văn Đạt', N'Hưng Yên', CAST(N'1998-04-06' AS Date), NULL, N'MDV000029', 1, N'0986565645', N'Phamdat@gmail.com', N'khong co', N'123456789', 1)
INSERT [dbo].[tblCanBo] ([MaCanBo], [HoVaTen], [QueQuan], [NgaySinh], [urlPhoto], [MaDonVi], [GioiTinh], [SoDienThoai], [DiaChiEMail], [GhiChu], [MatKhau], [TrangThai]) VALUES (N'MCB000030', N'Nguyễn Văn Chung', N'Hưng yên', CAST(N'1995-08-06' AS Date), NULL, N'MDV000030', 1, N'0985656565', N'chung@yahoo.com', N'khong co', N'123456789', 1)
INSERT [dbo].[tblChiTietMuonTra] ([MaQuaTrinhTraSach], [MaSach], [TinhTrang], [MaSoCaBiet], [MuonHayTra]) VALUES (1, N'MS000001', N'Tốt', N'MSCB000001', 1)
INSERT [dbo].[tblChiTietMuonTra] ([MaQuaTrinhTraSach], [MaSach], [TinhTrang], [MaSoCaBiet], [MuonHayTra]) VALUES (1, N'MS000021', N'1', N'MSCB000021', 1)
INSERT [dbo].[tblChiTietMuonTra] ([MaQuaTrinhTraSach], [MaSach], [TinhTrang], [MaSoCaBiet], [MuonHayTra]) VALUES (2, N'MS000002', N'Tốt', N'MSCB000002', 1)
INSERT [dbo].[tblChiTietMuonTra] ([MaQuaTrinhTraSach], [MaSach], [TinhTrang], [MaSoCaBiet], [MuonHayTra]) VALUES (2, N'MS000022', N'1', N'MSCB000022', 1)
INSERT [dbo].[tblChiTietMuonTra] ([MaQuaTrinhTraSach], [MaSach], [TinhTrang], [MaSoCaBiet], [MuonHayTra]) VALUES (3, N'MS000023', N'1', N'MSCB000023', 1)
INSERT [dbo].[tblChiTietMuonTra] ([MaQuaTrinhTraSach], [MaSach], [TinhTrang], [MaSoCaBiet], [MuonHayTra]) VALUES (4, N'MS000003', N'tốt', N'MSCB000003', 1)
INSERT [dbo].[tblChiTietMuonTra] ([MaQuaTrinhTraSach], [MaSach], [TinhTrang], [MaSoCaBiet], [MuonHayTra]) VALUES (4, N'MS000024', N'1', N'MSCB000024', 0)
INSERT [dbo].[tblChiTietMuonTra] ([MaQuaTrinhTraSach], [MaSach], [TinhTrang], [MaSoCaBiet], [MuonHayTra]) VALUES (5, N'MS000004', N'Tốt', N'MSCB000004', 1)
INSERT [dbo].[tblChiTietMuonTra] ([MaQuaTrinhTraSach], [MaSach], [TinhTrang], [MaSoCaBiet], [MuonHayTra]) VALUES (5, N'MS000025', N'1', N'MSCB000025', 1)
INSERT [dbo].[tblChiTietMuonTra] ([MaQuaTrinhTraSach], [MaSach], [TinhTrang], [MaSoCaBiet], [MuonHayTra]) VALUES (6, N'MS000005', N'Bình thường', N'MSCB000005', 0)
INSERT [dbo].[tblChiTietMuonTra] ([MaQuaTrinhTraSach], [MaSach], [TinhTrang], [MaSoCaBiet], [MuonHayTra]) VALUES (7, N'MS000006', N'Bình thường', N'MSCB000006', 0)
INSERT [dbo].[tblChiTietMuonTra] ([MaQuaTrinhTraSach], [MaSach], [TinhTrang], [MaSoCaBiet], [MuonHayTra]) VALUES (8, N'MS000007', N'Tốt', N'MSCB000007', 0)
INSERT [dbo].[tblChiTietMuonTra] ([MaQuaTrinhTraSach], [MaSach], [TinhTrang], [MaSoCaBiet], [MuonHayTra]) VALUES (9, N'MS000008', N'Tốt', N'MSCB000008', 0)
INSERT [dbo].[tblChiTietMuonTra] ([MaQuaTrinhTraSach], [MaSach], [TinhTrang], [MaSoCaBiet], [MuonHayTra]) VALUES (10, N'MS000009', N'tốt', N'MSCB000009', 0)
INSERT [dbo].[tblDonVi] ([MaDonVi], [TenDonVI], [DiaChi], [SoDienThoai], [TruongDonVI], [EMail], [Website]) VALUES (N'MDV000001', N'az', N'Phố Nối-Mỹ Hào-Hưng Yên', N'0321356465', N'Chiến Trần', N'phongcanbo@gmail.com', N'Elib.com3')
INSERT [dbo].[tblDonVi] ([MaDonVi], [TenDonVI], [DiaChi], [SoDienThoai], [TruongDonVI], [EMail], [Website]) VALUES (N'MDV000002', N'Phòng Quản Trị', N'Phố Nối-Mỹ Hào-Hưng Yên', N'0321365454', N'Hoàng Văn Thuận Dương', N'phongquantri@gmail.com', N'Elib.com')
INSERT [dbo].[tblDonVi] ([MaDonVi], [TenDonVI], [DiaChi], [SoDienThoai], [TruongDonVI], [EMail], [Website]) VALUES (N'MDV000003', N'Phòng Tài vụ', N'Phố Nối-Mỹ Hào-Hưng Yên', N'0321356465', N'Đặng Xuân Bách', N'phongtaivu@gmail.com', N'Elib.com')
INSERT [dbo].[tblDonVi] ([MaDonVi], [TenDonVI], [DiaChi], [SoDienThoai], [TruongDonVI], [EMail], [Website]) VALUES (N'MDV000004', N'Phòng Thiết Bị', N'Phố Nối-Mỹ Hào-Hưng Yên', N'0321356665', N'Đào Quang Hiếu', N'phongthietbi@gmail.com', N'Elib.com')
INSERT [dbo].[tblDonVi] ([MaDonVi], [TenDonVI], [DiaChi], [SoDienThoai], [TruongDonVI], [EMail], [Website]) VALUES (N'MDV000005', N'MDV000005', N'Phố Nối-Mỹ Hào-Hưng Yên', N'0321364998', N'Vũ Đức Hiến', N'phongdaotao@gmail.com', N'Elib.com')
INSERT [dbo].[tblDonVi] ([MaDonVi], [TenDonVI], [DiaChi], [SoDienThoai], [TruongDonVI], [EMail], [Website]) VALUES (N'MDV000006', N'Đoàn Thanh Niên', N'Phố Nối-Mỹ Hào-Hưng Yên', N'0321386776', N'Nguyễn Xuân Bích', N'doanthanhnien@gmail.com', N'Elib.com')
INSERT [dbo].[tblDonVi] ([MaDonVi], [TenDonVI], [DiaChi], [SoDienThoai], [TruongDonVI], [EMail], [Website]) VALUES (N'MDV000007', N'Công Đoàn Trường', N'Phố Nối-Mỹ Hào-Hưng Yên', N'0321355688', N'Bàn Văn Ước', N'congdoantruong@gmail.com', N'Elib.com')
INSERT [dbo].[tblDonVi] ([MaDonVi], [TenDonVI], [DiaChi], [SoDienThoai], [TruongDonVI], [EMail], [Website]) VALUES (N'MDV000008', N'Thư Viện', N'Phố Nối-Mỹ Hào-Hưng Yên', N'0321354374', N'Nguyễn Trung Anh', N'thuvien@gmail.com', N'Elib.com')
INSERT [dbo].[tblDonVi] ([MaDonVi], [TenDonVI], [DiaChi], [SoDienThoai], [TruongDonVI], [EMail], [Website]) VALUES (N'MDV000009', N'Phòng Khoa Học Công Nghệ', N'Phố Nối-Mỹ Hào-Hưng Yên', N'0321378454', N'Đỗ Thị Hiền', N'khoahoccongnghe@gmail.com', N'Elib.com')
INSERT [dbo].[tblDonVi] ([MaDonVi], [TenDonVI], [DiaChi], [SoDienThoai], [TruongDonVI], [EMail], [Website]) VALUES (N'MDV000010', N'MDV000010', N'Phố Nối-Mỹ Hào-Hưng Yên', N'0321365341', N'Nguyễn Thị Nga', N'xuatban@gmail.com', N' Eblidn.com')
INSERT [dbo].[tblDonVi] ([MaDonVi], [TenDonVI], [DiaChi], [SoDienThoai], [TruongDonVI], [EMail], [Website]) VALUES (N'MDV000021', N'MDV000021', N'hưng yên', N'023234324', N'dương otaku', N'duong@gmai.com', N'duong.com')
INSERT [dbo].[tblDonVi] ([MaDonVi], [TenDonVI], [DiaChi], [SoDienThoai], [TruongDonVI], [EMail], [Website]) VALUES (N'MDV000022', N'Khoa công nghệ may', N'Cơ Sở 2 Đại Học SPKT', N'03213654985', N'Đaò quang Hiều', N'Hieu123@gmail.com', N'fit.utehy.vn')
INSERT [dbo].[tblDonVi] ([MaDonVi], [TenDonVI], [DiaChi], [SoDienThoai], [TruongDonVI], [EMail], [Website]) VALUES (N'MDV000023', N'Khoa Điện', N'Cơ Sở 2 Đại Học SPKT', N'0321652365', N'Nguyễn Xuân Bích', N'Bichnguyenxuan@gmail.com', N'fit.utehy.vn')
INSERT [dbo].[tblDonVi] ([MaDonVi], [TenDonVI], [DiaChi], [SoDienThoai], [TruongDonVI], [EMail], [Website]) VALUES (N'MDV000024', N'Khoa Cơ Khí', N'Cơ Sở 2 Đại Học SPKT', N'0321654856', N'Hoàng Thuận Dương', N'Thuanduong@gmail.com', N'fit.utehy.vn')
INSERT [dbo].[tblDonVi] ([MaDonVi], [TenDonVI], [DiaChi], [SoDienThoai], [TruongDonVI], [EMail], [Website]) VALUES (N'MDV000025', N'Khoa Ngôn ngữ Anh', N'Cơ Sở 2 Đại Học SPKT', N'0972409205', N'Nguyễn Bích', N'bichnguyen@gmail.com', N'fit.utehy.vn')
INSERT [dbo].[tblDonVi] ([MaDonVi], [TenDonVI], [DiaChi], [SoDienThoai], [TruongDonVI], [EMail], [Website]) VALUES (N'MDV000026', N'Khoa Kinh tế', N'Cơ Sở 2 Đại Học SPKT', N'0136526598', N'Trần Văn Chiến', N'chientran123@gmail.com', N'fit.utehy.vn')
INSERT [dbo].[tblDonVi] ([MaDonVi], [TenDonVI], [DiaChi], [SoDienThoai], [TruongDonVI], [EMail], [Website]) VALUES (N'MDV000027', N'Khoa Môi Trường', N'Cơ Sở 2 Đại Học SPKT', N'0321659865', N'Đặng Xuân Bách', N'xuanbach@gmail.com', N'fit.utehy.vn')
INSERT [dbo].[tblDonVi] ([MaDonVi], [TenDonVI], [DiaChi], [SoDienThoai], [TruongDonVI], [EMail], [Website]) VALUES (N'MDV000028', N'Khoa KHCB', N'Cơ Sở 2 Đại Học SPKT', N'0321589856', N'Nguyễn Như Cường', N'nhuwcuong@gmail.com', N'fit.utehy.vn')
INSERT [dbo].[tblDonVi] ([MaDonVi], [TenDonVI], [DiaChi], [SoDienThoai], [TruongDonVI], [EMail], [Website]) VALUES (N'MDV000029', N'Khoa Ngôn Ngữ Trung', N'Cơ Sở 2 Đại Học SPKT', N'0321658874', N'Nguyễn Văn Dũng', N'vandung@yahoo.com', N'fit.utehy.vn')
INSERT [dbo].[tblDonVi] ([MaDonVi], [TenDonVI], [DiaChi], [SoDienThoai], [TruongDonVI], [EMail], [Website]) VALUES (N'MDV000030', N'Khoa Ngoại Ngữ', N'Cơ Sở 2 Đại Học SPKT', N'0321546854', N'Vũ Đức Hiến', N'duchien@gmail.com', N'fit.utehy.vn')
INSERT [dbo].[tblHSSV] ([MaHSSV], [HoTen], [MaLop], [GioiTinh], [NgaySinh], [NoiSinh], [QueQuan], [NoiOHienNay], [DienThoai], [EMail], [urlPhoto], [GhiChu], [MatKhau], [TrangThai]) VALUES (N'MHSSV000021', N'Trần Văn Chiến', N'ML000021', 1, CAST(N'1994-06-05' AS Date), N'Hưng Yên', N'Hưng Yên', N'Mỹ Hào Hưng Yên', N'0986365269', N'tranchien@gmail.com', NULL, NULL, N'123456789', 1)
INSERT [dbo].[tblHSSV] ([MaHSSV], [HoTen], [MaLop], [GioiTinh], [NgaySinh], [NoiSinh], [QueQuan], [NoiOHienNay], [DienThoai], [EMail], [urlPhoto], [GhiChu], [MatKhau], [TrangThai]) VALUES (N'MHSSV000022', N'Nguyễn Xuân Bích', N'ML000022', 1, CAST(N'1993-09-02' AS Date), N'Hưng Yên', N'Hưng Yên', N'Thành Phố Hưng Yên', N'0986355265', N'canhbuomphieudutk111@gmail.com', NULL, NULL, N'123456789', 1)
INSERT [dbo].[tblHSSV] ([MaHSSV], [HoTen], [MaLop], [GioiTinh], [NgaySinh], [NoiSinh], [QueQuan], [NoiOHienNay], [DienThoai], [EMail], [urlPhoto], [GhiChu], [MatKhau], [TrangThai]) VALUES (N'MHSSV000023', N'Bàn Văn Ước', N'ML000023', 1, CAST(N'1995-01-02' AS Date), N'Hà Nội', N'Hà Nội', N'Hà Nội', N'0165254454', N'banuoc@gmail.com', NULL, NULL, N'123456789', 1)
INSERT [dbo].[tblHSSV] ([MaHSSV], [HoTen], [MaLop], [GioiTinh], [NgaySinh], [NoiSinh], [QueQuan], [NoiOHienNay], [DienThoai], [EMail], [urlPhoto], [GhiChu], [MatKhau], [TrangThai]) VALUES (N'MHSSV000024', N'Đặng Xuân Bách', N'ML000024', 1, CAST(N'1995-02-03' AS Date), N'Hưng Yên', N'Hưng Yên', N'Hưng Yên', N'01652365236', N'xuanbach@gmail.com', NULL, NULL, N'123456789', 1)
INSERT [dbo].[tblHSSV] ([MaHSSV], [HoTen], [MaLop], [GioiTinh], [NgaySinh], [NoiSinh], [QueQuan], [NoiOHienNay], [DienThoai], [EMail], [urlPhoto], [GhiChu], [MatKhau], [TrangThai]) VALUES (N'MHSSV000025', N'Vũ Đức Hiến', N'ML000025', 1, CAST(N'1996-02-03' AS Date), N'Hưng Yên', N'Hưng Yên', N'Hưng Yên', N'01652323232', N'duchien@gmail.com', NULL, NULL, N'123456789', 1)
INSERT [dbo].[tblHSSV] ([MaHSSV], [HoTen], [MaLop], [GioiTinh], [NgaySinh], [NoiSinh], [QueQuan], [NoiOHienNay], [DienThoai], [EMail], [urlPhoto], [GhiChu], [MatKhau], [TrangThai]) VALUES (N'MHSSV000026', N'Lê Văn Anh', N'ML000026', 1, CAST(N'1993-01-02' AS Date), N'Hà Nội', N'Hà Nội', N'Hà Nội', N'01652326547', N'vananh@gmail.com', NULL, NULL, N'123456789', 1)
INSERT [dbo].[tblHSSV] ([MaHSSV], [HoTen], [MaLop], [GioiTinh], [NgaySinh], [NoiSinh], [QueQuan], [NoiOHienNay], [DienThoai], [EMail], [urlPhoto], [GhiChu], [MatKhau], [TrangThai]) VALUES (N'MHSSV000027', N'Vũ Văn Chiến', N'ML000027', 1, CAST(N'1996-01-05' AS Date), N'Hà Nội', N'Hà Nội', N'Hà Nội', N'01659856656', N'chien123@gmail.com', NULL, NULL, N'123456789', 1)
INSERT [dbo].[tblHSSV] ([MaHSSV], [HoTen], [MaLop], [GioiTinh], [NgaySinh], [NoiSinh], [QueQuan], [NoiOHienNay], [DienThoai], [EMail], [urlPhoto], [GhiChu], [MatKhau], [TrangThai]) VALUES (N'MHSSV000028', N'Lê Thu Hương', N'ML000028', 1, CAST(N'1993-02-03' AS Date), N'Hưng Yên', N'Hưng Yên', N'Hưng Yên', N'01652326547', N'canhbuomphieudutk111@gmail.com', NULL, NULL, N'123456789', 1)
INSERT [dbo].[tblHSSV] ([MaHSSV], [HoTen], [MaLop], [GioiTinh], [NgaySinh], [NoiSinh], [QueQuan], [NoiOHienNay], [DienThoai], [EMail], [urlPhoto], [GhiChu], [MatKhau], [TrangThai]) VALUES (N'MHSSV000029', N'Vũ Tuấn Hưởng', N'ML000029', 1, CAST(N'1993-01-02' AS Date), N'Hưng Yên', N'Hưng Yên', N'Hưng Yên', N'01659856656', N'vananh@gmail.com', NULL, NULL, N'123456789', 1)
INSERT [dbo].[tblHSSV] ([MaHSSV], [HoTen], [MaLop], [GioiTinh], [NgaySinh], [NoiSinh], [QueQuan], [NoiOHienNay], [DienThoai], [EMail], [urlPhoto], [GhiChu], [MatKhau], [TrangThai]) VALUES (N'MHSSV000030', N'Nguyễn Văn An', N'ML000030', 1, CAST(N'1993-01-02' AS Date), N'Hưng Yên', N'Hưng Yên', N'Hưng Yên', N'01659856656', N'canhbuomphieudutk111@gmail.com', NULL, NULL, N'123456789', 1)
INSERT [dbo].[tblLinhVuc] ([MaLinhVuc], [TenLinhVuc], [GhiChu]) VALUES (N'MLV000001', N'Văn Hóa', N'Về lĩnh vực văn hóa')
INSERT [dbo].[tblLinhVuc] ([MaLinhVuc], [TenLinhVuc], [GhiChu]) VALUES (N'MLV000002', N'Văn hóa giáo dục', N'Về lĩnh vực văn hóa giáo dục')
INSERT [dbo].[tblLinhVuc] ([MaLinhVuc], [TenLinhVuc], [GhiChu]) VALUES (N'MLV000003', N'Văn hóa nghệ thuật', N'về lĩnh vực văn hóa nghệ thuật')
INSERT [dbo].[tblLinhVuc] ([MaLinhVuc], [TenLinhVuc], [GhiChu]) VALUES (N'MLV000004', N'Văn hóa văn nghệ', N'Về lĩnh vực văn hóa văn nghệ')
INSERT [dbo].[tblLinhVuc] ([MaLinhVuc], [TenLinhVuc], [GhiChu]) VALUES (N'MLV000005', N'Văn nghệ', N'Về lĩnh vực văn nghệ')
INSERT [dbo].[tblLinhVuc] ([MaLinhVuc], [TenLinhVuc], [GhiChu]) VALUES (N'MLV000006', N'Tác phẩm nghệ thuật', N'Về tác phẩm nghệ thuật')
INSERT [dbo].[tblLinhVuc] ([MaLinhVuc], [TenLinhVuc], [GhiChu]) VALUES (N'MLV000007', N'Văn hóa đời sống', N'về lĩnh vực văn hóa đời sống')
INSERT [dbo].[tblLinhVuc] ([MaLinhVuc], [TenLinhVuc], [GhiChu]) VALUES (N'MLV000008', N'Đạo đức', N'Về lĩnh vực đạo đức')
INSERT [dbo].[tblLinhVuc] ([MaLinhVuc], [TenLinhVuc], [GhiChu]) VALUES (N'MLV000009', N'Lối sống mới', N'Về lĩnh vực lối sống mới')
INSERT [dbo].[tblLinhVuc] ([MaLinhVuc], [TenLinhVuc], [GhiChu]) VALUES (N'MLV000010', N'Nếp sống mới', N'Về lĩnh vực nếp sống mới')
INSERT [dbo].[tblLinhVuc] ([MaLinhVuc], [TenLinhVuc], [GhiChu]) VALUES (N'MLV000011', N'Địa lý', N'Lĩnh vực về Địa lý')
INSERT [dbo].[tblLinhVuc] ([MaLinhVuc], [TenLinhVuc], [GhiChu]) VALUES (N'MLV000012', N'Khoa học Trái đất', N'Lĩnh vực về Trái đất')
INSERT [dbo].[tblLinhVuc] ([MaLinhVuc], [TenLinhVuc], [GhiChu]) VALUES (N'MLV000013', N'Thiên văn học', N'Lĩnh vực về Thiên văn học')
INSERT [dbo].[tblLinhVuc] ([MaLinhVuc], [TenLinhVuc], [GhiChu]) VALUES (N'MLV000014', N'Xã hội học', N'Lĩnh vực về Xã hội')
INSERT [dbo].[tblLinhVuc] ([MaLinhVuc], [TenLinhVuc], [GhiChu]) VALUES (N'MLV000015', N'Tâm lý', N'Lĩnh vực về Tâm lý')
INSERT [dbo].[tblLinhVuc] ([MaLinhVuc], [TenLinhVuc], [GhiChu]) VALUES (N'MLV000016', N'Công nghiệp', N'Lĩnh vực về Công nghiệp')
INSERT [dbo].[tblLinhVuc] ([MaLinhVuc], [TenLinhVuc], [GhiChu]) VALUES (N'MLV000017', N'Điện tử', N'Lĩnh vực về Điện tử')
INSERT [dbo].[tblLinhVuc] ([MaLinhVuc], [TenLinhVuc], [GhiChu]) VALUES (N'MLV000018', N'Viễn thông', N'Lĩnh vực về Viễn thông')
INSERT [dbo].[tblLinhVuc] ([MaLinhVuc], [TenLinhVuc], [GhiChu]) VALUES (N'MLV000019', N'Phong tục tập quán', N'Lĩnh vực về Phong tục tập quán')
INSERT [dbo].[tblLinhVuc] ([MaLinhVuc], [TenLinhVuc], [GhiChu]) VALUES (N'MLV000020', N'Chính trị', N'Lĩnh vực về Chính trị')
INSERT [dbo].[tblLinhVuc] ([MaLinhVuc], [TenLinhVuc], [GhiChu]) VALUES (N'MLV000021', N'Khoa Hoc', N'khong co')
INSERT [dbo].[tblLinhVuc] ([MaLinhVuc], [TenLinhVuc], [GhiChu]) VALUES (N'MLV000022', N'Cong Nghe Thong Tin', N'khong co')
INSERT [dbo].[tblLinhVuc] ([MaLinhVuc], [TenLinhVuc], [GhiChu]) VALUES (N'MLV000023', N'May Thoi Trang', N'khong co')
INSERT [dbo].[tblLinhVuc] ([MaLinhVuc], [TenLinhVuc], [GhiChu]) VALUES (N'MLV000024', N'Co Khi', N'khong co')
INSERT [dbo].[tblLinhVuc] ([MaLinhVuc], [TenLinhVuc], [GhiChu]) VALUES (N'MLV000025', N'Dien Tu', N'khong co')
INSERT [dbo].[tblLopHoc] ([MaLop], [MaKhoa], [TenLop], [HeDaoTao], [Khoa]) VALUES (N'ML000001', N'MDV000001', N'TK11.1', N'Đại học', N'công nghệ thông tin')
INSERT [dbo].[tblLopHoc] ([MaLop], [MaKhoa], [TenLop], [HeDaoTao], [Khoa]) VALUES (N'ML000002', N'MDV000002', N'TK11.2', N'Đại Học', N'Công nghệ thông tin')
INSERT [dbo].[tblLopHoc] ([MaLop], [MaKhoa], [TenLop], [HeDaoTao], [Khoa]) VALUES (N'ML000003', N'MDV000003', N'TK11.3', N'Đại học', N'công nghệ thông tin')
INSERT [dbo].[tblLopHoc] ([MaLop], [MaKhoa], [TenLop], [HeDaoTao], [Khoa]) VALUES (N'ML000004', N'MDV000004', N'TK11.4', N'Đại học', N'công nghệ thông tin')
INSERT [dbo].[tblLopHoc] ([MaLop], [MaKhoa], [TenLop], [HeDaoTao], [Khoa]) VALUES (N'ML000005', N'MDV000005', N'TK11.5', N'Đại học', N'công nghệ thông tin')
INSERT [dbo].[tblLopHoc] ([MaLop], [MaKhoa], [TenLop], [HeDaoTao], [Khoa]) VALUES (N'ML000006', N'MDV000006', N'TK40', N'Cao đẳng', N'Công nghệ thông tin')
INSERT [dbo].[tblLopHoc] ([MaLop], [MaKhoa], [TenLop], [HeDaoTao], [Khoa]) VALUES (N'ML000007', N'MDV000007', N'TK41', N'Cao đẳng', N'Công nghệ thông tin')
INSERT [dbo].[tblLopHoc] ([MaLop], [MaKhoa], [TenLop], [HeDaoTao], [Khoa]) VALUES (N'ML000008', N'MDV000008', N'TK42', N'Cao đẳng', N'công nghệ thông tin')
INSERT [dbo].[tblLopHoc] ([MaLop], [MaKhoa], [TenLop], [HeDaoTao], [Khoa]) VALUES (N'ML000009', N'MDV000009', N'TK43', N'Cao đẳng', N'Công nghệ thông tin')
INSERT [dbo].[tblLopHoc] ([MaLop], [MaKhoa], [TenLop], [HeDaoTao], [Khoa]) VALUES (N'ML000021', N'MDV000021', N'Tk11.1', N'Đại học', N'CNTT')
INSERT [dbo].[tblLopHoc] ([MaLop], [MaKhoa], [TenLop], [HeDaoTao], [Khoa]) VALUES (N'ML000022', N'MDV000022', N'Tk11.2', N'Đại học', N'Khoa công nghệ may')
INSERT [dbo].[tblLopHoc] ([MaLop], [MaKhoa], [TenLop], [HeDaoTao], [Khoa]) VALUES (N'ML000023', N'MDV000023', N'TK11.3', N'Đại Học', N'Khoa Điện')
INSERT [dbo].[tblLopHoc] ([MaLop], [MaKhoa], [TenLop], [HeDaoTao], [Khoa]) VALUES (N'ML000024', N'MDV000024', N'TK11.4', N'Cao Đẳng', N'Khoa Cơ Khí')
INSERT [dbo].[tblLopHoc] ([MaLop], [MaKhoa], [TenLop], [HeDaoTao], [Khoa]) VALUES (N'ML000025', N'MDV000025', N'TK11.5', N'Cao Đẳng', N'Khoa Ngôn ngữ Anh')
INSERT [dbo].[tblLopHoc] ([MaLop], [MaKhoa], [TenLop], [HeDaoTao], [Khoa]) VALUES (N'ML000026', N'MDV000026', N'TK11.6', N'Cao Đẳng', N'Khoa Kinh tế')
INSERT [dbo].[tblLopHoc] ([MaLop], [MaKhoa], [TenLop], [HeDaoTao], [Khoa]) VALUES (N'ML000027', N'MDV000027', N'MK11.1', N'Đại Học', N'Khoa Môi Trường')
INSERT [dbo].[tblLopHoc] ([MaLop], [MaKhoa], [TenLop], [HeDaoTao], [Khoa]) VALUES (N'ML000028', N'MDV000028', N'MK11.1', N'Đại Học', N'Khoa KHCB')
INSERT [dbo].[tblLopHoc] ([MaLop], [MaKhoa], [TenLop], [HeDaoTao], [Khoa]) VALUES (N'ML000029', N'MDV000029', N'TK40', N'Cao Đẳng', N'Khoa Công nghệ thông tin')
INSERT [dbo].[tblLopHoc] ([MaLop], [MaKhoa], [TenLop], [HeDaoTao], [Khoa]) VALUES (N'ML000030', N'MDV000030', N'TK41', N'Cao Đẳng', N'Khoa Công nghệ thông tin')
INSERT [dbo].[tblNgonNgu] ([MaNgonNgu], [TenNgonNgu]) VALUES (N'MNN000001', N'Tiếng việt')
INSERT [dbo].[tblNgonNgu] ([MaNgonNgu], [TenNgonNgu]) VALUES (N'MNN000002', N'Tiếng Anh')
INSERT [dbo].[tblNgonNgu] ([MaNgonNgu], [TenNgonNgu]) VALUES (N'MNN000003', N'Tiếng Hàn')
INSERT [dbo].[tblNgonNgu] ([MaNgonNgu], [TenNgonNgu]) VALUES (N'MNN000004', N'Tiếng Nhật')
INSERT [dbo].[tblNgonNgu] ([MaNgonNgu], [TenNgonNgu]) VALUES (N'MNN000005', N'Tiếng Trung')
INSERT [dbo].[tblNgonNgu] ([MaNgonNgu], [TenNgonNgu]) VALUES (N'MNN000006', N'Tiếng Lào')
INSERT [dbo].[tblNgonNgu] ([MaNgonNgu], [TenNgonNgu]) VALUES (N'MNN000007', N'Tiếng Thái')
INSERT [dbo].[tblNgonNgu] ([MaNgonNgu], [TenNgonNgu]) VALUES (N'MNN000008', N'Tiếng Ả Rập')
INSERT [dbo].[tblNgonNgu] ([MaNgonNgu], [TenNgonNgu]) VALUES (N'MNN000009', N'Tiếng Bố Đào Nha')
INSERT [dbo].[tblNgonNgu] ([MaNgonNgu], [TenNgonNgu]) VALUES (N'MNN000010', N'Tiếng Mĩ La Tinh')
INSERT [dbo].[tblNgonNgu] ([MaNgonNgu], [TenNgonNgu]) VALUES (N'MNN000011', N'Tiếng Hàn')
INSERT [dbo].[tblNgonNgu] ([MaNgonNgu], [TenNgonNgu]) VALUES (N'MNN000012', N'Tiếng Trung')
INSERT [dbo].[tblNgonNgu] ([MaNgonNgu], [TenNgonNgu]) VALUES (N'MNN000013', N'Tiếng Nhật')
INSERT [dbo].[tblNgonNgu] ([MaNgonNgu], [TenNgonNgu]) VALUES (N'MNN000014', N'Tiếng Lào')
INSERT [dbo].[tblNgonNgu] ([MaNgonNgu], [TenNgonNgu]) VALUES (N'MNN000015', N'Tiếng Anh')
INSERT [dbo].[tblNgonNgu] ([MaNgonNgu], [TenNgonNgu]) VALUES (N'MNN000016', N'Tiếng Thái')
INSERT [dbo].[tblNgonNgu] ([MaNgonNgu], [TenNgonNgu]) VALUES (N'MNN000017', N'Tiếng Ấn độ')
INSERT [dbo].[tblNgonNgu] ([MaNgonNgu], [TenNgonNgu]) VALUES (N'MNN000018', N'Tiếng Campuchia')
INSERT [dbo].[tblNgonNgu] ([MaNgonNgu], [TenNgonNgu]) VALUES (N'MNN000019', N'Tiếng Nga')
INSERT [dbo].[tblNgonNgu] ([MaNgonNgu], [TenNgonNgu]) VALUES (N'MNN000020', N'Tiếng Việt')
INSERT [dbo].[tblNgonNgu] ([MaNgonNgu], [TenNgonNgu]) VALUES (N'MNN000021', N'tieng anh (us)')
INSERT [dbo].[tblNgonNgu] ([MaNgonNgu], [TenNgonNgu]) VALUES (N'MNN000022', N'Tieng nga')
INSERT [dbo].[tblNgonNgu] ([MaNgonNgu], [TenNgonNgu]) VALUES (N'MNN000023', N'Tieng Phap')
INSERT [dbo].[tblNgonNgu] ([MaNgonNgu], [TenNgonNgu]) VALUES (N'MNN000024 ', N'Tieng Nhat')
INSERT [dbo].[tblNgonNgu] ([MaNgonNgu], [TenNgonNgu]) VALUES (N'MNN000025', N' Tieng Han')
INSERT [dbo].[tblNgonNgu] ([MaNgonNgu], [TenNgonNgu]) VALUES (N'MNN000026', N'Tieng arap')
INSERT [dbo].[tblNgonNgu] ([MaNgonNgu], [TenNgonNgu]) VALUES (N'MNN000027', N'Tieng Trung')
INSERT [dbo].[tblNgonNgu] ([MaNgonNgu], [TenNgonNgu]) VALUES (N'MNN000028', N'Tieng Viet')
INSERT [dbo].[tblNgonNgu] ([MaNgonNgu], [TenNgonNgu]) VALUES (N'MNN000029', N'Tieng Thai Lan')
INSERT [dbo].[tblNgonNgu] ([MaNgonNgu], [TenNgonNgu]) VALUES (N'MNN000030', N'Tieng Lao')
INSERT [dbo].[tblNhaXuatBan] ([MaNXB], [TenNXB], [urlLogo], [GhiChu]) VALUES (N'MNSB000001', N'Kim Đồng', NULL, N'Nhà xuất bản Kim Đồng')
INSERT [dbo].[tblNhaXuatBan] ([MaNXB], [TenNXB], [urlLogo], [GhiChu]) VALUES (N'MNSB000002', N'Văn Học', NULL, N'Nhà xuất bản Văn học')
INSERT [dbo].[tblNhaXuatBan] ([MaNXB], [TenNXB], [urlLogo], [GhiChu]) VALUES (N'MNSB000003', N'Nhà xuất bản công an nhân dân', NULL, N'Nhà xuất bản công an nhân dân')
INSERT [dbo].[tblNhaXuatBan] ([MaNXB], [TenNXB], [urlLogo], [GhiChu]) VALUES (N'MNSB000004', N'Nhà xuất bản trẻ', NULL, N'Nhà xuất bản trẻ')
INSERT [dbo].[tblNhaXuatBan] ([MaNXB], [TenNXB], [urlLogo], [GhiChu]) VALUES (N'MNSB000005', N'Nhà sách Xuân Thu', NULL, N'Nhà xuất bản Xuân Thu')
INSERT [dbo].[tblNhaXuatBan] ([MaNXB], [TenNXB], [urlLogo], [GhiChu]) VALUES (N'MNSB000006', N'Nhà xuất bản khoa học và kỹ thuật', NULL, N'Nhà xuất bản khoa học và kỹ thuật')
INSERT [dbo].[tblNhaXuatBan] ([MaNXB], [TenNXB], [urlLogo], [GhiChu]) VALUES (N'MNSB000007', N'Nhà xuất bản Lao động - Xã hội', NULL, N'Nhà xuất bản Lao động - Xã hội')
INSERT [dbo].[tblNhaXuatBan] ([MaNXB], [TenNXB], [urlLogo], [GhiChu]) VALUES (N'MNSB000008', N' Nhà sách NGUYỄN VĂN CỪ', NULL, N' Nhà sách NGUYỄN VĂN CỪ')
INSERT [dbo].[tblNhaXuatBan] ([MaNXB], [TenNXB], [urlLogo], [GhiChu]) VALUES (N'MNSB000009', N'Nhà Sách Tân Định', NULL, N'Nhà Sách Tân Định')
INSERT [dbo].[tblNhaXuatBan] ([MaNXB], [TenNXB], [urlLogo], [GhiChu]) VALUES (N'MNSB000010', N'Tiệm sách Y dược', NULL, N'Tiệm sách Y dược')
INSERT [dbo].[tblNhaXuatBan] ([MaNXB], [TenNXB], [urlLogo], [GhiChu]) VALUES (N'MNXB000011', N'Nhà xuất bản Âm nhạc', NULL, N'Xuất bản ấn phẩm về âm nhạc')
INSERT [dbo].[tblNhaXuatBan] ([MaNXB], [TenNXB], [urlLogo], [GhiChu]) VALUES (N'MNXB000012', N'Nhà xuất bản Bản đồ', NULL, N'Xuất bản ấn phẩm về bản đồ')
INSERT [dbo].[tblNhaXuatBan] ([MaNXB], [TenNXB], [urlLogo], [GhiChu]) VALUES (N'MNXB000013', N'Nhà xuất bản Bưu điện', NULL, N'Xuất bản ấn phẩm về bưu chính viễn thông')
INSERT [dbo].[tblNhaXuatBan] ([MaNXB], [TenNXB], [urlLogo], [GhiChu]) VALUES (N'MNXB000014', N'Nhà xuất bản Công an nhân dân', NULL, N'Xuất bản ấn phẩm về an ninh')
INSERT [dbo].[tblNhaXuatBan] ([MaNXB], [TenNXB], [urlLogo], [GhiChu]) VALUES (N'MNXB000015', N'Nhà xuất bản Tuổi trẻ', NULL, N'Xuất bản ấn phẩm về giới trẻ')
INSERT [dbo].[tblNhaXuatBan] ([MaNXB], [TenNXB], [urlLogo], [GhiChu]) VALUES (N'MNXB000016', N'Cục Báo chí', NULL, N'Xuất bản ấn phẩm báo chí')
INSERT [dbo].[tblNhaXuatBan] ([MaNXB], [TenNXB], [urlLogo], [GhiChu]) VALUES (N'MNXB000017', N'Nhà xuất bản Hà Nội', NULL, N'Xuất bản các ấn phẩm an ninh')
INSERT [dbo].[tblNhaXuatBan] ([MaNXB], [TenNXB], [urlLogo], [GhiChu]) VALUES (N'MNXB000018', N'Nhà xuất bản Giao thông vận tải', NULL, N'Xuất bản các ấn phẩm về giao thông')
INSERT [dbo].[tblNhaXuatBan] ([MaNXB], [TenNXB], [urlLogo], [GhiChu]) VALUES (N'MNXB000019', N'Hội nhà văn', NULL, N'Xuất bản các ấn bản văn thơ')
INSERT [dbo].[tblNhaXuatBan] ([MaNXB], [TenNXB], [urlLogo], [GhiChu]) VALUES (N'MNXB000020', N'Đại học sư phạm Hà Nội', NULL, N'Xuất bản các ấn phẩm giáo dục')
INSERT [dbo].[tblNhaXuatBan] ([MaNXB], [TenNXB], [urlLogo], [GhiChu]) VALUES (N'MNXB000021', N'Ha Noi', NULL, NULL)
INSERT [dbo].[tblNhaXuatBan] ([MaNXB], [TenNXB], [urlLogo], [GhiChu]) VALUES (N'MNXB000022', N'Dong Nai', NULL, NULL)
INSERT [dbo].[tblNhaXuatBan] ([MaNXB], [TenNXB], [urlLogo], [GhiChu]) VALUES (N'MNXB000023', N'KimDong', NULL, NULL)
INSERT [dbo].[tblNhaXuatBan] ([MaNXB], [TenNXB], [urlLogo], [GhiChu]) VALUES (N'MNXB000024', N'ThanhNien', NULL, NULL)
INSERT [dbo].[tblNhaXuatBan] ([MaNXB], [TenNXB], [urlLogo], [GhiChu]) VALUES (N'MNXB000025', N'HungYen', NULL, NULL)
INSERT [dbo].[tblNhaXuatBan] ([MaNXB], [TenNXB], [urlLogo], [GhiChu]) VALUES (N'MNXB000026', N'DaiHocQuocGia', NULL, NULL)
INSERT [dbo].[tblNhaXuatBan] ([MaNXB], [TenNXB], [urlLogo], [GhiChu]) VALUES (N'MNXB000027', N'VanHoa', NULL, NULL)
INSERT [dbo].[tblNhaXuatBan] ([MaNXB], [TenNXB], [urlLogo], [GhiChu]) VALUES (N'MNXB000028', N'HoChiMinh', NULL, NULL)
INSERT [dbo].[tblNhaXuatBan] ([MaNXB], [TenNXB], [urlLogo], [GhiChu]) VALUES (N'MNXB000029', N'DaiHocHue', NULL, NULL)
INSERT [dbo].[tblNhaXuatBan] ([MaNXB], [TenNXB], [urlLogo], [GhiChu]) VALUES (N'MNXB000030', N'CongAnNhanDan', NULL, NULL)
SET IDENTITY_INSERT [dbo].[tblQuaTrinhMuonTra] ON 

INSERT [dbo].[tblQuaTrinhMuonTra] ([MaQuaTrinhMuonTra], [MaCanBo_HSSV], [MaThuThu], [ThoiGianMuonTra], [TienNhanVe], [TienDatCoc], [XuPhatNeuCo], [GhiChu]) VALUES (1, N'MCB000001', N'MTT000001', CAST(N'2016-02-02' AS Date), 50000, 30000, N'Không', N'Đã Thu Tiền đặt cọc')
INSERT [dbo].[tblQuaTrinhMuonTra] ([MaQuaTrinhMuonTra], [MaCanBo_HSSV], [MaThuThu], [ThoiGianMuonTra], [TienNhanVe], [TienDatCoc], [XuPhatNeuCo], [GhiChu]) VALUES (2, N'MCB000002', N'MTT000002', CAST(N'2016-04-05' AS Date), 100000, 50000, N'Không', N'Đã Thu Tiền đặt cọc')
INSERT [dbo].[tblQuaTrinhMuonTra] ([MaQuaTrinhMuonTra], [MaCanBo_HSSV], [MaThuThu], [ThoiGianMuonTra], [TienNhanVe], [TienDatCoc], [XuPhatNeuCo], [GhiChu]) VALUES (3, N'MCB000023', N'MTT000023', CAST(N'2016-01-02' AS Date), 3000, 2000, N'0', N'0')
INSERT [dbo].[tblQuaTrinhMuonTra] ([MaQuaTrinhMuonTra], [MaCanBo_HSSV], [MaThuThu], [ThoiGianMuonTra], [TienNhanVe], [TienDatCoc], [XuPhatNeuCo], [GhiChu]) VALUES (4, N'MCB000003', N'MTT000003', CAST(N'2016-04-05' AS Date), 30000, 15000, N'Không', N'Đã Thu Tiền đặt cọc')
INSERT [dbo].[tblQuaTrinhMuonTra] ([MaQuaTrinhMuonTra], [MaCanBo_HSSV], [MaThuThu], [ThoiGianMuonTra], [TienNhanVe], [TienDatCoc], [XuPhatNeuCo], [GhiChu]) VALUES (5, N'MCB000004', N'MTT000004', CAST(N'2016-05-07' AS Date), 10000, 0, N'Không', N'Đã Thu Tiền đặt cọc')
INSERT [dbo].[tblQuaTrinhMuonTra] ([MaQuaTrinhMuonTra], [MaCanBo_HSSV], [MaThuThu], [ThoiGianMuonTra], [TienNhanVe], [TienDatCoc], [XuPhatNeuCo], [GhiChu]) VALUES (6, N'MCB000005', N'MTT000005', CAST(N'2016-05-07' AS Date), 20000, 5000, N'KHÔNG', N'Đã Thu Tiền đặt cọc')
INSERT [dbo].[tblQuaTrinhMuonTra] ([MaQuaTrinhMuonTra], [MaCanBo_HSSV], [MaThuThu], [ThoiGianMuonTra], [TienNhanVe], [TienDatCoc], [XuPhatNeuCo], [GhiChu]) VALUES (7, N'MCB000006', N'MTT000006', CAST(N'2016-05-08' AS Date), 25000, 10000, N'KHÔNG', N'Đã Thu Tiền đặt cọc')
INSERT [dbo].[tblQuaTrinhMuonTra] ([MaQuaTrinhMuonTra], [MaCanBo_HSSV], [MaThuThu], [ThoiGianMuonTra], [TienNhanVe], [TienDatCoc], [XuPhatNeuCo], [GhiChu]) VALUES (8, N'MCB000007', N'MTT000007', CAST(N'2016-05-08' AS Date), 30000, 15000, N'KHÔNG', N'Đã Thu Tiền đặt cọc')
INSERT [dbo].[tblQuaTrinhMuonTra] ([MaQuaTrinhMuonTra], [MaCanBo_HSSV], [MaThuThu], [ThoiGianMuonTra], [TienNhanVe], [TienDatCoc], [XuPhatNeuCo], [GhiChu]) VALUES (9, N'MCB000008', N'MTT000008', CAST(N'2016-05-09' AS Date), 65000, 30000, N'KHÔNG', N'Đã Thu Tiền đặt cọc')
INSERT [dbo].[tblQuaTrinhMuonTra] ([MaQuaTrinhMuonTra], [MaCanBo_HSSV], [MaThuThu], [ThoiGianMuonTra], [TienNhanVe], [TienDatCoc], [XuPhatNeuCo], [GhiChu]) VALUES (10, N'MCB000009', N'MTT000009', CAST(N'2016-05-09' AS Date), 100000, 50000, N'KHÔNG', N'Đã Thu Tiền đặt cọc')
INSERT [dbo].[tblQuaTrinhMuonTra] ([MaQuaTrinhMuonTra], [MaCanBo_HSSV], [MaThuThu], [ThoiGianMuonTra], [TienNhanVe], [TienDatCoc], [XuPhatNeuCo], [GhiChu]) VALUES (11, N'MCB000010', N'MTT000010', CAST(N'2016-05-10' AS Date), 50000, 30000, N'KHÔNG', N'Đã Thu Tiền đặt cọc')
SET IDENTITY_INSERT [dbo].[tblQuaTrinhMuonTra] OFF
INSERT [dbo].[tblSach] ([MaSach], [MaPhanLoai], [TenSach], [MaNXB], [LanXuatBan], [ISBN_ISSN], [SoTrang], [Tap], [NamXuatBan], [NuocXuatBan], [KichThuoc], [urlAnhBia], [DuongDanBanScan], [GiaBia], [MaNgonNgu], [TomTatNoiDung], [TuKhoa], [SachDichHayKhong], [NgonNguBanDau], [TinhTrang], [GhiChu]) VALUES (N'MS000001', N'MPL000001', N'Lập trình', N'MNSB000001', 4, N'101-241', 40, 1, 2016, N'Việt Nam', N'210x297', NULL, NULL, 20000, N'MNN000001', N'Dạy kỹ năng lập trình cho các bạn mới học, có thể tự tạo ra một sản phẩm lập trình riêng cho cá nhân, vận dụng vào các ứng dụng thực tiễn.v.v.v', N'Sách Lập Trình', 1, N'Tiếng Anh', 1, N'Sách lập trình cho sinh viên công nghệ')
INSERT [dbo].[tblSach] ([MaSach], [MaPhanLoai], [TenSach], [MaNXB], [LanXuatBan], [ISBN_ISSN], [SoTrang], [Tap], [NamXuatBan], [NuocXuatBan], [KichThuoc], [urlAnhBia], [DuongDanBanScan], [GiaBia], [MaNgonNgu], [TomTatNoiDung], [TuKhoa], [SachDichHayKhong], [NgonNguBanDau], [TinhTrang], [GhiChu]) VALUES (N'MS000002', N'MPL000002', N'Từ Điển Anh-Việt', N'MNSB000001', 2, N'301-302', 300, 1, 2016, N'Việt Nam', N'412x412', NULL, NULL, 100000, N'MNN000002', N'Tra các từ tiếng anh sang tiếng việt, Cấu trúc câu trong ngữ pháp,cách thức giao tiếp với người ngoại quốc..', N'Từ Điển Anh-Việt', 1, N'Tiếng Anh', 1, N'Từ điển anh-việt')
INSERT [dbo].[tblSach] ([MaSach], [MaPhanLoai], [TenSach], [MaNXB], [LanXuatBan], [ISBN_ISSN], [SoTrang], [Tap], [NamXuatBan], [NuocXuatBan], [KichThuoc], [urlAnhBia], [DuongDanBanScan], [GiaBia], [MaNgonNgu], [TomTatNoiDung], [TuKhoa], [SachDichHayKhong], [NgonNguBanDau], [TinhTrang], [GhiChu]) VALUES (N'MS000003', N'MPL000003', N'Hóa Học', N'MNSB000006', 2, N'901-911', 80, 1, 2016, N'VIỆT NAM', N'210x297', NULL, NULL, 50000, N'MNN000001', N'Sự tồn tại của các nguyên tố,cấu trúc phân tử, bảng tuần hoàn của các chất, cấu tạo từ loại chất...', N'Hóa Học', 0, N'Tiếng Việt', 1, N'Sách Hóa Học')
INSERT [dbo].[tblSach] ([MaSach], [MaPhanLoai], [TenSach], [MaNXB], [LanXuatBan], [ISBN_ISSN], [SoTrang], [Tap], [NamXuatBan], [NuocXuatBan], [KichThuoc], [urlAnhBia], [DuongDanBanScan], [GiaBia], [MaNgonNgu], [TomTatNoiDung], [TuKhoa], [SachDichHayKhong], [NgonNguBanDau], [TinhTrang], [GhiChu]) VALUES (N'MS000004', N'MPL000004', N'Toán Cao cấp', N'MNSB000004', 1, N'646-166', 30, 1, 2016, N'Việt Nam', N'210x297', NULL, NULL, 35000, N'MNN000001', N'Giải một bài toán bằng nhiều phương pháp khác nhau.Các ứng dụng của toán học,...', N'Toán cao cấp', 0, N'Tiếng Việt', 1, N'Toán Cao Cấp')
INSERT [dbo].[tblSach] ([MaSach], [MaPhanLoai], [TenSach], [MaNXB], [LanXuatBan], [ISBN_ISSN], [SoTrang], [Tap], [NamXuatBan], [NuocXuatBan], [KichThuoc], [urlAnhBia], [DuongDanBanScan], [GiaBia], [MaNgonNgu], [TomTatNoiDung], [TuKhoa], [SachDichHayKhong], [NgonNguBanDau], [TinhTrang], [GhiChu]) VALUES (N'MS000005', N'MPL000005', N'Tâm lý học', N'MNSB000003', 4, N'656-233', 30, 1, 2016, N'Việt Nam', N'210x297', NULL, NULL, 40000, N'MNN000001', N'Dạy kĩ năng giao tiếp, kĩ năng nói, tâm lý của mỗi người, giải pháp.....', N'Tâm lý học', 1, N'Tiếng Việt', 1, N'Tâm lý học')
INSERT [dbo].[tblSach] ([MaSach], [MaPhanLoai], [TenSach], [MaNXB], [LanXuatBan], [ISBN_ISSN], [SoTrang], [Tap], [NamXuatBan], [NuocXuatBan], [KichThuoc], [urlAnhBia], [DuongDanBanScan], [GiaBia], [MaNgonNgu], [TomTatNoiDung], [TuKhoa], [SachDichHayKhong], [NgonNguBanDau], [TinhTrang], [GhiChu]) VALUES (N'MS000006', N'MPL000006', N'Tác phẩm thơ hay', N'MNSB000005', 2, N'655-656', 60, 1, 2016, N'Việt Nam', N'210c297', NULL, NULL, 45000, N'MNN000001', N'Mỗi bài thơ được thể hiên đặc sắc qua các vần thơ, được tác giả miêu tả một cách điêu luyện....vần thơ uyển chuyển ... Mỗi bài thơ được tác giả lấy một bối cảnh riêng...', N'Tác phẩm Thơ', 1, N'Tiếng Việt', 1, N'Tác phẩm thơ')
INSERT [dbo].[tblSach] ([MaSach], [MaPhanLoai], [TenSach], [MaNXB], [LanXuatBan], [ISBN_ISSN], [SoTrang], [Tap], [NamXuatBan], [NuocXuatBan], [KichThuoc], [urlAnhBia], [DuongDanBanScan], [GiaBia], [MaNgonNgu], [TomTatNoiDung], [TuKhoa], [SachDichHayKhong], [NgonNguBanDau], [TinhTrang], [GhiChu]) VALUES (N'MS000007', N'MPL000007', N'Địa Lý', N'MNSB000007', 1, N'654-233', 100, 3, 2016, N'Việt Nam', N'412x412', NULL, NULL, 15000, N'MNN000001', N'Ví trí địa lý các lục địa,Cấu tạo hành tinh của chúng ta, các đường kinh tuyến vĩ tuyến ,biểu đồ thể hiện các giá trị khác nhau....', N'Địa lý', 1, N'Tiếng Anh', 1, N'Địa lý')
INSERT [dbo].[tblSach] ([MaSach], [MaPhanLoai], [TenSach], [MaNXB], [LanXuatBan], [ISBN_ISSN], [SoTrang], [Tap], [NamXuatBan], [NuocXuatBan], [KichThuoc], [urlAnhBia], [DuongDanBanScan], [GiaBia], [MaNgonNgu], [TomTatNoiDung], [TuKhoa], [SachDichHayKhong], [NgonNguBanDau], [TinhTrang], [GhiChu]) VALUES (N'MS000008', N'MPL000008', N'Sinh học', N'MNSB000002', 3, N'103-323', 82, 3, 2016, N'Việt Nam', N'210x297', NULL, NULL, 25000, N'MNN000002', N'Cấu tạo các thảm thực vật,động vật, cơ quan tuần hoàn, bầu sinh quyển, Cấu tạo hệ sinh thái....', N'Sinh học', 1, N'Tiếng Anh', 1, N'Sinh Học')
INSERT [dbo].[tblSach] ([MaSach], [MaPhanLoai], [TenSach], [MaNXB], [LanXuatBan], [ISBN_ISSN], [SoTrang], [Tap], [NamXuatBan], [NuocXuatBan], [KichThuoc], [urlAnhBia], [DuongDanBanScan], [GiaBia], [MaNgonNgu], [TomTatNoiDung], [TuKhoa], [SachDichHayKhong], [NgonNguBanDau], [TinhTrang], [GhiChu]) VALUES (N'MS000009', N'MPL000009', N'Vật Lý', N'MNSB000009', 1, N'3202-2023', 60, 1, 2016, N'Việt Nam', N'210x297', NULL, NULL, 70000, N'MNN000002', N'Nguyên lý hoạt động của một vật chất nào đó,Hay sự chuyển dịch của các vật dẫn ,Sự tương tác giữa các vật vô định và vật cố định....', N'Vật Lý', 1, N'Tiếng việt', 1, N'Vật Lý')
INSERT [dbo].[tblSach] ([MaSach], [MaPhanLoai], [TenSach], [MaNXB], [LanXuatBan], [ISBN_ISSN], [SoTrang], [Tap], [NamXuatBan], [NuocXuatBan], [KichThuoc], [urlAnhBia], [DuongDanBanScan], [GiaBia], [MaNgonNgu], [TomTatNoiDung], [TuKhoa], [SachDichHayKhong], [NgonNguBanDau], [TinhTrang], [GhiChu]) VALUES (N'MS000010', N'MPL000010', N'Từ điển Việt-Nhật', N'MNSB000010', 1, N'326-366', 500, 1, 2016, N'Nhật Bản', N'412x412', NULL, NULL, 60000, N'MNN000004', N'Cấu trúc tu từ, Dịch từ tiếng nhật sang tiếng việt,Ví dụ ,Các câu để giao tiếp....', N'Từ điển Việt-Nhật', 1, N'Tiếng Nhật', 1, N'Từ điển Việt-Nhật')
INSERT [dbo].[tblSach] ([MaSach], [MaPhanLoai], [TenSach], [MaNXB], [LanXuatBan], [ISBN_ISSN], [SoTrang], [Tap], [NamXuatBan], [NuocXuatBan], [KichThuoc], [urlAnhBia], [DuongDanBanScan], [GiaBia], [MaNgonNgu], [TomTatNoiDung], [TuKhoa], [SachDichHayKhong], [NgonNguBanDau], [TinhTrang], [GhiChu]) VALUES (N'MS000021', N'MPL000021', N'Doreamon', N'MNXB000021', 1, N'22', 125, 12, 2016, N'Japan', N'20', NULL, NULL, 22000, N'MNN000021', N'Kể về chuyến phiêu lưu của mèo máy và những người bạn', N'doremon', 1, N'EngLish', 1, N'con sach')
INSERT [dbo].[tblSach] ([MaSach], [MaPhanLoai], [TenSach], [MaNXB], [LanXuatBan], [ISBN_ISSN], [SoTrang], [Tap], [NamXuatBan], [NuocXuatBan], [KichThuoc], [urlAnhBia], [DuongDanBanScan], [GiaBia], [MaNgonNgu], [TomTatNoiDung], [TuKhoa], [SachDichHayKhong], [NgonNguBanDau], [TinhTrang], [GhiChu]) VALUES (N'MS000022', N'MPL000022', N'Conan', N'MNXB000022', 2, N'45', 200, 3, 2014, N'Japan', N'20', NULL, NULL, 30000, N'MNN000022', N'Hành trình phá án của thám tử conan', N'conan', 1, N'Tieng Nhat', 1, N'con sach')
INSERT [dbo].[tblSach] ([MaSach], [MaPhanLoai], [TenSach], [MaNXB], [LanXuatBan], [ISBN_ISSN], [SoTrang], [Tap], [NamXuatBan], [NuocXuatBan], [KichThuoc], [urlAnhBia], [DuongDanBanScan], [GiaBia], [MaNgonNgu], [TomTatNoiDung], [TuKhoa], [SachDichHayKhong], [NgonNguBanDau], [TinhTrang], [GhiChu]) VALUES (N'MS000023', N'MPL000023', N'Triệu phú kho ổ chuột', N'MNXB000023', 3, N'50', 200, 4, 2015, N'USA', N'20', NULL, NULL, 125000, N'MNN000023', N'Triệu phú khu ổ chuột', N'trieuphu', 1, N'English', 1, N'con sach')
INSERT [dbo].[tblSach] ([MaSach], [MaPhanLoai], [TenSach], [MaNXB], [LanXuatBan], [ISBN_ISSN], [SoTrang], [Tap], [NamXuatBan], [NuocXuatBan], [KichThuoc], [urlAnhBia], [DuongDanBanScan], [GiaBia], [MaNgonNgu], [TomTatNoiDung], [TuKhoa], [SachDichHayKhong], [NgonNguBanDau], [TinhTrang], [GhiChu]) VALUES (N'MS000024', N'MPL000024', N'Không gia đình', N'MNXB000024', 3, N'50', 200, 4, 2016, N'USA', N'20', NULL, NULL, 300000, N'MNN000024', N'Cuộc sống không có gia đình của 1 con người', N'khong gia dinh', 1, N'English', 1, N'con sach')
INSERT [dbo].[tblSach] ([MaSach], [MaPhanLoai], [TenSach], [MaNXB], [LanXuatBan], [ISBN_ISSN], [SoTrang], [Tap], [NamXuatBan], [NuocXuatBan], [KichThuoc], [urlAnhBia], [DuongDanBanScan], [GiaBia], [MaNgonNgu], [TomTatNoiDung], [TuKhoa], [SachDichHayKhong], [NgonNguBanDau], [TinhTrang], [GhiChu]) VALUES (N'MS000025', N'MPL000025', N'Tôi tài giỏi bạn cũng thế', N'MNXB000025', 4, N'50', 200, 4, 2015, N'USA', N'20', NULL, NULL, 200000, N'MNN000025', N'Tôi tài giỏi bạn củng thế', N'toi tai gioi', 1, N'English', 1, N'con sach')
INSERT [dbo].[tblSach_CaBiet] ([MaSach], [MaSoCaBiet], [TinhTrang], [GhiChu]) VALUES (N'MS000001', N'MSCB000001', 1, N'Mã số cá biệt 1')
INSERT [dbo].[tblSach_CaBiet] ([MaSach], [MaSoCaBiet], [TinhTrang], [GhiChu]) VALUES (N'MS000002', N'MSCB000002', 1, N'Mã số cá biệt 2')
INSERT [dbo].[tblSach_CaBiet] ([MaSach], [MaSoCaBiet], [TinhTrang], [GhiChu]) VALUES (N'MS000003', N'MSCB000003', 1, N'Mã số các biệt 3')
INSERT [dbo].[tblSach_CaBiet] ([MaSach], [MaSoCaBiet], [TinhTrang], [GhiChu]) VALUES (N'MS000004', N'MSCB000004', 1, N'Mã số cá biệt  4')
INSERT [dbo].[tblSach_CaBiet] ([MaSach], [MaSoCaBiet], [TinhTrang], [GhiChu]) VALUES (N'MS000005', N'MSCB000005', 1, N'Mã số cá biệt 5')
INSERT [dbo].[tblSach_CaBiet] ([MaSach], [MaSoCaBiet], [TinhTrang], [GhiChu]) VALUES (N'MS000006', N'MSCB000006', 1, N'Mã số cá biệt 6')
INSERT [dbo].[tblSach_CaBiet] ([MaSach], [MaSoCaBiet], [TinhTrang], [GhiChu]) VALUES (N'MS000007', N'MSCB000007', 1, N'Mã số cá biệt 7')
INSERT [dbo].[tblSach_CaBiet] ([MaSach], [MaSoCaBiet], [TinhTrang], [GhiChu]) VALUES (N'MS000008', N'MSCB000008', 1, N'Mã số cá biệt 8')
INSERT [dbo].[tblSach_CaBiet] ([MaSach], [MaSoCaBiet], [TinhTrang], [GhiChu]) VALUES (N'MS000009', N'MSCB000009', 1, N'Mã số cá biệt 9')
INSERT [dbo].[tblSach_CaBiet] ([MaSach], [MaSoCaBiet], [TinhTrang], [GhiChu]) VALUES (N'MS000021', N'MSCB000021', 1, N'con sach')
INSERT [dbo].[tblSach_CaBiet] ([MaSach], [MaSoCaBiet], [TinhTrang], [GhiChu]) VALUES (N'MS000022', N'MSCB000022', 1, NULL)
INSERT [dbo].[tblSach_CaBiet] ([MaSach], [MaSoCaBiet], [TinhTrang], [GhiChu]) VALUES (N'MS000023', N'MSCB000023', 1, NULL)
INSERT [dbo].[tblSach_CaBiet] ([MaSach], [MaSoCaBiet], [TinhTrang], [GhiChu]) VALUES (N'MS000024', N'MSCB000024', 1, NULL)
INSERT [dbo].[tblSach_CaBiet] ([MaSach], [MaSoCaBiet], [TinhTrang], [GhiChu]) VALUES (N'MS000025', N'MSCB000025', 1, NULL)
INSERT [dbo].[tblSach_LinhVuc] ([MaSach], [MaLinhVuc]) VALUES (N'MS000001', N'MLV000001')
INSERT [dbo].[tblSach_LinhVuc] ([MaSach], [MaLinhVuc]) VALUES (N'MS000002', N'MLV000002')
INSERT [dbo].[tblSach_LinhVuc] ([MaSach], [MaLinhVuc]) VALUES (N'MS000003', N'MLV000003')
INSERT [dbo].[tblSach_LinhVuc] ([MaSach], [MaLinhVuc]) VALUES (N'MS000004', N'MLV000004')
INSERT [dbo].[tblSach_LinhVuc] ([MaSach], [MaLinhVuc]) VALUES (N'MS000005', N'MLV000005')
INSERT [dbo].[tblSach_LinhVuc] ([MaSach], [MaLinhVuc]) VALUES (N'MS000006', N'MLV000006')
INSERT [dbo].[tblSach_LinhVuc] ([MaSach], [MaLinhVuc]) VALUES (N'MS000007', N'MLV000007')
INSERT [dbo].[tblSach_LinhVuc] ([MaSach], [MaLinhVuc]) VALUES (N'MS000008', N'MLV000008')
INSERT [dbo].[tblSach_LinhVuc] ([MaSach], [MaLinhVuc]) VALUES (N'MS000009', N'MLV000009')
INSERT [dbo].[tblSach_LinhVuc] ([MaSach], [MaLinhVuc]) VALUES (N'MS000021', N'MLV000021')
INSERT [dbo].[tblSach_LinhVuc] ([MaSach], [MaLinhVuc]) VALUES (N'MS000022', N'MLV000022')
INSERT [dbo].[tblSach_LinhVuc] ([MaSach], [MaLinhVuc]) VALUES (N'MS000023', N'MLV000023')
INSERT [dbo].[tblSach_LinhVuc] ([MaSach], [MaLinhVuc]) VALUES (N'MS000024', N'MLV000024')
INSERT [dbo].[tblSach_LinhVuc] ([MaSach], [MaLinhVuc]) VALUES (N'MS000025', N'MLV000025')
INSERT [dbo].[tblSach_TacGia] ([MaSach], [MaTacGia]) VALUES (N'MS000001', N'MTG000001')
INSERT [dbo].[tblSach_TacGia] ([MaSach], [MaTacGia]) VALUES (N'MS000002', N'MTG000002')
INSERT [dbo].[tblSach_TacGia] ([MaSach], [MaTacGia]) VALUES (N'MS000003', N'MTG000003')
INSERT [dbo].[tblSach_TacGia] ([MaSach], [MaTacGia]) VALUES (N'MS000004', N'MTG000004')
INSERT [dbo].[tblSach_TacGia] ([MaSach], [MaTacGia]) VALUES (N'MS000005', N'MTG000005')
INSERT [dbo].[tblSach_TacGia] ([MaSach], [MaTacGia]) VALUES (N'MS000006', N'MTG000006')
INSERT [dbo].[tblSach_TacGia] ([MaSach], [MaTacGia]) VALUES (N'MS000007', N'MTG000007')
INSERT [dbo].[tblSach_TacGia] ([MaSach], [MaTacGia]) VALUES (N'MS000008', N'MTG000008')
INSERT [dbo].[tblSach_TacGia] ([MaSach], [MaTacGia]) VALUES (N'MS000009', N'MTG000009')
INSERT [dbo].[tblSach_TacGia] ([MaSach], [MaTacGia]) VALUES (N'MS000021', N'MTG000021')
INSERT [dbo].[tblSach_TacGia] ([MaSach], [MaTacGia]) VALUES (N'MS000022', N'MTG000022')
INSERT [dbo].[tblSach_TacGia] ([MaSach], [MaTacGia]) VALUES (N'MS000023', N'MTG000023')
INSERT [dbo].[tblSach_TacGia] ([MaSach], [MaTacGia]) VALUES (N'MS000024', N'MTG000024')
INSERT [dbo].[tblSach_TacGia] ([MaSach], [MaTacGia]) VALUES (N'MS000025', N'MTG000025')
INSERT [dbo].[tblSach_TheLoai] ([MaSach], [MaTheLoai]) VALUES (N'MS000002', N'MTL000002')
INSERT [dbo].[tblSach_TheLoai] ([MaSach], [MaTheLoai]) VALUES (N'MS000003', N'MTL000003')
INSERT [dbo].[tblSach_TheLoai] ([MaSach], [MaTheLoai]) VALUES (N'MS000004', N'MTL000004')
INSERT [dbo].[tblSach_TheLoai] ([MaSach], [MaTheLoai]) VALUES (N'MS000005', N'MTL000005')
INSERT [dbo].[tblSach_TheLoai] ([MaSach], [MaTheLoai]) VALUES (N'MS000006', N'MTL000006')
INSERT [dbo].[tblSach_TheLoai] ([MaSach], [MaTheLoai]) VALUES (N'MS000007', N'MTL000007')
INSERT [dbo].[tblSach_TheLoai] ([MaSach], [MaTheLoai]) VALUES (N'MS000008', N'MTL000008')
INSERT [dbo].[tblSach_TheLoai] ([MaSach], [MaTheLoai]) VALUES (N'MS000009', N'MTL000009')
INSERT [dbo].[tblSach_TheLoai] ([MaSach], [MaTheLoai]) VALUES (N'MS000010', N'MTL000010')
INSERT [dbo].[tblSach_TheLoai] ([MaSach], [MaTheLoai]) VALUES (N'MS000021', N'MTL000021')
INSERT [dbo].[tblSach_TheLoai] ([MaSach], [MaTheLoai]) VALUES (N'MS000022', N'MTL000022')
INSERT [dbo].[tblSach_TheLoai] ([MaSach], [MaTheLoai]) VALUES (N'MS000023', N'MTL000023')
INSERT [dbo].[tblSach_TheLoai] ([MaSach], [MaTheLoai]) VALUES (N'MS000024', N'MTL000024')
INSERT [dbo].[tblSach_TheLoai] ([MaSach], [MaTheLoai]) VALUES (N'MS000025', N'MTL000025')
INSERT [dbo].[tblTacGia] ([MaTacGia], [HoTenTacGia], [MoTa]) VALUES (N'MTG000001', N'Xuân Diệu', N'Tác giả Xuân Diệu')
INSERT [dbo].[tblTacGia] ([MaTacGia], [HoTenTacGia], [MoTa]) VALUES (N'MTG000002', N'Tố Hữu', N'Tác giả Tố Hữu')
INSERT [dbo].[tblTacGia] ([MaTacGia], [HoTenTacGia], [MoTa]) VALUES (N'MTG000003', N'Nguyễn Bỉnh Khiêm', N'Tác giả Nguyễn Bỉnh Khiêm')
INSERT [dbo].[tblTacGia] ([MaTacGia], [HoTenTacGia], [MoTa]) VALUES (N'MTG000004', N'Nam Cao', N'Tác giả Nam Cao')
INSERT [dbo].[tblTacGia] ([MaTacGia], [HoTenTacGia], [MoTa]) VALUES (N'MTG000005', N'Tô Hoài', N'Tác giả Tô Hoài')
INSERT [dbo].[tblTacGia] ([MaTacGia], [HoTenTacGia], [MoTa]) VALUES (N'MTG000006', N'Thạch Lam', N'Tác giả Thạch Lam')
INSERT [dbo].[tblTacGia] ([MaTacGia], [HoTenTacGia], [MoTa]) VALUES (N'MTG000007', N'Nguyễn Thi', N'Tác giả Nguyễn Thi')
INSERT [dbo].[tblTacGia] ([MaTacGia], [HoTenTacGia], [MoTa]) VALUES (N'MTG000008', N'Kim Lân', N'Tác giả Kim Lân')
INSERT [dbo].[tblTacGia] ([MaTacGia], [HoTenTacGia], [MoTa]) VALUES (N'MTG000009', N'Vũ Trọng Phụng', N'Tác giả Vũ Trọng Phụng')
INSERT [dbo].[tblTacGia] ([MaTacGia], [HoTenTacGia], [MoTa]) VALUES (N'MTG000011', N'Nam Cao', N'Là nhà văn tiêu biểu nhất thế kỷ 20')
INSERT [dbo].[tblTacGia] ([MaTacGia], [HoTenTacGia], [MoTa]) VALUES (N'MTG000012', N'Thâm Tâm', N'Là nhà văn tiêu biểu nhất thế kỷ 20')
INSERT [dbo].[tblTacGia] ([MaTacGia], [HoTenTacGia], [MoTa]) VALUES (N'MTG000013', N'Ngô Tất Tố', N'Là nhà văn tiêu biểu nhất thế kỷ 19-20')
INSERT [dbo].[tblTacGia] ([MaTacGia], [HoTenTacGia], [MoTa]) VALUES (N'MTG000014', N'Nguyễn Bính', N'Là nhà văn tiêu biểu nhất thế kỷ 20')
INSERT [dbo].[tblTacGia] ([MaTacGia], [HoTenTacGia], [MoTa]) VALUES (N'MTG000015', N'Hoàng Ngọc Phách', N'Là nhà văn tiêu biểu nhất thế kỷ 19-20')
INSERT [dbo].[tblTacGia] ([MaTacGia], [HoTenTacGia], [MoTa]) VALUES (N'MTG000016', N'Xuân Diệu', N'Là nhà văn tiêu biểu nhất thế kỷ 20')
INSERT [dbo].[tblTacGia] ([MaTacGia], [HoTenTacGia], [MoTa]) VALUES (N'MTG000017', N'Kim Lân', N'Là nhà văn tiêu biểu nhất thế kỷ 20-21')
INSERT [dbo].[tblTacGia] ([MaTacGia], [HoTenTacGia], [MoTa]) VALUES (N'MTG000018', N'Tố Hữu', N'Là nhà văn tiêu biểu nhất thế kỷ 20-21')
INSERT [dbo].[tblTacGia] ([MaTacGia], [HoTenTacGia], [MoTa]) VALUES (N'MTG000019', N'Tú Mỡ', N'Là nhà văn trào phúng ở Việt Nam')
INSERT [dbo].[tblTacGia] ([MaTacGia], [HoTenTacGia], [MoTa]) VALUES (N'MTG000020', N'Thép Mới', N'Là nhà văn tiêu biểu nhất thế kỷ 20')
INSERT [dbo].[tblTacGia] ([MaTacGia], [HoTenTacGia], [MoTa]) VALUES (N'MTG000021', N'Nguyễn Xuân Bích', N'Khong co')
INSERT [dbo].[tblTacGia] ([MaTacGia], [HoTenTacGia], [MoTa]) VALUES (N'MTG000022', N'Bàn Vưn Ước', N'Khong co')
INSERT [dbo].[tblTacGia] ([MaTacGia], [HoTenTacGia], [MoTa]) VALUES (N'MTG000023', N'Đào Quang Hiếu', N'Khong co')
INSERT [dbo].[tblTacGia] ([MaTacGia], [HoTenTacGia], [MoTa]) VALUES (N'MTG000024', N'Nguyễn Xuân Bích', N'Khong co')
INSERT [dbo].[tblTacGia] ([MaTacGia], [HoTenTacGia], [MoTa]) VALUES (N'MTG000025', N'Hoàng Văn Thuận Dương', N'Khong co')
INSERT [dbo].[tblTacGia] ([MaTacGia], [HoTenTacGia], [MoTa]) VALUES (N'MTG000026', N'Trần Văn CHiến', N'Khong co')
INSERT [dbo].[tblTacGia] ([MaTacGia], [HoTenTacGia], [MoTa]) VALUES (N'MTG000027', N'Vũ Đức Hiến', N'Khong co')
INSERT [dbo].[tblTacGia] ([MaTacGia], [HoTenTacGia], [MoTa]) VALUES (N'MTG000028', N'Đặng Xuân Bách', N'Khong co')
INSERT [dbo].[tblTacGia] ([MaTacGia], [HoTenTacGia], [MoTa]) VALUES (N'MTG000029', N'Hoàng Văn Thuận Dương', N'Khong co')
INSERT [dbo].[tblTacGia] ([MaTacGia], [HoTenTacGia], [MoTa]) VALUES (N'MTG000030', N'Đào Quang Hiếu', N'Khong co')
INSERT [dbo].[tblTaiKhoan] ([TenDangNhap], [HoVaTen], [MatKhau], [QuyenHan], [TrangThai], [MoTa]) VALUES (N'banuoc', N'Bàn Văn Ước', N'555555', 1, 1, N'User')
INSERT [dbo].[tblTaiKhoan] ([TenDangNhap], [HoVaTen], [MatKhau], [QuyenHan], [TrangThai], [MoTa]) VALUES (N'DaoHieu', N'Đào Quang Hiếu', N'123456789', 1, 1, N'Admin')
INSERT [dbo].[tblTaiKhoan] ([TenDangNhap], [HoVaTen], [MatKhau], [QuyenHan], [TrangThai], [MoTa]) VALUES (N'duchien', N'Vũ Đức Hiến', N'666666', 1, 1, N'User')
INSERT [dbo].[tblTaiKhoan] ([TenDangNhap], [HoVaTen], [MatKhau], [QuyenHan], [TrangThai], [MoTa]) VALUES (N'MeoMun', N'Nguyễn Xuân Bích', N'123456789', 1, 1, N'Admin')
INSERT [dbo].[tblTaiKhoan] ([TenDangNhap], [HoVaTen], [MatKhau], [QuyenHan], [TrangThai], [MoTa]) VALUES (N'quanghieu', N'Đào Quang Hiếu', N'777777', 1, 1, N'User')
INSERT [dbo].[tblTaiKhoan] ([TenDangNhap], [HoVaTen], [MatKhau], [QuyenHan], [TrangThai], [MoTa]) VALUES (N'thuanduong', N'Hoàng Văn Thuận Dương', N'222222', 1, 1, N'User')
INSERT [dbo].[tblTaiKhoan] ([TenDangNhap], [HoVaTen], [MatKhau], [QuyenHan], [TrangThai], [MoTa]) VALUES (N'tranchien', N'Trần Văn Chiến', N'111111', 10, 1, N'Admin')
INSERT [dbo].[tblTaiKhoan] ([TenDangNhap], [HoVaTen], [MatKhau], [QuyenHan], [TrangThai], [MoTa]) VALUES (N'VuHien', N'Vũ Đức Hiến', N'123456789', 1, 1, N'Admin')
INSERT [dbo].[tblTaiKhoan] ([TenDangNhap], [HoVaTen], [MatKhau], [QuyenHan], [TrangThai], [MoTa]) VALUES (N'xuanbach', N'Đặng Xuân Bách', N'333333', 1, 1, N'User')
INSERT [dbo].[tblTaiKhoan] ([TenDangNhap], [HoVaTen], [MatKhau], [QuyenHan], [TrangThai], [MoTa]) VALUES (N'xuanbich', N'Nguyễn Xuân Bích', N'444444', 1, 1, N'User')
INSERT [dbo].[tblTheLoai] ([MaTheLoai], [TenTheLoai], [MoTa]) VALUES (N'MTk000001', N'Văn Học', N'Thể loại văn học')
INSERT [dbo].[tblTheLoai] ([MaTheLoai], [TenTheLoai], [MoTa]) VALUES (N'MTL000002', N'Nghệ Thuật', N'Thể loại nghệ thuật')
INSERT [dbo].[tblTheLoai] ([MaTheLoai], [TenTheLoai], [MoTa]) VALUES (N'MTL000003', N'Xã Hội', N'Thể Loại Xã hội')
INSERT [dbo].[tblTheLoai] ([MaTheLoai], [TenTheLoai], [MoTa]) VALUES (N'MTL000004', N'Tâm Lý', N'Thê loại tâm lý')
INSERT [dbo].[tblTheLoai] ([MaTheLoai], [TenTheLoai], [MoTa]) VALUES (N'MTL000005', N'Đời Sống', N'Thể loại đời sống')
INSERT [dbo].[tblTheLoai] ([MaTheLoai], [TenTheLoai], [MoTa]) VALUES (N'MTL000006', N'Lịch sử', N'Thể loại lịch sử')
INSERT [dbo].[tblTheLoai] ([MaTheLoai], [TenTheLoai], [MoTa]) VALUES (N'MTL000007', N'Bút ký', N'Thể loại bút ký')
INSERT [dbo].[tblTheLoai] ([MaTheLoai], [TenTheLoai], [MoTa]) VALUES (N'MTL000008', N'Thơ', N'Thể loại thơ')
INSERT [dbo].[tblTheLoai] ([MaTheLoai], [TenTheLoai], [MoTa]) VALUES (N'MTL000009', N'Chuyện cười', N'Thể loại chuyện cười')
INSERT [dbo].[tblTheLoai] ([MaTheLoai], [TenTheLoai], [MoTa]) VALUES (N'MTL000010', N'Địa lý', N'Thể loại địa lý')
INSERT [dbo].[tblTheLoai] ([MaTheLoai], [TenTheLoai], [MoTa]) VALUES (N'MTL000011', N'Bình luận văn học', N'Bình luận về các bài văn thơ')
INSERT [dbo].[tblTheLoai] ([MaTheLoai], [TenTheLoai], [MoTa]) VALUES (N'MTL000012', N'Chính trị', N'Thể loại Chính trị')
INSERT [dbo].[tblTheLoai] ([MaTheLoai], [TenTheLoai], [MoTa]) VALUES (N'MTL000013', N'Địa lý', N'Thể loại về Địa lý')
INSERT [dbo].[tblTheLoai] ([MaTheLoai], [TenTheLoai], [MoTa]) VALUES (N'MTL000014', N'Viễn tưởng', N'Thể loại Viễn tưởng')
INSERT [dbo].[tblTheLoai] ([MaTheLoai], [TenTheLoai], [MoTa]) VALUES (N'MTL000015', N'Lịch sử', N'Thể loại Lịch sử')
INSERT [dbo].[tblTheLoai] ([MaTheLoai], [TenTheLoai], [MoTa]) VALUES (N'MTL000016', N'Giáo khoa', N'Thể loại Giáo khoa')
INSERT [dbo].[tblTheLoai] ([MaTheLoai], [TenTheLoai], [MoTa]) VALUES (N'MTL000017', N'Khoa học giả tưởng', N'Thể loại giả tưởng')
INSERT [dbo].[tblTheLoai] ([MaTheLoai], [TenTheLoai], [MoTa]) VALUES (N'MTL000018', N'Kinh doanh', N'Thể loại Kinh doanh')
INSERT [dbo].[tblTheLoai] ([MaTheLoai], [TenTheLoai], [MoTa]) VALUES (N'MTL000019', N'Thiếu nhi', N'Thể loại Thiếu nhi')
INSERT [dbo].[tblTheLoai] ([MaTheLoai], [TenTheLoai], [MoTa]) VALUES (N'MTL000020', N'Thiếu niên', N'Thể loại Thiếu niên')
INSERT [dbo].[tblTheLoai] ([MaTheLoai], [TenTheLoai], [MoTa]) VALUES (N'MTL000021', N'Truyện ', N'Truyện')
INSERT [dbo].[tblTheLoai] ([MaTheLoai], [TenTheLoai], [MoTa]) VALUES (N'MTL000022', N'Truyện Ngắn', N'Truyện Ngắn')
INSERT [dbo].[tblTheLoai] ([MaTheLoai], [TenTheLoai], [MoTa]) VALUES (N'MTL000023', N'Truyện Dài tập', N'Truyện dài tập')
INSERT [dbo].[tblTheLoai] ([MaTheLoai], [TenTheLoai], [MoTa]) VALUES (N'MTL000024', N'Truyện tranh', N'truyện tranh')
INSERT [dbo].[tblTheLoai] ([MaTheLoai], [TenTheLoai], [MoTa]) VALUES (N'MTL000025', N'Báo', N'Báo')
INSERT [dbo].[tblTheLoai] ([MaTheLoai], [TenTheLoai], [MoTa]) VALUES (N'MTL000026', N'Sách chuyên ngành CNTT', N'Sách chuyên ngành CNTT')
INSERT [dbo].[tblTheLoai] ([MaTheLoai], [TenTheLoai], [MoTa]) VALUES (N'MTL000027', N'Sách chuyên ngành May', N'Sách chuyên ngành May')
INSERT [dbo].[tblTheLoai] ([MaTheLoai], [TenTheLoai], [MoTa]) VALUES (N'MTL000028', N'Tạp Chí', N'Tạp Chí')
INSERT [dbo].[tblTheLoai] ([MaTheLoai], [TenTheLoai], [MoTa]) VALUES (N'MTL000029', N'Tiểu Thuyết', N'Tiểu Thuyết')
INSERT [dbo].[tblTheLoai] ([MaTheLoai], [TenTheLoai], [MoTa]) VALUES (N'MTL000030', N'Truyện Ngôn Tình', N'Truyện Ngôn Tình')
INSERT [dbo].[tblThuThu] ([MaThuThu], [HoTen], [MatKhau], [DiaChiEmail], [DienThoai], [TrangThai], [urlPhoto], [GhiChu]) VALUES (N'MTT000001', N'Nguyễn Cẩm Anh', N'1000', N'camanh@gmail.com', N'016422312454', 1, NULL, N'Thủ thư 1')
INSERT [dbo].[tblThuThu] ([MaThuThu], [HoTen], [MatKhau], [DiaChiEmail], [DienThoai], [TrangThai], [urlPhoto], [GhiChu]) VALUES (N'MTT000002', N'Nguyễn Hoàng Anh', N'3422', N'hoanganh@gmail.com', N'016422532435', 1, NULL, N'thủ thư 2')
INSERT [dbo].[tblThuThu] ([MaThuThu], [HoTen], [MatKhau], [DiaChiEmail], [DienThoai], [TrangThai], [urlPhoto], [GhiChu]) VALUES (N'MTT000003', N'Nguyễn Việt Anh', N'34324', N'vietanh@gmail.com', N'016532425668', 1, NULL, N'Thủ thư 3')
INSERT [dbo].[tblThuThu] ([MaThuThu], [HoTen], [MatKhau], [DiaChiEmail], [DienThoai], [TrangThai], [urlPhoto], [GhiChu]) VALUES (N'MTT000004', N'Nguyễn Anh Ba', N'54354', N'anhba@gmail.com', N'016625434351', 1, NULL, N'Thủ thư 4')
INSERT [dbo].[tblThuThu] ([MaThuThu], [HoTen], [MatKhau], [DiaChiEmail], [DienThoai], [TrangThai], [urlPhoto], [GhiChu]) VALUES (N'MTT000005', N'Trần Nam Bình', N'54353', N'binh@gmail.com', N'016626788941', 1, NULL, N'Thủ thư 5')
INSERT [dbo].[tblThuThu] ([MaThuThu], [HoTen], [MatKhau], [DiaChiEmail], [DienThoai], [TrangThai], [urlPhoto], [GhiChu]) VALUES (N'MTT000006', N'Nguyễn Như Cường', N'33321', N'cuong@gmail.com', N'016654451114', 1, NULL, N'thủ thư 6')
INSERT [dbo].[tblThuThu] ([MaThuThu], [HoTen], [MatKhau], [DiaChiEmail], [DienThoai], [TrangThai], [urlPhoto], [GhiChu]) VALUES (N'MTT000007', N'Vũ Thị Dịu', N'34333', N'diu@gmail.com', N'016546465682', 1, NULL, N'Thủ thư 7')
INSERT [dbo].[tblThuThu] ([MaThuThu], [HoTen], [MatKhau], [DiaChiEmail], [DienThoai], [TrangThai], [urlPhoto], [GhiChu]) VALUES (N'MTT000008', N'Đao Thị Doan', N'6777', N'daodoan@gmail.com', N'01254353415', 1, NULL, N'Thủ thư 8')
INSERT [dbo].[tblThuThu] ([MaThuThu], [HoTen], [MatKhau], [DiaChiEmail], [DienThoai], [TrangThai], [urlPhoto], [GhiChu]) VALUES (N'MTT000009', N'Chu Thị Minh Châu', N'334324', N'minhchau@gmail.com', N'016544324788', 1, NULL, N'Thủ thư 9')
INSERT [dbo].[tblThuThu] ([MaThuThu], [HoTen], [MatKhau], [DiaChiEmail], [DienThoai], [TrangThai], [urlPhoto], [GhiChu]) VALUES (N'MTT000010', N'Vũ Đính Chuyên', N'77234', N'dinhchuyen@gmail.com', N'016543564527', 1, NULL, N'Thủ thư 10')
INSERT [dbo].[tblThuThu] ([MaThuThu], [HoTen], [MatKhau], [DiaChiEmail], [DienThoai], [TrangThai], [urlPhoto], [GhiChu]) VALUES (N'MTT000021', N'Nguyễn Xuân Bích', N'123456789', N'xuanbich@gmail.com', N'0972409205', 1, NULL, N'Admin')
INSERT [dbo].[tblThuThu] ([MaThuThu], [HoTen], [MatKhau], [DiaChiEmail], [DienThoai], [TrangThai], [urlPhoto], [GhiChu]) VALUES (N'MTT000022', N'Bàn Văn Ước', N'123456789', N'uoc@gmail.com', N'0985656565', 1, NULL, N'Admin')
INSERT [dbo].[tblThuThu] ([MaThuThu], [HoTen], [MatKhau], [DiaChiEmail], [DienThoai], [TrangThai], [urlPhoto], [GhiChu]) VALUES (N'MTT000023', N'Nguyễn Văn Phương', N'123456789', N'phieudutk111@gmail.com', N'0985445555', 1, NULL, N'Admin')
INSERT [dbo].[tblThuThu] ([MaThuThu], [HoTen], [MatKhau], [DiaChiEmail], [DienThoai], [TrangThai], [urlPhoto], [GhiChu]) VALUES (N'MTT000024', N'Nguyễn Văn Lộc', N'123456789', N'phieudutk111@gmail.com', N'0985456542', 1, NULL, N'Admin')
INSERT [dbo].[tblThuThu] ([MaThuThu], [HoTen], [MatKhau], [DiaChiEmail], [DienThoai], [TrangThai], [urlPhoto], [GhiChu]) VALUES (N'MTT000025', N'Lê Văn Ánh', N'123446466', N'phieudutk111@gmail.com', N'0985656523', 1, NULL, N'người dùng')
INSERT [dbo].[tblThuThu] ([MaThuThu], [HoTen], [MatKhau], [DiaChiEmail], [DienThoai], [TrangThai], [urlPhoto], [GhiChu]) VALUES (N'MTT000026', N'Lê Xuân Phúc', N'12345678', N'phieudutk111@gmail.com', N'0978565265', 1, NULL, N'người dùng')
INSERT [dbo].[tblThuThu] ([MaThuThu], [HoTen], [MatKhau], [DiaChiEmail], [DienThoai], [TrangThai], [urlPhoto], [GhiChu]) VALUES (N'MTT000027', N'Vũ Văn Hiến', N'123456789', N'hienphieudutk111@gmail.com', N'0985652365', 1, NULL, N'người dùng')
INSERT [dbo].[tblThuThu] ([MaThuThu], [HoTen], [MatKhau], [DiaChiEmail], [DienThoai], [TrangThai], [urlPhoto], [GhiChu]) VALUES (N'MTT000028', N'Vũ Xuân Phúc', N'123456789', N'phuc1@gmail.com', N'0875654562', 1, NULL, N'người dùng')
INSERT [dbo].[tblThuThu] ([MaThuThu], [HoTen], [MatKhau], [DiaChiEmail], [DienThoai], [TrangThai], [urlPhoto], [GhiChu]) VALUES (N'MTT000029', N'Vũ Văn Trường', N'123654845', N'truong1@gmail.com', N'09855555554', 1, NULL, N'Admin')
INSERT [dbo].[tblThuThu] ([MaThuThu], [HoTen], [MatKhau], [DiaChiEmail], [DienThoai], [TrangThai], [urlPhoto], [GhiChu]) VALUES (N'MTT000030', N'Vũ Đình An', N'123456987', N'an1@gmail.com', N'09656587423', 1, NULL, N'người dùng')
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_tblSach_CaBiet]    Script Date: 5/7/2016 10:07:39 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_tblSach_CaBiet] ON [dbo].[tblSach_CaBiet]
(
	[MaSoCaBiet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblCanBo]  WITH CHECK ADD  CONSTRAINT [FK_tblDocGia_tblKhoa] FOREIGN KEY([MaDonVi])
REFERENCES [dbo].[tblDonVi] ([MaDonVi])
GO
ALTER TABLE [dbo].[tblCanBo] CHECK CONSTRAINT [FK_tblDocGia_tblKhoa]
GO
ALTER TABLE [dbo].[tblChiTietMuonTra]  WITH CHECK ADD  CONSTRAINT [FK_tblChiTietTraSach_tblQuaTrinhTraSach] FOREIGN KEY([MaQuaTrinhTraSach])
REFERENCES [dbo].[tblQuaTrinhMuonTra] ([MaQuaTrinhMuonTra])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblChiTietMuonTra] CHECK CONSTRAINT [FK_tblChiTietTraSach_tblQuaTrinhTraSach]
GO
ALTER TABLE [dbo].[tblChiTietMuonTra]  WITH CHECK ADD  CONSTRAINT [FK_tblChiTietTraSach_tblSach_CaBiet] FOREIGN KEY([MaSach], [MaSoCaBiet])
REFERENCES [dbo].[tblSach_CaBiet] ([MaSach], [MaSoCaBiet])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblChiTietMuonTra] CHECK CONSTRAINT [FK_tblChiTietTraSach_tblSach_CaBiet]
GO
ALTER TABLE [dbo].[tblHSSV]  WITH CHECK ADD  CONSTRAINT [FK_tblHSSV_tblLopHoc] FOREIGN KEY([MaLop])
REFERENCES [dbo].[tblLopHoc] ([MaLop])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblHSSV] CHECK CONSTRAINT [FK_tblHSSV_tblLopHoc]
GO
ALTER TABLE [dbo].[tblLopHoc]  WITH CHECK ADD  CONSTRAINT [FK_tblLopHoc_tblKhoa] FOREIGN KEY([MaKhoa])
REFERENCES [dbo].[tblDonVi] ([MaDonVi])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblLopHoc] CHECK CONSTRAINT [FK_tblLopHoc_tblKhoa]
GO
ALTER TABLE [dbo].[tblQuaTrinhMuonTra]  WITH NOCHECK ADD  CONSTRAINT [FK_tblQuaTrinhMuonTra_tblHSSV] FOREIGN KEY([MaCanBo_HSSV])
REFERENCES [dbo].[tblHSSV] ([MaHSSV])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblQuaTrinhMuonTra] NOCHECK CONSTRAINT [FK_tblQuaTrinhMuonTra_tblHSSV]
GO
ALTER TABLE [dbo].[tblQuaTrinhMuonTra]  WITH CHECK ADD  CONSTRAINT [FK_tblQuaTrinhMuonTra_tblThuThu] FOREIGN KEY([MaThuThu])
REFERENCES [dbo].[tblThuThu] ([MaThuThu])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblQuaTrinhMuonTra] CHECK CONSTRAINT [FK_tblQuaTrinhMuonTra_tblThuThu]
GO
ALTER TABLE [dbo].[tblQuaTrinhMuonTra]  WITH NOCHECK ADD  CONSTRAINT [FK_tblQuaTrinhTraSach_tblDocGia] FOREIGN KEY([MaCanBo_HSSV])
REFERENCES [dbo].[tblCanBo] ([MaCanBo])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblQuaTrinhMuonTra] NOCHECK CONSTRAINT [FK_tblQuaTrinhTraSach_tblDocGia]
GO
ALTER TABLE [dbo].[tblSach]  WITH CHECK ADD  CONSTRAINT [FK_tblSach_tblNgonNgu] FOREIGN KEY([MaNgonNgu])
REFERENCES [dbo].[tblNgonNgu] ([MaNgonNgu])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblSach] CHECK CONSTRAINT [FK_tblSach_tblNgonNgu]
GO
ALTER TABLE [dbo].[tblSach]  WITH CHECK ADD  CONSTRAINT [FK_tblSach_tblNhaXuatBan1] FOREIGN KEY([MaNXB])
REFERENCES [dbo].[tblNhaXuatBan] ([MaNXB])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblSach] CHECK CONSTRAINT [FK_tblSach_tblNhaXuatBan1]
GO
ALTER TABLE [dbo].[tblSach_CaBiet]  WITH CHECK ADD  CONSTRAINT [FK_tblSach_CaBiet_tblSach] FOREIGN KEY([MaSach])
REFERENCES [dbo].[tblSach] ([MaSach])
GO
ALTER TABLE [dbo].[tblSach_CaBiet] CHECK CONSTRAINT [FK_tblSach_CaBiet_tblSach]
GO
ALTER TABLE [dbo].[tblSach_LinhVuc]  WITH CHECK ADD  CONSTRAINT [FK_tblSach_LinhVuc_tblLinhVuc] FOREIGN KEY([MaLinhVuc])
REFERENCES [dbo].[tblLinhVuc] ([MaLinhVuc])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblSach_LinhVuc] CHECK CONSTRAINT [FK_tblSach_LinhVuc_tblLinhVuc]
GO
ALTER TABLE [dbo].[tblSach_LinhVuc]  WITH CHECK ADD  CONSTRAINT [FK_tblSach_LinhVuc_tblSach] FOREIGN KEY([MaSach])
REFERENCES [dbo].[tblSach] ([MaSach])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblSach_LinhVuc] CHECK CONSTRAINT [FK_tblSach_LinhVuc_tblSach]
GO
ALTER TABLE [dbo].[tblSach_TacGia]  WITH CHECK ADD  CONSTRAINT [FK_tblSach_TacGia_tblSach] FOREIGN KEY([MaSach])
REFERENCES [dbo].[tblSach] ([MaSach])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblSach_TacGia] CHECK CONSTRAINT [FK_tblSach_TacGia_tblSach]
GO
ALTER TABLE [dbo].[tblSach_TacGia]  WITH CHECK ADD  CONSTRAINT [FK_tblSach_TacGia_tblTacGia] FOREIGN KEY([MaTacGia])
REFERENCES [dbo].[tblTacGia] ([MaTacGia])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblSach_TacGia] CHECK CONSTRAINT [FK_tblSach_TacGia_tblTacGia]
GO
ALTER TABLE [dbo].[tblSach_TheLoai]  WITH CHECK ADD  CONSTRAINT [FK_tblSach_TheLoai_tblSach] FOREIGN KEY([MaSach])
REFERENCES [dbo].[tblSach] ([MaSach])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblSach_TheLoai] CHECK CONSTRAINT [FK_tblSach_TheLoai_tblSach]
GO
ALTER TABLE [dbo].[tblSach_TheLoai]  WITH CHECK ADD  CONSTRAINT [FK_tblSach_TheLoai_tblTheLoai] FOREIGN KEY([MaTheLoai])
REFERENCES [dbo].[tblTheLoai] ([MaTheLoai])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblSach_TheLoai] CHECK CONSTRAINT [FK_tblSach_TheLoai_tblTheLoai]
GO
/****** Object:  StoredProcedure [dbo].[tblCanBo_DS]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 Create proc [dbo].[tblCanBo_DS]
as
 begin
 select * from tblCanBo
end
GO
/****** Object:  StoredProcedure [dbo].[tblCanBo_Lay1]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 Create proc [dbo].[tblCanBo_Lay1]
@MaCanBo nvarchar(30)
as
begin
select * from tblCanBo where MaCanBo=@MaCanBo
end
GO
/****** Object:  StoredProcedure [dbo].[tblCanBo_Sua]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 Create proc [dbo].[tblCanBo_Sua]
 @MaCanBo nvarchar(30),
 @HoVaTen nvarchar(30),
 @QueQuan nvarchar(150),
 @NgaySinh date,
 @urlPhoTo nvarchar(300),
 @MaDonVi nvarchar(30),
 @GioiTinh bit,
 @SoDienThoai nvarchar(30),
 @DiaChiEmail nvarchar(30),
 @GhiChu nvarchar(100),
 @MatKhau nvarchar(30),
 @TrangThai bit
as
 begin
 update  tblCanBo set HoVaTen=@HoVaTen, QueQuan=@QueQuan, NgaySinh=@NgaySinh, urlPhoto=@urlPhoTo, GioiTinh=@GioiTinh, SoDienThoai=@SoDienThoai, DiaChiEMail=@DiaChiEmail, GhiChu=@GhiChu, MatKhau=@MatKhau, TrangThai=@TrangThai where MaCanBo=@MaCanBo and MaDonVi=@MaDonVi
 end
GO
/****** Object:  StoredProcedure [dbo].[tblCanBo_Them]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[tblCanBo_Them]
 @MaCanBo nvarchar(30),
 @HoVaTen nvarchar(30),
 @QueQuan nvarchar(150),
 @NgaySinh date,
 @urlPhoTo nvarchar(300),
 @MaDonVi nvarchar(30),
 @GioiTinh bit,
 @SoDienThoai nvarchar(30),
 @DiaChiEmail nvarchar(30),
 @GhiChu nvarchar(100),
 @MatKhau nvarchar(30),
 @TrangThai bit
 as
 begin
 insert into tblCanBo values(@MaCanBo,@HoVaTen,@QueQuan,@NgaySinh,@urlPhoTo,@MaDonVi,@GioiTinh,@SoDienThoai,@DiaChiEmail,@GhiChu,@MatKhau,@TrangThai)
 end
GO
/****** Object:  StoredProcedure [dbo].[tblCanBo_Xoa]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[tblCanBo_Xoa]
 @MaCanBo nvarchar(30)
 as
 begin
 delete from tblCanBo where MaCanBo=@MaCanBo
 end
GO
/****** Object:  StoredProcedure [dbo].[tblChiTietMuonTra_DS]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 Create proc [dbo].[tblChiTietMuonTra_DS]
as
 begin
 select * from tblChiTietMuonTra
end
GO
/****** Object:  StoredProcedure [dbo].[tblChiTietMuonTra_Lay]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[tblChiTietMuonTra_Lay]
@MaQuaTrinhTraSach int,
@MaSach nvarchar(30),
@MaSoCaBiet nvarchar(30)
as
begin
select * from tblChiTietMuonTra where MaQuaTrinhTraSach=@MaQuaTrinhTraSach and MaSach=@MaSach and MaSoCaBiet=@MaSoCaBiet
end
GO
/****** Object:  StoredProcedure [dbo].[tblChiTietMuonTra_Sua]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[tblChiTietMuonTra_Sua]
@MaQuaTrinhTraSach int,
@MaSach nvarchar(30),
@TinhTrang nvarchar(30),
@MaSoCaBiet nvarchar(30),
@MuonHayTra bit
as
begin
update tblChiTietMuonTra set MaQuaTrinhTraSach=@MaQuaTrinhTraSach,MaSach=@MaSach,TinhTrang=@TinhTrang,MaSoCaBiet=@MaSoCaBiet,MuonHayTra=@MuonHayTra where MaQuaTrinhTraSach=@MaQuaTrinhTraSach and MaSach=@MaSach and MaSoCaBiet=@MaSoCaBiet
end
GO
/****** Object:  StoredProcedure [dbo].[tblChiTietMuonTra_them]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[tblChiTietMuonTra_them]
@MaQuaTrinhTraSach int,
@MaSach nvarchar(30),
@TinhTrang nvarchar(30),
@MaSoCaBiet nvarchar(30),
@MuonHayTra bit
as
begin
insert into tblChiTietMuonTra values(@MaQuaTrinhTraSach,@MaSach,@TinhTrang,@MaSoCaBiet,@MuonHayTra)
end

GO
/****** Object:  StoredProcedure [dbo].[tblChiTietMuonTra_Xoa]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 Create proc [dbo].[tblChiTietMuonTra_Xoa]
@MaQuaTrinhTraSach int,
@MaSach nvarchar(30),
@MaSoCaBiet nvarchar(30)
as
begin
delete from tblChiTietMuonTra where MaQuaTrinhTraSach=@MaQuaTrinhTraSach and MaSach=@MaSach and MaSoCaBiet=@MaSoCaBiet
end
GO
/****** Object:  StoredProcedure [dbo].[tblDonVi_DS]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  Create proc [dbo].[tblDonVi_DS]
as
 begin
 select * from tblDonVi
end
GO
/****** Object:  StoredProcedure [dbo].[tblDonVi_Lay1]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[tblDonVi_Lay1]
@MaDonVi nvarchar(30)
as
begin
select * from tblDonVi where MaDonVi=@MaDonVi
end
GO
/****** Object:  StoredProcedure [dbo].[tblDonVi_Sua]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 Create proc [dbo].[tblDonVi_Sua]
 @MaDonVi nvarchar(30),
 @TenDonVi nvarchar(30),
 @DiaChi nvarchar(50),
 @SoDienThoai nvarchar(30),
 @TruongDonVi nvarchar(30),
 @EMail nvarchar(40),
 @Website nvarchar(40)
as
 begin
 update  tblDonVi set  TenDonVI=@TenDonVi, DiaChi=@DiaChi, SoDienThoai=@SoDienThoai, TruongDonVI=@TruongDonVi, EMail=@EMail, Website=@Website where MaDonVi=@MaDonVi
 end
GO
/****** Object:  StoredProcedure [dbo].[tblDonVi_Them]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[tblDonVi_Them]
 @MaDonVi nvarchar(30),
 @TenDonVi nvarchar(30),
 @DiaChi nvarchar(50),
 @SoDienThoai nvarchar(30),
 @TruongDonVi nvarchar(30),
 @EMail nvarchar(40),
 @Website nvarchar(40)
 as
 begin
 insert into tblDonVi values(@MaDonVi,@TenDonVi,@DiaChi,@SoDienThoai,@TruongDonVi,@EMail,@Website)
 end
GO
/****** Object:  StoredProcedure [dbo].[tblDonVi_Xoa]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[tblDonVi_Xoa]
 @MaDonVi nvarchar(30)
 as
 begin
 delete from tblDonVi where MaDonVi=@MaDonVi
 end
GO
/****** Object:  StoredProcedure [dbo].[tblHSSV_DS]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[tblHSSV_DS]
as
 begin
 select * from tblHSSV
end
GO
/****** Object:  StoredProcedure [dbo].[tblHSSV_Lay1]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[tblHSSV_Lay1]
@MaHSSV nvarchar(30)
as
begin
select * from tblHSSV where MaHSSV=@MaHSSV
end
GO
/****** Object:  StoredProcedure [dbo].[tblHSSV_Sua]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[tblHSSV_Sua]
@MaHSSV nvarchar(30),
@HoTen nvarchar(30),
@MaLop nvarchar(30),
@GioiTinh bit,
@NgaySinh date,
@NoiSinh nvarchar(100),
@QueQuan nvarchar(100),
@NoiOHienNay nvarchar(100),
@DienThoai nvarchar(30),
@EMail nvarchar(30),
@urlPhoto nvarchar(150),
@GhiChu nvarchar(max),
@MatKhau nvarchar(30),
@TrangThai bit
as
begin
update tblHSSV set HoTen=@HoTen,MaLop=@MaLop,GioiTinh=@GioiTinh,NgaySinh=@NgaySinh,NoiSinh=@NoiSinh,QueQuan=@QueQuan,NoiOHienNay=@NoiOHienNay,DienThoai=@DienThoai,EMail=@EMail,urlPhoto=@urlPhoto,GhiChu=@GhiChu,MatKhau=@MatKhau,TrangThai=@TrangThai where MaHSSV=@MaHSSV 
end
GO
/****** Object:  StoredProcedure [dbo].[tblHSSV_Them]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[tblHSSV_Them]
@MaHSSV nvarchar(30),
@HoTen nvarchar(30),
@MaLop nvarchar(30),
@GioiTinh bit,
@NgaySinh date,
@NoiSinh nvarchar(100),
@QueQuan nvarchar(100),
@NoiOHienNay nvarchar(100),
@DienThoai nvarchar(30),
@EMail nvarchar(30),
@urlPhoto nvarchar(150),
@GhiChu nvarchar(max),
@MatKhau nvarchar(30),
@TrangThai bit
as
begin
insert into tblHSSV values(@MaHSSV,@HoTen,@MaLop,@GioiTinh,@NgaySinh,@NoiSinh,@QueQuan,@NoiOHienNay,@DienThoai,@EMail,@urlPhoto,@GhiChu,@MatKhau,@TrangThai)
end
GO
/****** Object:  StoredProcedure [dbo].[tblHSSV_Xoa]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE proc [dbo].[tblHSSV_Xoa]
@MaHSSV nvarchar(30)
as
begin
delete from tblHSSV where MaHSSV=@MaHSSV
end
GO
/****** Object:  StoredProcedure [dbo].[tblLinhVuc_DS]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[tblLinhVuc_DS]
as
begin
select * from tblLinhVuc
end
GO
/****** Object:  StoredProcedure [dbo].[tblLinhVuc_Lay]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[tblLinhVuc_Lay]
@MaLinhVuc nvarchar(30)
as
begin
select * from tblLinhVuc where MaLinhVuc=@MaLinhVuc
end
GO
/****** Object:  StoredProcedure [dbo].[tblLinhVuc_Sua]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[tblLinhVuc_Sua]
@MaLinhVuc nvarchar(30),
@TenLinhVuc nvarchar(50),
@GhiChu nvarchar(100)
as
begin
update tblLinhVuc set TenLinhVuc=@TenLinhVuc,GhiChu=@GhiChu where MaLinhVuc=@MaLinhVuc
end
GO
/****** Object:  StoredProcedure [dbo].[tblLinhVuc_Them]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[tblLinhVuc_Them]
@MaLinhVuc nvarchar(30),
@TenLinhVuc nvarchar(50),
@GhiChu nvarchar(100)
as
begin
insert into tblLinhVuc values (@MaLinhVuc,@TenLinhVuc,@GhiChu)
end
GO
/****** Object:  StoredProcedure [dbo].[tblLinhVuc_Xoa]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[tblLinhVuc_Xoa]
@MaLinhVuc nvarchar(30)
as
begin
delete from tblLinhVuc where MaLinhVuc=@MaLinhVuc
end
GO
/****** Object:  StoredProcedure [dbo].[tblLopHoc_DS]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[tblLopHoc_DS]
as
 begin
 select * from tblLopHoc
end
GO
/****** Object:  StoredProcedure [dbo].[tblLopHoc_Lay1]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[tblLopHoc_Lay1]
@MaLop nvarchar (30)
as
begin
select * from tblLopHoc where MaLop=@MaLop
end
GO
/****** Object:  StoredProcedure [dbo].[tblLopHoc_Sua]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[tblLopHoc_Sua]
@MaLop nvarchar(30),
@MaKhoa nvarchar(30),
@TenLop nvarchar(30),
@HeDaoTao nvarchar(30),
@Khoa nvarchar (30)
as
begin
update tblLopHoc set MaKhoa=@MaKhoa,TenLop=@TenLop,HeDaoTao=@HeDaoTao,Khoa=@Khoa where MaLop=@MaLop
end
GO
/****** Object:  StoredProcedure [dbo].[tblLopHoc_Them]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[tblLopHoc_Them]
@MaLop nvarchar(30),
@MaKhoa nvarchar(30),
@TenLop nvarchar(30),
@HeDaoTao nvarchar(30),
@Khoa nvarchar (30)
as
begin
Insert into tblLopHoc Values (@MaLop,@MaKhoa,@TenLop,@HeDaoTao,@Khoa)
end
GO
/****** Object:  StoredProcedure [dbo].[tblLopHoc_Xoa]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[tblLopHoc_Xoa]
@MaLop nvarchar (30)
as
begin
delete from tblLopHoc Where MaLop=@MaLop
end
GO
/****** Object:  StoredProcedure [dbo].[tblNgonNgu_DS]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[tblNgonNgu_DS]
as
 begin
 select * from tblNgonNgu
end
GO
/****** Object:  StoredProcedure [dbo].[tblNgonNgu_Lay1]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[tblNgonNgu_Lay1]
@MaNgonNgu nvarchar(30)
as
begin
select * from tblNgonNgu where MaNgonNgu=@MaNgonNgu
end

GO
/****** Object:  StoredProcedure [dbo].[tblNgonNgu_Sua]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 Create proc [dbo].[tblNgonNgu_Sua]
@MaNgonNgu nvarchar(30),
@TenNgonNgu nvarchar(30)
as
 begin
 update  tblNgonNgu set TenNgonNgu=@TenNgonNgu where MaNgonNgu=@MaNgonNgu
 end
GO
/****** Object:  StoredProcedure [dbo].[tblNgonNgu_Them]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 Create proc [dbo].[tblNgonNgu_Them]
@MaNgonNgu nvarchar(30),
@TenNgonNgu nvarchar(30)
as
 begin
 insert into tblNgonNgu values(@MaNgonNgu,@TenNgonNgu)
 end
GO
/****** Object:  StoredProcedure [dbo].[tblNgonNgu_Xoa]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 Create proc [dbo].[tblNgonNgu_Xoa]
 @MaNgonNgu nvarchar(30)
 as
 begin
 delete from tblNgonNgu where MaNgonNgu=@MaNgonNgu
 end
GO
/****** Object:  StoredProcedure [dbo].[tblNhaXuatBan_DS]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  Create proc [dbo].[tblNhaXuatBan_DS]
as
 begin
 select * from tblNhaXuatBan
end
GO
/****** Object:  StoredProcedure [dbo].[tblNhaXuatBan_Lay1]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[tblNhaXuatBan_Lay1]
@MaNXB nvarchar(30)
as
begin
select * from tblNhaXuatBan where MaNXB=@MaNXB
end

GO
/****** Object:  StoredProcedure [dbo].[tblNhaXuatBan_Sua]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 Create proc [dbo].[tblNhaXuatBan_Sua]
@MaNXB nvarchar(30),
@TenNXB nvarchar(50),
@urlLogo nvarchar(150),
@GhiChu nvarchar(200)
as
 begin
 update  tblNhaXuatBan set TenNXB=@TenNXB, urlLogo=@urlLogo, GhiChu=@GhiChu where MaNXB=@MaNXB
 end
GO
/****** Object:  StoredProcedure [dbo].[tblNhaXuatBan_Them]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[tblNhaXuatBan_Them]
@MaNXB nvarchar(30),
@TenNXB nvarchar(50),
@urlLogo nvarchar(150),
@GhiChu nvarchar(200)
as
 begin
 insert into tblNhaXuatBan values(@MaNXB,@TenNXB,@urlLogo,@GhiChu)
 end
GO
/****** Object:  StoredProcedure [dbo].[tblNhaXuatBan_Xoa]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 Create proc [dbo].[tblNhaXuatBan_Xoa]
 @MaNXB nvarchar(30)
 as
 begin
 delete from tblNhaXuatBan where MaNXB=@MaNXB
 end
GO
/****** Object:  StoredProcedure [dbo].[tblQuaTrinhMuonTra_DS]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 Create proc [dbo].[tblQuaTrinhMuonTra_DS]
as
 begin
 select * from tblQuaTrinhMuonTra
end
GO
/****** Object:  StoredProcedure [dbo].[tblQuaTrinhMuonTra_Lay]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[tblQuaTrinhMuonTra_Lay]
@MaQuaTrinhMuonTra int
as
begin
select * from tblQuaTrinhMuonTra where MaQuaTrinhMuonTra=@MaQuaTrinhMuonTra
end
GO
/****** Object:  StoredProcedure [dbo].[tblQuaTrinhMuonTra_Sua]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[tblQuaTrinhMuonTra_Sua]
@MaQuaTrinhMuonTra int,
@MaCanBo_HSSV nvarchar(30),
@MaThuThu nvarchar(30),
@ThoiGianMuonTra date,
@TienNhanVe int,
@TienDatCoc int,
@XuPhatNeuCo nvarchar(MAX),
@GhiChu nvarchar(MAX)
as
begin
update tblQuaTrinhMuonTra set MaCanBo_HSSV=@MaCanBo_HSSV,MaThuThu=@MaThuThu,ThoiGianMuonTra=@ThoiGianMuonTra,TienNhanVe=@TienNhanVe,TienDatCoc=@TienDatCoc,XuPhatNeuCo=@XuPhatNeuCo,GhiChu=@GhiChu where MaQuaTrinhMuonTra=@MaQuaTrinhMuonTra
end
GO
/****** Object:  StoredProcedure [dbo].[tblQuaTrinhMuonTra_them]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[tblQuaTrinhMuonTra_them]
@MaCanBo_HSSV nvarchar(30),
@MaThuThu nvarchar(30),
@ThoiGianMuonTra date,
@TienNhanVe int,
@TienDatCoc int,
@XuPhatNeuCo nvarchar(max),
@GhiChu nvarchar(max)
as
begin
insert into tblQuaTrinhMuonTra values(@MaCanBo_HSSV,@MaThuThu,@ThoiGianMuonTra,@TienNhanVe,@TienDatCoc,@XuPhatNeuCo,@GhiChu)
end
GO
/****** Object:  StoredProcedure [dbo].[tblQuaTrinhMuonTra_Xoa]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[tblQuaTrinhMuonTra_Xoa]
@MaQuaTrinhMuonTra int
as
begin
delete from tblQuaTrinhMuonTra where @MaQuaTrinhMuonTra=@MaQuaTrinhMuonTra
end
GO
/****** Object:  StoredProcedure [dbo].[tblSach_CaBiet_DS]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[tblSach_CaBiet_DS]
as
begin
select * from tblSach_CaBiet
end
GO
/****** Object:  StoredProcedure [dbo].[tblSach_CaBiet_Lay]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[tblSach_CaBiet_Lay]
@MaSach nvarchar(30),
@MaSoCaBiet nvarchar(30)
as
begin
select * from tblSach_CaBiet where MaSach=@MaSach and MaSoCaBiet=@MaSoCaBiet
end
GO
/****** Object:  StoredProcedure [dbo].[tblSach_CaBiet_Sua]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[tblSach_CaBiet_Sua]
@MaSach nvarchar(30),
@MaSoCaBiet nvarchar(30),
@TinhTrang bit,
@GhiChu nvarchar(max)
as
begin
update tblSach_CaBiet set TinhTrang=@TinhTrang,GhiChu=@GhiChu where MaSach=@MaSach and MaSoCaBiet=@MaSoCaBiet
end
GO
/****** Object:  StoredProcedure [dbo].[tblSach_CaBiet_Them]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[tblSach_CaBiet_Them]
@MaSach nvarchar(30),
@MaSoCaBiet nvarchar(30),
@TinhTrang bit,
@GhiChu nvarchar(max)
as
begin
insert into tblSach_CaBiet values (@MaSach,@MaSoCaBiet,@TinhTrang,@GhiChu)
end
GO
/****** Object:  StoredProcedure [dbo].[tblSach_CaBiet_Xoa]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[tblSach_CaBiet_Xoa]
@MaSach nvarchar(30),
@MaSoCaBiet nvarchar(30)
as
begin
delete from tblSach_CaBiet where MaSach=@MaSach and MaSoCaBiet=@MaSoCaBiet
end
GO
/****** Object:  StoredProcedure [dbo].[tblSach_DS]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[tblSach_DS]
as
 begin
 select * from tblSach
end
GO
/****** Object:  StoredProcedure [dbo].[tblSach_Lay1]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[tblSach_Lay1]
@MaSach nvarchar(30)
as
begin
select * from tblSach where MaSach=@MaSach
end
GO
/****** Object:  StoredProcedure [dbo].[tblSach_LinhVuc_DS]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[tblSach_LinhVuc_DS]
as
begin
select * from tblSach_LinhVuc
end
GO
/****** Object:  StoredProcedure [dbo].[tblSach_LinhVuc_Lay]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[tblSach_LinhVuc_Lay]
@MaSach nvarchar(30),
@MaLinhVuc nvarchar(30)
as
begin
select * from tblSach_LinhVuc where MaSach=@MaSach and MaLinhVuc=@MaLinhVuc
end
GO
/****** Object:  StoredProcedure [dbo].[tblSach_LinhVuc_Them]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[tblSach_LinhVuc_Them]
@MaSach nvarchar(30),
@MaLinhVuc nvarchar(30)
as
begin
insert into tblSach_LinhVuc values (@MaSach,@MaLinhVuc)
end
GO
/****** Object:  StoredProcedure [dbo].[tblSach_LinhVuc_Xoa]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[tblSach_LinhVuc_Xoa]
@MaSach nvarchar(30),
@MaLinhVuc nvarchar(30)
as
begin
delete from tblSach_LinhVuc where MaSach=@MaSach and MaLinhVuc=@MaLinhVuc
end
GO
/****** Object:  StoredProcedure [dbo].[tblSach_Sua]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[tblSach_Sua]
@MaSach nvarchar(30),
@MaPhanLoai varchar(15),
@TenSach nvarchar(150),
@MaNXB nvarchar(30),
@LanXuatBan smallint,
@ISBN_ISSN nvarchar(20),
@SoTrang int,
@Tap smallint,
@NamXuatBan int,
@NuocXuatBan nvarchar(30),
@KichThuoc nvarchar(10),
@urlAnhBia nvarchar(200),
@DuongDanBanScan nchar(10),
@GiaBia float,
@MaNgonNgu nvarchar(30),
@TomTatNoiDung nvarchar(max),
@TuKhoa nvarchar(50),
@SachDichHayKhong bit,
@NgonNguBanDau nvarchar(30),
@TinhTrang bit,
@GhiChu nvarchar(max)
as
begin
update tblSach set MaPhanLoai=@MaPhanLoai, TenSach=@TenSach, MaNXB=@MaNXB, LanXuatBan=@LanXuatBan, ISBN_ISSN=@ISBN_ISSN, SoTrang=@SoTrang, Tap=@Tap, NamXuatBan=@NamXuatBan, NuocXuatBan=@NuocXuatBan, KichThuoc=@KichThuoc, urlAnhBia=@urlAnhBia, DuongDanBanScan=@DuongDanBanScan, GiaBia=@GiaBia, MaNgonNgu=@MaNgonNgu, TomTatNoiDung=@TomTatNoiDung, TuKhoa=@TuKhoa, SachDichHayKhong=@SachDichHayKhong, NgonNguBanDau=@NgonNguBanDau, TinhTrang=@TinhTrang, GhiChu=@GhiChu where MaSach=@MaSach
end
GO
/****** Object:  StoredProcedure [dbo].[tblSach_TacGia_DS]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[tblSach_TacGia_DS]
as
 begin
 select * from tblSach_TacGia
end
GO
/****** Object:  StoredProcedure [dbo].[tblSach_TacGia_Lay1]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[tblSach_TacGia_Lay1]
@MaSach nvarchar(30),
@MaTacGia nvarchar(30)
as
begin
select * from tblSach_TacGia where MaSach=@MaSach or MaTacGia=@MaTacGia
end
GO
/****** Object:  StoredProcedure [dbo].[tblSach_TacGia_Them]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[tblSach_TacGia_Them]
@MaSach nvarchar(30),
@MaTacGia nvarchar(30)
as
begin
insert into tblSach_TacGia values(@MaSach,@MaTacGia)
end
GO
/****** Object:  StoredProcedure [dbo].[tblSach_TacGia_Xoa]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[tblSach_TacGia_Xoa]
@MaSach nvarchar(30),
@MaTacGia nvarchar(30)
as
begin
delete tblSach_TacGia where MaSach=@MaSach and MaTacGia=@MaTacGia
end

GO
/****** Object:  StoredProcedure [dbo].[tblSach_TheLoai_DS]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  Create proc [dbo].[tblSach_TheLoai_DS]
as
 begin
 select * from tblSach_TheLoai
end
GO
/****** Object:  StoredProcedure [dbo].[tblSach_TheLoai_Lay1]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 Create proc [dbo].[tblSach_TheLoai_Lay1]
@MaSach nvarchar(30),
@MaTheLoai nvarchar(30)
as
begin
select * from tblSach_TheLoai where MaSach=@MaSach and MaTheLoai=@MaTheLoai
end
GO
/****** Object:  StoredProcedure [dbo].[tblSach_TheLoai_Them]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[tblSach_TheLoai_Them]
@MaSach nvarchar(30),
@MaTheLoai nvarchar(30)
as
begin
insert into tblSach_TheLoai values(@MaSach, @MaTheLoai)
end
GO
/****** Object:  StoredProcedure [dbo].[tblSach_TheLoai_Xoa]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[tblSach_TheLoai_Xoa]
@MaSach nvarchar(30),
@MaTheLoai nvarchar(30)
as
begin
delete tblSach_TheLoai where MaSach=@MaSach and MaTheLoai=@MaTheLoai
end
GO
/****** Object:  StoredProcedure [dbo].[tblSach_Them]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[tblSach_Them]
@MaSach nvarchar(30),
@MaPhanLoai varchar(15),
@TenSach nvarchar(150),
@MaNXB nvarchar(30),
@LanXuatBan smallint,
@ISBN_ISSN nvarchar(20),
@SoTrang int,
@Tap smallint,
@NamXuatBan int,
@NuocXuatBan nvarchar(30),
@KichThuoc nvarchar(10),
@urlAnhBia nvarchar(200),
@DuongDanBanScan nchar(10),
@GiaBia float,
@MaNgonNgu nvarchar(30),
@TomTatNoiDung nvarchar(max),
@TuKhoa nvarchar(50),
@SachDichHayKhong bit,
@NgonNguBanDau nvarchar(30),
@TinhTrang bit,
@GhiChu nvarchar(max)
as
begin
insert into tblSach values(@MaSach, @MaPhanLoai, @TenSach, @MaNXB, @LanXuatBan, @ISBN_ISSN, @SoTrang
, @Tap, @NamXuatBan, @NuocXuatBan, @KichThuoc, @urlAnhBia, @DuongDanBanScan, @GiaBia, @MaNgonNgu, @TomTatNoiDung, @TuKhoa,
@SachDichHayKhong, @NgonNguBanDau, @TinhTrang, @GhiChu)
end
GO
/****** Object:  StoredProcedure [dbo].[tblSach_Xoa]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[tblSach_Xoa]
@MaSach nvarchar(30)
 as
 begin
 delete from tblSach where MaSach=@MaSach
 end
GO
/****** Object:  StoredProcedure [dbo].[tblTacGia_DS]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[tblTacGia_DS]
as
 begin
 select * from tblTacGia
end
GO
/****** Object:  StoredProcedure [dbo].[tblTacGia_Lay1]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[tblTacGia_Lay1]
@MaTacGia nvarchar(30)
as
begin
select * from tblTacGia where MaTacGia=@MaTacGia
end
GO
/****** Object:  StoredProcedure [dbo].[tblTacGia_Sua]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 Create proc [dbo].[tblTacGia_Sua]
@MaTacGia nvarchar(30),
@HoTenTacGia nvarchar(30),
@MoTa nvarchar(100)
as
 begin
 update  tblTacGia set HoTenTacGia=@HoTenTacGia, MoTa=@MoTa where MaTacGia=@MaTacGia
 end
GO
/****** Object:  StoredProcedure [dbo].[tblTacGia_Them]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[tblTacGia_Them]
@MaTacGia nvarchar(30),
@HoTenTacGia nvarchar(30),
@MoTa nvarchar(100)
as
 begin
 insert into tblTacGia values(@MaTacGia,@HoTenTacGia,@MoTa)
 end
GO
/****** Object:  StoredProcedure [dbo].[tblTacGia_Xoa]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[tblTacGia_Xoa]
 @MaTacGia nvarchar(30)
 as
 begin
 delete from tblTacGia where MaTacGia=@MaTacGia
 end
GO
/****** Object:  StoredProcedure [dbo].[tblTaiKhoan_DS]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[tblTaiKhoan_DS]
as
 begin
 select * from tblTaiKhoan
end
GO
/****** Object:  StoredProcedure [dbo].[tblTaiKhoan_Lay1]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[tblTaiKhoan_Lay1]
@TenDangNhap nvarchar(30)
as
begin
select * from tblTaiKhoan where TenDangNhap=@TenDangNhap
end
GO
/****** Object:  StoredProcedure [dbo].[tblTaiKhoan_Sua]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 Create proc [dbo].[tblTaiKhoan_Sua]
@TenDangNhap nvarchar(30),
@HoVaTen nvarchar(30),
@MatKhau nvarchar(30),
@QuyenHan smallint,
@TrangThai bit,
@MoTa nvarchar(50)
as
 begin
 update  tblTaiKhoan set HoVaTen=@HoVaTen,MatKhau=@MatKhau, QuyenHan=@QuyenHan, TrangThai=@TrangThai, MoTa=@MoTa where TenDangNhap=@TenDangNhap
 end
GO
/****** Object:  StoredProcedure [dbo].[tblTaiKhoan_Them]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 Create proc [dbo].[tblTaiKhoan_Them]
@TenDangNhap nvarchar(30),
@HoVaTen nvarchar(30),
@MatKhau nvarchar(30),
@QuyenHan smallint,
@TrangThai bit,
@MoTa nvarchar(50)
as
 begin
 insert into tblTaiKhoan values(@TenDangNhap,@HoVaTen,@MatKhau,@QuyenHan,@TrangThai,@MoTa)
 end
GO
/****** Object:  StoredProcedure [dbo].[tblTaiKhoan_Xoa]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[tblTaiKhoan_Xoa]
 @TenDangNhap nvarchar(30)
 as
 begin
 delete from tblTaiKhoan where TenDangNhap=@TenDangNhap
 end
GO
/****** Object:  StoredProcedure [dbo].[tblTheLoai_DS]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[tblTheLoai_DS]
 as
 begin
 select * from tblTheLoai
end
GO
/****** Object:  StoredProcedure [dbo].[tblTheLoai_Lay1]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  Create proc [dbo].[tblTheLoai_Lay1]
@MaTheLoai nvarchar(30)
as
begin
select * from tblTheLoai where MaTheLoai=@MaTheLoai
end

GO
/****** Object:  StoredProcedure [dbo].[tblTheLoai_Sua]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 Create proc [dbo].[tblTheLoai_Sua]
@MaTheLoai nvarchar(30),
@TenTheLoai nvarchar(50),
@MoTa nvarchar(100)
as
 begin
 update  tblTheLoai set TenTheLoai=@TenTheLoai,MoTa=@MoTa where MaTheLoai=@MaTheLoai
 end
GO
/****** Object:  StoredProcedure [dbo].[tblTheLoai_Them]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[tblTheLoai_Them]
@MaTheLoai nvarchar(30),
@TenTheLoai nvarchar(50),
@MoTa nvarchar(100)
as
 begin
 insert into tblTheLoai values(@MaTheLoai,@TenTheLoai,@MoTa)
 end
GO
/****** Object:  StoredProcedure [dbo].[tblTheLoai_Xoa]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[tblTheLoai_Xoa]
 @MaTheLoai nvarchar(30)
 as
 begin
 delete from tblTheLoai where MaTheLoai=@MaTheLoai
 end
GO
/****** Object:  StoredProcedure [dbo].[tblThuThu_DS]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[tblThuThu_DS]
as
 begin
 select * from tblThuThu
end
GO
/****** Object:  StoredProcedure [dbo].[tblThuThu_Lay1]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[tblThuThu_Lay1]
@MaThuThu nvarchar(30)
as
begin
select * from tblThuThu where MaThuThu=@MaThuThu
end
GO
/****** Object:  StoredProcedure [dbo].[tblThuThu_Sua]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE proc [dbo].[tblThuThu_Sua]
@MaThuThu nvarchar(30),
@HoTen nvarchar(30),
@MatKhau nvarchar(30),
@DiaChiEmail nvarchar(30),
@DienThoai nvarchar(30),
@TrangThai bit,
@urlPhoto nvarchar(150),
@GhiChu nvarchar(50)
as
 begin
 update  tblThuThu set HoTen=@HoTen,MatKhau=@MatKhau,DiaChiEmail=@DiaChiEmail,DienThoai=@DienThoai,TrangThai=@TrangThai,urlPhoto=@urlPhoto,GhiChu=@GhiChu where MaThuThu=@MaThuThu
 end
GO
/****** Object:  StoredProcedure [dbo].[tblThuThu_Them]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[tblThuThu_Them]
@MaThuThu nvarchar(30),
@HoTen nvarchar(30),
@MatKhau nvarchar(30),
@DiaChiEmail nvarchar(30),
@DienThoai nvarchar(30),
@TrangThai bit,
@urlPhoto nvarchar(150),
@GhiChu nvarchar(50)
as
 begin
 insert into tblThuThu values(@MaThuThu,@HoTen,@MatKhau,@DiaChiEmail,@DienThoai,@TrangThai,@urlPhoto,@GhiChu)
 end
GO
/****** Object:  StoredProcedure [dbo].[tblThuThu_Xoa]    Script Date: 5/7/2016 10:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE proc [dbo].[tblThuThu_Xoa]
@MaThuThu nvarchar(30)
 as
 begin
 delete from tblThuThu where MaThuThu=@MaThuThu
 end
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Dịch hay ko!?. 0=Không dịch, 1=Dịch từ ngôn ngữ khác (NgonNguBanDau)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblSach', @level2type=N'COLUMN',@level2name=N'SachDichHayKhong'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0=Không sẵn có để mượn; 1=Sẵn để mượn' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblSach', @level2type=N'COLUMN',@level2name=N'TinhTrang'
GO
USE [master]
GO
ALTER DATABASE [ELib] SET  READ_WRITE 
GO
