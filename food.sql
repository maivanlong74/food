USE [food]
GO
/****** Object:  Table [dbo].[khachhang]    Script Date: 21/12/2022 10:28:41 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[khachhang](
	[makh] [bigint] IDENTITY(1,1) NOT NULL,
	[hoten] [nvarchar](100) NULL,
	[sodt] [bigint] NULL,
	[diachi] [nvarchar](50) NULL,
	[thenganhang] [bigint] NULL,
	[tennganhang] [nvarchar](50) NULL,
	[ten_anh] [nvarchar](50) NULL,
	[tendn] [nvarchar](50) NULL,
	[pass] [nvarchar](50) NULL,
 CONSTRAINT [PK_khachhang] PRIMARY KEY CLUSTERED 
(
	[makh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[phanhoi]    Script Date: 21/12/2022 10:28:41 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[phanhoi](
	[matinnhan] [bigint] IDENTITY(1,1) NOT NULL,
	[makh] [bigint] NOT NULL,
	[noidung] [nvarchar](max) NULL,
 CONSTRAINT [PK_phanhoi] PRIMARY KEY CLUSTERED 
(
	[matinnhan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[htphanhoi]    Script Date: 21/12/2022 10:28:41 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[htphanhoi]
AS
SELECT        dbo.phanhoi.matinnhan, dbo.khachhang.ten_anh, dbo.khachhang.hoten, dbo.phanhoi.noidung
FROM            dbo.khachhang INNER JOIN
                         dbo.phanhoi ON dbo.khachhang.makh = dbo.phanhoi.makh
GO
/****** Object:  Table [dbo].[chitiethoadon]    Script Date: 21/12/2022 10:28:41 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chitiethoadon](
	[mahoadon] [bigint] NOT NULL,
	[machitiethoadon] [bigint] IDENTITY(1,1) NOT NULL,
	[masanpham] [nvarchar](50) NOT NULL,
	[soluongmua] [int] NOT NULL,
	[damua] [bit] NULL,
 CONSTRAINT [PK_chitiethoadon] PRIMARY KEY CLUSTERED 
(
	[machitiethoadon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hoadon]    Script Date: 21/12/2022 10:28:41 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hoadon](
	[mahoadon] [bigint] IDENTITY(1,1) NOT NULL,
	[makh] [bigint] NOT NULL,
	[ngaymua] [datetime] NOT NULL,
	[damua] [bit] NULL,
 CONSTRAINT [PK_hoadon] PRIMARY KEY CLUSTERED 
(
	[mahoadon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sanpham]    Script Date: 21/12/2022 10:28:41 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sanpham](
	[masanpham] [nvarchar](50) NOT NULL,
	[tensanpham] [nvarchar](50) NULL,
	[soluong] [bigint] NULL,
	[gia] [bigint] NULL,
	[maloai] [nvarchar](50) NULL,
	[sotap] [nvarchar](50) NULL,
	[anh] [nvarchar](50) NULL,
	[video] [nvarchar](50) NULL,
 CONSTRAINT [PK_sanpham_1] PRIMARY KEY CLUSTERED 
(
	[masanpham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[lichsu]    Script Date: 21/12/2022 10:28:41 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[lichsu]
AS
SELECT        dbo.khachhang.makh, dbo.hoadon.mahoadon, dbo.khachhang.hoten, dbo.hoadon.ngaymua, dbo.chitiethoadon.soluongmua * dbo.sanpham.gia AS ThanhTien, dbo.hoadon.damua
FROM            dbo.hoadon INNER JOIN
                         dbo.chitiethoadon ON dbo.hoadon.mahoadon = dbo.chitiethoadon.mahoadon INNER JOIN
                         dbo.khachhang ON dbo.hoadon.makh = dbo.khachhang.makh INNER JOIN
                         dbo.sanpham ON dbo.chitiethoadon.masanpham = dbo.sanpham.masanpham
GO
/****** Object:  View [dbo].[xacnhan]    Script Date: 21/12/2022 10:28:41 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[xacnhan]
AS
SELECT        dbo.chitiethoadon.machitiethoadon, dbo.khachhang.hoten, dbo.sanpham.tensanpham, dbo.hoadon.ngaymua, dbo.chitiethoadon.soluongmua, dbo.chitiethoadon.soluongmua * dbo.sanpham.gia AS ThanhTien, 
                         dbo.hoadon.damua
FROM            dbo.hoadon INNER JOIN
                         dbo.chitiethoadon ON dbo.hoadon.mahoadon = dbo.chitiethoadon.mahoadon INNER JOIN
                         dbo.khachhang ON dbo.hoadon.makh = dbo.khachhang.makh INNER JOIN
                         dbo.sanpham ON dbo.chitiethoadon.masanpham = dbo.sanpham.masanpham
GO
/****** Object:  Table [dbo].[dangnhap]    Script Date: 21/12/2022 10:28:41 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dangnhap](
	[tendangnhap] [nvarchar](50) NOT NULL,
	[matkhau] [nvarchar](50) NOT NULL,
	[quyen] [bit] NULL,
 CONSTRAINT [PK_dangnhap] PRIMARY KEY CLUSTERED 
(
	[tendangnhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[fileanh]    Script Date: 21/12/2022 10:28:41 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fileanh](
	[ma_anh] [bigint] IDENTITY(1,1) NOT NULL,
	[ten_anh] [nvarchar](50) NULL,
 CONSTRAINT [PK_fileanh] PRIMARY KEY CLUSTERED 
(
	[ma_anh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[loai]    Script Date: 21/12/2022 10:28:41 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[loai](
	[maloai] [nvarchar](50) NOT NULL,
	[tenloai] [nvarchar](50) NULL,
 CONSTRAINT [PK_loại] PRIMARY KEY CLUSTERED 
(
	[maloai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[chitiethoadon] ON 

INSERT [dbo].[chitiethoadon] ([mahoadon], [machitiethoadon], [masanpham], [soluongmua], [damua]) VALUES (20, 33, N'm11', 1, 1)
INSERT [dbo].[chitiethoadon] ([mahoadon], [machitiethoadon], [masanpham], [soluongmua], [damua]) VALUES (20, 34, N'm16', 1, 1)
INSERT [dbo].[chitiethoadon] ([mahoadon], [machitiethoadon], [masanpham], [soluongmua], [damua]) VALUES (21, 35, N'm1', 1, 1)
INSERT [dbo].[chitiethoadon] ([mahoadon], [machitiethoadon], [masanpham], [soluongmua], [damua]) VALUES (22, 36, N'm10', 1, 0)
INSERT [dbo].[chitiethoadon] ([mahoadon], [machitiethoadon], [masanpham], [soluongmua], [damua]) VALUES (23, 37, N'm11', 1, 0)
INSERT [dbo].[chitiethoadon] ([mahoadon], [machitiethoadon], [masanpham], [soluongmua], [damua]) VALUES (23, 38, N'm36', 1, 1)
INSERT [dbo].[chitiethoadon] ([mahoadon], [machitiethoadon], [masanpham], [soluongmua], [damua]) VALUES (24, 39, N'm1', 1, 0)
INSERT [dbo].[chitiethoadon] ([mahoadon], [machitiethoadon], [masanpham], [soluongmua], [damua]) VALUES (25, 40, N'm10', 1, 0)
INSERT [dbo].[chitiethoadon] ([mahoadon], [machitiethoadon], [masanpham], [soluongmua], [damua]) VALUES (26, 41, N'm11', 1, 0)
INSERT [dbo].[chitiethoadon] ([mahoadon], [machitiethoadon], [masanpham], [soluongmua], [damua]) VALUES (26, 42, N'm13', 1, 0)
INSERT [dbo].[chitiethoadon] ([mahoadon], [machitiethoadon], [masanpham], [soluongmua], [damua]) VALUES (27, 43, N'm1', 1, 0)
INSERT [dbo].[chitiethoadon] ([mahoadon], [machitiethoadon], [masanpham], [soluongmua], [damua]) VALUES (27, 44, N'm7', 1, 0)
INSERT [dbo].[chitiethoadon] ([mahoadon], [machitiethoadon], [masanpham], [soluongmua], [damua]) VALUES (28, 45, N'm10', 1, 0)
INSERT [dbo].[chitiethoadon] ([mahoadon], [machitiethoadon], [masanpham], [soluongmua], [damua]) VALUES (29, 46, N'm1', 1, 0)
INSERT [dbo].[chitiethoadon] ([mahoadon], [machitiethoadon], [masanpham], [soluongmua], [damua]) VALUES (29, 47, N'm14', 1, 0)
INSERT [dbo].[chitiethoadon] ([mahoadon], [machitiethoadon], [masanpham], [soluongmua], [damua]) VALUES (30, 48, N'm1', 1, 0)
INSERT [dbo].[chitiethoadon] ([mahoadon], [machitiethoadon], [masanpham], [soluongmua], [damua]) VALUES (31, 49, N'm16', 1, 0)
INSERT [dbo].[chitiethoadon] ([mahoadon], [machitiethoadon], [masanpham], [soluongmua], [damua]) VALUES (32, 50, N'm11', 1, 0)
INSERT [dbo].[chitiethoadon] ([mahoadon], [machitiethoadon], [masanpham], [soluongmua], [damua]) VALUES (33, 51, N'm16', 1, 0)
INSERT [dbo].[chitiethoadon] ([mahoadon], [machitiethoadon], [masanpham], [soluongmua], [damua]) VALUES (34, 52, N'm21', 1, 0)
INSERT [dbo].[chitiethoadon] ([mahoadon], [machitiethoadon], [masanpham], [soluongmua], [damua]) VALUES (35, 53, N'm14', 1, 0)
INSERT [dbo].[chitiethoadon] ([mahoadon], [machitiethoadon], [masanpham], [soluongmua], [damua]) VALUES (36, 54, N'm15', 1, 0)
INSERT [dbo].[chitiethoadon] ([mahoadon], [machitiethoadon], [masanpham], [soluongmua], [damua]) VALUES (37, 55, N'm19', 1, 0)
SET IDENTITY_INSERT [dbo].[chitiethoadon] OFF
GO
INSERT [dbo].[dangnhap] ([tendangnhap], [matkhau], [quyen]) VALUES (N'admin', N'123', 1)
GO
SET IDENTITY_INSERT [dbo].[fileanh] ON 

INSERT [dbo].[fileanh] ([ma_anh], [ten_anh]) VALUES (1, N'anh1.jpg')
INSERT [dbo].[fileanh] ([ma_anh], [ten_anh]) VALUES (2, N'anh2.jpg')
INSERT [dbo].[fileanh] ([ma_anh], [ten_anh]) VALUES (3, N'abc.jpg')
INSERT [dbo].[fileanh] ([ma_anh], [ten_anh]) VALUES (4, N'DSCN0873.JPG')
INSERT [dbo].[fileanh] ([ma_anh], [ten_anh]) VALUES (6, N'9FB7E695-0438-4532-9FD8-2BEF60082FAA.jpeg')
INSERT [dbo].[fileanh] ([ma_anh], [ten_anh]) VALUES (7, N'DSCN0888.JPG')
INSERT [dbo].[fileanh] ([ma_anh], [ten_anh]) VALUES (9, N'1588616652178_plus.jpg\Web_food\\avt')
INSERT [dbo].[fileanh] ([ma_anh], [ten_anh]) VALUES (10, N'\Web_food\\avtabc.mp4')
INSERT [dbo].[fileanh] ([ma_anh], [ten_anh]) VALUES (11, N'Web_food\\avtIMG_4001_1.jpg')
INSERT [dbo].[fileanh] ([ma_anh], [ten_anh]) VALUES (13, N'\Web_food\\avt\DSCN0877.JPG')
INSERT [dbo].[fileanh] ([ma_anh], [ten_anh]) VALUES (14, N'\Web_food\\avt\1588616652178_plus.jpg')
INSERT [dbo].[fileanh] ([ma_anh], [ten_anh]) VALUES (15, N'\Web_food\\avt\abc.jpg')
INSERT [dbo].[fileanh] ([ma_anh], [ten_anh]) VALUES (16, N'\Web_food\\avt\DSCN0873.JPG')
INSERT [dbo].[fileanh] ([ma_anh], [ten_anh]) VALUES (17, N'\Web_food\avt\DSCN0877.JPG')
INSERT [dbo].[fileanh] ([ma_anh], [ten_anh]) VALUES (18, N'\Web_food\avt\abc.jpg')
INSERT [dbo].[fileanh] ([ma_anh], [ten_anh]) VALUES (19, N'\Web_food\avt\IMG_1588156936105_1588159035869.jpg')
INSERT [dbo].[fileanh] ([ma_anh], [ten_anh]) VALUES (20, N'\Web_food\avt\abc.jpg')
INSERT [dbo].[fileanh] ([ma_anh], [ten_anh]) VALUES (21, N'\Web_food\avt\DSCN0877.JPG')
INSERT [dbo].[fileanh] ([ma_anh], [ten_anh]) VALUES (22, N'\Web_food\avt\DSCN0873.JPG')
INSERT [dbo].[fileanh] ([ma_anh], [ten_anh]) VALUES (23, N'\Web_food\avt\DSCN0877.JPG')
INSERT [dbo].[fileanh] ([ma_anh], [ten_anh]) VALUES (24, N'\Web_food\avt\')
INSERT [dbo].[fileanh] ([ma_anh], [ten_anh]) VALUES (25, N'\Web_food\avt\')
INSERT [dbo].[fileanh] ([ma_anh], [ten_anh]) VALUES (26, N'\Web_food\avt\')
INSERT [dbo].[fileanh] ([ma_anh], [ten_anh]) VALUES (27, N'\Web_food\avt\DSCN0971.JPG')
INSERT [dbo].[fileanh] ([ma_anh], [ten_anh]) VALUES (28, N'\Web_food\avt\IMG_3977_1.jpg')
INSERT [dbo].[fileanh] ([ma_anh], [ten_anh]) VALUES (29, N'\Web_food\avt\IMG_20200714_014338.jpg')
INSERT [dbo].[fileanh] ([ma_anh], [ten_anh]) VALUES (30, N'\Web_food\avt\IMG_20200714_014338.jpg')
INSERT [dbo].[fileanh] ([ma_anh], [ten_anh]) VALUES (31, N'\Web_food\avt\IMG_1588157280921_1588159098244.jpg')
INSERT [dbo].[fileanh] ([ma_anh], [ten_anh]) VALUES (32, N'\Web_food\avt\abc.mp4')
INSERT [dbo].[fileanh] ([ma_anh], [ten_anh]) VALUES (33, N'\Web_food\avt\abc.jpg')
INSERT [dbo].[fileanh] ([ma_anh], [ten_anh]) VALUES (34, N'\Web_food\avt\DSCN0877.JPG')
INSERT [dbo].[fileanh] ([ma_anh], [ten_anh]) VALUES (35, N'\Web_food\avt\abc.jpg')
INSERT [dbo].[fileanh] ([ma_anh], [ten_anh]) VALUES (36, N'\Web_food\avt\abc.jpg')
INSERT [dbo].[fileanh] ([ma_anh], [ten_anh]) VALUES (37, N'\Web_food\avt\yeu.jpg')
INSERT [dbo].[fileanh] ([ma_anh], [ten_anh]) VALUES (39, N'\Web_food\avt\')
SET IDENTITY_INSERT [dbo].[fileanh] OFF
GO
SET IDENTITY_INSERT [dbo].[hoadon] ON 

INSERT [dbo].[hoadon] ([mahoadon], [makh], [ngaymua], [damua]) VALUES (20, 16, CAST(N'2022-12-21T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[hoadon] ([mahoadon], [makh], [ngaymua], [damua]) VALUES (21, 16, CAST(N'2022-12-21T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[hoadon] ([mahoadon], [makh], [ngaymua], [damua]) VALUES (22, 16, CAST(N'2022-12-21T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[hoadon] ([mahoadon], [makh], [ngaymua], [damua]) VALUES (23, 16, CAST(N'2022-12-21T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[hoadon] ([mahoadon], [makh], [ngaymua], [damua]) VALUES (24, 16, CAST(N'2022-12-21T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[hoadon] ([mahoadon], [makh], [ngaymua], [damua]) VALUES (25, 17, CAST(N'2022-12-21T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[hoadon] ([mahoadon], [makh], [ngaymua], [damua]) VALUES (26, 17, CAST(N'2022-12-21T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[hoadon] ([mahoadon], [makh], [ngaymua], [damua]) VALUES (27, 17, CAST(N'2022-12-21T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[hoadon] ([mahoadon], [makh], [ngaymua], [damua]) VALUES (28, 16, CAST(N'2022-12-21T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[hoadon] ([mahoadon], [makh], [ngaymua], [damua]) VALUES (29, 16, CAST(N'2022-12-21T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[hoadon] ([mahoadon], [makh], [ngaymua], [damua]) VALUES (30, 16, CAST(N'2022-12-21T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[hoadon] ([mahoadon], [makh], [ngaymua], [damua]) VALUES (31, 16, CAST(N'2022-12-21T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[hoadon] ([mahoadon], [makh], [ngaymua], [damua]) VALUES (32, 17, CAST(N'2022-12-21T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[hoadon] ([mahoadon], [makh], [ngaymua], [damua]) VALUES (33, 17, CAST(N'2022-12-21T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[hoadon] ([mahoadon], [makh], [ngaymua], [damua]) VALUES (34, 17, CAST(N'2022-12-21T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[hoadon] ([mahoadon], [makh], [ngaymua], [damua]) VALUES (35, 17, CAST(N'2022-12-21T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[hoadon] ([mahoadon], [makh], [ngaymua], [damua]) VALUES (36, 17, CAST(N'2022-12-21T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[hoadon] ([mahoadon], [makh], [ngaymua], [damua]) VALUES (37, 16, CAST(N'2022-12-21T00:00:00.000' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[hoadon] OFF
GO
SET IDENTITY_INSERT [dbo].[khachhang] ON 

INSERT [dbo].[khachhang] ([makh], [hoten], [sodt], [diachi], [thenganhang], [tennganhang], [ten_anh], [tendn], [pass]) VALUES (16, N'Mai Văn Long', 1234567, N'79 Duy Tân', 123456766, N'A', N'\Web_food\avt\abc.jpg', N'Long', N'123')
INSERT [dbo].[khachhang] ([makh], [hoten], [sodt], [diachi], [thenganhang], [tennganhang], [ten_anh], [tendn], [pass]) VALUES (17, N'Hồ Thị Như Ngoc', 123456, N'Nguyễn Trải', 1111111111, N'B', N'\Web_food\avt\yeu.jpg', N'Ngoc', N'123')
SET IDENTITY_INSERT [dbo].[khachhang] OFF
GO
INSERT [dbo].[loai] ([maloai], [tenloai]) VALUES (N'anvat', N'ăn vặt')
INSERT [dbo].[loai] ([maloai], [tenloai]) VALUES (N'chien', N'chiên')
INSERT [dbo].[loai] ([maloai], [tenloai]) VALUES (N'com', N'cơm')
INSERT [dbo].[loai] ([maloai], [tenloai]) VALUES (N'haisan', N'hải sản')
INSERT [dbo].[loai] ([maloai], [tenloai]) VALUES (N'lau', N'lẩu')
INSERT [dbo].[loai] ([maloai], [tenloai]) VALUES (N'trangmieng', N'tráng miệng')
GO
SET IDENTITY_INSERT [dbo].[phanhoi] ON 

INSERT [dbo].[phanhoi] ([matinnhan], [makh], [noidung]) VALUES (6, 16, N'Món ăn rất ngon, tôi rất hài lòng')
INSERT [dbo].[phanhoi] ([matinnhan], [makh], [noidung]) VALUES (7, 17, N'Ngonnnnnnnn')
INSERT [dbo].[phanhoi] ([matinnhan], [makh], [noidung]) VALUES (9, 16, N'Tôi sẽ ủng hộ tiếp')
SET IDENTITY_INSERT [dbo].[phanhoi] OFF
GO
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [soluong], [gia], [maloai], [sotap], [anh], [video]) VALUES (N'm1', N'cá chiên xù', 10, 200000, N'chien', N'1', N'a1.jpg', N'')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [soluong], [gia], [maloai], [sotap], [anh], [video]) VALUES (N'm10', N'Lẩu bò cobe', 20, 300000, N'lau', N'1', N'a10.jpg', N'')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [soluong], [gia], [maloai], [sotap], [anh], [video]) VALUES (N'm11', N'Cơm trắng', 40, 10000, N'com', N'1', N'b1.jpg', N'')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [soluong], [gia], [maloai], [sotap], [anh], [video]) VALUES (N'm12', N'Xoài', 30, 10000, N'trangmieng', N'1', N'b2.jpg', NULL)
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [soluong], [gia], [maloai], [sotap], [anh], [video]) VALUES (N'm13', N'Lẩu bò cobe', 12, 300000, N'lau', N'1', N'b3.jpg', NULL)
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [soluong], [gia], [maloai], [sotap], [anh], [video]) VALUES (N'm14', N'Tôm hấp', 13, 300000, N'haisan ', N'1', N'b4.jpg', NULL)
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [soluong], [gia], [maloai], [sotap], [anh], [video]) VALUES (N'm15', N'Lẩu bò cobe', 11, 300000, N'chien', N'1', N'b5.jpg', NULL)
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [soluong], [gia], [maloai], [sotap], [anh], [video]) VALUES (N'm16', N'Lẩu bò cobe', 10, 300000, N'com', N'1', N'b6.jpg', NULL)
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [soluong], [gia], [maloai], [sotap], [anh], [video]) VALUES (N'm17', N'Lẩu bò cobe', 40, 300000, N'haisan ', N'1', N'b7.jpg', NULL)
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [soluong], [gia], [maloai], [sotap], [anh], [video]) VALUES (N'm18', N'Lẩu bò cobe', 30, 200000, N'lau', N'1', N'b8.jpg', NULL)
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [soluong], [gia], [maloai], [sotap], [anh], [video]) VALUES (N'm19', N'Lẩu bò cobe', 24, 200000, N'com', N'1', N'b9.jpg', NULL)
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [soluong], [gia], [maloai], [sotap], [anh], [video]) VALUES (N'm2', N'lẩu hải sản', 10, 300000, N'lau', N'1', N'a2.jpg', N'')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [soluong], [gia], [maloai], [sotap], [anh], [video]) VALUES (N'm20', N'Lẩu bò cobe', 43, 200000, N'trangmieng', N'1', N'b10.jpg', NULL)
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [soluong], [gia], [maloai], [sotap], [anh], [video]) VALUES (N'm21', N'Lẩu bò cobe', 40, 200000, N'lau', N'1', N'c1.jpg', NULL)
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [soluong], [gia], [maloai], [sotap], [anh], [video]) VALUES (N'm22', N'Lẩu bò cobe', 35, 200000, N'com', N'1', N'c2.jpg', NULL)
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [soluong], [gia], [maloai], [sotap], [anh], [video]) VALUES (N'm23', N'Lẩu bò cobe', 63, 200000, N'haisan ', N'1', N'c3.jpg', NULL)
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [soluong], [gia], [maloai], [sotap], [anh], [video]) VALUES (N'm24', N'Cơm chiên', 33, 100000, N'com', N'1', N'c4.jpg', NULL)
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [soluong], [gia], [maloai], [sotap], [anh], [video]) VALUES (N'm25', N'Cơm chiên', 23, 100000, N'chien', N'1', N'c5.jpg', NULL)
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [soluong], [gia], [maloai], [sotap], [anh], [video]) VALUES (N'm26', N'Cơm chiên', 21, 100000, N'trangmieng', N'1', N'c6.jpg', NULL)
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [soluong], [gia], [maloai], [sotap], [anh], [video]) VALUES (N'm27', N'Cơm chiên', 30, 100000, N'lau', N'1', N'c7.jpg', NULL)
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [soluong], [gia], [maloai], [sotap], [anh], [video]) VALUES (N'm28', N'Cơm chiên', 10, 100000, N'trangmieng', N'1', N'c8.jpg', NULL)
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [soluong], [gia], [maloai], [sotap], [anh], [video]) VALUES (N'm29', N'Cơm chiên', 11, 100000, N'haisan ', N'1', N'c9.jpg', NULL)
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [soluong], [gia], [maloai], [sotap], [anh], [video]) VALUES (N'm3', N'táo ', 5, 20000, N'trangmieng', N'1', N'a3.jpg', N'')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [soluong], [gia], [maloai], [sotap], [anh], [video]) VALUES (N'm30', N'Cơm chiên', 44, 100000, N'trangmieng', N'1', N'c10.jpg', NULL)
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [soluong], [gia], [maloai], [sotap], [anh], [video]) VALUES (N'm31', N'Cơm chiên', 32, 100000, N'chien', N'1', N'd1.jpg', NULL)
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [soluong], [gia], [maloai], [sotap], [anh], [video]) VALUES (N'm32', N'Cơm chiên', 33, 100000, N'anvat', N'1', N'd2.jpg', NULL)
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [soluong], [gia], [maloai], [sotap], [anh], [video]) VALUES (N'm33', N'Cơm chiên', 22, 100000, N'haisan ', N'1', N'd3.jpg', NULL)
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [soluong], [gia], [maloai], [sotap], [anh], [video]) VALUES (N'm34', N'Cơm chiên', 55, 4000000, N'com', N'1', N'd4.jpg', NULL)
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [soluong], [gia], [maloai], [sotap], [anh], [video]) VALUES (N'm35', N'Cơm chiên', 22, 200000, N'anvat', N'1', N'd5.jpg', NULL)
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [soluong], [gia], [maloai], [sotap], [anh], [video]) VALUES (N'm36', N'Cơm chiên', 11, 200000, N'trangmieng', N'1', N'd6.jpg', NULL)
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [soluong], [gia], [maloai], [sotap], [anh], [video]) VALUES (N'm37', N'Cơm chiên', 22, 200000, N'lau', N'1', N'd7.jpg', NULL)
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [soluong], [gia], [maloai], [sotap], [anh], [video]) VALUES (N'm38', N'Cơm chiên', 11, 200000, N'com', N'1', N'd8.jpg', NULL)
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [soluong], [gia], [maloai], [sotap], [anh], [video]) VALUES (N'm39', N'Cơm chiên', 44, 200000, N'lau', N'1', N'd9.jpg', NULL)
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [soluong], [gia], [maloai], [sotap], [anh], [video]) VALUES (N'm4', N'cơm tấm', 20, 10000, N'com', N'1', N'a4.jpg', N'')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [soluong], [gia], [maloai], [sotap], [anh], [video]) VALUES (N'm40', N'Cơm chiên', 33, 100000, N'anvat', N'1', N'd10.jpg', NULL)
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [soluong], [gia], [maloai], [sotap], [anh], [video]) VALUES (N'm41', N'Cơm chiên', 22, 10000, N'lau', N'1', N'e1.jpg', NULL)
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [soluong], [gia], [maloai], [sotap], [anh], [video]) VALUES (N'm5', N'bào ngư hấp', 10, 200000, N'haisan', N'1', N'a5.jpg', N'')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [soluong], [gia], [maloai], [sotap], [anh], [video]) VALUES (N'm6', N'xiên bẩn', 30, 10000, N'anvat', N'1', N'a6.jpg', N'')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [soluong], [gia], [maloai], [sotap], [anh], [video]) VALUES (N'm7', N'Cá viên chiên', 30, 20000, N'trangmieng', N'1', N'a7.jpg', N'')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [soluong], [gia], [maloai], [sotap], [anh], [video]) VALUES (N'm8', N'Cơm chiên', 10, 10000, N'chien', N'1', N'a8.jpg', N'')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [soluong], [gia], [maloai], [sotap], [anh], [video]) VALUES (N'm9', N'Tôm hấp', 20, 100000, N'haisan ', N'1', N'a9.jpg', N'')
GO
ALTER TABLE [dbo].[chitiethoadon]  WITH CHECK ADD  CONSTRAINT [FK_chitiethoadon_hoadon] FOREIGN KEY([mahoadon])
REFERENCES [dbo].[hoadon] ([mahoadon])
GO
ALTER TABLE [dbo].[chitiethoadon] CHECK CONSTRAINT [FK_chitiethoadon_hoadon]
GO
ALTER TABLE [dbo].[hoadon]  WITH CHECK ADD  CONSTRAINT [FK_hoadon_khachhang] FOREIGN KEY([makh])
REFERENCES [dbo].[khachhang] ([makh])
GO
ALTER TABLE [dbo].[hoadon] CHECK CONSTRAINT [FK_hoadon_khachhang]
GO
ALTER TABLE [dbo].[phanhoi]  WITH CHECK ADD  CONSTRAINT [FK_phanhoi_khachhang] FOREIGN KEY([makh])
REFERENCES [dbo].[khachhang] ([makh])
GO
ALTER TABLE [dbo].[phanhoi] CHECK CONSTRAINT [FK_phanhoi_khachhang]
GO
ALTER TABLE [dbo].[sanpham]  WITH CHECK ADD  CONSTRAINT [FK_sanpham_loai] FOREIGN KEY([maloai])
REFERENCES [dbo].[loai] ([maloai])
GO
ALTER TABLE [dbo].[sanpham] CHECK CONSTRAINT [FK_sanpham_loai]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[45] 4[28] 2[10] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "khachhang"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 225
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "phanhoi"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 119
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'htphanhoi'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'htphanhoi'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[34] 4[35] 2[31] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "sanpham"
            Begin Extent = 
               Top = 6
               Left = 662
               Bottom = 225
               Right = 832
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "chitiethoadon"
            Begin Extent = 
               Top = 0
               Left = 39
               Bottom = 150
               Right = 219
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "hoadon"
            Begin Extent = 
               Top = 88
               Left = 451
               Bottom = 215
               Right = 621
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "khachhang"
            Begin Extent = 
               Top = 0
               Left = 246
               Bottom = 198
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 4755
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'lichsu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'lichsu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[42] 4[30] 2[24] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "hoadon"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 214
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "chitiethoadon"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 213
               Right = 426
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "khachhang"
            Begin Extent = 
               Top = 6
               Left = 464
               Bottom = 216
               Right = 634
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "sanpham"
            Begin Extent = 
               Top = 6
               Left = 672
               Bottom = 225
               Right = 842
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'xacnhan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'xacnhan'
GO
