USE [master]
GO
/****** Object:  Database [ELib]    Script Date: 04/05/2016 23:17:05 ******/
CREATE DATABASE [ELib]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ELib', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ELib.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ELib_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ELib_log.ldf' , SIZE = 3456KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ELib] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ELib].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ELib] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ELib] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ELib] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ELib] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ELib] SET ARITHABORT OFF 
GO
ALTER DATABASE [ELib] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ELib] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ELib] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ELib] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ELib] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ELib] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ELib] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ELib] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ELib] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ELib] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ELib] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ELib] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ELib] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ELib] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ELib] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ELib] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ELib] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ELib] SET RECOVERY FULL 
GO
ALTER DATABASE [ELib] SET  MULTI_USER 
GO
ALTER DATABASE [ELib] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ELib] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ELib] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ELib] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ELib] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ELib', N'ON'
GO
USE [ELib]
GO
/****** Object:  UserDefinedTableType [dbo].[TableType]    Script Date: 04/05/2016 23:17:05 ******/
CREATE TYPE [dbo].[TableType] AS TABLE(
	[LocationName] [nvarchar](100) NULL
)
GO
/****** Object:  UserDefinedFunction [dbo].[SinhMa]    Script Date: 04/05/2016 23:17:05 ******/
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
/****** Object:  Table [dbo].[tblCanBo]    Script Date: 04/05/2016 23:17:05 ******/
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
/****** Object:  Table [dbo].[tblChiTietMuonTra]    Script Date: 04/05/2016 23:17:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblChiTietMuonTra](
	[MaQuaTrinhTraSach] [int] NOT NULL,
	[MaSach] [nvarchar](30) NOT NULL,
	[TinhTrang] [nvarchar](30) NULL,
 CONSTRAINT [PK_tblChiTietTraSach] PRIMARY KEY CLUSTERED 
(
	[MaQuaTrinhTraSach] ASC,
	[MaSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblDonVi]    Script Date: 04/05/2016 23:17:05 ******/
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
/****** Object:  Table [dbo].[tblHSSV]    Script Date: 04/05/2016 23:17:05 ******/
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
/****** Object:  Table [dbo].[tblLinhVuc]    Script Date: 04/05/2016 23:17:05 ******/
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
/****** Object:  Table [dbo].[tblLopHoc]    Script Date: 04/05/2016 23:17:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLopHoc](
	[MaLop] [nvarchar](30) NOT NULL,
	[MaKhoa] [nvarchar](30) NOT NULL,
	[TenLop] [nvarchar](30) NOT NULL,
	[MaHeDaoTao] [nvarchar](30) NULL,
	[Khoa] [nvarchar](30) NULL,
 CONSTRAINT [PK_tblLopHoc] PRIMARY KEY CLUSTERED 
(
	[MaLop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblNgonNgu]    Script Date: 04/05/2016 23:17:05 ******/
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
/****** Object:  Table [dbo].[tblNhaXuatBan]    Script Date: 04/05/2016 23:17:05 ******/
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
/****** Object:  Table [dbo].[tblQuaTrinhMuonTra]    Script Date: 04/05/2016 23:17:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblQuaTrinhMuonTra](
	[MaQuaTrinhMuonTra] [int] IDENTITY(1,1) NOT NULL,
	[MaCanBo_HSSV] [nvarchar](30) NOT NULL,
	[MaThuThu] [nvarchar](30) NULL,
	[MuonHayTra] [bit] NULL,
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
/****** Object:  Table [dbo].[tblSach]    Script Date: 04/05/2016 23:17:05 ******/
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
	[SoLuong] [int] NULL,
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
	[SachDichHayKhong] [bit] NULL,
	[NgonNguBanDau] [nvarchar](30) NULL,
	[TinhTrang] [bit] NULL,
	[MaThuThu] [nvarchar](30) NOT NULL,
	[GhiChu] [nvarchar](max) NULL,
 CONSTRAINT [PK_tblSach] PRIMARY KEY CLUSTERED 
(
	[MaSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblSach_CaBiet]    Script Date: 04/05/2016 23:17:05 ******/
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
/****** Object:  Table [dbo].[tblSach_LinhVuc]    Script Date: 04/05/2016 23:17:05 ******/
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
/****** Object:  Table [dbo].[tblSach_TacGia]    Script Date: 04/05/2016 23:17:05 ******/
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
/****** Object:  Table [dbo].[tblSach_TheLoai]    Script Date: 04/05/2016 23:17:05 ******/
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
/****** Object:  Table [dbo].[tblTacGia]    Script Date: 04/05/2016 23:17:05 ******/
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
/****** Object:  Table [dbo].[tblTaiKhoan]    Script Date: 04/05/2016 23:17:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTaiKhoan](
	[TenDangNhap] [nvarchar](30) NOT NULL,
	[HoVaTen] [nvarchar](30) NOT NULL,
	[MatKhau] [nvarchar](30) NOT NULL,
	[QuyenHan] [smallint] NULL,
	[TrangThai] [bit] NULL,
	[MoTa] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblTaiKhoan] PRIMARY KEY CLUSTERED 
(
	[TenDangNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblTheLoai]    Script Date: 04/05/2016 23:17:05 ******/
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
/****** Object:  Table [dbo].[tblThuThu]    Script Date: 04/05/2016 23:17:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblThuThu](
	[MaThuThu] [nvarchar](30) NOT NULL,
	[HoTen] [nvarchar](30) NOT NULL,
	[MatKhau] [nvarchar](30) NULL,
	[QuyenHan] [smallint] NULL,
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
INSERT [dbo].[tblTheLoai] ([MaTheLoai], [TenTheLoai], [MoTa]) VALUES (N'2', N'Thể loại 2', NULL)
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_tblSach_CaBiet]    Script Date: 04/05/2016 23:17:05 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_tblSach_CaBiet] ON [dbo].[tblSach_CaBiet]
(
	[MaSoCaBiet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblSach] ADD  CONSTRAINT [DF_tblSach_SachDichHayKhong]  DEFAULT ((0)) FOR [SachDichHayKhong]
GO
ALTER TABLE [dbo].[tblTaiKhoan] ADD  CONSTRAINT [DF_tblTaiKhoan_QuyenHan]  DEFAULT ((0)) FOR [QuyenHan]
GO
ALTER TABLE [dbo].[tblTaiKhoan] ADD  CONSTRAINT [DF_tblTaiKhoan_TrangThai]  DEFAULT ((0)) FOR [TrangThai]
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
ALTER TABLE [dbo].[tblChiTietMuonTra]  WITH CHECK ADD  CONSTRAINT [FK_tblChiTietTraSach_tblSach] FOREIGN KEY([MaSach])
REFERENCES [dbo].[tblSach_CaBiet] ([MaSoCaBiet])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblChiTietMuonTra] CHECK CONSTRAINT [FK_tblChiTietTraSach_tblSach]
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Dịch hay ko!?. 0=Không dịch, 1=Dịch từ ngôn ngữ khác (NgonNguBanDau)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblSach', @level2type=N'COLUMN',@level2name=N'SachDichHayKhong'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0=Không sẵn có để mượn; 1=Sẵn để mượn' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblSach', @level2type=N'COLUMN',@level2name=N'TinhTrang'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cho biết ai là người nhập sách này' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblSach', @level2type=N'COLUMN',@level2name=N'MaThuThu'
GO
USE [master]
GO
ALTER DATABASE [ELib] SET  READ_WRITE 
GO
