USE [master]
GO
/****** Object:  Database [ThuongMaiDienTu]    Script Date: 01/12/2022 05:59:34 ******/
CREATE DATABASE [ThuongMaiDienTu] ON  PRIMARY 
( NAME = N'ThuongMaiDienTu', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\ThuongMaiDienTu.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ThuongMaiDienTu_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\ThuongMaiDienTu_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ThuongMaiDienTu] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ThuongMaiDienTu].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ThuongMaiDienTu] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [ThuongMaiDienTu] SET ANSI_NULLS OFF
GO
ALTER DATABASE [ThuongMaiDienTu] SET ANSI_PADDING OFF
GO
ALTER DATABASE [ThuongMaiDienTu] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [ThuongMaiDienTu] SET ARITHABORT OFF
GO
ALTER DATABASE [ThuongMaiDienTu] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [ThuongMaiDienTu] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [ThuongMaiDienTu] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [ThuongMaiDienTu] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [ThuongMaiDienTu] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [ThuongMaiDienTu] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [ThuongMaiDienTu] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [ThuongMaiDienTu] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [ThuongMaiDienTu] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [ThuongMaiDienTu] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [ThuongMaiDienTu] SET  DISABLE_BROKER
GO
ALTER DATABASE [ThuongMaiDienTu] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [ThuongMaiDienTu] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [ThuongMaiDienTu] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [ThuongMaiDienTu] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [ThuongMaiDienTu] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [ThuongMaiDienTu] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [ThuongMaiDienTu] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [ThuongMaiDienTu] SET  READ_WRITE
GO
ALTER DATABASE [ThuongMaiDienTu] SET RECOVERY SIMPLE
GO
ALTER DATABASE [ThuongMaiDienTu] SET  MULTI_USER
GO
ALTER DATABASE [ThuongMaiDienTu] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [ThuongMaiDienTu] SET DB_CHAINING OFF
GO
USE [ThuongMaiDienTu]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 01/12/2022 05:59:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[Feedback_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[Feedback_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonHangInfor]    Script Date: 01/12/2022 05:59:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHangInfor](
	[DonHangInfor_id] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Sdt] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[TinhThanh] [nvarchar](50) NULL,
	[QuanHuyen] [nvarchar](50) NULL,
	[PhuongXa] [nvarchar](50) NULL,
 CONSTRAINT [PK_DonHangInfor] PRIMARY KEY CLUSTERED 
(
	[DonHangInfor_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DonHangInfor] ON
INSERT [dbo].[DonHangInfor] ([DonHangInfor_id], [HoTen], [Email], [Sdt], [DiaChi], [TinhThanh], [QuanHuyen], [PhuongXa]) VALUES (6, N'Trần quốc đại', N'123@gmail.com', N'0777973833', N'58B ấp 4 Xuân Thới sơn Hóc Môn', N'31', N'Huyện Hóc Môn', N'Chọn phường / xã')
INSERT [dbo].[DonHangInfor] ([DonHangInfor_id], [HoTen], [Email], [Sdt], [DiaChi], [TinhThanh], [QuanHuyen], [PhuongXa]) VALUES (7, N'', N'', N'', N'', N'', N'Chọn quận / huyện', N'Chọn phường / xã')
INSERT [dbo].[DonHangInfor] ([DonHangInfor_id], [HoTen], [Email], [Sdt], [DiaChi], [TinhThanh], [QuanHuyen], [PhuongXa]) VALUES (8, N'Trần quốc đại', N'123@gmail.com', N'0777973833', N'58B ấp 4 Xuân Thới sơn Hóc Môn', N'31', N'Huyện Hóc Môn', N'Chọn phường / xã')
SET IDENTITY_INSERT [dbo].[DonHangInfor] OFF
/****** Object:  Table [dbo].[Account_role]    Script Date: 01/12/2022 05:59:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account_role](
	[Account_role_id] [int] IDENTITY(1,1) NOT NULL,
	[Account_role_name] [varchar](50) NULL,
 CONSTRAINT [PK_Account_role] PRIMARY KEY CLUSTERED 
(
	[Account_role_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Account_role] ON
INSERT [dbo].[Account_role] ([Account_role_id], [Account_role_name]) VALUES (1, N'admin')
INSERT [dbo].[Account_role] ([Account_role_id], [Account_role_name]) VALUES (2, N'user')
SET IDENTITY_INSERT [dbo].[Account_role] OFF
/****** Object:  Table [dbo].[Type_SanPham]    Script Date: 01/12/2022 05:59:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type_SanPham](
	[Type_SanPham_id] [int] IDENTITY(1,1) NOT NULL,
	[Type_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Type_SanPham] PRIMARY KEY CLUSTERED 
(
	[Type_SanPham_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Type_SanPham] ON
INSERT [dbo].[Type_SanPham] ([Type_SanPham_id], [Type_name]) VALUES (1, N'Tee')
INSERT [dbo].[Type_SanPham] ([Type_SanPham_id], [Type_name]) VALUES (2, N'Pant')
INSERT [dbo].[Type_SanPham] ([Type_SanPham_id], [Type_name]) VALUES (3, N'Jacket')
INSERT [dbo].[Type_SanPham] ([Type_SanPham_id], [Type_name]) VALUES (4, N'Accessories')
SET IDENTITY_INSERT [dbo].[Type_SanPham] OFF
/****** Object:  Table [dbo].[TinhTrangDonHang]    Script Date: 01/12/2022 05:59:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TinhTrangDonHang](
	[TinhTrangDonHang_id] [int] NOT NULL,
	[TinhTrangDonHang_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_TinhTrangDonHang] PRIMARY KEY CLUSTERED 
(
	[TinhTrangDonHang_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[TinhTrangDonHang] ([TinhTrangDonHang_id], [TinhTrangDonHang_name]) VALUES (1, N'Chờ xác nhận')
INSERT [dbo].[TinhTrangDonHang] ([TinhTrangDonHang_id], [TinhTrangDonHang_name]) VALUES (2, N'Đã xác nhận')
INSERT [dbo].[TinhTrangDonHang] ([TinhTrangDonHang_id], [TinhTrangDonHang_name]) VALUES (3, N'Đang vận chuyển')
INSERT [dbo].[TinhTrangDonHang] ([TinhTrangDonHang_id], [TinhTrangDonHang_name]) VALUES (4, N'Đã giao hàng')
/****** Object:  Table [dbo].[ThanhToan]    Script Date: 01/12/2022 05:59:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThanhToan](
	[ThanhToan_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_ThanhToan] PRIMARY KEY CLUSTERED 
(
	[ThanhToan_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Size]    Script Date: 01/12/2022 05:59:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Size](
	[Size_id] [int] NOT NULL,
	[Size_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Size] PRIMARY KEY CLUSTERED 
(
	[Size_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Size] ([Size_id], [Size_name]) VALUES (1, N'S')
INSERT [dbo].[Size] ([Size_id], [Size_name]) VALUES (2, N'M')
INSERT [dbo].[Size] ([Size_id], [Size_name]) VALUES (3, N'L')
INSERT [dbo].[Size] ([Size_id], [Size_name]) VALUES (4, N'XL')
INSERT [dbo].[Size] ([Size_id], [Size_name]) VALUES (5, N'XL')
/****** Object:  Table [dbo].[SanPhamDetail]    Script Date: 01/12/2022 05:59:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPhamDetail](
	[SanPhamDetail_id] [int] IDENTITY(1,1) NOT NULL,
	[S] [int] NULL,
	[M] [int] NULL,
	[L] [int] NULL,
	[XL] [int] NULL,
	[XXL] [int] NULL,
 CONSTRAINT [PK_SanPhamDetail] PRIMARY KEY CLUSTERED 
(
	[SanPhamDetail_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SanPhamDetail] ON
INSERT [dbo].[SanPhamDetail] ([SanPhamDetail_id], [S], [M], [L], [XL], [XXL]) VALUES (13, 10, 2, 3, 50, 30)
INSERT [dbo].[SanPhamDetail] ([SanPhamDetail_id], [S], [M], [L], [XL], [XXL]) VALUES (14, 5, 2, 3, 2, 3)
INSERT [dbo].[SanPhamDetail] ([SanPhamDetail_id], [S], [M], [L], [XL], [XXL]) VALUES (15, 4, 5, 6, 7, 8)
INSERT [dbo].[SanPhamDetail] ([SanPhamDetail_id], [S], [M], [L], [XL], [XXL]) VALUES (16, 0, 0, 0, 0, 0)
INSERT [dbo].[SanPhamDetail] ([SanPhamDetail_id], [S], [M], [L], [XL], [XXL]) VALUES (17, 1, 0, 0, 50, 0)
INSERT [dbo].[SanPhamDetail] ([SanPhamDetail_id], [S], [M], [L], [XL], [XXL]) VALUES (18, 26, 51, 0, 0, 0)
INSERT [dbo].[SanPhamDetail] ([SanPhamDetail_id], [S], [M], [L], [XL], [XXL]) VALUES (20, 0, 0, 0, 0, 0)
INSERT [dbo].[SanPhamDetail] ([SanPhamDetail_id], [S], [M], [L], [XL], [XXL]) VALUES (21, 0, 0, 0, 0, 0)
INSERT [dbo].[SanPhamDetail] ([SanPhamDetail_id], [S], [M], [L], [XL], [XXL]) VALUES (22, 0, 0, 0, 0, 0)
INSERT [dbo].[SanPhamDetail] ([SanPhamDetail_id], [S], [M], [L], [XL], [XXL]) VALUES (23, 12, 10, 0, 0, 0)
INSERT [dbo].[SanPhamDetail] ([SanPhamDetail_id], [S], [M], [L], [XL], [XXL]) VALUES (24, 0, 0, 0, 0, 0)
INSERT [dbo].[SanPhamDetail] ([SanPhamDetail_id], [S], [M], [L], [XL], [XXL]) VALUES (25, 0, 0, 0, 0, 0)
INSERT [dbo].[SanPhamDetail] ([SanPhamDetail_id], [S], [M], [L], [XL], [XXL]) VALUES (26, 0, 0, 0, 0, 0)
INSERT [dbo].[SanPhamDetail] ([SanPhamDetail_id], [S], [M], [L], [XL], [XXL]) VALUES (27, 10, 5, 6, 2, 0)
INSERT [dbo].[SanPhamDetail] ([SanPhamDetail_id], [S], [M], [L], [XL], [XXL]) VALUES (28, 0, 0, 0, 0, 0)
INSERT [dbo].[SanPhamDetail] ([SanPhamDetail_id], [S], [M], [L], [XL], [XXL]) VALUES (29, 0, 0, 0, 0, 0)
INSERT [dbo].[SanPhamDetail] ([SanPhamDetail_id], [S], [M], [L], [XL], [XXL]) VALUES (30, 3, 1, 4, 0, 0)
INSERT [dbo].[SanPhamDetail] ([SanPhamDetail_id], [S], [M], [L], [XL], [XXL]) VALUES (31, 1, 1, 2, 0, 0)
INSERT [dbo].[SanPhamDetail] ([SanPhamDetail_id], [S], [M], [L], [XL], [XXL]) VALUES (32, 0, 0, 0, 0, 0)
INSERT [dbo].[SanPhamDetail] ([SanPhamDetail_id], [S], [M], [L], [XL], [XXL]) VALUES (33, 2, 1, 1, 0, 0)
INSERT [dbo].[SanPhamDetail] ([SanPhamDetail_id], [S], [M], [L], [XL], [XXL]) VALUES (34, 0, 0, 1, 0, 0)
INSERT [dbo].[SanPhamDetail] ([SanPhamDetail_id], [S], [M], [L], [XL], [XXL]) VALUES (35, 0, 0, 4, 0, 0)
INSERT [dbo].[SanPhamDetail] ([SanPhamDetail_id], [S], [M], [L], [XL], [XXL]) VALUES (36, 2, 0, 0, 0, 0)
INSERT [dbo].[SanPhamDetail] ([SanPhamDetail_id], [S], [M], [L], [XL], [XXL]) VALUES (37, 0, 1, 2, 0, 0)
INSERT [dbo].[SanPhamDetail] ([SanPhamDetail_id], [S], [M], [L], [XL], [XXL]) VALUES (38, 1, 1, 1, 0, 0)
INSERT [dbo].[SanPhamDetail] ([SanPhamDetail_id], [S], [M], [L], [XL], [XXL]) VALUES (39, 0, 1, 0, 0, 0)
INSERT [dbo].[SanPhamDetail] ([SanPhamDetail_id], [S], [M], [L], [XL], [XXL]) VALUES (40, 0, 0, 0, 0, 0)
INSERT [dbo].[SanPhamDetail] ([SanPhamDetail_id], [S], [M], [L], [XL], [XXL]) VALUES (41, 0, 2, 0, 0, 0)
INSERT [dbo].[SanPhamDetail] ([SanPhamDetail_id], [S], [M], [L], [XL], [XXL]) VALUES (42, 0, 0, 0, 0, 0)
INSERT [dbo].[SanPhamDetail] ([SanPhamDetail_id], [S], [M], [L], [XL], [XXL]) VALUES (43, 0, 0, 0, 0, 0)
INSERT [dbo].[SanPhamDetail] ([SanPhamDetail_id], [S], [M], [L], [XL], [XXL]) VALUES (44, 0, 2, 0, 0, 0)
INSERT [dbo].[SanPhamDetail] ([SanPhamDetail_id], [S], [M], [L], [XL], [XXL]) VALUES (45, 2, 14, 9, 2, 0)
INSERT [dbo].[SanPhamDetail] ([SanPhamDetail_id], [S], [M], [L], [XL], [XXL]) VALUES (46, 7, 12, 11, 6, 0)
INSERT [dbo].[SanPhamDetail] ([SanPhamDetail_id], [S], [M], [L], [XL], [XXL]) VALUES (47, 5, 10, 10, 5, 0)
INSERT [dbo].[SanPhamDetail] ([SanPhamDetail_id], [S], [M], [L], [XL], [XXL]) VALUES (48, 0, 0, 0, 0, 0)
INSERT [dbo].[SanPhamDetail] ([SanPhamDetail_id], [S], [M], [L], [XL], [XXL]) VALUES (49, 3, 7, 5, 11, 0)
INSERT [dbo].[SanPhamDetail] ([SanPhamDetail_id], [S], [M], [L], [XL], [XXL]) VALUES (50, 0, 0, 0, 0, 0)
INSERT [dbo].[SanPhamDetail] ([SanPhamDetail_id], [S], [M], [L], [XL], [XXL]) VALUES (51, 5, 10, 12, 4, 11)
INSERT [dbo].[SanPhamDetail] ([SanPhamDetail_id], [S], [M], [L], [XL], [XXL]) VALUES (52, 12, 9, 8, 2, 0)
INSERT [dbo].[SanPhamDetail] ([SanPhamDetail_id], [S], [M], [L], [XL], [XXL]) VALUES (53, 8, 15, 20, 9, 0)
INSERT [dbo].[SanPhamDetail] ([SanPhamDetail_id], [S], [M], [L], [XL], [XXL]) VALUES (54, 6, 16, 12, 8, 0)
INSERT [dbo].[SanPhamDetail] ([SanPhamDetail_id], [S], [M], [L], [XL], [XXL]) VALUES (55, 3, 4, 2, 0, 0)
INSERT [dbo].[SanPhamDetail] ([SanPhamDetail_id], [S], [M], [L], [XL], [XXL]) VALUES (56, 7, 10, 12, 0, 0)
INSERT [dbo].[SanPhamDetail] ([SanPhamDetail_id], [S], [M], [L], [XL], [XXL]) VALUES (57, 0, 0, 0, 0, 0)
INSERT [dbo].[SanPhamDetail] ([SanPhamDetail_id], [S], [M], [L], [XL], [XXL]) VALUES (58, 0, 6, 0, 0, 0)
INSERT [dbo].[SanPhamDetail] ([SanPhamDetail_id], [S], [M], [L], [XL], [XXL]) VALUES (59, 7, 5, 5, 0, 0)
INSERT [dbo].[SanPhamDetail] ([SanPhamDetail_id], [S], [M], [L], [XL], [XXL]) VALUES (60, 11, 2, 6, 0, 0)
INSERT [dbo].[SanPhamDetail] ([SanPhamDetail_id], [S], [M], [L], [XL], [XXL]) VALUES (61, 1, 20, 4, 0, 0)
INSERT [dbo].[SanPhamDetail] ([SanPhamDetail_id], [S], [M], [L], [XL], [XXL]) VALUES (62, 0, 21, 23, 12, 0)
INSERT [dbo].[SanPhamDetail] ([SanPhamDetail_id], [S], [M], [L], [XL], [XXL]) VALUES (63, 0, 0, 0, 0, 0)
INSERT [dbo].[SanPhamDetail] ([SanPhamDetail_id], [S], [M], [L], [XL], [XXL]) VALUES (64, 0, 0, 0, 0, 0)
SET IDENTITY_INSERT [dbo].[SanPhamDetail] OFF
/****** Object:  Table [dbo].[SanPham]    Script Date: 01/12/2022 05:59:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[SanPham_Id] [int] IDENTITY(1,1) NOT NULL,
	[SanPham_Name] [nvarchar](50) NULL,
	[SanPham_description] [nvarchar](max) NULL,
	[SanPham_Price] [int] NULL,
	[SanPham_priceSale] [int] NULL,
	[Sale_key] [bit] NULL,
	[Main_img] [nvarchar](max) NULL,
	[Img1] [nvarchar](max) NULL,
	[Img2] [nvarchar](max) NULL,
	[Img3] [nvarchar](max) NULL,
	[Img4] [nvarchar](max) NULL,
	[Type_SanPham_id] [int] NULL,
	[SanPhamDetail_id] [int] NULL,
	[SoLuong] [int] NULL,
	[StringPrice] [nvarchar](50) NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[SanPham_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SanPham] ON
INSERT [dbo].[SanPham] ([SanPham_Id], [SanPham_Name], [SanPham_description], [SanPham_Price], [SanPham_priceSale], [Sale_key], [Main_img], [Img1], [Img2], [Img3], [Img4], [Type_SanPham_id], [SanPhamDetail_id], [SoLuong], [StringPrice]) VALUES (41, N'Túi Mini Nebulus', N'Túi NEBULUS chính hãng từ bộ sưu tập hoàn toàn mới. Túi lớn, bền - thời trang và tiện dụng. Với 2 ngăn chính lớn và khóa kéo zip. Với dây đeo có thể điều chỉnh độ dài và đóng kẹp. Rất nhiều không gian lưu trữ cho tất cả các loại! Chất liệu không thấm nước, có nhiều chi tiết phức tạp khiến chiếc túi bum này trở thành phụ kiện lý tưởng cho mọi dịp.', 300000, 0, 0, N'~/Content/Image_SanPham/bag1.jpg', N'~/Content/Image_SanPham/1.jpg', N'~/Content/Image_SanPham/2.jpg', N'~/Content/Image_SanPham/3.jpg', N'~/Content/Image_SanPham/4.jpg', 4, 31, 4, N'300.000đ')
INSERT [dbo].[SanPham] ([SanPham_Id], [SanPham_Name], [SanPham_description], [SanPham_Price], [SanPham_priceSale], [Sale_key], [Main_img], [Img1], [Img2], [Img3], [Img4], [Type_SanPham_id], [SanPhamDetail_id], [SoLuong], [StringPrice]) VALUES (43, N'Túi Mini Crossbag', N'Chất liệu: Vải Canvas cao cấp chống trượt nước
Kích thước: 20 x 15 x 5 cm
Ngăn chống sốc đựng vừa tất cả các dòng điện thoại
Quai đeo có thể tháo rời', 280000, 0, 0, N'~/Content/Image_SanPham/a1.jpg', N'~/Content/Image_SanPham/a2.jpg', N'~/Content/Image_SanPham/a3.jpg', N'~/Content/Image_SanPham/a4.jpg', N'~/Content/Image_SanPham/a5.jpg', 4, 33, 4, N'280.000đ')
INSERT [dbo].[SanPham] ([SanPham_Id], [SanPham_Name], [SanPham_description], [SanPham_Price], [SanPham_priceSale], [Sale_key], [Main_img], [Img1], [Img2], [Img3], [Img4], [Type_SanPham_id], [SanPhamDetail_id], [SoLuong], [StringPrice]) VALUES (45, N'Balo chống nước Kyt Airspace', N'Chất liệu bên ngoài chống nước tuyệt đối
Tất cả khóa gài đều dễ dàng tăng giảm độ dài
Có khóa gài ngang ngực
Đệm balo thoáng khí giúp đeo lâu thoải mái
Có các túi hộp khóa kéo zip đa năng
Kích thước xấp xỉ: 28cm x 16cm x 53cm', 950000, 0, 0, N'~/Content/Image_SanPham/a6.jpg', N'~/Content/Image_SanPham/a8.jpg', N'~/Content/Image_SanPham/a9.jpg', N'~/Content/Image_SanPham/a10.jpg', N'~/Content/Image_SanPham/a11.jpg', 4, 34, 1, N'950.000đ')
INSERT [dbo].[SanPham] ([SanPham_Id], [SanPham_Name], [SanPham_description], [SanPham_Price], [SanPham_priceSale], [Sale_key], [Main_img], [Img1], [Img2], [Img3], [Img4], [Type_SanPham_id], [SanPhamDetail_id], [SoLuong], [StringPrice]) VALUES (46, N'Balo Adidas Ops 30L Rusksack', N'Chất liệu Nylon E Polyester Outer: Polyester chống nước s
Kích thước: 58 x 30 x 18cm (30 lít)
Laptop : 15.6 inch 
Có ngăn giày riêng
', 650000, 0, 0, N'~/Content/Image_SanPham/b1.jpg', N'~/Content/Image_SanPham/b5.jpg', N'~/Content/Image_SanPham/b2.jpg', N'~/Content/Image_SanPham/b3.jpg', N'~/Content/Image_SanPham/b4.jpg', 4, 35, 4, N'650.000đ')
INSERT [dbo].[SanPham] ([SanPham_Id], [SanPham_Name], [SanPham_description], [SanPham_Price], [SanPham_priceSale], [Sale_key], [Main_img], [Img1], [Img2], [Img3], [Img4], [Type_SanPham_id], [SanPhamDetail_id], [SoLuong], [StringPrice]) VALUES (47, N'Mũ Cappie', N'Chất liệu: Cotton chất lượng cao
Kích cỡ: Freesize, điều chỉnh bằng khóa kim loại sau mũ', 95000, 0, 0, N'~/Content/Image_SanPham/b6.jpg', N'~/Content/Image_SanPham/b7.jpg', N'~/Content/Image_SanPham/b8.jpg', N'~/Content/Image_SanPham/b9.jpg', N'~/Content/Image_SanPham/b10.jpg', 4, 36, 2, N'95.000đ')
INSERT [dbo].[SanPham] ([SanPham_Id], [SanPham_Name], [SanPham_description], [SanPham_Price], [SanPham_priceSale], [Sale_key], [Main_img], [Img1], [Img2], [Img3], [Img4], [Type_SanPham_id], [SanPhamDetail_id], [SoLuong], [StringPrice]) VALUES (48, N'Mũ Bucket MLB', N'Chất liệu: 100% Nylon. Sau: 100% Polyester. Lớp lót: 65% Polyester, 35% Cotton 
Kiểu dáng nón bucket hiện đại
Thiết kế lấy cảm hứng từ hiệp hội bóng chày MLB
Chi tiết logo bóng chày thêu nổi bật phía trước
Họa tiết monogram nổi bật
Chất vải mềm mịn, thấm hút tốt', 1290000, 0, 0, N'~/Content/Image_SanPham/c1.jpg', N'~/Content/Image_SanPham/c2.jpg', N'~/Content/Image_SanPham/c3.jpg', N'~/Content/Image_SanPham/c5.jpg', N'~/Content/Image_SanPham/c4.jpg', 4, 37, 3, N'1.290.000đ')
INSERT [dbo].[SanPham] ([SanPham_Id], [SanPham_Name], [SanPham_description], [SanPham_Price], [SanPham_priceSale], [Sale_key], [Main_img], [Img1], [Img2], [Img3], [Img4], [Type_SanPham_id], [SanPhamDetail_id], [SoLuong], [StringPrice]) VALUES (52, N'Kính Gucci', N'Gọng kính kim loại tổng hợp chống gỉ sét. An toàn tuyệt đối.
Độ bền màu và tính đàn hồi cao. Ốc vặn được gia công kỹ lưỡng và cẩn thận.
Đệm mũi êm ái, tạo cảm giác dễ chịu khi đeo, cân đối giữa hai bên thái dương, mắt và sóng mũi.
Càng kính chắc chắn, không gây ra vết hằn khó chịu trên da.
Dễ phối đồ với nhiều phong cách khác nhau', 850000, 0, 0, N'~/Content/Image_SanPham/d5.jpg', N'~/Content/Image_SanPham/d1.jpg', N'~/Content/Image_SanPham/d2.jpg', N'~/Content/Image_SanPham/d3.jpg', N'~/Content/Image_SanPham/d4.jpg', 4, 41, 2, N'850.000đ')
INSERT [dbo].[SanPham] ([SanPham_Id], [SanPham_Name], [SanPham_description], [SanPham_Price], [SanPham_priceSale], [Sale_key], [Main_img], [Img1], [Img2], [Img3], [Img4], [Type_SanPham_id], [SanPhamDetail_id], [SoLuong], [StringPrice]) VALUES (55, N'Kính Ray-Ban', N'Chất liệu mắt: Thủy tinh
Chất liệu gọng: Metal
Màu mắt: Xanh Green
Màu Gọng: Vàng
Lọc UV400: Có', 900000, 0, 0, N'~/Content/Image_SanPham/e1.jpg', N'~/Content/Image_SanPham/e2.jpg', N'~/Content/Image_SanPham/e3.jpg', N'~/Content/Image_SanPham/e4.jpg', N'~/Content/Image_SanPham/e5.jpg', 3, 44, 2, N'900.000đ')
INSERT [dbo].[SanPham] ([SanPham_Id], [SanPham_Name], [SanPham_description], [SanPham_Price], [SanPham_priceSale], [Sale_key], [Main_img], [Img1], [Img2], [Img3], [Img4], [Type_SanPham_id], [SanPhamDetail_id], [SoLuong], [StringPrice]) VALUES (56, N'Levent Velvet', N'Chất liệu: 100% Cotton', 370000, 0, 0, N'~/Content/Image_SanPham/r1.jpg', N'~/Content/Image_SanPham/r2.jpg', N'~/Content/Image_SanPham/r3.jpg', N'~/Content/Image_SanPham/r4.jpg', N'~/Content/Image_SanPham/r5.jpg', 1, 45, 27, N'370.000đ')
INSERT [dbo].[SanPham] ([SanPham_Id], [SanPham_Name], [SanPham_description], [SanPham_Price], [SanPham_priceSale], [Sale_key], [Main_img], [Img1], [Img2], [Img3], [Img4], [Type_SanPham_id], [SanPhamDetail_id], [SoLuong], [StringPrice]) VALUES (57, N'Levent Dark Grey', N'Chất liệu: 100% Cotton', 370000, 0, 0, N'~/Content/Image_SanPham/r6.jpg', N'~/Content/Image_SanPham/r7.jpg', N'~/Content/Image_SanPham/r8.jpg', N'~/Content/Image_SanPham/r9.jpg', N'~/Content/Image_SanPham/r10.jpg', 1, 46, 36, N'370.000đ')
INSERT [dbo].[SanPham] ([SanPham_Id], [SanPham_Name], [SanPham_description], [SanPham_Price], [SanPham_priceSale], [Sale_key], [Main_img], [Img1], [Img2], [Img3], [Img4], [Type_SanPham_id], [SanPhamDetail_id], [SoLuong], [StringPrice]) VALUES (58, N'Levent Black', N'Chất liệu: 100% Cotton', 370000, 0, 0, N'~/Content/Image_SanPham/t1.jpg', N'~/Content/Image_SanPham/t2.jpg', N'~/Content/Image_SanPham/t3.jpg', N'~/Content/Image_SanPham/t4.jpg', N'~/Content/Image_SanPham/t5.jpg', 1, 47, 30, N'370.000đ')
INSERT [dbo].[SanPham] ([SanPham_Id], [SanPham_Name], [SanPham_description], [SanPham_Price], [SanPham_priceSale], [Sale_key], [Main_img], [Img1], [Img2], [Img3], [Img4], [Type_SanPham_id], [SanPhamDetail_id], [SoLuong], [StringPrice]) VALUES (59, N'Levent White', N'Chất liệu: 100% Cotton', 370000, 0, 0, N'~/Content/Image_SanPham/t6.jpg', N'~/Content/Image_SanPham/t7.jpg', N'~/Content/Image_SanPham/t8.jpg', N'~/Content/Image_SanPham/t9.jpg', N'~/Content/Image_SanPham/t10.jpg', 1, 48, 0, N'370.000đ')
INSERT [dbo].[SanPham] ([SanPham_Id], [SanPham_Name], [SanPham_description], [SanPham_Price], [SanPham_priceSale], [Sale_key], [Main_img], [Img1], [Img2], [Img3], [Img4], [Type_SanPham_id], [SanPhamDetail_id], [SoLuong], [StringPrice]) VALUES (60, N'Levent Bear', N'Chất liệu: 100% Cotton', 370000, 0, 0, N'~/Content/Image_SanPham/z1.jpg', N'~/Content/Image_SanPham/z2.jpg', N'~/Content/Image_SanPham/z3.jpg', N'~/Content/Image_SanPham/z4.jpg', N'~/Content/Image_SanPham/z5.jpg', 1, 49, 26, N'370.000đ')
INSERT [dbo].[SanPham] ([SanPham_Id], [SanPham_Name], [SanPham_description], [SanPham_Price], [SanPham_priceSale], [Sale_key], [Main_img], [Img1], [Img2], [Img3], [Img4], [Type_SanPham_id], [SanPhamDetail_id], [SoLuong], [StringPrice]) VALUES (61, N'Levent Tiger', N'Chất liệu: 100% Cotton', 370000, 0, 0, N'~/Content/Image_SanPham/z6.jpg', N'~/Content/Image_SanPham/z7.jpg', N'~/Content/Image_SanPham/z8.jpg', N'~/Content/Image_SanPham/z9.jpg', N'~/Content/Image_SanPham/z10.jpg', 1, 50, 0, N'370.000đ')
INSERT [dbo].[SanPham] ([SanPham_Id], [SanPham_Name], [SanPham_description], [SanPham_Price], [SanPham_priceSale], [Sale_key], [Main_img], [Img1], [Img2], [Img3], [Img4], [Type_SanPham_id], [SanPhamDetail_id], [SoLuong], [StringPrice]) VALUES (62, N'Oid Salor Black', N'Chất liệu 100% Cotton 
Thấm mồ hôi tốt, để bạn luôn thoải mái khi mặc
Nhẹ và độ bền vải cao dễ dàng sử dụng', 295000, 0, 0, N'~/Content/Image_SanPham/aa1.jpg', N'~/Content/Image_SanPham/aa2.jpg', N'~/Content/Image_SanPham/aa3.jpg', N'~/Content/Image_SanPham/aa4.jpg', N'~/Content/Image_SanPham/aa5.jpg', 1, 51, 42, N'295.000đ')
INSERT [dbo].[SanPham] ([SanPham_Id], [SanPham_Name], [SanPham_description], [SanPham_Price], [SanPham_priceSale], [Sale_key], [Main_img], [Img1], [Img2], [Img3], [Img4], [Type_SanPham_id], [SanPhamDetail_id], [SoLuong], [StringPrice]) VALUES (63, N'Oid Salor White', N'Chất liệu 100% Cotton tạo sự mềm mại ngay lần đầu chạm
Thấm mồ hôi tốt, để bạn luôn thoải mái khi mặc
Nhẹ và độ bền vải cao dễ dàng sử dụng', 295000, 0, 0, N'~/Content/Image_SanPham/p1.jpg', N'~/Content/Image_SanPham/p2.jpg', N'~/Content/Image_SanPham/p3.jpg', N'~/Content/Image_SanPham/p4.jpg', N'~/Content/Image_SanPham/p5.jpg', 1, 52, 31, N'295.000đ')
INSERT [dbo].[SanPham] ([SanPham_Id], [SanPham_Name], [SanPham_description], [SanPham_Price], [SanPham_priceSale], [Sale_key], [Main_img], [Img1], [Img2], [Img3], [Img4], [Type_SanPham_id], [SanPhamDetail_id], [SoLuong], [StringPrice]) VALUES (64, N'Polo LCSTE White', N'100% sợi bông cotton 
Bay hơi nhanh 
Thấm hút tốt
Co giãn tốt 
Độ bền cao.', 590000, 0, 0, N'~/Content/Image_SanPham/k1.jpeg', N'~/Content/Image_SanPham/k2.jpeg', N'~/Content/Image_SanPham/k3.jpeg', N'~/Content/Image_SanPham/k5.jpeg', N'~/Content/Image_SanPham/k4.jpeg', 1, 53, 52, N'590.000đ')
INSERT [dbo].[SanPham] ([SanPham_Id], [SanPham_Name], [SanPham_description], [SanPham_Price], [SanPham_priceSale], [Sale_key], [Main_img], [Img1], [Img2], [Img3], [Img4], [Type_SanPham_id], [SanPhamDetail_id], [SoLuong], [StringPrice]) VALUES (65, N'Polo Ranger Black', N'Chất liệu áo sơ mi:  Pique
Kiểu form: Basic', 350000, 0, 0, N'~/Content/Image_SanPham/n1.jpg', N'~/Content/Image_SanPham/n2.jpg', N'~/Content/Image_SanPham/n3.jpg', N'~/Content/Image_SanPham/n4.jpg', N'~/Content/Image_SanPham/n5.jpg', 1, 54, 42, N'350.000đ')
INSERT [dbo].[SanPham] ([SanPham_Id], [SanPham_Name], [SanPham_description], [SanPham_Price], [SanPham_priceSale], [Sale_key], [Main_img], [Img1], [Img2], [Img3], [Img4], [Type_SanPham_id], [SanPhamDetail_id], [SoLuong], [StringPrice]) VALUES (66, N'Hoodie Cream', N'Chất liệu: 100% Cotton
Thân thiện
Thấm hút thoát ẩm
Mềm mại
Kiểm soát mùi
Điều hòa nhiệt', 280000, 0, 0, N'~/Content/Image_SanPham/10122021071256_ao_hodie_nam_U1AKH12101BONHT_toto_shop__12_.jpg', N'~/Content/Image_SanPham/AO_KHOAC_U1AKH12101BONHT_(ao_hodie_nam_u1akh12101bonht_toto_shop_(2)).jpg', N'~/Content/Image_SanPham/AO_KHOAC_U1AKH12101BONHT_(ao_hodie_nam_u1akh12101bonht_toto_shop_(3)).jpg', N'~/Content/Image_SanPham/AO_KHOAC_U1AKH12101BONHT_(ao_hodie_nam_u1akh12101bonht_toto_shop_(7)).jpg', N'~/Content/Image_SanPham/AO_KHOAC_U1AKH12101BONHT_(ao_hodie_nam_u1akh12101bonht_toto_shop_(8)).jpg', 3, 55, 9, N'280.000đ')
INSERT [dbo].[SanPham] ([SanPham_Id], [SanPham_Name], [SanPham_description], [SanPham_Price], [SanPham_priceSale], [Sale_key], [Main_img], [Img1], [Img2], [Img3], [Img4], [Type_SanPham_id], [SanPhamDetail_id], [SoLuong], [StringPrice]) VALUES (67, N'Hoodie Black', N'Chất liệu: 100% Cotton
Thân thiện
Thấm hút thoát ẩm
Mềm mại
Kiểm soát mùi
Điều hòa nhiệt', 280000, 0, 0, N'~/Content/Image_SanPham/19112021051107_ao_hodie_nam_U1AKH11101SONHT_toto_shop__13_.jpg', N'~/Content/Image_SanPham/AO_HOODIE_U1AKH11101SONHT_(ao_hodie_nam_u1akh11101sonht_toto_shop_(2)).jpg', N'~/Content/Image_SanPham/AO_HOODIE_U1AKH11101SONHT_(ao_hodie_nam_u1akh11101sonht_toto_shop_(3)).jpg', N'~/Content/Image_SanPham/AO_HOODIE_U1AKH11101SONHT_(ao_hodie_nam_u1akh11101sonht_toto_shop_(7)).jpg', N'~/Content/Image_SanPham/AO_HOODIE_U1AKH11101SONHT_(ao_hodie_nam_u1akh11101sonht_toto_shop_(9)).jpg', 3, 56, 29, N'280.000đ')
INSERT [dbo].[SanPham] ([SanPham_Id], [SanPham_Name], [SanPham_description], [SanPham_Price], [SanPham_priceSale], [Sale_key], [Main_img], [Img1], [Img2], [Img3], [Img4], [Type_SanPham_id], [SanPhamDetail_id], [SoLuong], [StringPrice]) VALUES (69, N'Mũ Bucket MLB Shadow', N'Chất liệu: 53% Nylon, 47% Cotton. Lớp lót: 81% Polyester, 19% Cotton
Kiểu dáng nón bucket hiện đại
Thiết kế lấy cảm hứng từ hiệp hội bóng chày MLB
Cộng hưởng cùng chi tiết logo thêu nổi bật
Chất vải mềm mịn, thấm hút tốt
Gam màu hiện đại dễ dàng phối với nhiều trang phục và phụ kiện', 1100000, 0, 0, N'~/Content/Image_SanPham/c6.jpg', N'~/Content/Image_SanPham/c7.jpg', N'~/Content/Image_SanPham/c8.jpg', N'~/Content/Image_SanPham/c9.jpg', N'~/Content/Image_SanPham/c10.jpg', 3, 58, 6, N'1.100.000đ')
INSERT [dbo].[SanPham] ([SanPham_Id], [SanPham_Name], [SanPham_description], [SanPham_Price], [SanPham_priceSale], [Sale_key], [Main_img], [Img1], [Img2], [Img3], [Img4], [Type_SanPham_id], [SanPhamDetail_id], [SoLuong], [StringPrice]) VALUES (70, N'Hoodie White', N'Chất liệu: 100% Cotton
Thân thiện
Thấm hút thoát ẩm
Mềm mại
Kiểm soát mùi
Điều hòa nhiệt', 280000, 0, 0, N'~/Content/Image_SanPham/14052021100522_IMG_8433.jpg', N'~/Content/Image_SanPham/AO_HOODIE_U1AKH2041001_(Don_1).jpg', N'~/Content/Image_SanPham/AO_HOODIE_U1AKH2041001_(Don_2).jpg', N'~/Content/Image_SanPham/AO_HOODIE_U1AKH2041001_(Don_5).jpg', N'~/Content/Image_SanPham/AO_HOODIE_U1AKH2041001_(Don_8).jpg', 3, 59, 17, N'280.000đ')
INSERT [dbo].[SanPham] ([SanPham_Id], [SanPham_Name], [SanPham_description], [SanPham_Price], [SanPham_priceSale], [Sale_key], [Main_img], [Img1], [Img2], [Img3], [Img4], [Type_SanPham_id], [SanPhamDetail_id], [SoLuong], [StringPrice]) VALUES (71, N'Hoodie Red', N'Chất liệu: 100% Cotton
Thân thiện
Thấm hút thoát ẩm
Mềm mại
Kiểm soát mùi
Điều hòa nhiệt', 280000, 0, 0, N'~/Content/Image_SanPham/img_3516_ea41aa420b8b4f2191729f99e6e6e7e4_master.jpg', N'~/Content/Image_SanPham/img_3517_223a8459de5c4c549ea57a6c111c74a7_master.jpg', N'~/Content/Image_SanPham/86a8dfeea970602e396165_cab18b21bad640f1ab7df1356b1d2b5a_master.jpg', N'~/Content/Image_SanPham/4d632d4a5b479319ca5638_bbd328ff81cf4564be21b4286cba6eed_master.jpg', N'~/Content/Image_SanPham/1d71a23ad4a41dfa44b564_4c29d777c70c41faa8f5913c997582ca_master.jpg', 3, 60, 19, N'280.000đ')
INSERT [dbo].[SanPham] ([SanPham_Id], [SanPham_Name], [SanPham_description], [SanPham_Price], [SanPham_priceSale], [Sale_key], [Main_img], [Img1], [Img2], [Img3], [Img4], [Type_SanPham_id], [SanPhamDetail_id], [SoLuong], [StringPrice]) VALUES (72, N'Hoodie Green', N'Chất liệu: 100% Cotton
Thân thiện
Thấm hút thoát ẩm
Mềm mại
Kiểm soát mùi
Điều hòa nhiệt', 280000, 0, 0, N'~/Content/Image_SanPham/img_3522_31421a37635c44b3aea428f481dd5007_master.jpg', N'~/Content/Image_SanPham/91dd47494112894cd00350_1812d9d5fdd04b9499bcfdd9d647647b_master.jpg', N'~/Content/Image_SanPham/9a1d114e5d22957ccc3348_323924abb35041cb9746b5ca27423a88_master.jpg', N'~/Content/Image_SanPham/bdd05671502a9874c13b53_b8d8c33477f84ba88dd251ae4c3aedf0_master.jpg', N'~/Content/Image_SanPham/e4a59ff6d39a1bc4428b46_c0b3d0b8c7944435baad966f41a27ca9_master.jpg', 3, 61, 25, N'280.000đ')
INSERT [dbo].[SanPham] ([SanPham_Id], [SanPham_Name], [SanPham_description], [SanPham_Price], [SanPham_priceSale], [Sale_key], [Main_img], [Img1], [Img2], [Img3], [Img4], [Type_SanPham_id], [SanPhamDetail_id], [SoLuong], [StringPrice]) VALUES (73, N'Jogger Black', N'Chất liệu: dòng vải linen
Mặc vào người sẽ cảm thấy thoáng mát, dịu nhẹ, và thiết kế mới cải tiến này sẽ vẫn mang đến cho bạn vẻ ngoài năng động, pha một chút thanh lịch.', 425000, 0, 0, N'~/Content/Image_SanPham/j1.jpg', N'~/Content/Image_SanPham/j2.jpg', N'~/Content/Image_SanPham/j3.jpg', N'~/Content/Image_SanPham/j4.jpg', N'~/Content/Image_SanPham/j5.jpg', 2, 62, 56, N'425.000đ')
INSERT [dbo].[SanPham] ([SanPham_Id], [SanPham_Name], [SanPham_description], [SanPham_Price], [SanPham_priceSale], [Sale_key], [Main_img], [Img1], [Img2], [Img3], [Img4], [Type_SanPham_id], [SanPhamDetail_id], [SoLuong], [StringPrice]) VALUES (74, N'Jogger Black kéo dây', N'Chất liệu: 100% cotton
Mặc vào người sẽ cảm thấy thoáng mát, dịu nhẹ, và thiết kế mới cải tiến này sẽ vẫn mang đến cho bạn vẻ ngoài năng động, pha một chút thanh lịch.', 425000, 0, 0, N'~/Content/Image_SanPham/j6.jpg', N'~/Content/Image_SanPham/j7.jpg', N'~/Content/Image_SanPham/j8.jpg', N'~/Content/Image_SanPham/j9.jpg', N'~/Content/Image_SanPham/j10.jpg', 2, 63, 0, N'425.000đ')
INSERT [dbo].[SanPham] ([SanPham_Id], [SanPham_Name], [SanPham_description], [SanPham_Price], [SanPham_priceSale], [Sale_key], [Main_img], [Img1], [Img2], [Img3], [Img4], [Type_SanPham_id], [SanPhamDetail_id], [SoLuong], [StringPrice]) VALUES (75, N'Jogger Grey', N'Chất liệu: 100% cotton
Mặc vào người sẽ cảm thấy thoáng mát, dịu nhẹ, và thiết kế mới cải tiến này sẽ vẫn mang đến cho bạn vẻ ngoài năng động, pha một chút thanh lịch.', 425000, 0, 0, N'~/Content/Image_SanPham/j11.jpg', N'~/Content/Image_SanPham/j12.jpg', N'~/Content/Image_SanPham/j13.jpg', N'~/Content/Image_SanPham/j14.jpg', N'~/Content/Image_SanPham/j15.jpg', 2, 64, 0, N'425.000đ')
SET IDENTITY_INSERT [dbo].[SanPham] OFF
/****** Object:  Table [dbo].[Account]    Script Date: 01/12/2022 05:59:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Account_user] [nchar](30) NULL,
	[Account_password] [nchar](30) NULL,
	[Account_role_id] [int] NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON
INSERT [dbo].[Account] ([id], [Account_user], [Account_password], [Account_role_id]) VALUES (1, N'admin                         ', N'admin                         ', 1)
INSERT [dbo].[Account] ([id], [Account_user], [Account_password], [Account_role_id]) VALUES (2, N'user                          ', N'user                          ', 2)
INSERT [dbo].[Account] ([id], [Account_user], [Account_password], [Account_role_id]) VALUES (18, N'quocdai9.5.2000@gmail.com     ', N'01227973833                   ', 2)
SET IDENTITY_INSERT [dbo].[Account] OFF
/****** Object:  Table [dbo].[Infor]    Script Date: 01/12/2022 05:59:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Infor](
	[Infor_id] [int] IDENTITY(1,1) NOT NULL,
	[Account_id] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[TinhThanh] [nvarchar](50) NULL,
	[QuanHuyen] [nvarchar](50) NULL,
	[PhuongXa] [nvarchar](50) NULL,
	[BuyHistory] [nvarchar](50) NULL,
 CONSTRAINT [PK_Infor] PRIMARY KEY CLUSTERED 
(
	[Infor_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Infor] ON
INSERT [dbo].[Infor] ([Infor_id], [Account_id], [Name], [Phone], [DiaChi], [TinhThanh], [QuanHuyen], [PhuongXa], [BuyHistory]) VALUES (15, 18, N'Trần Quốc Đại', N'0777973833', NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Infor] OFF
/****** Object:  Table [dbo].[DonHang]    Script Date: 01/12/2022 05:59:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[DonHang_id] [int] IDENTITY(1,1) NOT NULL,
	[Account_ID] [int] NULL,
	[NgayGio] [datetime] NULL,
	[TinhTrangDonHang_id] [int] NULL,
	[PhuongThucThanhToan] [nvarchar](50) NULL,
	[TinhTrangThanhToan] [nvarchar](50) NULL,
	[Total] [int] NULL,
	[DonHangInfor_id] [int] NULL,
 CONSTRAINT [PK_DonHang] PRIMARY KEY CLUSTERED 
(
	[DonHang_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DonHang] ON
INSERT [dbo].[DonHang] ([DonHang_id], [Account_ID], [NgayGio], [TinhTrangDonHang_id], [PhuongThucThanhToan], [TinhTrangThanhToan], [Total], [DonHangInfor_id]) VALUES (6, NULL, CAST(0x0000AE1B000993A2 AS DateTime), 1, N'COD', N'Chưa thanh toán', 494000, 6)
INSERT [dbo].[DonHang] ([DonHang_id], [Account_ID], [NgayGio], [TinhTrangDonHang_id], [PhuongThucThanhToan], [TinhTrangThanhToan], [Total], [DonHangInfor_id]) VALUES (7, NULL, CAST(0x0000AE1B0054CE37 AS DateTime), 1, N'COD', N'Chưa thanh toán', 280000, 7)
INSERT [dbo].[DonHang] ([DonHang_id], [Account_ID], [NgayGio], [TinhTrangDonHang_id], [PhuongThucThanhToan], [TinhTrangThanhToan], [Total], [DonHangInfor_id]) VALUES (8, NULL, CAST(0x0000AE1B00628C69 AS DateTime), 1, N'COD', N'Chưa thanh toán', 1275000, 8)
SET IDENTITY_INSERT [dbo].[DonHang] OFF
/****** Object:  Table [dbo].[ProductListCheckout]    Script Date: 01/12/2022 05:59:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductListCheckout](
	[ProductListCheckout_id] [int] IDENTITY(1,1) NOT NULL,
	[DonHang_id] [int] NULL,
	[SanPham_id] [int] NULL,
	[SoLuong] [int] NULL,
	[Size] [nvarchar](50) NULL,
	[Price] [int] NULL,
	[StringPrice] [nvarchar](50) NULL,
 CONSTRAINT [PK_ProductListCheckout] PRIMARY KEY CLUSTERED 
(
	[ProductListCheckout_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ProductListCheckout] ON
INSERT [dbo].[ProductListCheckout] ([ProductListCheckout_id], [DonHang_id], [SanPham_id], [SoLuong], [Size], [Price], [StringPrice]) VALUES (5, 7, 70, 1, N'M', 280000, N'280.000')
INSERT [dbo].[ProductListCheckout] ([ProductListCheckout_id], [DonHang_id], [SanPham_id], [SoLuong], [Size], [Price], [StringPrice]) VALUES (6, 8, 73, 1, N'M', 425000, N'425.000')
INSERT [dbo].[ProductListCheckout] ([ProductListCheckout_id], [DonHang_id], [SanPham_id], [SoLuong], [Size], [Price], [StringPrice]) VALUES (7, 8, 73, 2, N'L', 850000, N'850.000')
SET IDENTITY_INSERT [dbo].[ProductListCheckout] OFF
/****** Object:  ForeignKey [FK_SanPham_SanPhamDetail]    Script Date: 01/12/2022 05:59:35 ******/
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_SanPhamDetail] FOREIGN KEY([SanPhamDetail_id])
REFERENCES [dbo].[SanPhamDetail] ([SanPhamDetail_id])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_SanPhamDetail]
GO
/****** Object:  ForeignKey [FK_SanPham_Type_SanPham]    Script Date: 01/12/2022 05:59:35 ******/
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_Type_SanPham] FOREIGN KEY([Type_SanPham_id])
REFERENCES [dbo].[Type_SanPham] ([Type_SanPham_id])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_Type_SanPham]
GO
/****** Object:  ForeignKey [FK_Account_Account_role]    Script Date: 01/12/2022 05:59:35 ******/
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Account_role] FOREIGN KEY([Account_role_id])
REFERENCES [dbo].[Account_role] ([Account_role_id])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Account_role]
GO
/****** Object:  ForeignKey [FK_Infor_Account]    Script Date: 01/12/2022 05:59:35 ******/
ALTER TABLE [dbo].[Infor]  WITH CHECK ADD  CONSTRAINT [FK_Infor_Account] FOREIGN KEY([Account_id])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Infor] CHECK CONSTRAINT [FK_Infor_Account]
GO
/****** Object:  ForeignKey [FK_DonHang_Account]    Script Date: 01/12/2022 05:59:35 ******/
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_DonHang_Account] FOREIGN KEY([Account_ID])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_DonHang_Account]
GO
/****** Object:  ForeignKey [FK_DonHang_DonHangInfor1]    Script Date: 01/12/2022 05:59:35 ******/
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_DonHang_DonHangInfor1] FOREIGN KEY([DonHangInfor_id])
REFERENCES [dbo].[DonHangInfor] ([DonHangInfor_id])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_DonHang_DonHangInfor1]
GO
/****** Object:  ForeignKey [FK_DonHang_TinhTrangDonHang]    Script Date: 01/12/2022 05:59:35 ******/
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_DonHang_TinhTrangDonHang] FOREIGN KEY([TinhTrangDonHang_id])
REFERENCES [dbo].[TinhTrangDonHang] ([TinhTrangDonHang_id])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_DonHang_TinhTrangDonHang]
GO
/****** Object:  ForeignKey [FK_ProductListCheckout_DonHang]    Script Date: 01/12/2022 05:59:35 ******/
ALTER TABLE [dbo].[ProductListCheckout]  WITH CHECK ADD  CONSTRAINT [FK_ProductListCheckout_DonHang] FOREIGN KEY([DonHang_id])
REFERENCES [dbo].[DonHang] ([DonHang_id])
GO
ALTER TABLE [dbo].[ProductListCheckout] CHECK CONSTRAINT [FK_ProductListCheckout_DonHang]
GO
/****** Object:  ForeignKey [FK_ProductListCheckout_SanPham]    Script Date: 01/12/2022 05:59:35 ******/
ALTER TABLE [dbo].[ProductListCheckout]  WITH CHECK ADD  CONSTRAINT [FK_ProductListCheckout_SanPham] FOREIGN KEY([SanPham_id])
REFERENCES [dbo].[SanPham] ([SanPham_Id])
GO
ALTER TABLE [dbo].[ProductListCheckout] CHECK CONSTRAINT [FK_ProductListCheckout_SanPham]
GO
