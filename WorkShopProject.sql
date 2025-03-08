CREATE Database WorkShopProject
GO
USE [WorkShopProject]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[uID] [int] IDENTITY(1,1) NOT NULL,
	[user] [varchar](255) NULL,
	[pass] [varchar](255) NULL,
	[isUser] [int] NULL,
	[isAdmin] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[uID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[AccountID] [int] NULL,
	[ProductID] [int] NULL,
	[Amount] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 12/28/2020 5:52:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[cid] [int] NOT NULL,
	[cname] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 12/28/2020 5:52:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[price] [money] NULL,
	[title] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[cateID] [int] NULL,
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT INTO [dbo].[Account] ([uID], [user], [pass], [isUser], [isAdmin]) VALUES 
(1, N'Minh', N'147', 0, 1),
(2, N'Khanh', N'147', 0, 1),
(3, N'Bach', N'147', 0, 1),
(4, N'Hai', N'147', 0, 1),
(5, N'Phuc', N'147', 0, 1),
(6, N'Forseken', N'123', 1, 0),
(7, N'Something', N'123', 1, 0),
(8, N'Jingg', N'123', 1, 0),
(9, N'Davai', N'123', 1, 0),
(10, N'Mindfreak', N'123', 1, 0);
SET IDENTITY_INSERT [dbo].[Account] OFF
INSERT INTO [dbo].[Category] ([cid], [cname]) VALUES 
(1, N'Món Chính'),
(2, N'Nước Giải Khát'),
(3, N'Đồ Ăn Vặt'),
(4, N'Combo Giờ Chơi');
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT INTO [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID]) 
VALUES 
(1, N'Mì tôm nước trứng', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQVqurQpHruTKJZh9C8tRgwOvP-HTBCmoqHqA&s', 15000, N'Mì', N'Ngon', 1),
(2, N'Cơm rang dưa bò', N'https://i-giadinh.vnecdn.net/2021/10/25/nh1-1635170791-4676-1635171165.jpg', 25000, N'Cơm', N'Ngon', 1),
(3, N'Mì Cay', N'https://aloha.com.vn/wp-content/uploads/2023/11/my-cay-sa-dec-va-nhung-dieu-ban-co-the-chua-biet.png', 30000, N'Mì cay', N'Ngon', 1),
(4, N'Phở', N'https://static.kinhtedothi.vn/w960/images/upload/2022/09/16/phobohanoi.jpg', 25000, N'Phở', N'Ngon', 1),
(5, N'Bánh mì chảo', N'https://i.ytimg.com/vi/gKyUmebeE-o/maxresdefault.jpg', 30000, N'Bánh mì chảo', N'Ngon', 1),
(6, N'Xôi thập cẩm', N'https://i.ytimg.com/vi/DAAmDnzO6MI/maxresdefault.jpg', 25000, N'Xôi thập cẩm', N'Ngon', 1),
(7, N'Trà Tắc', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKZi656qNO94cRFfLe4b7IzWTOQPvygDLzmA&s?width=550&height=550', 15000, N'Trà', N'Ngon', 2),
(8, N'Trà Sữa Truyền Thống', N'https://tiemkemsuti.com/wp-content/uploads/2024/03/sp6.png?width=550&height=550', 20000, N'Trà Sữa', N'Ngon', 2),
(9, N'Bạc xỉu', N'https://bizweb.dktcdn.net/thumb/1024x1024/100/487/455/products/bac-siu-1698982665917.jpg?v=1724205132167?width=550&height=550', 18000, N'Bạc xỉu', N'Ngon', 2),
(10, N'Coca', N'https://product.hstatic.net/1000141988/product/nuoc_ngot_cocacola_vi_nguyen_ban_320_ml_5545f89b5d434c548a8bff6118a3ed49.jpg?width=550&height=550', 10000, N'Coca', N'Ngon', 2),
(11, N'RockStar', N'https://www.lottemart.vn/media/catalog/product/cache/0x0/8/9/8934588712081.jpg.webp?width=550&height=550', 15000, N'RockStar', N'Ngon', 2),
(12, N'Nước Lọc', N'https://www.lottemart.vn/media/catalog/product/cache/0x0/8/9/8934588063053-1.jpg.webp?width=550&height=550', 8000, N'Nước Lọc', N'Ngon', 2),
(13, N'Cá Viên Chiên', N'https://sgfoods.com.vn/sites/default/files/product_images/17158645-363e-4cd6-8358-5f126d3bfb47.jpg?width=550&height=550', 20000, N'Cá Viên', N'Ngon', 3),
(14, N'Khoai Tây Chiên', N'https://www.vegeta-chay.com/wp-content/uploads/2016/07/khoai-tay-chien.jpg?width=550&height=550', 20000, N'Khoai Tây', N'Ngon', 3),
(15, N'Thèo Lèo', N'https://media3.scdn.vn/img4/2024/08_01/3jhUuY2MTHS6GRPng9dv_simg_de2fe0_500x500_maxb.jpg?width=550&height=550', 6000, N'Thèo Lèo', N'Ngon', 3),
(16, N'Bánh Vỏ Sò', N'https://down-vn.img.susercontent.com/file/vn-11134207-7ras8-m63hat4giebn41?width=550&height=550', 6000, N'Bánh Vỏ Sò', N'Ngon', 3),
(17, N'Bánh Cua Hành', N'https://vn-live-01.slatic.net/p/34335799602b1073927d7e23a4745113.jpg?width=550&height=550', 6000, N'Bánh con cua', N'Ngon', 3),
(18, N'Bánh Tráng Trộn', N'https://bizweb.dktcdn.net/thumb/large/100/393/670/files/the-nao-la-banh-trang-tron-chuan.jpg?v=1604290889159?width=550&height=550', 15000, N'Bánh Tráng Trộn', N'Vui', 3),
(19, N'Combo Sáng Pro', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrnGSc6Cofpl0MFjVEV8d99FNCRb5H5C8rnQ&s?width=550&height=550', 25000, N'Combo', N'Vui', 4),
(20, N'Combo Sáng Vip', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR564gIZd1X-8jpyGM0pcevMOsBH2JWSbH3kQHyL4i2wuLJbfSgp1ZxcekLMU48TjSttbw&usqp=CAU?width=550&height=550', 30000, N'Combo', N'Vui', 4),
(21, N'Combo Sáng FPS', NULL, 35000, N'Combo', N'Vui', 4),
(22, N'Combo Đêm Pro', NULL, 25000, N'Combo', N'Vui', 4),
(23, N'Combo Đêm Vip', NULL, 30000, N'Combo', N'Vui', 4),
(24, N'Combo Đêm FPS', NULL, 35000, N'Combo', N'Vui', 4);
SET IDENTITY_INSERT [dbo].[product] OFF