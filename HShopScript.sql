IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'Hshop2023')
BEGIN
  CREATE DATABASE Hshop2023;
END;
GO

USE [Hshop2023]
GO
/****** Object:  Table [dbo].[ChiTietHD]    Script Date: 12/1/2023 7:35:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHD](
	[MaCT] [int] IDENTITY(1,1) NOT NULL,
	[MaHD] [int] NOT NULL,
	[MaHH] [int] NOT NULL,
	[DonGia] [float] NOT NULL,
	[SoLuong] [int] NOT NULL,
	[GiamGia] [float] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[MaCT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[HangHoa]    Script Date: 12/1/2023 7:35:08 AM ******/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HangHoa](
	[MaHH] [int] IDENTITY(1,1) NOT NULL,
	[TenHH] [nvarchar](50) NOT NULL,
	[MaLoai] [int] NOT NULL,
	[MoTaDonVi] [nvarchar](50) NULL,
	[DonGia] [float] NULL,
	[Hinh] [nvarchar](50) NULL,
	[NgaySX] [datetime] NOT NULL,
	[GiamGia] [float] NOT NULL,
	[SoLanXem] [int] NOT NULL,
	[MoTa] [nvarchar](max) NULL,
	[MaNCC] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[MaHH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[vChiTietHoaDon]    Script Date: 12/1/2023 7:35:08 AM ******/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vChiTietHoaDon]
AS 
	SELECT cthd.*, TenHH
	FROM ChiTietHD cthd JOIN HangHoa hh 
		ON hh.MaHH = cthd.MaHH


GO


/****** Object:  Table [dbo].[ChuDe]    Script Date: 12/1/2023 7:35:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChuDe](
	[MaCD] [int] IDENTITY(1,1) NOT NULL,
	[TenCD] [nvarchar](50) NULL,
	[MaNV] [nvarchar](50) NULL,
 CONSTRAINT [PK_ChuDe] PRIMARY KEY CLUSTERED 
(
	[MaCD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[HoaDon]    Script Date: 12/1/2023 7:35:08 AM ******/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHD] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [nvarchar](20) NOT NULL,
	[NgayDat] [datetime] NOT NULL,
	[NgayCan] [datetime] NULL,
	[NgayGiao] [datetime] NULL,
	[HoTen] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](60) NOT NULL,
	[CachThanhToan] [nvarchar](50) NOT NULL,
	[CachVanChuyen] [nvarchar](50) NOT NULL,
	[PhiVanChuyen] [float] NOT NULL,
	[MaTrangThai] [int] NOT NULL,
	[MaNV] [nvarchar](50) NULL,
	[GhiChu] [nvarchar](50) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[KhachHang]    Script Date: 12/1/2023 7:35:08 AM ******/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [nvarchar](20) NOT NULL,
	[MatKhau] [nvarchar](50) NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[GioiTinh] [bit] NOT NULL,
	[NgaySinh] [datetime] NOT NULL,
	[DiaChi] [nvarchar](60) NULL,
	[DienThoai] [nvarchar](24) NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Hinh] [nvarchar](50) NULL,
	[HieuLuc] [bit] NOT NULL,
	[VaiTro] [int] NOT NULL,
	[RandomKey] [varchar](50) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Loai]    Script Date: 12/1/2023 7:35:08 AM ******/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loai](
	[MaLoai] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](50) NOT NULL,
	[MoTa] [nvarchar](max) NULL,
	[Hinh] [nvarchar](50) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 12/1/2023 7:35:08 AM ******/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNCC] [nvarchar](50) NOT NULL,
	[TenNCC] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[DienThoai] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[MoTa] [nvarchar](max) NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 12/1/2023 7:35:08 AM ******/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [nvarchar](50) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[MatKhau] [nvarchar](50) NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanCong]    Script Date: 12/1/2023 7:35:08 AM ******/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanCong](
	[MaPC] [int] IDENTITY(1,1) NOT NULL,
	[MaNV] [nvarchar](50) NOT NULL,
	[MaPB] [varchar](7) NOT NULL,
	[NgayPC] [datetime] NULL,
	[HieuLuc] [bit] NULL,
 CONSTRAINT [PK_PhanCong] PRIMARY KEY CLUSTERED 
(
	[MaPC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanQuyen]    Script Date: 12/1/2023 7:35:08 AM ******/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanQuyen](
	[MaPQ] [int] IDENTITY(1,1) NOT NULL,
	[MaPB] [varchar](7) NULL,
	[MaTrang] [int] NULL,
	[Them] [bit] NOT NULL,
	[Sua] [bit] NOT NULL,
	[Xoa] [bit] NOT NULL,
	[Xem] [bit] NOT NULL,
 CONSTRAINT [PK_PhanQuyen] PRIMARY KEY CLUSTERED 
(
	[MaPQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhongBan]    Script Date: 12/1/2023 7:35:08 AM ******/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhongBan](
	[MaPB] [varchar](7) NOT NULL,
	[TenPB] [nvarchar](50) NOT NULL,
	[ThongTin] [nvarchar](max) NULL,
 CONSTRAINT [PK_PhongBan] PRIMARY KEY CLUSTERED 
(
	[MaPB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrangThai]    Script Date: 12/1/2023 7:35:08 AM ******/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrangThai](
	[MaTrangThai] [int] NOT NULL,
	[TenTrangThai] [nvarchar](50) NOT NULL,
	[MoTa] [nvarchar](500) NULL,
 CONSTRAINT [PK_TrangThai] PRIMARY KEY CLUSTERED 
(
	[MaTrangThai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrangWeb]    Script Date: 12/1/2023 7:35:08 AM ******/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrangWeb](
	[MaTrang] [int] IDENTITY(1,1) NOT NULL,
	[TenTrang] [nvarchar](50) NOT NULL,
	[URL] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_TrangWeb] PRIMARY KEY CLUSTERED 
(
	[MaTrang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


--Drop table [ChiTietHD]
--Drop table [PhanQuyen]
--Drop table [TrangWeb]
--Drop table [PhanCong]
--Drop table [PhongBan]
--Drop table [NhaCungCap]
--Drop table [Loai]
--Drop table [HoiDap]
--Drop Table [HangHoa]
--Drop table [KhachHang]
--Drop table [NhanVien]
--Drop table [TrangThai]
--Drop table [HoaDon]

Select *from [YeuThich]
Select *from [ChiTietHD]
Select *from [PhanQuyen]
Select *from [TrangWeb]
Select *from [PhanCong]
Select *from [PhongBan]
Select *from [NhaCungCap]
Select *from [Loai]
Select *from [HoiDap]
Select *from [GopY]
Select *from [ChuDe]
Select *from [BanBe]
Select *from [HangHoa]
Select *from [KhachHang]
Select *from [NhanVien]
Select *from [TrangThai]
Select *from [HoaDon]

--delete from [Loai]
--Delete from [NhaCungCap]
--delete from [NhanVien]
--delete from [PhanCong]
--delete from [PhanQuyen]
--delete from [PhongBan]
--delete from [TrangThai]
--delete from ChiTietHD
--delete from HangHoa 
SET IDENTITY_INSERT [dbo].[ChiTietHD] ON 

INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (1, 1, 2, 45.000,2, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (2, 2, 1, 100.000, 3, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (3, 3, 3, 17.000, 2, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (4, 4, 7, 25.000, 2, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (5, 5, 9, 39.000, 8, 0)
SET IDENTITY_INSERT [dbo].[ChiTietHD] OFF
GO
SET IDENTITY_INSERT [dbo].[HangHoa] ON 
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1, N'Pizza xúc xích',2,N'Cái', 100.000, N'Pizza xúc xích.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'Món ăn xuất xứ từ Italia, lớp vỏ bánh vừa mỏng vừa giòn với lớp sốt cà chua rắc thêm thêm mai mozzarelle cùng với xúc xích', N'Lottte')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (2, N'Phở Bò',1 , N'Phần', 45.000, N'Phở bò.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'Phở bò là 1 trong những điểm đặc trưng của ẩm thực Việt Nam vơi nước dùng được hầm từ xương ống bò rưới vào tô bánh phở, hương vị thật thơm ngon', N'PhoHong')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (3, N'Bánh Xèo', 3, N'Cái', 17.000, N'Bánh xèo.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 1, N'Bánh xèo là một loại bánh Việt Nam, có bột bên ngoài, bên trong có nhân là tôm, thịt, giá đỗ, được rán màu vàng, đúc thành hình tròn hoặc gấp lại thành hình bán nguyệt', N'BaoTran')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (4, N'Bánh Mì', 3, N'Cái', 27.000,N'Bánh mì.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'Bánh mì là thực phẩm được chế biến từ bột mì hoặc từ ngũ cốc được nghiền ra trộn với nước, thường là bằng cách nướng', N'Lotte')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (5, N'Gỏi Sứa', 8, N'Phần', 70.000, N'Gỏi sứa.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'Nộm sứa, còn gọi là gỏi sứa, là món nộm sử dụng nguyên liệu chính là sứa đã được sơ chế, chần qua nước sôi, trộn chua ngọt với các loại rau, thịt động vật và gia vị.', N'BaoTran')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (6, N'Bánh Canh', 3, N'Phần', 35.000,N'Bánh canh.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'Bánh canh là một món ăn Việt Nam. Bánh canh có nguồn gốc từ Đông Nam Bộ, sau đó phổ biến khắp Việt Nam. Bánh canh bao gồm nước lèo được nấu từ tôm, cá và giò heo thêm gia vị tùy theo từng loại bánh canh', N'ThienTrang')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (7, N'Bánh Tráng Trộn', 4, N'Phần',25.000, N'Bánh tráng trộn.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'Bánh tráng trộn là món ăn vặt gắn liền với tuổi thơ của rất nhiều người. Vị chua của xoài xanh quyện cùng bò khô, đậu phộng, sợi bánh tráng dai dai kèm rau răm, nước sốt khiến bao con tim “thổn thức”.', N'BaoTran')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (8, N'Trà Sữa', 5,N'Ly', 20.000, N'Trà sữa.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'Đây là một trong loại đồ uống thu hút mọi đối tượng. Điều đặc biệt ở trà sữa chính là sự kết hợp hòa quyện của trà và sữa tạo ra những hương vị mới lạ.', N'Lotte')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (9, N'Hamburger', 3, N'Cái', 39.000, N'Hamburger.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1, N'Hamburger là một loại thức ăn bao gồm bánh mì kẹp thịt xay (thường là thịt bò) ở giữa. Miếng thịt có thể được nướng, chiên, hun khói hay nướng trên lửa.', N'Lotte')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10, N'Gà Rán', 6, N'Phần', 50.000, N'Gà rán.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'Gà rán là một món ăn xuất xứ từ miền Nam Hoa Kỳ; nguyên liệu chính là những miếng thịt gà đã được lăn bột rồi chiên trên chảo, chiên ngập dầu, chiên áp suất hoặc chiên chân không', N'KFC')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (11, N'Gỏi Gà',8,N'Phần', 70.000, N'Gỏi gà.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'Món gỏi gà ta là một sự kết hợp tinh tế giữa thịt gà ta thơm ngon và các loại rau sống tươi mát. Thịt gà được nấu chín mềm, thái nhỏ và trộn đều với các loại rau thơm', N'BaoTran')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (12, N'Gỏi Tai Heo',8, N'Phần', 70.000, N'Gỏi tai heo.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'Gỏi tai heo là một món nộm ngon, được nhiều người yêu thích. Món ăn này thường có vị chua chua ngọt ngọt rất thanh mát, giúp giải nhiệt và kích thích ăn uống.', N'BaoTran')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (13, N'Gà Nướng', 6, N'Con', 200.000, N'Gà nướng.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 1, N'Gà nướng là món ăn bắt nguồn từ một loại lò nướng đất sét hình trụ, thịt gà được tẩm ướp với sữa chua, ớt bột và nhiều loại gia vị sau đó đem nướng trong lò đất truyền thống đến khi có màu vàng và mùi thơm', N'KFC')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (14, N'Gà Ủ Muối', 6, N'Con', 210.000,N'Gà ủ muối.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'Gà ủ muối là một món ngon đặc sản ở vùng Thái Nguyên. Những con gà ta được tuyển chọn được sơ chế sạch sẽ tẩm ướp thêm các loại gia vị đặc trưng của núi rừng miền Bắc như lá móc mật, chanh, sả tạo nên hương vị đặc trưng.', N'KFC')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (15, N'Trà Chanh Dây', 5, N'Ly', 20.000, N'Trà chanh dây.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'Trà chanh là một thức uống giải khát được kết hợp cân bằng giữa vị thanh chát dịu của trà cùng vị chua của chanh tạo nên thứ đồ uống độc đáo giải khát vào mùa hè.', N'Lotte')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (16, N'Trà Đào', 5, N'Ly', 20.000,N'Trà đào.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'Trà đào là một thức uống mang hương vị ngọt ngào, tươi mới, là sự kết hợp của những lát đào chua chua ngọt ngọt cùng hương đậm đà của trà', N'Lotte')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (17, N'Bánh Tráng Nướng', 4, N'Cái',15.000, N'Bánh tráng nướng.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'Bánh tráng nướng nó được làm từ loại bánh tráng mỏng nướng giòn với phần nhân bánh phong phú như xúc xích, gà xé, thập cẩm, hải sản, khô bò, phô mai, trứng gà...,', N'BaoTran')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (18, N'Bánh Tráng cuốn', 4,N'Phần', 25.000, N'Bánh tráng cuốn.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'Bánh tráng cuốn mang vị ngọt dịu, mềm dẻo của bánh tráng trắng. Những chiếc bánh tráng được làm từ những hạt gạo mới nhất, thơm ngon nhất', N'BaoTran')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (19, N'Bún Riêu', 7, N'Phần', 35.000, N'Bún riêu.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1, N'Bún riêu được nấu từ quả dọc, cà chua, mỡ nước, giấm bỗng, nước mắm, muối, hành hoa. Bún riêu thường thêm chút mắm tôm để tăng thêm vị đậm đà', N'ThienTrang')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (20, N'Bún Măng Vịt', 7, N'Phần', 40.000, N'Bún măng vịt.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'Bún măng vịt là món ăn độc đáo và vô cùng hấp dẫn nhờ sự kết hợp giữa thịt vịt dai ngon và hương vị thanh ngọt của nước dùng', N'ThienTrang')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (21, N'Bún Bò', 7, N'Phần',15.000, N'Bún bò.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'Bún bò chính gốc Huế có nguyên liệu chính là bún, thịt bắp bò, giò heo, cùng nước dùng có màu đỏ đặc trưng do ớt và vị sả và ruốc.', N'ThienTrang')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (22, N'Pizza phô mai', 2,N'Cái', 25.000, N'Pizza phô mai.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'Pizza làm từ cheese (phô mai) đặc trưng với hương vị thơm béo, lớp nhân bên trong được gấp đôi hoặc gấp ba phô mai vàng ươm, kết cấu dai dai và kéo sợi, đem lại trải nghiệm “bùng nổ” về vị giác', N'Lotte')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (23, N'Phở Cuốn', 1, N'Phần', 35.000, N'Phở cuốn.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1, N'Bánh phở được tráng mỏng, cuộn lẫn thịt bò xào chín với rau thơm. Nước chấm phở cuốn có vị tương tự như nước mắm của bún chả Hà Nội', N'PhoHong')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (24, N'Phở Gà', 1, N'Phần', 40.000, N'Phở gà.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'Phở gà là món có hương vị thơm ngon của nguyên liệu tự nhiên, khi nấu chín sợi phở trở nên dai, kích thích vị giác, phù hợp khẩu vị của đa số người tiêu dùng.', N'PhoHong')

SET IDENTITY_INSERT [dbo].[HangHoa] OFF
GO
SET IDENTITY_INSERT [dbo].[HoaDon] ON 

INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (1, N'TTNP', CAST(N'2022-07-04T00:00:00.000' AS DateTime), CAST(N'2022-08-01T00:00:00.000' AS DateTime), CAST(N'2022-07-16T00:00:00.000' AS DateTime), NULL, N'Phường 7,DaLat', N'Cash', N'Airline', 0, 0, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (2, N'NTAP', CAST(N'2022-07-05T00:00:00.000' AS DateTime), CAST(N'2022-08-16T00:00:00.000' AS DateTime), CAST(N'2022-07-10T00:00:00.000' AS DateTime), NULL, N'Phường 2,DaLat', N'Cash', N'Airline', 0, 0, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (3, N'TTNP', CAST(N'2022-07-08T00:00:00.000' AS DateTime), CAST(N'2022-08-05T00:00:00.000' AS DateTime), CAST(N'2022-07-12T00:00:00.000' AS DateTime), NULL, N'Vĩnh Trung,TP Nha Trang', N'Cash', N'Airline', 0, 0, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (4, N'NPT', CAST(N'2022-07-08T00:00:00.000' AS DateTime), CAST(N'2022-08-05T00:00:00.000' AS DateTime), CAST(N'2022-07-15T00:00:00.000' AS DateTime), NULL, N'Vĩnh Thái,TP Nha Trang', N'Cash', N'Airline', 0, 0, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (5, N'NTT', CAST(N'2022-07-09T00:00:00.000' AS DateTime), CAST(N'2022-08-06T00:00:00.000' AS DateTime), CAST(N'2022-07-11T00:00:00.000' AS DateTime), NULL, N'Minh Hưng,Bình Phước', N'Cash', N'Airline', 0, 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[HoaDon] OFF
GO


INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'TTNP', N'iloveyou', N'Trần Thị Nhã Phương', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Bình Thuận', N'0987645656', N'tnp@gmail.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'NTAP', N'iloveyou', N'Nguyễn Thị Ánh Phượng', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Đà Lạt', N'0956434235', N'ntap@gmail.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'NTT', N'iloveyou', N'Nguyễn Thùy Trâm', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Nha Trang', N'0989878967', N'ntt@gmail.com', N'User.jpg', 1, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'NPT', N'iloveyou', N'Ngô Phúc Thịnh', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Nha Trang', N'0987687654', N'npt@gmail.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'NHD', N'iloveyou', N'Nguyễn Hải Đăng', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Nha Trang', N'097685587', N'nhd@gmail.com', N'User.jpg', 0, 0, NULL)

GO

SET IDENTITY_INSERT [dbo].[Loai] ON 

INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [MoTa], [Hinh]) VALUES (1, N'Phở', N'Ngon hết sẩy', N'')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [MoTa], [Hinh]) VALUES (2, N'Pizza', N'Ngon hết sẩy', N'')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [MoTa], [Hinh]) VALUES (3, N'Bánh', N'Ngon hết sẩy', N'')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [MoTa], [Hinh]) VALUES (4, N'Bánh Tráng', N'Ngon hết sẩy', N'')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [MoTa], [Hinh]) VALUES (5, N'Nước', N'Ngon hết sẩy', N'')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [MoTa], [Hinh]) VALUES (6, N'Gà', N'Ngon hết sẩy', N'')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [MoTa], [Hinh]) VALUES (7, N'Bún', N'Ngon hết sẩy', N'')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [MoTa], [Hinh]) VALUES (8, N'Gỏi', N'Ngon hết sẩy', N'')

SET IDENTITY_INSERT [dbo].[Loai] OFF
GO

INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [Email], [DienThoai], [DiaChi], [MoTa]) VALUES (N'KF', N'KFC', N'kfc@gmail.com', N'0987345876',N'17 Nguyên Công Trứ P.7 Nha Trang', N'Vị ngon trên từng ngón tay')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [Email], [DienThoai], [DiaChi], [MoTa]) VALUES (N'TT', N'ThienTrang', N'tt@gmail.com', N'0918456987',N'111 tổ 16 thôn Xuân Sơn Nha Trang', N'Nóng hổi vừa thổi vừa ăn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [Email], [DienThoai], [DiaChi], [MoTa]) VALUES (N'PH', N'PhoHong', N'ph@gmail.com', N'0913745789',N'20 Chi Lăng P.9 Đà Lạt', N'Sự hài lòng của bạn là sự thành công của chúng tôi')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [Email], [DienThoai], [DiaChi], [MoTa]) VALUES (N'BT', N'BaoTran', N'bt@gmail.com', N'0987456876',N'Quảng trường Lâm Viên', N'Ngon, giá cả hợp túi tiền')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [Email], [DienThoai], [DiaChi], [MoTa]) VALUES (N'LT', N'Lotte', N'lt@gmail.com', N'0913745789',N'11 Bùi Thị Xuân Đà Lạt', N'Khách hàng là thượng đế')
GO

INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [Email], [MatKhau]) VALUES (N'tnp', N'Trần Nhã Phương', N'tnp@gmail.com', N'123')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [Email], [MatKhau]) VALUES (N'tvp', N'Trần Văn Phúc', N'tvp@gmail.com', N'123')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [Email], [MatKhau]) VALUES (N'nvb', N'Nguyễn Văn Bảo', N'nvb@gmail.com', N'123')
GO

SET IDENTITY_INSERT [dbo].[PhanCong] ON 

INSERT [dbo].[PhanCong] ([MaPC], [MaNV], [MaPB], [NgayPC], [HieuLuc]) VALUES (1, N'tnp',N'BGD' , CAST(N'2017-12-17T10:10:06.877' AS DateTime), 0)
INSERT [dbo].[PhanCong] ([MaPC], [MaNV], [MaPB], [NgayPC], [HieuLuc]) VALUES (2, N'tvp',N'BGD', CAST(N'2017-11-11T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[PhanCong] ([MaPC], [MaNV], [MaPB], [NgayPC], [HieuLuc]) VALUES (3, N'nvb',N'BGD', CAST(N'2017-12-17T10:15:51.303' AS DateTime), 1)
INSERT [dbo].[PhanCong] ([MaPC], [MaNV], [MaPB], [NgayPC], [HieuLuc]) VALUES (4, N'nvb',N'PKD', CAST(N'2017-12-17T10:15:51.333' AS DateTime), 1)
INSERT [dbo].[PhanCong] ([MaPC], [MaNV], [MaPB], [NgayPC], [HieuLuc]) VALUES (5, N'nvb',N'PKD', CAST(N'2017-12-17T10:16:19.203' AS DateTime), 0)
INSERT [dbo].[PhanCong] ([MaPC], [MaNV], [MaPB], [NgayPC], [HieuLuc]) VALUES (6, N'tnp',N'PKT', CAST(N'2017-12-17T10:16:19.213' AS DateTime), 0)
INSERT [dbo].[PhanCong] ([MaPC], [MaNV], [MaPB], [NgayPC], [HieuLuc]) VALUES (7, N'tnp',N'PKT', CAST(N'2017-12-17T10:16:39.180' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[PhanCong] OFF
GO


SET IDENTITY_INSERT [dbo].[PhanQuyen] ON 
INSERT [dbo].[PhanQuyen] ([MaPQ], [MaPB], [MaTrang], [Them], [Sua], [Xoa], [Xem]) VALUES (1, N'BGD', 1, 0, 0, 0, 0)
INSERT [dbo].[PhanQuyen] ([MaPQ], [MaPB], [MaTrang], [Them], [Sua], [Xoa], [Xem]) VALUES (2, N'PKD', 2, 0, 0, 0, 0)
INSERT [dbo].[PhanQuyen] ([MaPQ], [MaPB], [MaTrang], [Them], [Sua], [Xoa], [Xem]) VALUES (3, N'PKT', 3, 0, 0, 0, 0)

SET IDENTITY_INSERT [dbo].[PhanQuyen] OFF
GO

INSERT [dbo].[PhongBan] ([MaPB], [TenPB], [ThongTin]) VALUES (N'BGD', N'Ban Giám Đốc', NULL)
INSERT [dbo].[PhongBan] ([MaPB], [TenPB], [ThongTin]) VALUES (N'PKD', N'Phòng kinh doanh', NULL)
INSERT [dbo].[PhongBan] ([MaPB], [TenPB], [ThongTin]) VALUES (N'PKT', N'Phòng Kỹ thuật', NULL)
INSERT [dbo].[PhongBan] ([MaPB], [TenPB], [ThongTin]) VALUES (N'PKTo', N'Phòng Kế toán', NULL)
GO

INSERT [dbo].[TrangThai] ([MaTrangThai], [TenTrangThai], [MoTa]) VALUES (-1, N'Khách hàng hủy đơn hàng', NULL)
INSERT [dbo].[TrangThai] ([MaTrangThai], [TenTrangThai], [MoTa]) VALUES (0, N'Mới đặt hàng', NULL)
INSERT [dbo].[TrangThai] ([MaTrangThai], [TenTrangThai], [MoTa]) VALUES (1, N'Đã thanh toán', NULL)
INSERT [dbo].[TrangThai] ([MaTrangThai], [TenTrangThai], [MoTa]) VALUES (2, N'Chờ giao hàng', NULL)
INSERT [dbo].[TrangThai] ([MaTrangThai], [TenTrangThai], [MoTa]) VALUES (3, N'Đã giao hàng', NULL)
GO
SET IDENTITY_INSERT [dbo].[TrangWeb] ON 

INSERT [dbo].[TrangWeb] ([MaTrang], [TenTrang], [URL]) VALUES (1, N'Trang chủ Admin', N'Default.aspx')
INSERT [dbo].[TrangWeb] ([MaTrang], [TenTrang], [URL]) VALUES (2, N'Quản lý Đơn hàng', N'QLDonHang.aspx')
INSERT [dbo].[TrangWeb] ([MaTrang], [TenTrang], [URL]) VALUES (3, N'Quản lý Hàng hóa', N'QLHangHoa.aspx')

SET IDENTITY_INSERT [dbo].[TrangWeb] OFF
GO

ALTER TABLE [dbo].[BanBe] ADD  CONSTRAINT [DF_Promotions_Sent]  DEFAULT (getdate()) FOR [NgayGui]
GO
ALTER TABLE [dbo].[ChiTietHD] ADD  CONSTRAINT [DF_Order_Details_UnitPrice]  DEFAULT ((0)) FOR [DonGia]
GO
ALTER TABLE [dbo].[ChiTietHD] ADD  CONSTRAINT [DF_Order_Details_Quantity]  DEFAULT ((1)) FOR [SoLuong]
GO
ALTER TABLE [dbo].[ChiTietHD] ADD  CONSTRAINT [DF_Order_Details_Discount]  DEFAULT ((0)) FOR [GiamGia]
GO
ALTER TABLE [dbo].[GopY] ADD  CONSTRAINT [DF_GopY_NgayGY]  DEFAULT (getdate()) FOR [NgayGY]
GO
ALTER TABLE [dbo].[GopY] ADD  CONSTRAINT [DF_GopY_CanTraLoi]  DEFAULT ((0)) FOR [CanTraLoi]
GO
ALTER TABLE [dbo].[HangHoa] ADD  CONSTRAINT [DF_Products_UnitPrice]  DEFAULT ((0)) FOR [DonGia]
GO
ALTER TABLE [dbo].[HangHoa] ADD  CONSTRAINT [DF_Products_ProductDate]  DEFAULT (getdate()) FOR [NgaySX]
GO
ALTER TABLE [dbo].[HangHoa] ADD  CONSTRAINT [DF_Products_Discount]  DEFAULT ((0)) FOR [GiamGia]
GO
ALTER TABLE [dbo].[HangHoa] ADD  CONSTRAINT [DF_Products_Votes]  DEFAULT ((0)) FOR [SoLanXem]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF_Orders_OrderDate]  DEFAULT (getdate()) FOR [NgayDat]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF_Orders_RequireDate]  DEFAULT (getdate()) FOR [NgayCan]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF_Orders_ShippedDate]  DEFAULT (((1)/(1))/(1900)) FOR [NgayGiao]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF_Orders_PaymentMethod]  DEFAULT (N'Cash') FOR [CachThanhToan]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF_Orders_ShippingMethod]  DEFAULT (N'Airline') FOR [CachVanChuyen]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF_Orders_Freight]  DEFAULT ((0)) FOR [PhiVanChuyen]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF_Orders_Status]  DEFAULT ((0)) FOR [MaTrangThai]
GO
ALTER TABLE [dbo].[HoiDap] ADD  CONSTRAINT [DF_HoiDap_NgayDua]  DEFAULT (getdate()) FOR [NgayDua]
GO
ALTER TABLE [dbo].[KhachHang] ADD  CONSTRAINT [DF_Customers_Gender]  DEFAULT ((0)) FOR [GioiTinh]
GO
ALTER TABLE [dbo].[KhachHang] ADD  CONSTRAINT [DF_Customers_Birthday]  DEFAULT (getdate()) FOR [NgaySinh]
GO
ALTER TABLE [dbo].[KhachHang] ADD  CONSTRAINT [DF_Customers_Photo]  DEFAULT (N'Photo.gif') FOR [Hinh]
GO
ALTER TABLE [dbo].[KhachHang] ADD  CONSTRAINT [DF_Customers_Active]  DEFAULT ((0)) FOR [HieuLuc]
GO
ALTER TABLE [dbo].[KhachHang] ADD  CONSTRAINT [DF_Customers_UserLevel]  DEFAULT ((0)) FOR [VaiTro]
GO
ALTER TABLE [dbo].[PhanQuyen] ADD  CONSTRAINT [DF_PhanQuyen_Them]  DEFAULT ((0)) FOR [Them]
GO
ALTER TABLE [dbo].[PhanQuyen] ADD  CONSTRAINT [DF_PhanQuyen_Sua]  DEFAULT ((0)) FOR [Sua]
GO
ALTER TABLE [dbo].[PhanQuyen] ADD  CONSTRAINT [DF_PhanQuyen_Xoa]  DEFAULT ((0)) FOR [Xoa]
GO
ALTER TABLE [dbo].[PhanQuyen] ADD  CONSTRAINT [DF_PhanQuyen_Xem]  DEFAULT ((0)) FOR [Xem]
GO
ALTER TABLE [dbo].[BanBe]  WITH CHECK ADD  CONSTRAINT [FK_BanBe_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[BanBe] CHECK CONSTRAINT [FK_BanBe_KhachHang]
GO
ALTER TABLE [dbo].[BanBe]  WITH CHECK ADD  CONSTRAINT [FK_QuangBa_HangHoa] FOREIGN KEY([MaHH])
REFERENCES [dbo].[HangHoa] ([MaHH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BanBe] CHECK CONSTRAINT [FK_QuangBa_HangHoa]
GO
ALTER TABLE [dbo].[ChiTietHD]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoaDon] ([MaHD])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietHD] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[ChiTietHD]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([MaHH])
REFERENCES [dbo].[HangHoa] ([MaHH])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[ChiTietHD] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[ChuDe]  WITH CHECK ADD  CONSTRAINT [FK_ChuDe_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChuDe] CHECK CONSTRAINT [FK_ChuDe_NhanVien]
GO
ALTER TABLE [dbo].[GopY]  WITH CHECK ADD  CONSTRAINT [FK_GopY_ChuDe] FOREIGN KEY([MaCD])
REFERENCES [dbo].[ChuDe] ([MaCD])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GopY] CHECK CONSTRAINT [FK_GopY_ChuDe]
GO
ALTER TABLE [dbo].[HangHoa]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[Loai] ([MaLoai])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HangHoa] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[HangHoa]  WITH CHECK ADD  CONSTRAINT [FK_Products_Suppliers] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HangHoa] CHECK CONSTRAINT [FK_Products_Suppliers]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_NhanVien]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_TrangThai] FOREIGN KEY([MaTrangThai])
REFERENCES [dbo].[TrangThai] ([MaTrangThai])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_TrangThai]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[HoiDap]  WITH CHECK ADD  CONSTRAINT [FK_HoiDap_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HoiDap] CHECK CONSTRAINT [FK_HoiDap_NhanVien]
GO
ALTER TABLE [dbo].[PhanCong]  WITH CHECK ADD  CONSTRAINT [FK_PhanCong_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[PhanCong] CHECK CONSTRAINT [FK_PhanCong_NhanVien]
GO
ALTER TABLE [dbo].[PhanCong]  WITH CHECK ADD  CONSTRAINT [FK_PhanCong_PhongBan] FOREIGN KEY([MaPB])
REFERENCES [dbo].[PhongBan] ([MaPB])
GO
ALTER TABLE [dbo].[PhanCong] CHECK CONSTRAINT [FK_PhanCong_PhongBan]
GO
ALTER TABLE [dbo].[PhanQuyen]  WITH CHECK ADD  CONSTRAINT [FK_PhanQuyen_PhongBan] FOREIGN KEY([MaPB])
REFERENCES [dbo].[PhongBan] ([MaPB])
GO
ALTER TABLE [dbo].[PhanQuyen] CHECK CONSTRAINT [FK_PhanQuyen_PhongBan]
GO
ALTER TABLE [dbo].[PhanQuyen]  WITH CHECK ADD  CONSTRAINT [FK_PhanQuyen_TrangWeb] FOREIGN KEY([MaTrang])
REFERENCES [dbo].[TrangWeb] ([MaTrang])
GO
ALTER TABLE [dbo].[PhanQuyen] CHECK CONSTRAINT [FK_PhanQuyen_TrangWeb]
GO
ALTER TABLE [dbo].[YeuThich]  WITH CHECK ADD  CONSTRAINT [FK_Favorites_Customers] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[YeuThich] CHECK CONSTRAINT [FK_Favorites_Customers]
GO
ALTER TABLE [dbo].[YeuThich]  WITH CHECK ADD  CONSTRAINT [FK_YeuThich_HangHoa] FOREIGN KEY([MaHH])
REFERENCES [dbo].[HangHoa] ([MaHH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[YeuThich] CHECK CONSTRAINT [FK_YeuThich_HangHoa]
GO
