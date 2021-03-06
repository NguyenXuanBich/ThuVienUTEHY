USE [master]
GO
/****** Object:  Database [ELib]    Script Date: 8/13/2017 10:27:11 AM ******/
CREATE DATABASE [ELib]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ELib', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ELib.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ELib_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ELib_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ELib] SET COMPATIBILITY_LEVEL = 120
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
ALTER DATABASE [ELib] SET  ENABLE_BROKER 
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
/****** Object:  UserDefinedTableType [dbo].[TableType]    Script Date: 8/13/2017 10:27:12 AM ******/
CREATE TYPE [dbo].[TableType] AS TABLE(
	[LocationName] [nvarchar](100) NULL
)
GO
/****** Object:  UserDefinedFunction [dbo].[SinhMa]    Script Date: 8/13/2017 10:27:12 AM ******/
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
/****** Object:  Table [dbo].[tblCanBo]    Script Date: 8/13/2017 10:27:12 AM ******/
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
/****** Object:  Table [dbo].[tblChiTietMuonTra]    Script Date: 8/13/2017 10:27:12 AM ******/
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
/****** Object:  Table [dbo].[tblDonVi]    Script Date: 8/13/2017 10:27:12 AM ******/
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
/****** Object:  Table [dbo].[tblHSSV]    Script Date: 8/13/2017 10:27:12 AM ******/
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
/****** Object:  Table [dbo].[tblLinhVuc]    Script Date: 8/13/2017 10:27:12 AM ******/
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
/****** Object:  Table [dbo].[tblLopHoc]    Script Date: 8/13/2017 10:27:12 AM ******/
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
/****** Object:  Table [dbo].[tblNgonNgu]    Script Date: 8/13/2017 10:27:12 AM ******/
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
/****** Object:  Table [dbo].[tblNhaXuatBan]    Script Date: 8/13/2017 10:27:12 AM ******/
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
/****** Object:  Table [dbo].[tblQuaTrinhMuonTra]    Script Date: 8/13/2017 10:27:12 AM ******/
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
/****** Object:  Table [dbo].[tblSach]    Script Date: 8/13/2017 10:27:12 AM ******/
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
/****** Object:  Table [dbo].[tblSach_CaBiet]    Script Date: 8/13/2017 10:27:12 AM ******/
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
/****** Object:  Table [dbo].[tblSach_LinhVuc]    Script Date: 8/13/2017 10:27:12 AM ******/
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
/****** Object:  Table [dbo].[tblSach_TacGia]    Script Date: 8/13/2017 10:27:12 AM ******/
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
/****** Object:  Table [dbo].[tblSach_TheLoai]    Script Date: 8/13/2017 10:27:12 AM ******/
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
/****** Object:  Table [dbo].[tblTacGia]    Script Date: 8/13/2017 10:27:12 AM ******/
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
/****** Object:  Table [dbo].[tblTaiKhoan]    Script Date: 8/13/2017 10:27:12 AM ******/
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
/****** Object:  Table [dbo].[tblTheLoai]    Script Date: 8/13/2017 10:27:12 AM ******/
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
/****** Object:  Table [dbo].[tblThuThu]    Script Date: 8/13/2017 10:27:12 AM ******/
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
INSERT [dbo].[tblTaiKhoan] ([TenDangNhap], [HoVaTen], [MatKhau], [QuyenHan], [TrangThai], [MoTa]) VALUES (N'Bich', N'Bich', N'12345', 1, 1, N'1')
INSERT [dbo].[tblThuThu] ([MaThuThu], [HoTen], [MatKhau], [QuyenHan], [DiaChiEmail], [DienThoai], [TrangThai], [urlPhoto], [GhiChu]) VALUES (N'MTT1', N'Bich', N'12345', 1, N'sdsd', N'2323232', 1, NULL, NULL)
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_tblSach_CaBiet]    Script Date: 8/13/2017 10:27:12 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_tblSach_CaBiet] ON [dbo].[tblSach_CaBiet]
(
	[MaSoCaBiet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblSach] ADD  CONSTRAINT [DF_tblSach_SachDichHayKhong]  DEFAULT ((0)) FOR [SachDichHayKhong]
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
/****** Object:  StoredProcedure [dbo].[tblCanBo_DS]    Script Date: 8/13/2017 10:27:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 Create proc [dbo].[tblCanBo_DS]
as
 begin
 select * from tblCanBo
end


--lấy 1
-- [ELib]

GO
/****** Object:  StoredProcedure [dbo].[tblCanBo_Lay1]    Script Date: 8/13/2017 10:27:12 AM ******/
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



--Thêm
-- [ELib]

GO
/****** Object:  StoredProcedure [dbo].[tblCanBo_Sua]    Script Date: 8/13/2017 10:27:12 AM ******/
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

--Xóa
-- [ELib]

GO
/****** Object:  StoredProcedure [dbo].[tblCanBo_Them]    Script Date: 8/13/2017 10:27:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 Create proc [dbo].[tblCanBo_Them]
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

----Sửa
-- [ELib]

GO
/****** Object:  StoredProcedure [dbo].[tblCanBo_Xoa]    Script Date: 8/13/2017 10:27:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[tblCanBo_Xoa]
 @MaCanBo nvarchar(30)
 as
 begin
 delete from tblCanBo where MaCanBo=@MaCanBo
 end


--Danh Sách
-- [ELib]

GO
/****** Object:  StoredProcedure [dbo].[tblChiTietMuonTra_DS]    Script Date: 8/13/2017 10:27:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 Create proc [dbo].[tblChiTietMuonTra_DS]
as
 begin
 select * from tblChiTietMuonTra
end


--lấy 1
-- [ELib]

GO
/****** Object:  StoredProcedure [dbo].[tblChiTietMuonTra_Lay]    Script Date: 8/13/2017 10:27:12 AM ******/
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




--Thêm
-- [ELib]

GO
/****** Object:  StoredProcedure [dbo].[tblChiTietMuonTra_Sua]    Script Date: 8/13/2017 10:27:12 AM ******/
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


--Xóa
-- [ELib]

GO
/****** Object:  StoredProcedure [dbo].[tblChiTietMuonTra_them]    Script Date: 8/13/2017 10:27:12 AM ******/
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


--sửa

-- [ELib]

GO
/****** Object:  StoredProcedure [dbo].[tblChiTietMuonTra_Xoa]    Script Date: 8/13/2017 10:27:12 AM ******/
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


-- Danh sách

-- [ELib]

GO
/****** Object:  StoredProcedure [dbo].[tblDonVi_DS]    Script Date: 8/13/2017 10:27:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  Create proc [dbo].[tblDonVi_DS]
as
 begin
 select * from tblDonVi
end


--lấy 1

-- [ELib]

GO
/****** Object:  StoredProcedure [dbo].[tblDonVi_Lay1]    Script Date: 8/13/2017 10:27:12 AM ******/
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





--Thêm

-- [ELib]

GO
/****** Object:  StoredProcedure [dbo].[tblDonVi_Sua]    Script Date: 8/13/2017 10:27:12 AM ******/
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


--xóa
-- [ELib]

GO
/****** Object:  StoredProcedure [dbo].[tblDonVi_Them]    Script Date: 8/13/2017 10:27:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 Create proc [dbo].[tblDonVi_Them]
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


--sửa
-- [ELib]

GO
/****** Object:  StoredProcedure [dbo].[tblDonVi_Xoa]    Script Date: 8/13/2017 10:27:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[tblDonVi_Xoa]
 @MaDonVi nvarchar(30)
 as
 begin
 delete from tblDonVi where MaDonVi=@MaDonVi
 end


--Danh sách
-- [ELib]

GO
/****** Object:  StoredProcedure [dbo].[tblHSSV_DS]    Script Date: 8/13/2017 10:27:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 Create proc [dbo].[tblHSSV_DS]
as
 begin
 select * from tblHSSV
end


--Lấy 1
-- [ELib]

GO
/****** Object:  StoredProcedure [dbo].[tblHSSV_Lay1]    Script Date: 8/13/2017 10:27:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[tblHSSV_Lay1]
@MaHSSV nvarchar(30)
as
begin
select * from tblHSSV where MaHSSV=@MaHSSV
end






--Thêm
-- [ELib]

GO
/****** Object:  StoredProcedure [dbo].[tblHSSV_Sua]    Script Date: 8/13/2017 10:27:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[tblHSSV_Sua]
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


--Xóa
-- [ELib]

GO
/****** Object:  StoredProcedure [dbo].[tblHSSV_Them]    Script Date: 8/13/2017 10:27:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 Create proc [dbo].[tblHSSV_Them]
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


--Sửa
-- [ELib]

GO
/****** Object:  StoredProcedure [dbo].[tblHSSV_Xoa]    Script Date: 8/13/2017 10:27:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 Create proc [dbo].[tblHSSV_Xoa]
@MaHSSV nvarchar(30)
as
begin
delete from tblHSSV where MaHSSV=@MaHSSV
end


--Danh sách
-- [ELib]

GO
/****** Object:  StoredProcedure [dbo].[tblLopHoc_DS]    Script Date: 8/13/2017 10:27:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[tblLopHoc_DS]
as
 begin
 select * from tblLopHoc
end


--Lấy1
-- [ELib]

GO
/****** Object:  StoredProcedure [dbo].[tblLopHoc_Lay1]    Script Date: 8/13/2017 10:27:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[tblLopHoc_Lay1]
@MaLop nvarchar (30)
as
begin
select * from tblLopHoc where MaLop=@MaLop
end





--Thêm
-- [ELib]

GO
/****** Object:  StoredProcedure [dbo].[tblLopHoc_Sua]    Script Date: 8/13/2017 10:27:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[tblLopHoc_Sua]
@MaLop nvarchar(30),
@MaKhoa nvarchar(30),
@TenLop nvarchar(30),
@HeDaoTao nvarchar(30),
@Khoa nvarchar (30)
as
begin
update tblLopHoc set MaKhoa=@MaKhoa,TenLop=@TenLop,HeDaoTao=@HeDaoTao,Khoa=@Khoa where MaLop=@MaLop
end


--Xóa
-- [ELib]

GO
/****** Object:  StoredProcedure [dbo].[tblLopHoc_Them]    Script Date: 8/13/2017 10:27:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[tblLopHoc_Them]
@MaLop nvarchar(30),
@MaKhoa nvarchar(30),
@TenLop nvarchar(30),
@HeDaoTao nvarchar(30),
@Khoa nvarchar (30)
as
begin
Insert into tblLopHoc Values (@MaLop,@MaKhoa,@TenLop,@HeDaoTao,@Khoa)
end



--Sửa
-- [ELib]

GO
/****** Object:  StoredProcedure [dbo].[tblLopHoc_Xoa]    Script Date: 8/13/2017 10:27:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[tblLopHoc_Xoa]
@MaLop nvarchar (30)
as
begin
delete from tblLopHoc Where MaLop=@MaLop
end


--Danh Sách
-- [ELib]

GO
/****** Object:  StoredProcedure [dbo].[tblNgonNgu_DS]    Script Date: 8/13/2017 10:27:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[tblNgonNgu_DS]
as
 begin
 select * from tblNgonNgu
end


--lây1
-- [ELib]

GO
/****** Object:  StoredProcedure [dbo].[tblNgonNgu_Lay1]    Script Date: 8/13/2017 10:27:12 AM ******/
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




--them
-- [ELib]

GO
/****** Object:  StoredProcedure [dbo].[tblNgonNgu_Sua]    Script Date: 8/13/2017 10:27:12 AM ******/
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


--Xóa
-- [ELib]

GO
/****** Object:  StoredProcedure [dbo].[tblNgonNgu_Them]    Script Date: 8/13/2017 10:27:12 AM ******/
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



--Sửa
-- [ELib]

GO
/****** Object:  StoredProcedure [dbo].[tblNgonNgu_Xoa]    Script Date: 8/13/2017 10:27:12 AM ******/
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


--Danh sách
-- [ELib]

GO
/****** Object:  StoredProcedure [dbo].[tblNhaXuatBan_DS]    Script Date: 8/13/2017 10:27:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  Create proc [dbo].[tblNhaXuatBan_DS]
as
 begin
 select * from tblNhaXuatBan
end


--lấy 1
-- [ELib]

GO
/****** Object:  StoredProcedure [dbo].[tblNhaXuatBan_Lay1]    Script Date: 8/13/2017 10:27:12 AM ******/
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







--Thêm
-- [ELib]

GO
/****** Object:  StoredProcedure [dbo].[tblNhaXuatBan_Sua]    Script Date: 8/13/2017 10:27:12 AM ******/
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


--Xóa
-- [ELib]

GO
/****** Object:  StoredProcedure [dbo].[tblNhaXuatBan_Them]    Script Date: 8/13/2017 10:27:12 AM ******/
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


--sửa
-- [ELib]

GO
/****** Object:  StoredProcedure [dbo].[tblNhaXuatBan_Xoa]    Script Date: 8/13/2017 10:27:12 AM ******/
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


--Danh Sách
-- [ELib]

GO
/****** Object:  StoredProcedure [dbo].[tblQuaTrinhMuonTra_DS]    Script Date: 8/13/2017 10:27:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 Create proc [dbo].[tblQuaTrinhMuonTra_DS]
as
 begin
 select * from tblQuaTrinhMuonTra
end


--lây 1
-- [ELib]

GO
/****** Object:  StoredProcedure [dbo].[tblQuaTrinhMuonTra_Lay]    Script Date: 8/13/2017 10:27:12 AM ******/
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





--Thêm
-- [ELib]

GO
/****** Object:  StoredProcedure [dbo].[tblQuaTrinhMuonTra_Sua]    Script Date: 8/13/2017 10:27:12 AM ******/
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


--Xóa
-- [ELib]

GO
/****** Object:  StoredProcedure [dbo].[tblQuaTrinhMuonTra_them]    Script Date: 8/13/2017 10:27:12 AM ******/
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


--Sửa
-- [ELib]

GO
/****** Object:  StoredProcedure [dbo].[tblQuaTrinhMuonTra_Xoa]    Script Date: 8/13/2017 10:27:12 AM ******/
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


--Danh sách
-- [ELib]

GO
/****** Object:  StoredProcedure [dbo].[tblSach_DS]    Script Date: 8/13/2017 10:27:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[tblSach_DS]
as
 begin
 select * from tblSach
end


--lây1
-- [ELib]

GO
/****** Object:  StoredProcedure [dbo].[tblSach_Lay1]    Script Date: 8/13/2017 10:27:12 AM ******/
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




--Them
-- [ELib]

GO
/****** Object:  StoredProcedure [dbo].[tblSach_Sua]    Script Date: 8/13/2017 10:27:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[tblSach_Sua]
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
@MaThuThu nvarchar(30),
@GhiChu nvarchar(max)
as
begin
update tblSach set MaPhanLoai=@MaPhanLoai, TenSach=@TenSach, MaNXB=@MaNXB, LanXuatBan=@LanXuatBan, ISBN_ISSN=@ISBN_ISSN, SoTrang=@SoTrang, Tap=@Tap, NamXuatBan=@NamXuatBan, NuocXuatBan=@NuocXuatBan, KichThuoc=@KichThuoc, urlAnhBia=@urlAnhBia, DuongDanBanScan=@DuongDanBanScan, GiaBia=@GiaBia, MaNgonNgu=@MaNgonNgu, TomTatNoiDung=@TomTatNoiDung, TuKhoa=@TuKhoa, SachDichHayKhong=@SachDichHayKhong, NgonNguBanDau=@NgonNguBanDau, TinhTrang=@TinhTrang, MaThuThu=@MaThuThu, GhiChu=@GhiChu where MaSach=@MaSach
end

--Xóa

-- [ELib]

GO
/****** Object:  StoredProcedure [dbo].[tblSach_TacGia_DS]    Script Date: 8/13/2017 10:27:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[tblSach_TacGia_DS]
as
 begin
 select * from tblSach_TacGia
end



--lây1
-- [ELib]

GO
/****** Object:  StoredProcedure [dbo].[tblSach_TacGia_Lay1]    Script Date: 8/13/2017 10:27:12 AM ******/
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





--Thêm
-- [ELib]

GO
/****** Object:  StoredProcedure [dbo].[tblSach_TacGia_Them]    Script Date: 8/13/2017 10:27:12 AM ******/
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


--Sửa
-- [ELib]

GO
/****** Object:  StoredProcedure [dbo].[tblSach_TacGia_Xoa]    Script Date: 8/13/2017 10:27:12 AM ******/
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



--Danh Sách
-- [ELib]

GO
/****** Object:  StoredProcedure [dbo].[tblSach_TheLoai_DS]    Script Date: 8/13/2017 10:27:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  Create proc [dbo].[tblSach_TheLoai_DS]
as
 begin
 select * from tblSach_TheLoai
end


--Lây1
-- [ELib]

GO
/****** Object:  StoredProcedure [dbo].[tblSach_TheLoai_Lay1]    Script Date: 8/13/2017 10:27:12 AM ******/
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





--Thêm
-- [ELib]

GO
/****** Object:  StoredProcedure [dbo].[tblSach_TheLoai_Them]    Script Date: 8/13/2017 10:27:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[tblSach_TheLoai_Them]
@MaSach nvarchar(30),
@MaTheLoai nvarchar(30)
as
begin
insert into tblSach_TheLoai values(@MaSach, @MaTheLoai)
end


--Xóa
-- [ELib]

GO
/****** Object:  StoredProcedure [dbo].[tblSach_TheLoai_Xoa]    Script Date: 8/13/2017 10:27:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[tblSach_TheLoai_Xoa]
@MaSach nvarchar(30),
@MaTheLoai nvarchar(30)
as
begin
delete tblSach_TheLoai where MaSach=@MaSach and MaTheLoai=@MaTheLoai
end


--Danh sách
-- [ELib]

GO
/****** Object:  StoredProcedure [dbo].[tblSach_Them]    Script Date: 8/13/2017 10:27:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[tblSach_Them]
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
@MaThuThu nvarchar(30),
@GhiChu nvarchar(max)
as
begin
insert into tblSach values(@MaSach, @MaPhanLoai, @TenSach, @MaNXB, @LanXuatBan, @ISBN_ISSN, @SoTrang
, @Tap, @NamXuatBan, @NuocXuatBan, @KichThuoc, @urlAnhBia, @DuongDanBanScan, @GiaBia, @MaNgonNgu, @TomTatNoiDung, @TuKhoa,
@SachDichHayKhong, @NgonNguBanDau, @TinhTrang, @MaThuThu, @GhiChu)
end


--Sửa
-- [ELib]

GO
/****** Object:  StoredProcedure [dbo].[tblSach_Xoa]    Script Date: 8/13/2017 10:27:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[tblSach_Xoa]
@MaSach nvarchar(30)
 as
 begin
 delete from tblSach where MaSach=@MaSach
 end


--Danh sách


-- [ELib]

GO
/****** Object:  StoredProcedure [dbo].[tblTacGia_DS]    Script Date: 8/13/2017 10:27:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[tblTacGia_DS]
as
 begin
 select * from tblTacGia
end


--Lây1
-- [ELib]

GO
/****** Object:  StoredProcedure [dbo].[tblTacGia_Lay1]    Script Date: 8/13/2017 10:27:12 AM ******/
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





--Thêm
-- [ELib]

GO
/****** Object:  StoredProcedure [dbo].[tblTacGia_Sua]    Script Date: 8/13/2017 10:27:12 AM ******/
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


--Xóa
-- [ELib]

GO
/****** Object:  StoredProcedure [dbo].[tblTacGia_Them]    Script Date: 8/13/2017 10:27:12 AM ******/
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


--Sửa
-- [ELib]

GO
/****** Object:  StoredProcedure [dbo].[tblTacGia_Xoa]    Script Date: 8/13/2017 10:27:12 AM ******/
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


--Danh sách
-- [ELib]

GO
/****** Object:  StoredProcedure [dbo].[tblTaiKhoan_DS]    Script Date: 8/13/2017 10:27:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[tblTaiKhoan_DS]
as
 begin
 select * from tblTaiKhoan
end


--lấy 1
-- [ELib]

GO
/****** Object:  StoredProcedure [dbo].[tblTaiKhoan_Lay1]    Script Date: 8/13/2017 10:27:12 AM ******/
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





--Thêm
-- [ELib]

GO
/****** Object:  StoredProcedure [dbo].[tblTaiKhoan_Sua]    Script Date: 8/13/2017 10:27:12 AM ******/
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


--Xóa
-- [ELib]

GO
/****** Object:  StoredProcedure [dbo].[tblTaiKhoan_Them]    Script Date: 8/13/2017 10:27:12 AM ******/
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


--Sửa
-- [ELib]

GO
/****** Object:  StoredProcedure [dbo].[tblTaiKhoan_Xoa]    Script Date: 8/13/2017 10:27:12 AM ******/
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


--Danh sách
-- [ELib]

GO
/****** Object:  StoredProcedure [dbo].[tblTheLoai_DS]    Script Date: 8/13/2017 10:27:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[tblTheLoai_DS]
 as
 begin
 select * from tblTheLoai
end


--Lây1
-- [ELib]

GO
/****** Object:  StoredProcedure [dbo].[tblTheLoai_Lay1]    Script Date: 8/13/2017 10:27:12 AM ******/
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





--Thêm
-- [ELib]

GO
/****** Object:  StoredProcedure [dbo].[tblTheLoai_Sua]    Script Date: 8/13/2017 10:27:12 AM ******/
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


--Xóa
-- [ELib]

GO
/****** Object:  StoredProcedure [dbo].[tblTheLoai_Them]    Script Date: 8/13/2017 10:27:12 AM ******/
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


--Sửa
-- [ELib]

GO
/****** Object:  StoredProcedure [dbo].[tblTheLoai_Xoa]    Script Date: 8/13/2017 10:27:12 AM ******/
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


--Danh Sách

-- [ELib]

GO
/****** Object:  StoredProcedure [dbo].[tblThuThu_DS]    Script Date: 8/13/2017 10:27:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[tblThuThu_DS]
as
 begin
 select * from tblThuThu
end


--Lây1
-- [ELib]

GO
/****** Object:  StoredProcedure [dbo].[tblThuThu_Sua]    Script Date: 8/13/2017 10:27:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 Create proc [dbo].[tblThuThu_Sua]
@MaThuThu nvarchar(30),
@HoTen nvarchar(30),
@MatKhau nvarchar(30),
@QuyenHan smallint,
@DiaChiEmail nvarchar(30),
@DienThoai nvarchar(30),
@TrangThai bit,
@urlPhoto nvarchar(150),
@GhiChu nvarchar(50)
as
 begin
 update  tblThuThu set HoTen=@HoTen,MatKhau=@MatKhau,QuyenHan=@QuyenHan,DiaChiEmail=@DiaChiEmail,DienThoai=@DienThoai,TrangThai=@TrangThai,urlPhoto=@urlPhoto,GhiChu=@GhiChu where MaThuThu=@MaThuThu
 end


--Xóa
-- [ELib]

GO
/****** Object:  StoredProcedure [dbo].[tblThuThu_Them]    Script Date: 8/13/2017 10:27:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[tblThuThu_Them]
@MaThuThu nvarchar(30),
@HoTen nvarchar(30),
@MatKhau nvarchar(30),
@QuyenHan smallint,
@DiaChiEmail nvarchar(30),
@DienThoai nvarchar(30),
@TrangThai bit,
@urlPhoto nvarchar(150),
@GhiChu nvarchar(50)
as
 begin
 insert into tblThuThu values(@MaThuThu,@HoTen,@MatKhau,@QuyenHan,@DiaChiEmail,@DienThoai,@TrangThai,@urlPhoto,@GhiChu)
 end


--Sửa
-- [ELib]

GO
/****** Object:  StoredProcedure [dbo].[tblThuThu_Xoa]    Script Date: 8/13/2017 10:27:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  Create proc [dbo].[tblThuThu_Xoa]
@MaThuThu nvarchar(30)
 as
 begin
 delete from tblThuThu where MaThuThu=@MaThuThu
 end


--Danh Sách
-- [ELib]

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
