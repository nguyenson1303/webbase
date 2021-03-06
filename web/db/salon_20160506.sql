USE [soncoi_H1444_test]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 05/06/2016 16:06:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Total] [nvarchar](50) NULL,
	[Name] [nvarchar](152) NULL,
	[LName] [nvarchar](512) NULL,
	[Gender] [nvarchar](50) NULL,
	[Phone] [nvarchar](512) NULL,
	[Fax] [nvarchar](542) NULL,
	[Email] [nvarchar](512) NULL,
	[City] [nvarchar](256) NULL,
	[Address] [nvarchar](1000) NULL,
	[Recive] [nvarchar](1000) NULL,
	[Payment] [nvarchar](500) NULL,
	[Shipping] [nvarchar](500) NULL,
	[Note] [ntext] NULL,
	[CreateDate] [smalldatetime] NULL,
	[Status] [bit] NULL,
	[Process] [int] NULL,
	[ShipDate] [smalldatetime] NULL,
	[UserCreate] [nvarchar](50) NULL,
	[Code] [varchar](8) NULL,
 CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[orders] ON
INSERT [dbo].[orders] ([id], [Total], [Name], [LName], [Gender], [Phone], [Fax], [Email], [City], [Address], [Recive], [Payment], [Shipping], [Note], [CreateDate], [Status], [Process], [ShipDate], [UserCreate], [Code]) VALUES (40, N'10000', N'Nguyen Van test', N'Ngân Lượng', N'Nam', N'0967962562', NULL, N'nguyenson1303@gmail.com', N'', N'Ha Noi', N'', N'1', N'', N'Đây là đơn hàng test', CAST(0xA55B0529 AS SmallDateTime), 1, 0, NULL, N'abc1234@gmail.com', N'MGPWH4D7')
INSERT [dbo].[orders] ([id], [Total], [Name], [LName], [Gender], [Phone], [Fax], [Email], [City], [Address], [Recive], [Payment], [Shipping], [Note], [CreateDate], [Status], [Process], [ShipDate], [UserCreate], [Code]) VALUES (41, N'20000', N'Nguyen Van Son', NULL, N'Nam', N'0967962562', NULL, N'nguyenson1303@gmail.com', N'', N'Hà Nội', N'', N'0', N'', N'Day la pay test', CAST(0xA55C0381 AS SmallDateTime), 1, 0, NULL, N'abc1234@gmail.com', N'0M4NLGR5')
INSERT [dbo].[orders] ([id], [Total], [Name], [LName], [Gender], [Phone], [Fax], [Email], [City], [Address], [Recive], [Payment], [Shipping], [Note], [CreateDate], [Status], [Process], [ShipDate], [UserCreate], [Code]) VALUES (42, N'10000', N'Nguyen Van Son', NULL, N'Nam', N'0967962562', NULL, N'nguyenson1303@gmail.com', N'', N'Hà Nội', N'', N'0', N'', N'a', CAST(0xA586035B AS SmallDateTime), 1, 0, NULL, N'abc1234@gmail.com', N'AMJTFW9B')
SET IDENTITY_INSERT [dbo].[orders] OFF
/****** Object:  Table [dbo].[Logs]    Script Date: 05/06/2016 16:06:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EventDateTime] [datetime] NOT NULL,
	[EventLevel] [nvarchar](100) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[MachineName] [nvarchar](100) NOT NULL,
	[EventMessage] [nvarchar](max) NOT NULL,
	[ErrorSource] [nvarchar](100) NULL,
	[ErrorClass] [nvarchar](500) NULL,
	[ErrorMethod] [nvarchar](max) NULL,
	[ErrorMessage] [nvarchar](max) NULL,
	[InnerErrorMessage] [nvarchar](max) NULL,
 CONSTRAINT [PK_Logs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Logs] ON
INSERT [dbo].[Logs] ([Id], [EventDateTime], [EventLevel], [UserName], [MachineName], [EventMessage], [ErrorSource], [ErrorClass], [ErrorMethod], [ErrorMessage], [InnerErrorMessage]) VALUES (1, CAST(0x0000A58A00EC20D4 AS DateTime), N'Info', N'', N'PC-1408-0052', N'Bạn đã truy cập khu vực không hợp lệ', N'', N'', N'', N'', N'')
INSERT [dbo].[Logs] ([Id], [EventDateTime], [EventLevel], [UserName], [MachineName], [EventMessage], [ErrorSource], [ErrorClass], [ErrorMethod], [ErrorMessage], [InnerErrorMessage]) VALUES (2, CAST(0x0000A58A00F42018 AS DateTime), N'Info', N'', N'PC-1408-0052', N'soncoi đã truy cập khu vực không hợp lệ:act = list_user_permission,ctrl = adminUser,type_act= view,type= Admin', N'', N'', N'', N'', N'')
SET IDENTITY_INSERT [dbo].[Logs] OFF
/****** Object:  Table [dbo].[ImageProducts]    Script Date: 05/06/2016 16:06:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImageProducts](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaSP] [int] NULL,
	[Images] [nvarchar](1000) NULL,
	[ImagesFull] [nvarchar](1000) NULL,
 CONSTRAINT [PK_ImageProducts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ImageProducts] ON
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (5, 10, N'/images/product/2014/10/_thumb_10img-produce02-65x77.jpg', N'/images/product/2014/10/_large_10img-produce02-370x428.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (6, 10, N'/images/product/2014/10/_thumb_10img-produce01-80x93.jpg', N'/images/product/2014/10/_large_10img-produce01-350x405.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (7, 10, N'/images/product/2014/10/_thumb_10img-produce03-80x93.jpg', N'/images/product/2014/10/_large_10img-produce03-350x405.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (8, 10, N'/images/product/2014/10/_thumb_10img-produce05-65x77.jpg', N'/images/product/2014/10/_large_10img-produce05-350x405.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (113, 33, N'/images/photoproduct/2015/5/sc_small_2073_placeholder1-1.jpg', N'/images/photoproduct/2015/5/sc_full_2073_placeholder1-1.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (114, 33, N'/images/photoproduct/2015/5/sc_small_2073_placeholder6.jpg', N'/images/photoproduct/2015/5/sc_full_2073_placeholder6.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (115, 43, N'/images/photoproduct/2015/5/sc_small_2074_placeholder1-1.jpg', N'/images/photoproduct/2015/5/sc_full_2074_placeholder1-1.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (116, 43, N'/images/photoproduct/2015/5/sc_small_2074_placeholder6.jpg', N'/images/photoproduct/2015/5/sc_full_2074_placeholder6.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (117, 38, N'/images/photoproduct/2015/5/sc_small_2105_f1.jpg', N'/images/photoproduct/2015/5/sc_full_2105_f1.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (119, 38, N'/images/photoproduct/2015/5/sc_small_2106_l3-1.jpg', N'/images/photoproduct/2015/5/sc_full_2106_l3-1.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (123, 42, N'/images/photoproduct/2015/5/sc_small_2103_placeholder3-1.jpg', N'/images/photoproduct/2015/5/sc_full_2103_placeholder3-1.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (124, 42, N'/images/photoproduct/2015/5/sc_small_2103_placeholder3.jpg', N'/images/photoproduct/2015/5/sc_full_2103_placeholder3.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (125, 56, N'/images/photoproduct/2015/5/sc_small_2103_featured.jpg', N'/images/photoproduct/2015/5/sc_full_2103_featured.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (126, 56, N'/images/photoproduct/2015/5/sc_small_2103_featured-1.jpg', N'/images/photoproduct/2015/5/sc_full_2103_featured-1.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (128, 61, N'/images/photoproduct/2015/5/sc_small_2104_placeholder6.jpg', N'/images/photoproduct/2015/5/sc_full_2104_placeholder6.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (129, 35, N'/images/photoproduct/2015/5/sc_small_2104_placeholder2-1.jpg', N'/images/photoproduct/2015/5/sc_full_2104_placeholder2-1.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (130, 35, N'/images/photoproduct/2015/5/sc_small_2104_placeholder2.jpg', N'/images/photoproduct/2015/5/sc_full_2104_placeholder2.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (133, 59, N'/images/photoproduct/2015/5/sc_small_2106_placeholder1.jpg', N'/images/photoproduct/2015/5/sc_full_2106_placeholder1.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (137, 47, N'/images/photoproduct/2015/5/sc_small_2107_l3-1.jpg', N'/images/photoproduct/2015/5/sc_full_2107_l3-1.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (138, 47, N'/images/photoproduct/2015/5/sc_small_2107_1-7-1.jpg', N'/images/photoproduct/2015/5/sc_full_2107_1-7-1.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (142, 52, N'/images/photoproduct/2015/5/sc_small_2110_1-29.jpg', N'/images/photoproduct/2015/5/sc_full_2110_1-29.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (143, 52, N'/images/photoproduct/2015/5/sc_small_2110_1-28.jpg', N'/images/photoproduct/2015/5/sc_full_2110_1-28.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (144, 58, N'/images/photoproduct/2015/5/sc_small_2111_6.jpg', N'/images/photoproduct/2015/5/sc_full_2111_6.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (145, 37, N'/images/photoproduct/2015/5/sc_small_2111_30-001.jpg', N'/images/photoproduct/2015/5/sc_full_2111_30-001.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (146, 37, N'/images/photoproduct/2015/5/sc_small_2111_35.jpg', N'/images/photoproduct/2015/5/sc_full_2111_35.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (154, 0, N'/images/photoproduct/2015/5/sc_small_2072_4.jpg', N'/images/photoproduct/2015/5/sc_full_2072_4.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (155, 0, N'/images/photoproduct/2015/5/sc_small_2074_4.jpg', N'/images/photoproduct/2015/5/sc_full_2074_4.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (159, 77, N'/images/photoproduct/2015/6/sc_small_2085_MG_0997.jpg', N'/images/photoproduct/2015/6/sc_full_2085_MG_0997.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (160, 77, N'/images/photoproduct/2015/6/sc_small_2086_MG_1288-682x1024.jpg', N'/images/photoproduct/2015/6/sc_full_2086_MG_1288-682x1024.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (161, 77, N'/images/photoproduct/2015/6/sc_small_2089_MG_0972-682x1024.jpg', N'/images/photoproduct/2015/6/sc_full_2089_MG_0972-682x1024.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (162, 77, N'/images/photoproduct/2015/6/sc_small_2089_MG_1017-682x1024.jpg', N'/images/photoproduct/2015/6/sc_full_2089_MG_1017-682x1024.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (163, 77, N'/images/photoproduct/2015/6/sc_small_2090_MG_1121-682x1024.jpg', N'/images/photoproduct/2015/6/sc_full_2090_MG_1121-682x1024.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (164, 77, N'/images/photoproduct/2015/6/sc_small_2091_MG_0967.jpg', N'/images/photoproduct/2015/6/sc_full_2091_MG_0967.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (165, 77, N'/images/photoproduct/2015/6/sc_small_2091_MG_1123.jpg', N'/images/photoproduct/2015/6/sc_full_2091_MG_1123.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (166, 61, N'/images/photoproduct/2015/6/sc_small_2066_1-7-1.jpg', N'/images/photoproduct/2015/6/sc_full_2066_1-7-1.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (167, 57, N'/images/photoproduct/2015/6/sc_small_2068_1-5.jpg', N'/images/photoproduct/2015/6/sc_full_2068_1-5.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (168, 57, N'/images/photoproduct/2015/6/sc_small_2068_1-8.jpg', N'/images/photoproduct/2015/6/sc_full_2068_1-8.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (169, 59, N'/images/photoproduct/2015/6/sc_small_2068_1-23.jpg', N'/images/photoproduct/2015/6/sc_full_2068_1-23.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (170, 77, N'/images/photoproduct/2015/6/sc_small_2069_5.jpg', N'/images/photoproduct/2015/6/sc_full_2069_5.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (171, 77, N'/images/photoproduct/2015/6/sc_small_2069_1-9-1.jpg', N'/images/photoproduct/2015/6/sc_full_2069_1-9-1.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (172, 73, N'/images/photoproduct/2015/6/sc_small_2073_58-2.jpg', N'/images/photoproduct/2015/6/sc_full_2073_58-2.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (173, 73, N'/images/photoproduct/2015/6/sc_small_2073_MG_1156-1.jpg', N'/images/photoproduct/2015/6/sc_full_2073_MG_1156-1.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (174, 77, N'/images/photoproduct/2015/6/sc_small_2073_1-22.jpg', N'/images/photoproduct/2015/6/sc_full_2073_1-22.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (175, 77, N'/images/photoproduct/2015/6/sc_small_2074_1-28.jpg', N'/images/photoproduct/2015/6/sc_full_2074_1-28.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (176, 75, N'/images/photoproduct/2015/6/sc_small_2074_1-5.jpg', N'/images/photoproduct/2015/6/sc_full_2074_1-5.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (177, 75, N'/images/photoproduct/2015/6/sc_small_2074_1-6.jpg', N'/images/photoproduct/2015/6/sc_full_2074_1-6.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (178, 77, N'/images/photoproduct/2015/6/sc_small_2075_4.jpg', N'/images/photoproduct/2015/6/sc_full_2075_4.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (179, 72, N'/images/photoproduct/2015/6/sc_small_2075_1-9-1.jpg', N'/images/photoproduct/2015/6/sc_full_2075_1-9-1.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (180, 72, N'/images/photoproduct/2015/6/sc_small_2075_1-9.jpg', N'/images/photoproduct/2015/6/sc_full_2075_1-9.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (181, 77, N'/images/photoproduct/2015/6/sc_small_2076_10.jpg', N'/images/photoproduct/2015/6/sc_full_2076_10.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (182, 71, N'/images/photoproduct/2015/6/sc_small_2076_5.jpg', N'/images/photoproduct/2015/6/sc_full_2076_5.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (183, 77, N'/images/photoproduct/2015/6/sc_small_2077_31.jpg', N'/images/photoproduct/2015/6/sc_full_2077_31.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (184, 67, N'/images/photoproduct/2015/6/sc_small_2077_31.jpg', N'/images/photoproduct/2015/6/sc_full_2077_31.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (185, 67, N'/images/photoproduct/2015/6/sc_small_2077_17.jpg', N'/images/photoproduct/2015/6/sc_full_2077_17.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (186, 67, N'/images/photoproduct/2015/6/sc_small_2077_33.jpg', N'/images/photoproduct/2015/6/sc_full_2077_33.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (187, 77, N'/images/photoproduct/2015/6/sc_small_2078_25.jpg', N'/images/photoproduct/2015/6/sc_full_2078_25.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (188, 68, N'/images/photoproduct/2015/6/sc_small_2078_26.jpg', N'/images/photoproduct/2015/6/sc_full_2078_26.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (189, 68, N'/images/photoproduct/2015/6/sc_small_2078_27.jpg', N'/images/photoproduct/2015/6/sc_full_2078_27.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (190, 77, N'/images/photoproduct/2015/6/sc_small_2080_22.jpg', N'/images/photoproduct/2015/6/sc_full_2080_22.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (191, 76, N'/images/photoproduct/2015/6/sc_small_2080_23.jpg', N'/images/photoproduct/2015/6/sc_full_2080_23.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (192, 76, N'/images/photoproduct/2015/6/sc_small_2080_24.jpg', N'/images/photoproduct/2015/6/sc_full_2080_24.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (193, 77, N'/images/photoproduct/2015/6/sc_small_2081_16.jpg', N'/images/photoproduct/2015/6/sc_full_2081_16.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (194, 69, N'/images/photoproduct/2015/6/sc_small_2082_1-29.jpg', N'/images/photoproduct/2015/6/sc_full_2082_1-29.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (195, 69, N'/images/photoproduct/2015/6/sc_small_2082_15-1.jpg', N'/images/photoproduct/2015/6/sc_full_2082_15-1.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (196, 77, N'/images/photoproduct/2015/6/sc_small_2082_1-22.jpg', N'/images/photoproduct/2015/6/sc_full_2082_1-22.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (197, 65, N'/images/photoproduct/2015/6/sc_small_2082_11.jpg', N'/images/photoproduct/2015/6/sc_full_2082_11.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (198, 65, N'/images/photoproduct/2015/6/sc_small_2082_59-2.jpg', N'/images/photoproduct/2015/6/sc_full_2082_59-2.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (199, 62, N'/images/photoproduct/2015/6/sc_small_2083_14-2.jpg', N'/images/photoproduct/2015/6/sc_full_2083_14-2.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (200, 62, N'/images/photoproduct/2015/6/sc_small_2083_14.jpg', N'/images/photoproduct/2015/6/sc_full_2083_14.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (201, 77, N'/images/photoproduct/2015/6/sc_small_2084_58-1.jpg', N'/images/photoproduct/2015/6/sc_full_2084_58-1.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (202, 60, N'/images/photoproduct/2015/6/sc_small_2084_rgh.jpg', N'/images/photoproduct/2015/6/sc_full_2084_rgh.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (203, 77, N'/images/photoproduct/2015/6/sc_small_2094_78.jpg', N'/images/photoproduct/2015/6/sc_full_2094_78.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (204, 77, N'/images/photoproduct/2015/6/sc_small_2095_91.jpg', N'/images/photoproduct/2015/6/sc_full_2095_91.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (205, 66, N'/images/photoproduct/2015/6/sc_small_2095_92.jpg', N'/images/photoproduct/2015/6/sc_full_2095_92.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (206, 77, N'/images/photoproduct/2015/6/sc_small_2095_84.jpg', N'/images/photoproduct/2015/6/sc_full_2095_84.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (207, 77, N'/images/photoproduct/2015/6/sc_small_2052_MG_1416-682x1024.jpg', N'/images/photoproduct/2015/6/sc_full_2052_MG_1416-682x1024.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (208, 70, N'/images/photoproduct/2015/6/sc_small_2052_IMG_46211.jpg', N'/images/photoproduct/2015/6/sc_full_2052_IMG_46211.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (209, 77, N'/images/photoproduct/2015/6/sc_small_2041_3234.jpg', N'/images/photoproduct/2015/6/sc_full_2041_3234.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (210, 64, N'/images/photoproduct/2015/6/sc_small_2041_60-1.jpg', N'/images/photoproduct/2015/6/sc_full_2041_60-1.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (211, 77, N'/images/photoproduct/2015/6/sc_small_2042_1-4.jpg', N'/images/photoproduct/2015/6/sc_full_2042_1-4.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (212, 63, N'/images/photoproduct/2015/6/sc_small_2042_59-2.jpg', N'/images/photoproduct/2015/6/sc_full_2042_59-2.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (213, 77, N'/images/photoproduct/2015/6/sc_small_2071_demo999-21.jpg', N'/images/photoproduct/2015/6/sc_full_2071_demo999-21.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (214, 77, N'/images/photoproduct/2015/6/sc_small_2072_demo999-11.jpg', N'/images/photoproduct/2015/6/sc_full_2072_demo999-11.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (215, 77, N'/images/photoproduct/2015/6/sc_small_2073_demo999-62.jpg', N'/images/photoproduct/2015/6/sc_full_2073_demo999-62.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (216, 77, N'/images/photoproduct/2015/6/sc_small_2073_demo999-71.jpg', N'/images/photoproduct/2015/6/sc_full_2073_demo999-71.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (217, 77, N'/images/photoproduct/2015/6/sc_small_2076_demo999-63.jpg', N'/images/photoproduct/2015/6/sc_full_2076_demo999-63.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (218, 77, N'/images/photoproduct/2015/6/sc_small_2078_demo999-26.jpg', N'/images/photoproduct/2015/6/sc_full_2078_demo999-26.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (225, 77, N'/images/photoproduct/2015/12/sc_small_2083_462015112tumblr_nn3zpqypc11qbd81ro1_1280.jpg', N'/images/photoproduct/2015/12/sc_full_2083_462015112tumblr_nn3zpqypc11qbd81ro1_1280.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (233, 77, N'/images/photoproduct/2015/12/sc_small_2115_462015112tumblr_nmrx1feu5c1qbd81ro1_1280.jpg', N'/images/photoproduct/2015/12/sc_full_2115_462015112tumblr_nmrx1feu5c1qbd81ro1_1280.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (234, 77, N'/images/photoproduct/2015/12/sc_small_2115_462015111tumblr_nlno94mqtl1qbd81ro1_1280.jpg', N'/images/photoproduct/2015/12/sc_full_2115_462015111tumblr_nlno94mqtl1qbd81ro1_1280.jpg')
SET IDENTITY_INSERT [dbo].[ImageProducts] OFF
/****** Object:  Table [dbo].[ImageAlbums]    Script Date: 05/06/2016 16:06:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImageAlbums](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CatalogID] [int] NULL,
	[Images] [nvarchar](1000) NULL,
	[ImagesFull] [nvarchar](1000) NULL,
	[ImagesName] [nvarchar](250) NULL,
	[ImagesDes] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ImageAlbums] ON
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (12, 50, N'/images/photogallery/2015/6/sc_small_2070_tumblr_nmuvznHbqX1qbd81ro1_1280.jpg', N'/images/photogallery/2015/6/sc_full_2070_tumblr_nmuvznHbqX1qbd81ro1_1280.jpg', N'', N'')
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (13, 50, N'/images/photogallery/2015/6/sc_small_2070_tumblr_nfzfuaESS41qbd81ro1_1280.jpg', N'/images/photogallery/2015/6/sc_full_2070_tumblr_nfzfuaESS41qbd81ro1_1280.jpg', N'', N'')
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (14, 50, N'/images/photogallery/2015/6/sc_small_2070_tumblr_nieqxi9gWx1qbd81ro1_1280.jpg', N'/images/photogallery/2015/6/sc_full_2070_tumblr_nieqxi9gWx1qbd81ro1_1280.jpg', N'', N'')
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (15, 50, N'/images/photogallery/2015/6/sc_small_2070_tumblr_nmmkwosTLV1qbd81ro1_1280.jpg', N'/images/photogallery/2015/6/sc_full_2070_tumblr_nmmkwosTLV1qbd81ro1_1280.jpg', N'', N'')
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (16, 50, N'/images/photogallery/2015/6/sc_small_2070_tumblr_nmrx6pzBi31qbd81ro1_1280.jpg', N'/images/photogallery/2015/6/sc_full_2070_tumblr_nmrx6pzBi31qbd81ro1_1280.jpg', N'', N'')
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (17, 50, N'/images/photogallery/2015/6/sc_small_2070_tumblr_nmrx58Px3o1qbd81ro1_1280.jpg', N'/images/photogallery/2015/6/sc_full_2070_tumblr_nmrx58Px3o1qbd81ro1_1280.jpg', N'', N'')
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (18, 51, N'/images/photogallery/2015/6/sc_small_2071_tumblr_nmrx7ogcTQ1qbd81ro1_1280.jpg', N'/images/photogallery/2015/6/sc_full_2071_tumblr_nmrx7ogcTQ1qbd81ro1_1280.jpg', N'', N'')
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (20, 51, N'/images/photogallery/2015/6/sc_small_2072_tumblr_now0kbBnbS1qbd81ro1_1280.jpg', N'/images/photogallery/2015/6/sc_full_2072_tumblr_now0kbBnbS1qbd81ro1_1280.jpg', N'', N'')
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (21, 51, N'/images/photogallery/2015/6/sc_small_2072_large.jpg', N'/images/photogallery/2015/6/sc_full_2072_large.jpg', N'', N'')
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (22, 52, N'/images/photogallery/2015/6/sc_small_2073_category.png', N'/images/photogallery/2015/6/sc_full_2073_category.png', N'', N'')
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (25, 52, N'/images/photogallery/2015/6/sc_small_2074_MG_1349.jpg', N'/images/photogallery/2015/6/sc_full_2074_MG_1349.jpg', N'', N'')
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (26, 53, N'/images/photogallery/2015/6/sc_small_2075_MG_1490-682x1024.jpg', N'/images/photogallery/2015/6/sc_full_2075_MG_1490-682x1024.jpg', N'', N'')
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (27, 53, N'/images/photogallery/2015/6/sc_small_2075_MG_1487-682x1024.jpg', N'/images/photogallery/2015/6/sc_full_2075_MG_1487-682x1024.jpg', N'', N'')
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (28, 53, N'/images/photogallery/2015/6/sc_small_2091_tumblr_nmzjr4akLh1qbd81ro1_1280.jpg', N'/images/photogallery/2015/6/sc_full_2091_tumblr_nmzjr4akLh1qbd81ro1_1280.jpg', N'', N'')
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (29, 53, N'/images/photogallery/2015/6/sc_small_2091_tumblr_nmzjrr5SUU1qbd81ro1_1280.jpg', N'/images/photogallery/2015/6/sc_full_2091_tumblr_nmzjrr5SUU1qbd81ro1_1280.jpg', N'', N'')
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (30, 48, N'/images/photogallery/2015/6/sc_small_2094_tumblr_nm0jchnbof1qbd81ro1_1280.png', N'/images/photogallery/2015/6/sc_full_2094_tumblr_nm0jchnbof1qbd81ro1_1280.png', N'', N'')
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (31, 48, N'/images/photogallery/2015/6/sc_small_2094_tumblr_nmg5tjGV4n1qbd81ro1_1280.jpg', N'/images/photogallery/2015/6/sc_full_2094_tumblr_nmg5tjGV4n1qbd81ro1_1280.jpg', N'', N'')
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (32, 48, N'/images/photogallery/2015/6/sc_small_2094_tumblr_no8dy49Rpp1qbd81ro1_1280.jpg', N'/images/photogallery/2015/6/sc_full_2094_tumblr_no8dy49Rpp1qbd81ro1_1280.jpg', N'', N'')
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (33, 48, N'/images/photogallery/2015/6/sc_small_2094_tumblr_np1x8aUHJY1qbd81ro1_1280.jpg', N'/images/photogallery/2015/6/sc_full_2094_tumblr_np1x8aUHJY1qbd81ro1_1280.jpg', N'', N'')
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (34, 48, N'/images/photogallery/2015/6/sc_small_2036_tumblr_nobxnafijq1qbd81ro1_1280.jpg', N'/images/photogallery/2015/6/sc_full_2036_tumblr_nobxnafijq1qbd81ro1_1280.jpg', N'', N'')
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (35, 49, N'/images/photogallery/2015/6/sc_small_2036_tumblr_nmrx58Px3o1qbd81ro1_1280.jpg', N'/images/photogallery/2015/6/sc_full_2036_tumblr_nmrx58Px3o1qbd81ro1_1280.jpg', N'', N'')
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (36, 49, N'/images/photogallery/2015/6/sc_small_2036_tumblr_nlrwpyPRI81qbd81ro1_1280.jpg', N'/images/photogallery/2015/6/sc_full_2036_tumblr_nlrwpyPRI81qbd81ro1_1280.jpg', N'', N'')
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (37, 49, N'/images/photogallery/2015/6/sc_small_2036_tumblr_nmrx1feU5c1qbd81ro1_1280.jpg', N'/images/photogallery/2015/6/sc_full_2036_tumblr_nmrx1feU5c1qbd81ro1_1280.jpg', N'', N'')
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (38, 55, N'/images/photogallery/2015/6/sc_small_2041_tumblr_nlg5mfwvsT1qbd81ro1_1280.jpg', N'/images/photogallery/2015/6/sc_full_2041_tumblr_nlg5mfwvsT1qbd81ro1_1280.jpg', N'', N'')
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (39, 55, N'/images/photogallery/2015/6/sc_small_2041_tumblr_nlht8zyVgs1qbd81ro1_1280.jpg', N'/images/photogallery/2015/6/sc_full_2041_tumblr_nlht8zyVgs1qbd81ro1_1280.jpg', N'', N'')
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (40, 56, N'/images/photogallery/2015/6/sc_small_2041_tumblr_nlc4lg1cHf1qbd81ro1_1280.jpg', N'/images/photogallery/2015/6/sc_full_2041_tumblr_nlc4lg1cHf1qbd81ro1_1280.jpg', N'', N'')
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (41, 56, N'/images/photogallery/2015/6/sc_small_2041_tumblr_np9airfzlj1qbd81ro1_1280.jpg', N'/images/photogallery/2015/6/sc_full_2041_tumblr_np9airfzlj1qbd81ro1_1280.jpg', N'', N'')
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (42, 57, N'/images/photogallery/2015/6/sc_small_2042_tumblr_now0kaHKzo1qbd81ro1_1280.jpg', N'/images/photogallery/2015/6/sc_full_2042_tumblr_now0kaHKzo1qbd81ro1_1280.jpg', N'', N'')
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (43, 57, N'/images/photogallery/2015/6/sc_small_2042_tumblr_no8dxy81m81qbd81ro1_1280.jpg', N'/images/photogallery/2015/6/sc_full_2042_tumblr_no8dxy81m81qbd81ro1_1280.jpg', N'', N'')
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (44, 57, N'/images/photogallery/2015/6/sc_small_2042_tumblr_nlno94mQTl1qbd81ro1_1280.jpg', N'/images/photogallery/2015/6/sc_full_2042_tumblr_nlno94mQTl1qbd81ro1_1280.jpg', N'', N'')
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (46, 58, N'/images/photogallery/2015/6/sc_small_2042_tumblr_nozq7eHAK31qbd81ro1_1280.jpg', N'/images/photogallery/2015/6/sc_full_2042_tumblr_nozq7eHAK31qbd81ro1_1280.jpg', N'', N'')
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (47, 58, N'/images/photogallery/2015/6/sc_small_2043_tumblr_np1x8aUHJY1qbd81ro1_1280.jpg', N'/images/photogallery/2015/6/sc_full_2043_tumblr_np1x8aUHJY1qbd81ro1_1280.jpg', N'', N'')
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (48, 54, N'/images/photogallery/2015/6/sc_small_2079_demo999-35.jpg', N'/images/photogallery/2015/6/sc_full_2079_demo999-35.jpg', N'', N'')
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (49, 54, N'/images/photogallery/2015/6/sc_small_2080_MG_1234.jpg', N'/images/photogallery/2015/6/sc_full_2080_MG_1234.jpg', N'', N'')
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (50, 54, N'/images/photogallery/2015/6/sc_small_2080_MG_1448.jpg', N'/images/photogallery/2015/6/sc_full_2080_MG_1448.jpg', N'', N'')
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (51, 54, N'/images/photogallery/2015/6/sc_small_2080_demo999-43.jpg', N'/images/photogallery/2015/6/sc_full_2080_demo999-43.jpg', N'', N'')
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (52, 59, N'/images/photogallery/2015/6/sc_small_2081_demo999-44.jpg', N'/images/photogallery/2015/6/sc_full_2081_demo999-44.jpg', N'', N'')
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (53, 59, N'/images/photogallery/2015/6/sc_small_2081_demo999-43.jpg', N'/images/photogallery/2015/6/sc_full_2081_demo999-43.jpg', N'', N'')
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (54, 59, N'/images/photogallery/2015/6/sc_small_2081_demo999-42.jpg', N'/images/photogallery/2015/6/sc_full_2081_demo999-42.jpg', N'', N'')
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (55, 59, N'/images/photogallery/2015/6/sc_small_2082_demo999-41.jpg', N'/images/photogallery/2015/6/sc_full_2082_demo999-41.jpg', N'', N'')
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (56, 59, N'/images/photogallery/2015/6/sc_small_2082_demo999-29.jpg', N'/images/photogallery/2015/6/sc_full_2082_demo999-29.jpg', N'', N'')
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (57, 59, N'/images/photogallery/2015/6/sc_small_2082_demo999-46.jpg', N'/images/photogallery/2015/6/sc_full_2082_demo999-46.jpg', N'', N'')
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (58, 0, N'/images/photogallery/2015/12/sc_small_2147_462015115tumblr_nlhshjutot1qbd81ro1_1280.jpg', N'/images/photogallery/2015/12/sc_full_2147_462015115tumblr_nlhshjutot1qbd81ro1_1280.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (59, 0, N'/images/photogallery/2015/12/sc_small_2110_462015115tumblr_nlhshjutot1qbd81ro1_1280.jpg', N'/images/photogallery/2015/12/sc_full_2110_462015115tumblr_nlhshjutot1qbd81ro1_1280.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (60, 46, N'/images/photogallery/2016/4/sc_small_2095_img_8160.jpg', N'/images/photogallery/2016/4/sc_full_2095_img_8160.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (61, 46, N'/images/photogallery/2016/4/sc_small_2130_img_8164.jpg', N'/images/photogallery/2016/4/sc_full_2130_img_8164.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (62, 46, N'/images/photogallery/2016/5/sc_small_2044_img_8169.jpg', N'/images/photogallery/2016/5/sc_full_2044_img_8169.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (63, 46, N'/images/photogallery/2016/5/sc_small_2060_img_8174.jpg', N'/images/photogallery/2016/5/sc_full_2060_img_8174.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (64, 46, N'/images/photogallery/2016/5/sc_small_2071_img_8177.jpg', N'/images/photogallery/2016/5/sc_full_2071_img_8177.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (65, 46, N'/images/photogallery/2016/5/sc_small_2081_img_8178.jpg', N'/images/photogallery/2016/5/sc_full_2081_img_8178.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (66, 46, N'/images/photogallery/2016/5/sc_small_2092_img_8180.jpg', N'/images/photogallery/2016/5/sc_full_2092_img_8180.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (67, 46, N'/images/photogallery/2016/5/sc_small_2042_img_8181.jpg', N'/images/photogallery/2016/5/sc_full_2042_img_8181.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (68, 46, N'/images/photogallery/2016/5/sc_small_2053_img_8183.jpg', N'/images/photogallery/2016/5/sc_full_2053_img_8183.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (69, 46, N'/images/photogallery/2016/5/sc_small_2065_img_8185.jpg', N'/images/photogallery/2016/5/sc_full_2065_img_8185.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (70, 46, N'/images/photogallery/2016/5/sc_small_2075_img_8187.jpg', N'/images/photogallery/2016/5/sc_full_2075_img_8187.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (71, 46, N'/images/photogallery/2016/5/sc_small_2041_img_8190.jpg', N'/images/photogallery/2016/5/sc_full_2041_img_8190.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (72, 46, N'/images/photogallery/2016/5/sc_small_2042_img_8191.jpg', N'/images/photogallery/2016/5/sc_full_2042_img_8191.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (73, 46, N'/images/photogallery/2016/5/sc_small_2058_img_8193.jpg', N'/images/photogallery/2016/5/sc_full_2058_img_8193.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (74, 46, N'/images/photogallery/2016/5/sc_small_2094_img_8194.jpg', N'/images/photogallery/2016/5/sc_full_2094_img_8194.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (75, 46, N'/images/photogallery/2016/5/sc_small_2090_img_8195.jpg', N'/images/photogallery/2016/5/sc_full_2090_img_8195.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (85, 46, N'/images/photogallery/2016/5/sc_small_635980380430158368_img_8198.jpg', N'/images/photogallery/2016/5/sc_full_635980380430158368_img_8198.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (86, 46, N'/images/photogallery/2016/5/sc_small_635980380435939618_img_8199.jpg', N'/images/photogallery/2016/5/sc_full_635980380435939618_img_8199.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (87, 46, N'/images/photogallery/2016/5/sc_small_635980380439533368_img_8202.jpg', N'/images/photogallery/2016/5/sc_full_635980380439533368_img_8202.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (88, 46, N'/images/photogallery/2016/5/sc_small_635980380753127091_img_8206.jpg', N'/images/photogallery/2016/5/sc_full_635980380753127091_img_8206.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (89, 46, N'/images/photogallery/2016/5/sc_small_635980380757970841_img_8209.jpg', N'/images/photogallery/2016/5/sc_full_635980380757970841_img_8209.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (90, 46, N'/images/photogallery/2016/5/sc_small_635980380763439592_img_8212.jpg', N'/images/photogallery/2016/5/sc_full_635980380763439592_img_8212.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (91, 46, N'/images/photogallery/2016/5/sc_small_635980381493752106_img_8226.jpg', N'/images/photogallery/2016/5/sc_full_635980381493752106_img_8226.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (92, 46, N'/images/photogallery/2016/5/sc_small_635980381498439606_img_8235.jpg', N'/images/photogallery/2016/5/sc_full_635980381498439606_img_8235.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (93, 46, N'/images/photogallery/2016/5/sc_small_635980381502970857_img_8237.jpg', N'/images/photogallery/2016/5/sc_full_635980381502970857_img_8237.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (94, 47, N'/images/photogallery/2016/5/sc_small_635980463852502141_img_8223.jpg', N'/images/photogallery/2016/5/sc_full_635980463852502141_img_8223.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (95, 47, N'/images/photogallery/2016/5/sc_small_635980463857189641_img_8238.jpg', N'/images/photogallery/2016/5/sc_full_635980463857189641_img_8238.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (96, 47, N'/images/photogallery/2016/5/sc_small_635980464404533328_img_8266.jpg', N'/images/photogallery/2016/5/sc_full_635980464404533328_img_8266.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (97, 47, N'/images/photogallery/2016/5/sc_small_635980464410627079_img_8272.jpg', N'/images/photogallery/2016/5/sc_full_635980464410627079_img_8272.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (98, 47, N'/images/photogallery/2016/5/sc_small_635980465069689585_img_8273.jpg', N'/images/photogallery/2016/5/sc_full_635980465069689585_img_8273.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (99, 47, N'/images/photogallery/2016/5/sc_small_635980465083595837_img_8276.jpg', N'/images/photogallery/2016/5/sc_full_635980465083595837_img_8276.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (100, 47, N'/images/photogallery/2016/5/sc_small_635980465429689562_img_8350.jpg', N'/images/photogallery/2016/5/sc_full_635980465429689562_img_8350.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (101, 47, N'/images/photogallery/2016/5/sc_small_635980465433908313_img_8351.jpg', N'/images/photogallery/2016/5/sc_full_635980465433908313_img_8351.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (102, 47, N'/images/photogallery/2016/5/sc_small_635980465440470814_img_8353.jpg', N'/images/photogallery/2016/5/sc_full_635980465440470814_img_8353.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (103, 47, N'/images/photogallery/2016/5/sc_small_635980466219533332_img_8301.jpg', N'/images/photogallery/2016/5/sc_full_635980466219533332_img_8301.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (104, 47, N'/images/photogallery/2016/5/sc_small_635980466223752083_img_8305.jpg', N'/images/photogallery/2016/5/sc_full_635980466223752083_img_8305.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (105, 47, N'/images/photogallery/2016/5/sc_small_635980466229220833_img_8312.jpg', N'/images/photogallery/2016/5/sc_full_635980466229220833_img_8312.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (106, 47, N'/images/photogallery/2016/5/sc_small_635980475012814577_img_8372.jpg', N'/images/photogallery/2016/5/sc_full_635980475012814577_img_8372.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (107, 47, N'/images/photogallery/2016/5/sc_small_635980475019377077_img_8379.jpg', N'/images/photogallery/2016/5/sc_full_635980475019377077_img_8379.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (108, 47, N'/images/photogallery/2016/5/sc_small_635980475024220828_img_8380.jpg', N'/images/photogallery/2016/5/sc_full_635980475024220828_img_8380.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (109, 47, N'/images/photogallery/2016/5/sc_small_635980475362814612_img_8385.jpg', N'/images/photogallery/2016/5/sc_full_635980475362814612_img_8385.jpg', NULL, NULL)
SET IDENTITY_INSERT [dbo].[ImageAlbums] OFF
/****** Object:  Table [dbo].[DetailOrder]    Script Date: 05/06/2016 16:06:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DetailOrder](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NULL,
	[ProductName] [ntext] NULL,
	[Quantity] [int] NULL,
	[Price] [float] NULL,
	[TotalPrice] [float] NULL,
	[Propertices] [varchar](50) NULL,
	[Code] [varchar](8) NULL,
 CONSTRAINT [PK_DetailOrder] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[DetailOrder] ON
INSERT [dbo].[DetailOrder] ([id], [OrderID], [ProductID], [ProductName], [Quantity], [Price], [TotalPrice], [Propertices], [Code]) VALUES (80, 0, 77, N'katara', 1, 10000, 10000, N'', N'MGPWH4D7')
INSERT [dbo].[DetailOrder] ([id], [OrderID], [ProductID], [ProductName], [Quantity], [Price], [TotalPrice], [Propertices], [Code]) VALUES (81, 0, 60, N'falda', 1, 10000, 10000, N'', N'0M4NLGR5')
INSERT [dbo].[DetailOrder] ([id], [OrderID], [ProductID], [ProductName], [Quantity], [Price], [TotalPrice], [Propertices], [Code]) VALUES (82, 0, 77, N'katara', 1, 10000, 10000, N'', N'0M4NLGR5')
INSERT [dbo].[DetailOrder] ([id], [OrderID], [ProductID], [ProductName], [Quantity], [Price], [TotalPrice], [Propertices], [Code]) VALUES (83, 0, 76, N'brianna', 1, 10000, 10000, N'', N'AMJTFW9B')
SET IDENTITY_INSERT [dbo].[DetailOrder] OFF
/****** Object:  StoredProcedure [dbo].[create_order_code]    Script Date: 05/06/2016 16:06:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[create_order_code]
as
begin
	Declare @r varchar(8);
	set @r = '';
	select @r = coalesce(@r, '') + n FROM (SELECT top 8 CHAR(number) n FROM master..spt_values
	WHERE type = 'P' 
	AND (number between ascii(0) and ascii(9)
	or number between ascii('A') and ascii('Z'))
	--or number between ascii('a') and ascii('z'))
	ORDER BY newid()) a
	select @r AS order_code
end

exec create_order_code
GO
/****** Object:  UserDefinedFunction [dbo].[ConvertDelimitedListIntoTable]    Script Date: 05/06/2016 16:06:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ConvertDelimitedListIntoTable] (
     @list NVARCHAR(MAX) ,
     @delimiter CHAR(1) )
RETURNS @table TABLE (item VARCHAR(255) NOT NULL )
AS 
    BEGIN
        DECLARE @pos INT ,@nextpos INT ,@valuelen INT

        SELECT  @pos = 0 ,@nextpos = 1

        WHILE @nextpos > 0 
            BEGIN
                SELECT  @nextpos = CHARINDEX(@delimiter,@list,@pos + 1)
                SELECT  @valuelen = CASE WHEN @nextpos > 0 THEN @nextpos
                                         ELSE LEN(@list) + 1
                                    END - @pos - 1
                INSERT  @table ( item )
                VALUES  (CONVERT(INT,SUBSTRING(@list,@pos + 1,@valuelen)) )
                SELECT  @pos = @nextpos

            END

        DELETE  FROM @table
        WHERE   item = ''

        RETURN 
    END
GO
/****** Object:  StoredProcedure [dbo].[_WebInfo_Update]    Script Date: 05/06/2016 16:06:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[_WebInfo_Update]
	@GeneralName      nvarchar(100)
	,@GeneralContent      nvarchar(MAX)
	,@Datemodified      smalldatetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @count int
	SET @count = (select count(GeneralName) from dbo._WebInfo 
					where GeneralName=@GeneralName)
	if (@count = 0)
		begin
			INSERT INTO _WebInfo
			   ([GeneralName]
			   ,[GeneralContent]
			   ,[Datemodified]
				)
		 VALUES
			   (@GeneralName
				,@GeneralContent
				,@Datemodified
				)
		end
	else
		begin
			UPDATE _WebInfo
			   SET GeneralContent  =  @GeneralContent
					,Datemodified  =  @Datemodified
			 WHERE GeneralName  =  @GeneralName
		end
	
END
GO
/****** Object:  Table [dbo].[_WebInfo]    Script Date: 05/06/2016 16:06:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_WebInfo](
	[GeneralID] [int] IDENTITY(1,1) NOT NULL,
	[GeneralName] [nvarchar](100) NOT NULL,
	[GeneralContent] [nvarchar](max) NULL,
	[Datemodified] [smalldatetime] NULL,
 CONSTRAINT [PK__WebInfo] PRIMARY KEY CLUSTERED 
(
	[GeneralID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[_WebInfo] ON
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (1, N'smtphost', N'smtp.gmail.com', CAST(0xA5EE0578 AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (2, N'smtpport', N'587', CAST(0xA5EE0578 AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (3, N'smtpuser', N'tempaids005@gmail.com', CAST(0xA5EE0578 AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (4, N'smtppass', N'Abc@123456', CAST(0xA5EE0578 AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (5, N'email', N'info@bellebeaute.vn', CAST(0xA5EE0578 AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (6, N'hotline', N'0996661112', CAST(0xA5EE056D AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (7, N'advsleft', N'<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
<div class="box effect"><a class="overlay">&nbsp;</a> <img src="/UserFiles/advertise-4.jpg" alt="Adv banner4" width="582" height="246" /></div>
</div>
<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
<div class="box effect"><a class="overlay">&nbsp;</a> <img src="/UserFiles/advertise-5.jpg" alt="Adv banner5" width="582" height="120" /></div>
<div class="box effect"><a class="overlay">&nbsp;</a> <img src="/UserFiles/advertise-6.jpg" alt="Adv banner6" width="582" height="120" /></div>
</div>', CAST(0xA3B60461 AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (8, N'advsright', N'<p><img alt="" src="/images/images/ArchitectoftheYear2014logo.png" style="height:75px; width:120px" /></p>
', CAST(0xA4790305 AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (9, N'banner', N'<img width="760" height="221" src="/UserFiles/Image/slide.jpg" alt="" />', CAST(0x9E420577 AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (10, N'newstop', N'TRANSMECO <a href="#">đạt giải thưởng &quot;SAO V&Agrave;NG ĐẤT VIỆT 2009&quot; </a>[11.11.2009]', CAST(0x9E420577 AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (11, N'video', N'qG58VXLH9aA', CAST(0x9E420577 AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (18, N'facebook', N'https://www.facebook.com/Belle-Hair-Salon-450987675084279/', CAST(0xA5EE056D AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (20, N'price_min', N'0', CAST(0xA4A0037E AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (21, N'price_max', N'20', CAST(0xA4A0037E AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (22, N'latitude', N'21.015906', CAST(0xA5EE056D AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (23, N'longitude', N'105.812098', CAST(0xA5EE056D AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (24, N'google_analysis', NULL, CAST(0xA5EE056D AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (25, N'app_extend_one', NULL, CAST(0xA5EE056D AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (26, N'app_extend_two', NULL, CAST(0xA5EE056D AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (27, N'tax', N'0.1', CAST(0xA5EE056D AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (28, N'fees', N'0', CAST(0xA5EE056D AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (29, N'min_fees', N'0', CAST(0xA5EE056D AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (30, N'Skyper', NULL, CAST(0xA5EE056D AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (31, N'imgmap', N'/images/icon/sc_original_2072_placemark.png', CAST(0xA5EE056D AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[_WebInfo] OFF
/****** Object:  Table [dbo].[_UserPermission]    Script Date: 05/06/2016 16:06:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_UserPermission](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[page_id] [int] NULL,
	[del] [bit] NULL,
	[edit] [bit] NULL,
	[add] [bit] NULL,
	[view] [bit] NULL,
	[user] [nvarchar](100) NULL,
 CONSTRAINT [PK__UserPermission] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[_UserPermission] ON
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (1, 1, 1, 1, 1, 1, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (2, 2, 0, 0, 0, 1, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (3, 3, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (4, 4, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (5, 5, 0, 0, 1, 1, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (6, 6, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (7, 7, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (8, 8, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (9, 9, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (10, 10, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (11, 11, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (12, 12, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (13, 13, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (14, 14, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (15, 15, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (16, 16, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (17, 17, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (18, 18, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (19, 19, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (20, 20, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (21, 21, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (22, 22, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (23, 23, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (24, 24, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (25, 25, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (26, 26, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (27, 27, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (28, 28, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (29, 29, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (30, 30, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (31, 31, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (32, 32, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (33, 33, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (34, 34, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (35, 35, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (36, 36, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (37, 37, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (38, 38, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (39, 39, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (40, 40, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (41, 41, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (42, 42, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (43, 43, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (44, 44, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (45, 45, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (46, 46, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (47, 47, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (48, 48, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (49, 49, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (50, 50, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (51, 51, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (52, 52, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (53, 53, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (54, 54, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (55, 1, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (56, 2, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (57, 3, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (58, 4, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (59, 5, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (60, 6, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (61, 7, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (62, 8, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (63, 9, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (64, 10, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (65, 11, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (66, 12, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (67, 13, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (68, 14, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (69, 15, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (70, 16, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (71, 17, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (72, 18, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (73, 19, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (74, 20, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (75, 21, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (76, 22, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (77, 23, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (78, 24, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (79, 25, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (80, 26, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (81, 27, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (82, 28, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (83, 29, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (84, 30, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (85, 31, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (86, 32, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (87, 33, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (88, 34, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (89, 35, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (90, 36, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (91, 37, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (92, 38, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (93, 39, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (94, 40, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (95, 41, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (96, 42, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (97, 43, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (98, 44, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (99, 45, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (100, 46, 1, 1, 1, 1, N'Admin')
GO
print 'Processed 100 total records'
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (101, 47, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (102, 48, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (103, 49, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (104, 50, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (105, 51, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (106, 52, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (107, 53, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (108, 54, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (109, 55, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (110, 55, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (111, 56, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (112, 56, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (113, 57, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (114, 57, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (115, 58, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (116, 58, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (117, 59, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (118, 59, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (119, 60, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (120, 60, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (121, 61, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (122, 61, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (123, 62, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (124, 62, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (125, 63, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (126, 63, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (127, 64, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (128, 65, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (129, 66, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (131, 68, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (132, 64, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (133, 65, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (134, 66, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (136, 68, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (137, 80, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (138, 81, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (139, 82, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (140, 83, 1, 1, 1, 1, N'Admin')
SET IDENTITY_INSERT [dbo].[_UserPermission] OFF
/****** Object:  Table [dbo].[_UserPage]    Script Date: 05/06/2016 16:06:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[_UserPage](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[act] [varchar](50) NULL,
	[ctrl] [varchar](50) NULL,
	[Title] [nvarchar](100) NULL,
	[IsShow] [bit] NULL,
	[Tye] [varchar](50) NULL,
	[ParentId] [int] NULL,
	[OrderDisplay] [int] NULL,
	[Icon] [varchar](100) NULL,
	[TypeAction] [varchar](10) NULL,
 CONSTRAINT [PK__UserPage] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[_UserPage] ON
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (1, N'list_catalog', N'adminCatalog', N'Danh mục sản phẩm', 1, N'SP', 69, 3, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (2, N'list_catalog', N'adminCatalog', N'Danh mục bài viết', 1, N'TT', 72, 3, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (3, N'list_catalog', N'adminCatalog', N'Danh mục Lookbook', 1, N'LB', 70, 2, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (4, N'list_catalog', N'adminCatalog', N'Danh mục Gallery', 0, N'GL', 70, 5, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (5, N'change_catalog', N'adminCatalog', N'Thêm danh mục sản phẩm', 1, N'SP', 69, 4, N'<i class="icon-double-angle-right"></i>', N'add')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (6, N'change_catalog', N'adminCatalog', N'Thêm danh mục bài viết', 1, N'TT', 72, 4, N'<i class="icon-double-angle-right"></i>', N'add')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (7, N'change_catalog', N'adminCatalog', N'Thêm Album Lookbook', 1, N'LB', 70, 3, N'<i class="icon-double-angle-right"></i>', N'add')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (8, N'change_catalog', N'adminCatalog', N'Thêm Album Gallery', 0, N'GL', 70, 6, N'<i class="icon-double-angle-right"></i>', N'add')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (9, N'change_product', N'adminProduct', N'Thêm sản phẩm', 1, N'', 69, 1, N'<i class="icon-double-angle-right"></i>', N'add')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (10, N'image_product', N'adminProduct', N'Ảnh sản phẩm', 0, N'', 69, 7, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (11, N'property_product', N'adminProduct', N'Thuộc tính sản phẩm', 0, N'', 69, 9, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (12, N'list_product', N'adminProduct', N'Sản phẩm', 1, N'', 69, 2, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (13, N'list_post', N'adminPost', N'Danh sách bài viết', 1, N'TT', 72, 2, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (14, N'change_post', N'adminPost', N'Thêm bài viết', 1, N'TT', 72, 1, N'<i class="icon-double-angle-right"></i>', N'add')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (15, N'list_link', N'adminLink', N'Slide trang chủ', 1, N'SL', 76, 1, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (16, N'list_link', N'adminLink', N'Background Slide trtang chủ', 1, N'BG', 76, 2, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (17, N'list_link', N'adminLink', N'Danh sách Brand', 1, N'DT', 69, 10, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (18, N'list_link', N'adminLink', N'Danh sách dự án', 1, N'PR', 76, 8, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (19, N'list_link', N'adminLink', N'Danh sách Testimonials', 1, N'TE', 76, 6, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (20, N'list_link', N'adminLink', N'Danh sách Video', 1, N'VD', 76, 7, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (21, N'list_link', N'adminLink', N'Danh sách thành viên', 1, N'MB', 76, 4, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (22, N'list_link', N'adminLink', N'Danh sách dịch vụ', 1, N'SR', 76, 5, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (23, N'list_link', N'adminLink', N'Quảng cáo nhiều cột', 1, N'AF', 76, 9, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (24, N'list_link', N'adminLink', N'Danh sách liên kết', 1, N'LK', 76, 10, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (25, N'change_link', N'adminLink', N'Thêm Slide', 0, N'SL', 76, 17, N'<i class="icon-double-angle-right"></i>', N'add')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (26, N'change_link', N'adminLink', N'Thêm Background Slide', 0, N'BG', 76, 16, N'<i class="icon-double-angle-right"></i>', N'add')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (27, N'change_link', N'adminLink', N'Thêm Brand', 0, N'DT', 69, 11, N'<i class="icon-double-angle-right"></i>', N'add')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (28, N'change_link', N'adminLink', N'Thêm project', 0, N'PR', 76, 19, N'<i class="icon-double-angle-right"></i>', N'add')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (29, N'change_link', N'adminLink', N'Thêm Testimonials', 0, N'TE', 76, 20, N'<i class="icon-double-angle-right"></i>', N'add')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (30, N'change_link', N'adminLink', N'Thêm Video', 0, N'VD', 76, 21, N'<i class="icon-double-angle-right"></i>', N'add')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (31, N'change_link', N'adminLink', N'Thêm thành viên', 0, N'MB', 76, 22, N'<i class="icon-double-angle-right"></i>', N'add')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (32, N'change_link', N'adminLink', N'Thêm service', 0, N'SR', 76, 23, N'<i class="icon-double-angle-right"></i>', N'add')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (33, N'change_link', N'adminLink', N'Thêm cột quảng cáo ', 0, N'AF', 76, 24, N'<i class="icon-double-angle-right"></i>', N'add')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (34, N'change_link', N'adminLink', N'Thêm liên kết', 0, N'LK', 76, 25, N'<i class="icon-double-angle-right"></i>', N'add')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (35, N'list_album_images', N'adminLink', N'Ảnh Lookbook', 1, N'LB', 70, 1, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (36, N'list_album_images', N'adminLink', N'Ảnh Gallery', 0, N'GL', 70, 4, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (37, N'system_config', N'adminGeneral', N'Cấu hình chung', 1, N'', 75, 6, N'<i class="icon-double-angle-right"></i>', N'edit')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (38, N'system_email', N'adminGeneral', N'Cấu hình email', 1, N'', 75, 7, N'<i class="icon-double-angle-right"></i>', N'edit')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (39, N'change_general', N'adminGeneral', N'Cập nhật quảng cáo trái', 1, N'advsleft', 76, 14, N'<i class="icon-double-angle-right"></i>', N'edit')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (40, N'change_general', N'adminGeneral', N'Cập nhật quảng cáo phải', 1, N'advsright', 76, 15, N'<i class="icon-double-angle-right"></i>', N'edit')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (41, N'change_general', N'adminGeneral', N'Cập nhật quảng cáo trên', 1, N'advstop', 76, 11, N'<i class="icon-double-angle-right"></i>', N'edit')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (42, N'change_general', N'adminGeneral', N'Cập nhật quảng cáo giữa', 1, N'advsmiddle', 76, 12, N'<i class="icon-double-angle-right"></i>', N'edit')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (43, N'change_general', N'adminGeneral', N'Cập nhật quảng cáo dưới', 1, N'advsbottom', 76, 13, N'<i class="icon-double-angle-right"></i>', N'edit')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (44, N'change_general', N'adminGeneral', N'Nội dung Shipping', 1, N'content_shipping', 77, 1, N'<i class="icon-double-angle-right"></i>', N'edit')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (45, N'change_general', N'adminGeneral', N'Email xác nhận đơn hàng', 1, N'email_order_confirm', 79, 2, N'<i class="icon-double-angle-right"></i>', N'edit')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (46, N'change_general', N'adminGeneral', N'Email xác nhận quên mật khẩu', 1, N'email_confirm_forgot_password', 79, 1, N'<i class="icon-double-angle-right"></i>', N'edit')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (47, N'change_general', N'adminGeneral', N'Email thay đổi trạng thái thanh toán', 1, N'email_order_payment_change_status', 79, 3, N'<i class="icon-double-angle-right"></i>', N'edit')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (48, N'list_page_static', N'adminStatic', N'Danh sách trang tĩnh', 1, N'', 73, 1, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (49, N'change_static', N'adminStatic', N'Thêm trang tĩnh', 1, N'', 73, 2, N'<i class="icon-double-angle-right"></i>', N'add')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (50, N'list_user', N'adminUser', N'Danh sách Admin', 1, N'Admin', 74, 1, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (51, N'change_user', N'adminUser', N'Thêm Admin', 1, N'Admin', 74, 2, N'<i class="icon-double-angle-right"></i>', N'add')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (52, N'list_user_permission', N'adminUser', N'Phân quyền Admin', 0, N'Admin', 74, 3, N'<i class="icon-double-angle-right"></i>', N'edit')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (53, N'list_order', N'adminOrder', N'Danh sách đơn hàng', 1, N'', 71, 1, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (54, N'change_order', N'adminOrder', N'Xử lý đơn hàng', 0, N'', 71, 2, N'<i class="icon-double-angle-right"></i>', N'edit')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (55, N'change_catalog', N'adminCatalog', N'Thêm danh mục Collection', 1, N'CL', 69, 6, N'<i class="icon-double-angle-right"></i>', N'add')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (56, N'change_general', N'adminGeneral', N'Giới thiệu ngắn', 1, N'aboutshort', 75, 2, N'<i class="icon-double-angle-right"></i>', N'edit')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (57, N'change_general', N'adminGeneral', N'Giới thiệu', 1, N'aboutcontent', 75, 1, N'<i class="icon-double-angle-right"></i>', N'edit')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (58, N'change_general', N'adminGeneral', N'Liên hệ', 1, N'contactdetail', 75, 3, N'<i class="icon-double-angle-right"></i>', N'edit')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (59, N'change_general', N'adminGeneral', N'Liên hệ ngắn', 1, N'contact', 75, 4, N'<i class="icon-double-angle-right"></i>', N'edit')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (60, N'footer', N'adminGeneral', N'Footer', 1, N'', 75, 8, N'<i class="icon-double-angle-right"></i>', N'edit')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (61, N'list_catalog', N'adminCatalog', N'Danh mục Collection', 1, N'CL', 69, 5, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (62, N'list_contact', N'adminGeneral', N'Ý kiến khách hàng', 1, N'', 78, 1, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (63, N'list_Rating', N'adminProduct', N'Bình luận và đánh giá', 0, N'', 69, 8, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (69, N'', N'', N'Quản lý Sản phẩm ', 1, N'', 0, 1, N'<i class="icon-certificate"></i>', N'')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (70, N'', N'', N'Quản lý Gallery ', 1, N'', 0, 2, N'<i class="icon-picture"></i>', N'')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (71, N'', N'', N'Quản lý Đơn hàng ', 1, N'', 0, 3, N'<i class="icon-barcode"></i>', N'')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (72, N'', N'', N'Quản lý Tin tức ', 1, N'', 0, 4, N'<i class="icon-text-width"></i>', N'')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (73, N'', N'', N'Quản lý Trang tĩnh ', 1, N'', 0, 5, N'<i class="icon-desktop"></i>', N'')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (74, N'', N'', N'Quản lý Thành viên ', 1, N'', 0, 6, N'<i class="icon-user"></i>', N'')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (75, N'', N'', N'Cấu hình Website ', 1, N'', 0, 7, N'<i class="icon-cogs"></i>', N'')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (76, N'', N'', N'Quảng cáo ', 1, N'', 0, 8, N'<i class="icon-globe"></i>', N'')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (77, N'', N'', N'Shipping ', 1, N'', 0, 9, N'<i class="icon-list-alt"></i>', N'')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (78, N'', N'', N'Ý kiến khách hàng ', 1, N'', 0, 10, N'<i class="icon-comments"></i>', N'')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (79, N'', N'', N'Email Template', 1, N'', 0, 11, N'<i class="icon-leaf"></i>', N'')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (80, N'list_log', N'adminUser', N'Log system', 1, N'', 74, 4, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (81, N'comment_facebook', N'adminProduct', N'Bình luận Facebook', 0, N'', 69, 9, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (82, N'list_user', N'adminUser', N'Danh sách Khách hàng', 1, N'Client', 74, 4, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (83, N'change_user', N'adminUser', N'Thông tin khách hàng', 0, N'Client', 74, 5, N'<i class="icon-double-angle-right"></i>', N'edit')
SET IDENTITY_INSERT [dbo].[_UserPage] OFF
/****** Object:  StoredProcedure [dbo].[_UserInfor_Statistic]    Script Date: 05/06/2016 16:06:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[_UserInfor_Statistic]
AS
BEGIN
	SELECT DATEPART(Year, DateRegister) Year, 
	DATEPART(Month, DateRegister) Month, 
	Count(InforId) [Total] 
	FROM _UserInfo 
	GROUP BY DATEPART(Year, DateRegister), 
	DATEPART(Month, DateRegister) 
	ORDER BY Year, Month 
END
GO
/****** Object:  Table [dbo].[_UserInfo]    Script Date: 05/06/2016 16:06:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[_UserInfo](
	[InforId] [int] IDENTITY(1,1) NOT NULL,
	[FName] [nvarchar](50) NULL,
	[LName] [nvarchar](50) NULL,
	[Phone] [varchar](20) NULL,
	[Address] [nvarchar](100) NULL,
	[Email] [nvarchar](50) NULL,
	[EventId] [int] NULL,
	[Birthday] [datetime] NULL,
	[Location] [nvarchar](50) NULL,
	[Note] [nvarchar](1000) NULL,
	[DateJoin] [datetime] NULL,
	[DateRegister] [datetime] NULL,
 CONSTRAINT [PK__UserInfo] PRIMARY KEY CLUSTERED 
(
	[InforId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[_UserInfo] ON
INSERT [dbo].[_UserInfo] ([InforId], [FName], [LName], [Phone], [Address], [Email], [EventId], [Birthday], [Location], [Note], [DateJoin], [DateRegister]) VALUES (1, N'a', N'a', N'04214213', N'adasd', N'aaaa@gmail.com', 41, CAST(0x0000A3E000000000 AS DateTime), N'Hà Nội', N'', NULL, CAST(0x0000A40500BEC875 AS DateTime))
INSERT [dbo].[_UserInfo] ([InforId], [FName], [LName], [Phone], [Address], [Email], [EventId], [Birthday], [Location], [Note], [DateJoin], [DateRegister]) VALUES (2, N'coi', NULL, NULL, NULL, N'abc123@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[_UserInfo] ([InforId], [FName], [LName], [Phone], [Address], [Email], [EventId], [Birthday], [Location], [Note], [DateJoin], [DateRegister]) VALUES (3, N'soncoi', NULL, NULL, NULL, N'abc1234@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[_UserInfo] ([InforId], [FName], [LName], [Phone], [Address], [Email], [EventId], [Birthday], [Location], [Note], [DateJoin], [DateRegister]) VALUES (4, N'nguyen coi', NULL, NULL, NULL, N'coicoi0101@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[_UserInfo] ([InforId], [FName], [LName], [Phone], [Address], [Email], [EventId], [Birthday], [Location], [Note], [DateJoin], [DateRegister]) VALUES (5, N'soncoi', NULL, N'0967962562', N'Son La', N'abc1234@gmail.com', NULL, CAST(0x00007AFA00000000 AS DateTime), NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[_UserInfo] OFF
/****** Object:  Table [dbo].[_User]    Script Date: 05/06/2016 16:06:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_User](
	[Username] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](500) NOT NULL,
	[Role] [int] NOT NULL,
	[Online] [bit] NULL,
	[LastLogin] [datetime] NULL,
	[IP] [nvarchar](100) NULL,
 CONSTRAINT [PK_tblUser] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[_User] ([Username], [Password], [Role], [Online], [LastLogin], [IP]) VALUES (N'abc123@gmail.com', N'E10ADC3949BA59ABBE56E057F20F883E', 2, 0, CAST(0x0000A54B00A26A59 AS DateTime), N'not login')
INSERT [dbo].[_User] ([Username], [Password], [Role], [Online], [LastLogin], [IP]) VALUES (N'abc1234@gmail.com', N'E10ADC3949BA59ABBE56E057F20F883E', 2, 1, CAST(0x0000A58C00BBD717 AS DateTime), N'127.0.0.1')
INSERT [dbo].[_User] ([Username], [Password], [Role], [Online], [LastLogin], [IP]) VALUES (N'Admin', N'E10ADC3949BA59ABBE56E057F20F883E', 1, 1, CAST(0x0000A5FE0105F187 AS DateTime), N'113.160.57.22')
INSERT [dbo].[_User] ([Username], [Password], [Role], [Online], [LastLogin], [IP]) VALUES (N'coicoi0101@gmail.com', N'25D55AD283AA400AF464C76D713C07AD', 2, 0, CAST(0x0000A56400F51388 AS DateTime), N'::1')
INSERT [dbo].[_User] ([Username], [Password], [Role], [Online], [LastLogin], [IP]) VALUES (N'soncoi', N'E10ADC3949BA59ABBE56E057F20F883E', 1, 1, CAST(0x0000A58A011F21AC AS DateTime), N'127.0.0.1')
INSERT [dbo].[_User] ([Username], [Password], [Role], [Online], [LastLogin], [IP]) VALUES (N'Test', N'E10ADC3949BA59ABBE56E057F20F883E', 1, 0, CAST(0x0000A58C00CBCFE7 AS DateTime), N'::1')
/****** Object:  StoredProcedure [dbo].[_ThongKe_Edit]    Script Date: 05/06/2016 16:06:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[_ThongKe_Edit]
AS
BEGIN
-- delete all record year-1
delete _Statistic
where ThoiGian <= DATEADD(yyyy, -1, GETDATE())
-- select analysis 
 DECLARE @SoTruyCapGanNhat bigint
 DECLARE @Count int
 SELECT @Count=Count(*) FROM _Statistic ttk
 IF @Count IS NULL SET @Count=0
 IF @Count=0
  INSERT INTO _Statistic(ThoiGian, SoTruyCap)
  VALUES (GetDate(),1)
 ELSE
  BEGIN
   
   DECLARE @ThoiGianGanNhat datetime
   SELECT @SoTruyCapGanNhat=ttk.SoTruyCap, @ThoiGianGanNhat=ttk.ThoiGian
     FROM _Statistic ttk WHERE ttk.ID=(SELECT Max(ttk2.ID) FROM _Statistic ttk2)
   IF @SoTruyCapGanNhat IS NULL SET @SoTruyCapGanNhat=0
   IF @ThoiGianGanNhat IS NULL SET @ThoiGianGanNhat=getdate()
   -- Kiểm tra xem lần truy cập này có phải đã sang ngày mới không (Qua thời điểm 12h00)
   -- Nếu chưa sang ngày mới thì cập nhật lại SoTruyCap
   IF Day(@ThoiGianGanNhat)=Day(GETDATE())
    BEGIN
     UPDATE _Statistic
     SET
      SoTruyCap = @SoTruyCapGanNhat+1,
      ThoiGian = GetDate()
      
     WHERE ID=(SELECT Max(ttk2.ID) FROM _Statistic ttk2)
    END
    -- Nếu đã sang ngày mới thì thêm mới bản ghi, SoTruyCap bắt đầu lại là 1
   ELSE
    BEGIN
     INSERT INTO _Statistic(ThoiGian, SoTruyCap)
     VALUES (GetDate(),1)
    END
  END
 
  -- Thống kê Hom nay, Hom qua, Tuan nay, Tuan Truoc, Thang nay, Thang Truoc
  DECLARE @HomNay INT
  SET @HomNay = datepart(dw, GetDate())
  SELECT @SoTruyCapGanNhat=ttk.SoTruyCap, @ThoiGianGanNhat=ttk.ThoiGian
     FROM _Statistic ttk WHERE ttk.ID=(SELECT Max(ttk2.ID) FROM _Statistic ttk2)
  --Tính SoTruyCapHomQua
  DECLARE @SoTruyCapHomQua bigint
  SELECT @SoTruyCapHomQua=isnull(SoTruyCap,0) FROM _Statistic  
   WHERE CONVERT(nvarchar(20),ThoiGian,103)=CONVERT(nvarchar(20),GETDATE()-1,103)
  IF @SoTruyCapHomQua IS null SET @SoTruyCapHomQua=0
  -- Tính Ngày đầu tuần này
  DECLARE @DauTuanNay datetime
  SET @DauTuanNay= DATEADD(wk, DATEDIFF(wk, 6, GetDate()), 6)
  -- Tính Ngày đầu của tuần trước Tính từ thời điểm 00:00:))
  DECLARE @NgayDauTuanTruoc datetime
  SET @NgayDauTuanTruoc = Cast(CONVERT(nvarchar(30),DATEADD(dd, -(@HomNay+6), GetDate()),101) AS datetime)
  -- Tính ngày cuối tuần trước tính đến 24h ngày cuối tuần 
  DECLARE @NgayCuoiTuanTruoc datetime
  SET @NgayCuoiTuanTruoc = Cast(CONVERT(nvarchar(30),DATEADD(dd, -@HomNay, GetDate()),101) +' 23:59:59' AS datetime)
  
  -- Tính số truy cập tuần này
  DECLARE @SoTruyCapTuanNay bigint
  SELECT @SoTruyCapTuanNay=isnull(Sum(SoTruyCap),0) FROM _Statistic ttk 
   WHERE ttk.ThoiGian BETWEEN @DauTuanNay AND getdate()
   
  -- Tính số truy cập tuần trước
  DECLARE @SoLanTruyCapTuanTruoc bigint
  SELECT @SoLanTruyCapTuanTruoc=isnull(sum(SoTruyCap),0)  FROM _Statistic ttk 
   WHERE ttk.ThoiGian BETWEEN @NgayDauTuanTruoc AND @NgayCuoiTuanTruoc
  
  -- Tính số truy cập tháng này
  DECLARE @SoTruyCapThangNay bigint 
  SELECT @SoTruyCapThangNay=isnull(Sum(SoTruyCap),0)
   FROM _Statistic ttk WHERE MONTH(ttk.ThoiGian)=MONTH(GETDATE())
  
  -- Tính số truy cập tháng trước
  DECLARE @SoTruyCapThangTruoc bigint 
  SELECT @SoTruyCapThangTruoc=isnull(Sum(SoTruyCap),0)
   FROM _Statistic ttk WHERE MONTH(ttk.ThoiGian)=MONTH(GETDATE())-1
  
  -- Tính tổng số
  DECLARE @TongSo bigint
  SELECT  @TongSo=isnull(Sum(SoTruyCap),0) FROM _Statistic ttk
  
  SELECT @SoTruyCapGanNhat AS HomNay, 
  @SoTruyCapHomQua AS HomQua,
  @SoTruyCapTuanNay AS TuanNay, 
  @SoLanTruyCapTuanTruoc AS TuanTruoc, 
  @SoTruyCapThangNay AS ThangNay, 
  @SoTruyCapThangTruoc AS ThangTruoc,
  @TongSo AS TatCa
END
GO
/****** Object:  StoredProcedure [dbo].[_Statistic_All]    Script Date: 05/06/2016 16:06:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[_Statistic_All]
AS
BEGIN
	--SELECT CONVERT(NVARCHAR(10), ThoiGian, 120) [date], 
	--SUM(SoTruyCap) [Total] 
	--FROM _Statistic 
	--GROUP BY CONVERT(NVARCHAR(10), ThoiGian, 120) 
	--ORDER BY [date]
	SELECT 
	cast(datepart(year, ThoiGian) as varchar(4)) as [year],
	cast(datepart(MONTH, ThoiGian) as varchar(2)) as [month], 
	SUM(SoTruyCap) [Total] 
	FROM _Statistic 
	group by cast(datepart(year, ThoiGian) as varchar(4)) , cast(datepart(MONTH, ThoiGian) as varchar(2)) 
	order by cast(datepart(year, ThoiGian) as varchar(4)) , cast(datepart(MONTH, ThoiGian) as varchar(2)) 
END
GO
/****** Object:  Table [dbo].[_Statistic]    Script Date: 05/06/2016 16:06:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_Statistic](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ThoiGian] [datetime] NOT NULL,
	[SoTruyCap] [bigint] NOT NULL,
	[year] [int] NULL,
	[month] [int] NULL,
	[total] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[_Statistic] ON
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (27, CAST(0x0000A49901240CB8 AS DateTime), 3, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (28, CAST(0x0000A49D0155C66C AS DateTime), 12, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (29, CAST(0x0000A49E01252DDB AS DateTime), 21, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (30, CAST(0x0000A49F00B20E43 AS DateTime), 1, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (31, CAST(0x0000A49F011D25C0 AS DateTime), 21, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (32, CAST(0x0000A4A001888DE3 AS DateTime), 36, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (33, CAST(0x0000A4A1000D089D AS DateTime), 1, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (34, CAST(0x0000A4A2012116F9 AS DateTime), 1, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (35, CAST(0x0000A4A201715432 AS DateTime), 7, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (36, CAST(0x0000A4A3011B9EE5 AS DateTime), 20, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (37, CAST(0x0000A4A40105C072 AS DateTime), 10, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (38, CAST(0x0000A4A5017D57E7 AS DateTime), 19, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (39, CAST(0x0000A4A6016A628D AS DateTime), 13, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (40, CAST(0x0000A4A700F14FE5 AS DateTime), 5, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (41, CAST(0x0000A4AA011EF9DC AS DateTime), 10, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (42, CAST(0x0000A4AB013797DC AS DateTime), 13, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (43, CAST(0x0000A4AC011B87D8 AS DateTime), 5, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (44, CAST(0x0000A4AD00FE8C22 AS DateTime), 9, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (45, CAST(0x0000A4B5011431A7 AS DateTime), 6, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (46, CAST(0x0000A4B8012E7105 AS DateTime), 3, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (47, CAST(0x0000A4F8012C129D AS DateTime), 10, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (48, CAST(0x0000A4F9016797A1 AS DateTime), 2, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (49, CAST(0x0000A4FA01083907 AS DateTime), 1, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (50, CAST(0x0000A511017E5701 AS DateTime), 1, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (51, CAST(0x0000A512012FB952 AS DateTime), 1, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (52, CAST(0x0000A5290093807D AS DateTime), 1, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (53, CAST(0x0000A52A0121DF82 AS DateTime), 1, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (54, CAST(0x0000A587017927DE AS DateTime), 13, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (55, CAST(0x0000A58801722EBA AS DateTime), 15, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (56, CAST(0x0000A58900B13547 AS DateTime), 18, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (57, CAST(0x0000A58A01341B91 AS DateTime), 53, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (58, CAST(0x0000A58B008EE966 AS DateTime), 1, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (59, CAST(0x0000A58B012C2FA9 AS DateTime), 18, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (60, CAST(0x0000A58C00CB8D07 AS DateTime), 31, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (61, CAST(0x0000A58D014F5C41 AS DateTime), 4, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (62, CAST(0x0000A58E01756C06 AS DateTime), 1, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (63, CAST(0x0000A58F015A1C63 AS DateTime), 6, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (64, CAST(0x0000A59000A8EC0C AS DateTime), 1, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (65, CAST(0x0000A5AB00ABF1B1 AS DateTime), 1, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (66, CAST(0x0000A5E90187904E AS DateTime), 34, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (67, CAST(0x0000A5EA01882EDB AS DateTime), 16, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (68, CAST(0x0000A5EB0187F47B AS DateTime), 22, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (69, CAST(0x0000A5EC0147C43E AS DateTime), 9, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (70, CAST(0x0000A5ED017E0E1D AS DateTime), 30, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (71, CAST(0x0000A5EE01825AD6 AS DateTime), 42, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (72, CAST(0x0000A5F80176DE66 AS DateTime), 13, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (73, CAST(0x0000A5F901885498 AS DateTime), 22, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (74, CAST(0x0000A5FA016A87A1 AS DateTime), 40, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (75, CAST(0x0000A5FB018192FD AS DateTime), 83, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (76, CAST(0x0000A5FC0165A52E AS DateTime), 31, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (77, CAST(0x0000A5FD018AAD35 AS DateTime), 76, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (78, CAST(0x0000A5FE01047AF4 AS DateTime), 37, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[_Statistic] OFF
/****** Object:  Table [dbo].[_Role]    Script Date: 05/06/2016 16:06:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_Role](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL,
	[Des] [nvarchar](500) NOT NULL,
	[Role] [nvarchar](max) NULL,
 CONSTRAINT [PK_tblRole] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[_Role] ON
INSERT [dbo].[_Role] ([ID], [RoleName], [Des], [Role]) VALUES (1, N'Admin', N'Quản trị cao nhất', N'Admin')
INSERT [dbo].[_Role] ([ID], [RoleName], [Des], [Role]) VALUES (2, N'Client', N'Người dùng', N'Client')
SET IDENTITY_INSERT [dbo].[_Role] OFF
/****** Object:  Table [dbo].[_Rating]    Script Date: 05/06/2016 16:06:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_Rating](
	[RatingId] [int] IDENTITY(1,1) NOT NULL,
	[Rating] [int] NULL,
	[ip] [nvarchar](50) NULL,
	[name] [nvarchar](250) NULL,
	[email] [nvarchar](30) NULL,
	[contents] [nvarchar](250) NULL,
	[itemId] [int] NULL,
 CONSTRAINT [PK__Rating] PRIMARY KEY CLUSTERED 
(
	[RatingId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[_Rating] ON
INSERT [dbo].[_Rating] ([RatingId], [Rating], [ip], [name], [email], [contents], [itemId]) VALUES (1, 4, N'123456', N'son coi', N'abc@gmail.com', N'vote phat nao', 73)
INSERT [dbo].[_Rating] ([RatingId], [Rating], [ip], [name], [email], [contents], [itemId]) VALUES (9, 5, N'122322', N'son coi2', N'abc1@gmail.com', N'vote phat nao2', 73)
INSERT [dbo].[_Rating] ([RatingId], [Rating], [ip], [name], [email], [contents], [itemId]) VALUES (10, 2, N'111111', N'son coi23', N'abc2@gmail.com', N'vote phat nao3', 73)
INSERT [dbo].[_Rating] ([RatingId], [Rating], [ip], [name], [email], [contents], [itemId]) VALUES (11, 5, N'::1', N'a', N'abc@gmail.com', N'aaaaaaaaaaa', 73)
INSERT [dbo].[_Rating] ([RatingId], [Rating], [ip], [name], [email], [contents], [itemId]) VALUES (12, 4, N'::1', N'sonc%20oi', N'abc@gmail.com', N'aaaaaaaa', 60)
INSERT [dbo].[_Rating] ([RatingId], [Rating], [ip], [name], [email], [contents], [itemId]) VALUES (14, 2, N'::1', N'aaa', N'em@gmail.com', N'aaaaaaaaaa', 65)
INSERT [dbo].[_Rating] ([RatingId], [Rating], [ip], [name], [email], [contents], [itemId]) VALUES (15, 2, N'::1', N'aaa', N'em@gmail.com', N'aaaaaa', 71)
INSERT [dbo].[_Rating] ([RatingId], [Rating], [ip], [name], [email], [contents], [itemId]) VALUES (16, 5, N'::1', N'Duy', N'abc123@gmail.com', N'aaaaaaa', 33)
INSERT [dbo].[_Rating] ([RatingId], [Rating], [ip], [name], [email], [contents], [itemId]) VALUES (17, 4, N'::1', N'bbb', N'abc1123@gmail.com', N'vvvvv', 71)
SET IDENTITY_INSERT [dbo].[_Rating] OFF
/****** Object:  Table [dbo].[_ProductTag]    Script Date: 05/06/2016 16:06:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[_ProductTag](
	[ProductTagID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[Tag] [nvarchar](50) NULL,
	[Link] [varchar](50) NULL,
 CONSTRAINT [PK_ProductTag] PRIMARY KEY CLUSTERED 
(
	[ProductTagID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[_ProductTag] ON
INSERT [dbo].[_ProductTag] ([ProductTagID], [ProductID], [Tag], [Link]) VALUES (3, 1, N'mạch nạp', N'mach-nap')
INSERT [dbo].[_ProductTag] ([ProductTagID], [ProductID], [Tag], [Link]) VALUES (4, 1, N'arm', N'arm')
SET IDENTITY_INSERT [dbo].[_ProductTag] OFF
/****** Object:  Table [dbo].[_ProductProperty]    Script Date: 05/06/2016 16:06:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_ProductProperty](
	[ProductID] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[Value] [nvarchar](500) NULL,
	[Type] [nvarchar](50) NULL,
	[ProID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK__ProductProperty] PRIMARY KEY CLUSTERED 
(
	[ProID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[_ProductProperty] ON
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (33, N'yellow', N'#eef206', N'COL', 2)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (33, N'blue', N'#2400ff', N'COL', 5)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (33, N'S', N'S', N'SIZ', 8)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (35, N'S', N'S', N'SIZ', 9)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (37, N'S', N'S', N'SIZ', 10)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (38, N'S', N'S', N'SIZ', 11)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (42, N'S', N'S', N'SIZ', 12)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (43, N'S', N'S', N'SIZ', 13)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (47, N'S', N'S', N'SIZ', 14)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (52, N'S', N'S', N'SIZ', 15)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (56, N'S', N'S', N'SIZ', 16)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (57, N'S', N'S', N'SIZ', 17)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (58, N'S', N'S', N'SIZ', 18)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (59, N'S', N'S', N'SIZ', 19)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (60, N'S', N'S', N'SIZ', 20)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (61, N'S', N'S', N'SIZ', 21)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (62, N'S', N'S', N'SIZ', 22)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (63, N'S', N'S', N'SIZ', 23)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (64, N'S', N'S', N'SIZ', 24)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (65, N'S', N'S', N'SIZ', 25)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (66, N'S', N'S', N'SIZ', 26)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (67, N'S', N'S', N'SIZ', 27)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (68, N'S', N'S', N'SIZ', 28)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (69, N'S', N'S', N'SIZ', 29)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (70, N'S', N'S', N'SIZ', 30)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (71, N'S', N'S', N'SIZ', 31)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (72, N'S', N'S', N'SIZ', 32)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (73, N'S', N'S', N'SIZ', 33)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (74, N'S', N'S', N'SIZ', 34)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (75, N'S', N'S', N'SIZ', 35)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (76, N'S', N'S', N'SIZ', 36)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (77, N'S', N'S', N'SIZ', 37)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (33, N'M', N'M', N'SIZ', 38)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (35, N'M', N'M', N'SIZ', 39)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (37, N'M', N'M', N'SIZ', 40)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (38, N'M', N'M', N'SIZ', 41)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (42, N'M', N'M', N'SIZ', 42)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (43, N'M', N'M', N'SIZ', 43)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (47, N'M', N'M', N'SIZ', 44)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (52, N'M', N'M', N'SIZ', 45)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (56, N'M', N'M', N'SIZ', 46)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (57, N'M', N'M', N'SIZ', 47)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (58, N'M', N'M', N'SIZ', 48)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (59, N'M', N'M', N'SIZ', 49)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (60, N'M', N'M', N'SIZ', 50)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (61, N'M', N'M', N'SIZ', 51)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (62, N'M', N'M', N'SIZ', 52)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (63, N'M', N'M', N'SIZ', 53)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (64, N'M', N'M', N'SIZ', 54)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (65, N'M', N'M', N'SIZ', 55)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (66, N'M', N'M', N'SIZ', 56)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (67, N'M', N'M', N'SIZ', 57)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (68, N'M', N'M', N'SIZ', 58)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (69, N'M', N'M', N'SIZ', 59)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (70, N'M', N'M', N'SIZ', 60)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (71, N'M', N'M', N'SIZ', 61)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (72, N'M', N'M', N'SIZ', 62)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (73, N'M', N'M', N'SIZ', 63)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (74, N'M', N'M', N'SIZ', 64)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (75, N'M', N'M', N'SIZ', 65)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (76, N'M', N'M', N'SIZ', 66)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (77, N'M', N'M', N'SIZ', 67)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (33, N'L', N'L', N'SIZ', 68)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (35, N'L', N'L', N'SIZ', 69)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (37, N'L', N'L', N'SIZ', 70)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (38, N'L', N'L', N'SIZ', 71)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (42, N'L', N'L', N'SIZ', 72)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (43, N'L', N'L', N'SIZ', 73)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (47, N'L', N'L', N'SIZ', 74)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (52, N'L', N'L', N'SIZ', 75)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (56, N'L', N'L', N'SIZ', 76)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (57, N'L', N'L', N'SIZ', 77)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (58, N'L', N'L', N'SIZ', 78)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (59, N'L', N'L', N'SIZ', 79)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (60, N'L', N'L', N'SIZ', 80)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (61, N'L', N'L', N'SIZ', 81)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (62, N'L', N'L', N'SIZ', 82)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (63, N'L', N'L', N'SIZ', 83)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (64, N'L', N'L', N'SIZ', 84)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (65, N'L', N'L', N'SIZ', 85)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (66, N'L', N'L', N'SIZ', 86)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (67, N'L', N'L', N'SIZ', 87)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (68, N'L', N'L', N'SIZ', 88)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (69, N'L', N'L', N'SIZ', 89)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (70, N'L', N'L', N'SIZ', 90)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (71, N'L', N'L', N'SIZ', 91)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (72, N'L', N'L', N'SIZ', 92)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (73, N'L', N'L', N'SIZ', 93)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (74, N'L', N'L', N'SIZ', 94)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (75, N'L', N'L', N'SIZ', 95)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (76, N'L', N'L', N'SIZ', 96)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (77, N'L', N'L', N'SIZ', 97)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (33, N'white', N'#ffffff', N'COL', 98)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (35, N'white', N'#ffffff', N'COL', 99)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (37, N'white', N'#ffffff', N'COL', 100)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (38, N'white', N'#ffffff', N'COL', 101)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (42, N'white', N'#ffffff', N'COL', 102)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (43, N'white', N'#ffffff', N'COL', 103)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (47, N'white', N'#ffffff', N'COL', 104)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (52, N'white', N'#ffffff', N'COL', 105)
GO
print 'Processed 100 total records'
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (56, N'white', N'#ffffff', N'COL', 106)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (57, N'white', N'#ffffff', N'COL', 107)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (58, N'white', N'#ffffff', N'COL', 108)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (59, N'white', N'#ffffff', N'COL', 109)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (60, N'white', N'#ffffff', N'COL', 110)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (61, N'white', N'#ffffff', N'COL', 111)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (62, N'white', N'#ffffff', N'COL', 112)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (63, N'white', N'#ffffff', N'COL', 113)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (64, N'white', N'#ffffff', N'COL', 114)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (65, N'white', N'#ffffff', N'COL', 115)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (66, N'white', N'#ffffff', N'COL', 116)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (67, N'white', N'#ffffff', N'COL', 117)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (68, N'white', N'#ffffff', N'COL', 118)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (69, N'white', N'#ffffff', N'COL', 119)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (70, N'white', N'#ffffff', N'COL', 120)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (71, N'white', N'#ffffff', N'COL', 121)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (72, N'white', N'#ffffff', N'COL', 122)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (73, N'white', N'#ffffff', N'COL', 123)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (74, N'white', N'#ffffff', N'COL', 124)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (75, N'white', N'#ffffff', N'COL', 125)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (76, N'white', N'#ffffff', N'COL', 126)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (77, N'white', N'#ffffff', N'COL', 127)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (33, N'red', N'#ff0000', N'COL', 128)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (35, N'red', N'#ff0000', N'COL', 129)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (37, N'red', N'#ff0000', N'COL', 130)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (38, N'red', N'#ff0000', N'COL', 131)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (42, N'red', N'#ff0000', N'COL', 132)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (43, N'red', N'#ff0000', N'COL', 133)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (47, N'red', N'#ff0000', N'COL', 134)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (52, N'red', N'#ff0000', N'COL', 135)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (56, N'red', N'#ff0000', N'COL', 136)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (57, N'red', N'#ff0000', N'COL', 137)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (58, N'red', N'#ff0000', N'COL', 138)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (59, N'red', N'#ff0000', N'COL', 139)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (60, N'red', N'#ff0000', N'COL', 140)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (61, N'red', N'#ff0000', N'COL', 141)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (62, N'red', N'#ff0000', N'COL', 142)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (63, N'red', N'#ff0000', N'COL', 143)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (64, N'red', N'#ff0000', N'COL', 144)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (65, N'red', N'#ff0000', N'COL', 145)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (66, N'red', N'#ff0000', N'COL', 146)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (67, N'red', N'#ff0000', N'COL', 147)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (68, N'red', N'#ff0000', N'COL', 148)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (69, N'red', N'#ff0000', N'COL', 149)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (70, N'red', N'#ff0000', N'COL', 150)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (71, N'red', N'#ff0000', N'COL', 151)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (72, N'red', N'#ff0000', N'COL', 152)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (73, N'red', N'#ff0000', N'COL', 153)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (74, N'red', N'#ff0000', N'COL', 154)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (75, N'red', N'#ff0000', N'COL', 155)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (76, N'red', N'#ff0000', N'COL', 156)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (77, N'red', N'#ff0000', N'COL', 157)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (0, N'red', N'#ff0000', N'COL', 166)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 182)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 183)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 184)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 185)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 186)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 187)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 188)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 189)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 190)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 191)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 192)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 193)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 194)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 195)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 196)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 197)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 198)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 199)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 200)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 201)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 202)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 203)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 204)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 205)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 206)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 207)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 208)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 209)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 210)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 211)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 212)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 213)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 214)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 215)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 216)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 217)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 218)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 219)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 220)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 221)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 222)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 223)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 224)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 225)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 226)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 227)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 228)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 229)
GO
print 'Processed 200 total records'
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 230)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 231)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 232)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 233)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 234)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 235)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 236)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 237)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 238)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 239)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 240)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 241)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 242)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 243)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 244)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 245)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 246)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 247)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 248)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 249)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 250)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 251)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 252)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 253)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 254)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 255)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 256)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 257)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 258)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 259)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 260)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 261)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 262)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 263)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 264)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 265)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 266)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 267)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 268)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 269)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 270)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 271)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 272)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 273)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 274)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 275)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 276)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 277)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 278)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 279)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 280)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 281)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 282)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 283)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 284)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 285)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 286)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 287)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 288)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 289)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 290)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 291)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 292)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 293)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 294)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 295)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 296)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 297)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 298)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 299)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 300)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 301)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 302)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 303)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 304)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 305)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 306)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 307)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 308)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 309)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 310)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 311)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 312)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 313)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 314)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 315)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 316)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 317)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 318)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 319)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 320)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 321)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 322)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 323)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 324)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 325)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 326)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 327)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 328)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 329)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 330)
GO
print 'Processed 300 total records'
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 331)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 332)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 333)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 334)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 335)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 336)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 337)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 338)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 339)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 340)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 341)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 342)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 343)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 344)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 345)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 346)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 347)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 348)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 349)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 350)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 351)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 352)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 353)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 354)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 355)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 356)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 357)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 358)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 359)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 360)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 361)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 362)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 363)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 364)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 365)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 366)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 367)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 368)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 369)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 370)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 371)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (59, N'tim', N'#ffad46', N'COL', 374)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (59, N'tim', N'#ffad46', N'COL', 375)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (77, N'Blue', N'#4986e7', N'COL', 378)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (0, N'Nhỏ', N'S', N'SIZ', 380)
SET IDENTITY_INSERT [dbo].[_ProductProperty] OFF
/****** Object:  StoredProcedure [dbo].[_Product_GetByCatalogType]    Script Date: 05/06/2016 16:06:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[_Product_GetByCatalogType]
	@Type nvarchar(50)
AS
BEGIN
	if(@Type <> '')
	begin
		select 
		ProductID,ProductName,ProductCode,CatalogID,Summary,Content,ImagePath,ImageBigPath,DateModify,Store,
		Promotion,Warranty,Manufacture,PriceOld,PriceNew,Views,OrderDisplay,Lang,IsShow,IsHot,
		IsPromotion,Link,Approve,StartDate,EndDate,Rating
		from _Product p 
		where p.ProductID in (
		select DISTINCT p.ProductID from _Product p CROSS APPLY [dbo].ConvertDelimitedListIntoTable(p.CatalogID,',') prop 
		inner join _Catalog c on prop.item = c.CatalogID 
		where c.Type = @Type )
		Order by p.ProductID DESC
	end
	else
	begin 
		select 
		ProductID,ProductName,ProductCode,CatalogID,Summary,Content,ImagePath,ImageBigPath,DateModify,Store,
		Promotion,Warranty,Manufacture,PriceOld,PriceNew,Views,OrderDisplay,Lang,IsShow,IsHot,
		IsPromotion,Link,Approve,StartDate,EndDate,Rating
		from _Product p 
		where p.ProductID in (
		select DISTINCT p.ProductID from _Product p CROSS APPLY [dbo].ConvertDelimitedListIntoTable(p.CatalogID,',') prop 
		inner join _Catalog c on prop.item = c.CatalogID 
		where c.Type in ('SP','CL'))
		Order by p.ProductID DESC
	end
END

--exec [_Product_GetByCatalogType] 'SP'
GO
/****** Object:  Table [dbo].[_Product]    Script Date: 05/06/2016 16:06:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[_Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](512) NOT NULL,
	[ProductCode] [nvarchar](50) NULL,
	[CatalogID] [varchar](500) NULL,
	[Summary] [ntext] NULL,
	[Content] [ntext] NULL,
	[ImagePath] [nvarchar](512) NULL,
	[ImageBigPath] [nvarchar](512) NULL,
	[DateModify] [datetime] NULL,
	[Store] [int] NOT NULL,
	[Promotion] [nvarchar](512) NULL,
	[Warranty] [nvarchar](250) NULL,
	[Manufacture] [nvarchar](512) NULL,
	[PriceOld] [money] NOT NULL,
	[PriceNew] [money] NULL,
	[Views] [int] NOT NULL,
	[OrderDisplay] [int] NOT NULL,
	[Lang] [nvarchar](10) NULL,
	[IsShow] [bit] NOT NULL,
	[IsHot] [bit] NOT NULL,
	[IsPromotion] [bit] NOT NULL,
	[Link] [nvarchar](500) NULL,
	[Approve] [bit] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Rating] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[_Product] ON
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (33, N'asya', N'KT_CC_007', N'39,40,44', N'Dòng sản phẩm chăm sóc kinh điển là 1 trong 2 sản phẩm đầu tiên trên thế giới sử dụng dưỡng chất tơ tằm trong sản phẩm dầu gội, tạo nên một bước đột phá về độ dai, suôn, và bóng mượt cho mái tóc', N'Xịt dưỡng cung cấp 
protein với công nghệ kim cương làm cho mái tóc sắc nét và màu tóc sáng 
bóng. Tái tạo lại những hạt Protein làm cho tóc trở nên chắc khỏe và 
sáng bóng. Phục hồi lại cấu trúc tự nhiên của tóc, tăng cường dưỡng chất
giúp tóc chống lại tia cực tím.', N'/images/photoproduct/2016/4/sc_small_2092_ghd_v_coral_styler_0_1409235636.jpg', N'/images/photoproduct/2016/4/sc_full_2092_ghd_v_coral_styler_0_1409235636.jpg', CAST(0x0000A5E901742EDF AS DateTime), 1, N'', N'', N'Olay', 0.0000, 10000.0000, 0, 2, N'vi', 1, 1, 0, N'asya', 1, CAST(0x0000A3E900000000 AS DateTime), CAST(0x0000A3EE00000000 AS DateTime), 5)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (35, N'lauretta', N'KT_CC_001', N'39', N'Dòng sản phẩm chăm sóc kinh điển là 1 trong 2 sản phẩm đầu tiên trên thế giới sử dụng dưỡng chất tơ tằm trong sản phẩm dầu gội, tạo nên một bước đột phá về độ dai, suôn, và bóng mượt cho mái tóc', N'Xịt dưỡng cung cấp 
protein với công nghệ kim cương làm cho mái tóc sắc nét và màu tóc sáng 
bóng. Tái tạo lại những hạt Protein làm cho tóc trở nên chắc khỏe và 
sáng bóng. Phục hồi lại cấu trúc tự nhiên của tóc, tăng cường dưỡng chất
giúp tóc chống lại tia cực tím.', N'/images/photoproduct/2015/6/sc_small_2091_MG_0967.jpg', N'/images/photoproduct/2015/6/sc_full_2091_MG_0967.jpg', CAST(0x0000A4AB0105D939 AS DateTime), 1, N'', N'', N'Olay', 0.0000, 10000.0000, 1, 0, N'vi  ', 1, 0, 0, N'lauretta', 1, CAST(0x0000A3E900000000 AS DateTime), CAST(0x0000A3EE00000000 AS DateTime), 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (37, N'erdina', N'KT_BT_007', N'40', N'Dòng sản phẩm chăm sóc kinh điển là 1 trong 2 sản phẩm đầu tiên trên thế giới sử dụng dưỡng chất tơ tằm trong sản phẩm dầu gội, tạo nên một bước đột phá về độ dai, suôn, và bóng mượt cho mái tóc', N'Xịt dưỡng cung cấp 
protein với công nghệ kim cương làm cho mái tóc sắc nét và màu tóc sáng 
bóng. Tái tạo lại những hạt Protein làm cho tóc trở nên chắc khỏe và 
sáng bóng. Phục hồi lại cấu trúc tự nhiên của tóc, tăng cường dưỡng chất
giúp tóc chống lại tia cực tím.', N'/images/photoproduct/2016/4/sc_small_2091_energize_shampoo_conditioner.jpg', N'/images/photoproduct/2016/4/sc_full_2091_energize_shampoo_conditioner.jpg', CAST(0x0000A5E90173F267 AS DateTime), 1, N'', N'', N'Olay', 0.0000, 10000.0000, 0, 0, N'vi', 1, 1, 0, N'erdina', 1, CAST(0x0000A3E900000000 AS DateTime), CAST(0x0000A3EE00000000 AS DateTime), 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (38, N'filisi', N'KT_BT_008', N'40', N'Dòng sản phẩm chăm sóc kinh điển là 1 trong 2 sản phẩm đầu tiên trên thế giới sử dụng dưỡng chất tơ tằm trong sản phẩm dầu gội, tạo nên một bước đột phá về độ dai, suôn, và bóng mượt cho mái tóc', N'Xịt dưỡng cung cấp 
protein với công nghệ kim cương làm cho mái tóc sắc nét và màu tóc sáng 
bóng. Tái tạo lại những hạt Protein làm cho tóc trở nên chắc khỏe và 
sáng bóng. Phục hồi lại cấu trúc tự nhiên của tóc, tăng cường dưỡng chất
giúp tóc chống lại tia cực tím.', N'/images/photoproduct/2015/6/sc_small_2090_MG_1121-682x1024.jpg', N'/images/photoproduct/2015/6/sc_full_2090_MG_1121-682x1024.jpg', CAST(0x0000A4AB0105ACCB AS DateTime), 1, N'', N'', N'Olay', 0.0000, 10000.0000, 1, 0, N'vi  ', 1, 0, 0, N'filisi', 1, CAST(0x0000A3E900000000 AS DateTime), CAST(0x0000A3EE00000000 AS DateTime), 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (42, N'iziar', N'KT_CC_003', N'39,44', N'Dòng sản phẩm chăm sóc kinh điển là 1 trong 2 sản phẩm đầu tiên trên thế giới sử dụng dưỡng chất tơ tằm trong sản phẩm dầu gội, tạo nên một bước đột phá về độ dai, suôn, và bóng mượt cho mái tóc', N'Xịt dưỡng cung cấp 
protein với công nghệ kim cương làm cho mái tóc sắc nét và màu tóc sáng 
bóng. Tái tạo lại những hạt Protein làm cho tóc trở nên chắc khỏe và 
sáng bóng. Phục hồi lại cấu trúc tự nhiên của tóc, tăng cường dưỡng chất
giúp tóc chống lại tia cực tím.', N'/images/photoproduct/2016/4/sc_small_2089_k_eacute_rastase_specifique_bain_divalent_balancing_shampoo_250ml_1363775533.png.jpg', N'/images/photoproduct/2016/4/sc_full_2089_k_eacute_rastase_specifique_bain_divalent_balancing_shampoo_250ml_1363775533.png.jpg', CAST(0x0000A5E901739857 AS DateTime), 1, N'', N'', N'Olay', 0.0000, 10000.0000, 0, 0, N'vi', 1, 1, 0, N'iziar', 1, CAST(0x0000A3E900000000 AS DateTime), CAST(0x0000A3EE00000000 AS DateTime), 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (43, N'alberta', N'KT_CC_006', N'39', N'Dòng sản phẩm chăm sóc kinh điển là 1 trong 2 sản phẩm đầu tiên trên thế giới sử dụng dưỡng chất tơ tằm trong sản phẩm dầu gội, tạo nên một bước đột phá về độ dai, suôn, và bóng mượt cho mái tóc', N'Xịt dưỡng cung cấp 
protein với công nghệ kim cương làm cho mái tóc sắc nét và màu tóc sáng 
bóng. Tái tạo lại những hạt Protein làm cho tóc trở nên chắc khỏe và 
sáng bóng. Phục hồi lại cấu trúc tự nhiên của tóc, tăng cường dưỡng chất
giúp tóc chống lại tia cực tím.', N'/images/photoproduct/2015/5/sc_small_2074_placeholder2.jpg', N'/images/photoproduct/2015/5/sc_full_2074_placeholder2.jpg', CAST(0x0000A49F00BB60C2 AS DateTime), 1, N'', N'', N'Olay', 0.0000, 10000.0000, 1, 1, N'vi  ', 1, 0, 0, N'alberta', 1, CAST(0x0000A3E900000000 AS DateTime), CAST(0x0000A3EE00000000 AS DateTime), 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (47, N'arkadiya', N'KT_BT_006', N'40', N'Dòng sản phẩm chăm sóc kinh điển là 1 trong 2 sản phẩm đầu tiên trên thế giới sử dụng dưỡng chất tơ tằm trong sản phẩm dầu gội, tạo nên một bước đột phá về độ dai, suôn, và bóng mượt cho mái tóc', N'Xịt dưỡng cung cấp 
protein với công nghệ kim cương làm cho mái tóc sắc nét và màu tóc sáng 
bóng. Tái tạo lại những hạt Protein làm cho tóc trở nên chắc khỏe và 
sáng bóng. Phục hồi lại cấu trúc tự nhiên của tóc, tăng cường dưỡng chất
giúp tóc chống lại tia cực tím.', N'/images/photoproduct/2015/5/sc_small_2067_placeholder2-1.jpg', N'/images/photoproduct/2015/5/sc_full_2067_placeholder2-1.jpg', CAST(0x0000A4A000E7F6D7 AS DateTime), 1, N'', N'', N'Olay', 0.0000, 10000.0000, 1, 0, N'vi  ', 1, 0, 1, N'arkadiya', 1, CAST(0x0000A3E900000000 AS DateTime), CAST(0x0000A3EE00000000 AS DateTime), 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (52, N'budur', N'KT_BT_003', N'40', N'Dòng sản phẩm chăm sóc kinh điển là 1 trong 2 sản phẩm đầu tiên trên thế giới sử dụng dưỡng chất tơ tằm trong sản phẩm dầu gội, tạo nên một bước đột phá về độ dai, suôn, và bóng mượt cho mái tóc', N'Xịt dưỡng cung cấp 
protein với công nghệ kim cương làm cho mái tóc sắc nét và màu tóc sáng 
bóng. Tái tạo lại những hạt Protein làm cho tóc trở nên chắc khỏe và 
sáng bóng. Phục hồi lại cấu trúc tự nhiên của tóc, tăng cường dưỡng chất
giúp tóc chống lại tia cực tím.', N'/images/photoproduct/2016/4/sc_small_2089_immortal_moringa_for_damaged_hair_125ml_1366299948.png.jpg', N'/images/photoproduct/2016/4/sc_full_2089_immortal_moringa_for_damaged_hair_125ml_1366299948.png.jpg', CAST(0x0000A5E901737A3D AS DateTime), 1, N'', N'', N'Olay', 0.0000, 10000.0000, 0, 0, N'vi', 1, 1, 0, N'budur', 1, CAST(0x0000A3E900000000 AS DateTime), CAST(0x0000A3EE00000000 AS DateTime), 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (56, N'kaleir', N'KT_CC_002', N'39', N'Dòng sản phẩm chăm sóc kinh điển là 1 trong 2 sản phẩm đầu tiên trên thế giới sử dụng dưỡng chất tơ tằm trong sản phẩm dầu gội, tạo nên một bước đột phá về độ dai, suôn, và bóng mượt cho mái tóc', N'Xịt dưỡng cung cấp 
protein với công nghệ kim cương làm cho mái tóc sắc nét và màu tóc sáng 
bóng. Tái tạo lại những hạt Protein làm cho tóc trở nên chắc khỏe và 
sáng bóng. Phục hồi lại cấu trúc tự nhiên của tóc, tăng cường dưỡng chất
giúp tóc chống lại tia cực tím.', N'/images/photoproduct/2015/5/sc_small_2056_featured-2.jpg', N'/images/photoproduct/2015/5/sc_full_2056_featured-2.jpg', CAST(0x0000A4A000E64FCC AS DateTime), 1, N'', N'', N'Lancome', 0.0000, 10000.0000, 1, 0, N'vi  ', 1, 0, 1, N'kaleir', 0, CAST(0x0000A3E900000000 AS DateTime), CAST(0x0000A3EE00000000 AS DateTime), 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (57, N'frida', N'KT_BT_005', N'40', N'Dòng sản phẩm chăm sóc kinh điển là 1 trong 2 sản phẩm đầu tiên trên thế giới sử dụng dưỡng chất tơ tằm trong sản phẩm dầu gội, tạo nên một bước đột phá về độ dai, suôn, và bóng mượt cho mái tóc', N'Xịt dưỡng cung cấp 
protein với công nghệ kim cương làm cho mái tóc sắc nét và màu tóc sáng 
bóng. Tái tạo lại những hạt Protein làm cho tóc trở nên chắc khỏe và 
sáng bóng. Phục hồi lại cấu trúc tự nhiên của tóc, tăng cường dưỡng chất
giúp tóc chống lại tia cực tím.', N'/images/photoproduct/2015/6/sc_small_2089_MG_1017-682x1024.jpg', N'/images/photoproduct/2015/6/sc_full_2089_MG_1017-682x1024.jpg', CAST(0x0000A4AB010567DE AS DateTime), 1, N'', N'', N'Lancome', 0.0000, 10000.0000, 1, 0, N'vi  ', 1, 0, 0, N'frida', 1, CAST(0x0000A3FE00000000 AS DateTime), CAST(0x0000A40500000000 AS DateTime), 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (58, N'aziza', N'KT_BT_004', N'40', N'Dòng sản phẩm chăm sóc kinh điển là 1 trong 2 sản phẩm đầu tiên trên thế giới sử dụng dưỡng chất tơ tằm trong sản phẩm dầu gội, tạo nên một bước đột phá về độ dai, suôn, và bóng mượt cho mái tóc', N'Xịt dưỡng cung cấp 
protein với công nghệ kim cương làm cho mái tóc sắc nét và màu tóc sáng 
bóng. Tái tạo lại những hạt Protein làm cho tóc trở nên chắc khỏe và 
sáng bóng. Phục hồi lại cấu trúc tự nhiên của tóc, tăng cường dưỡng chất
giúp tóc chống lại tia cực tím.', N'/images/photoproduct/2015/5/sc_small_2068_placeholder3.jpg', N'/images/photoproduct/2015/5/sc_full_2068_placeholder3.jpg', CAST(0x0000A4A000E769A5 AS DateTime), 1, N'', N'', N'Lancome', 0.0000, 10000.0000, 1, 0, N'vi  ', 1, 0, 0, N'aziza', NULL, CAST(0x0000A3FC00000000 AS DateTime), CAST(0x0000A3FE00000000 AS DateTime), 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (59, N'kantara', N'KT_BT_002', N'40', N'Dòng sản phẩm chăm sóc kinh điển là 1 trong 2 sản phẩm đầu tiên trên thế giới sử dụng dưỡng chất tơ tằm trong sản phẩm dầu gội, tạo nên một bước đột phá về độ dai, suôn, và bóng mượt cho mái tóc', N'Xịt dưỡng cung cấp 
protein với công nghệ kim cương làm cho mái tóc sắc nét và màu tóc sáng 
bóng. Tái tạo lại những hạt Protein làm cho tóc trở nên chắc khỏe và 
sáng bóng. Phục hồi lại cấu trúc tự nhiên của tóc, tăng cường dưỡng chất
giúp tóc chống lại tia cực tím.', N'/images/photoproduct/2015/6/sc_small_2089_MG_0972-682x1024.jpg', N'/images/photoproduct/2015/6/sc_full_2089_MG_0972-682x1024.jpg', CAST(0x0000A4AB01053473 AS DateTime), 1, N'', N'', N'Lancome', 0.0000, 10000.0000, 1, 0, N'vi  ', 1, 0, 0, N'kantara', NULL, CAST(0x0000A3FC00000000 AS DateTime), CAST(0x0000A3FE00000000 AS DateTime), 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (60, N'falda', N'KT_BT_001', N'39,40,61', N'Dòng sản phẩm chăm sóc kinh điển là 1 trong 2 sản phẩm đầu tiên trên thế giới sử dụng dưỡng chất tơ tằm trong sản phẩm dầu gội, tạo nên một bước đột phá về độ dai, suôn, và bóng mượt cho mái tóc', N'Xịt dưỡng cung cấp 
protein với công nghệ kim cương làm cho mái tóc sắc nét và màu tóc sáng 
bóng. Tái tạo lại những hạt Protein làm cho tóc trở nên chắc khỏe và 
sáng bóng. Phục hồi lại cấu trúc tự nhiên của tóc, tăng cường dưỡng chất
giúp tóc chống lại tia cực tím.', N'/images/photoproduct/2016/4/sc_small_2089_ghd_limited_edition_v_coral_styler_1409646740.jpg', N'/images/photoproduct/2016/4/sc_full_2089_ghd_limited_edition_v_coral_styler_1409646740.jpg', CAST(0x0000A5E901735E5F AS DateTime), 1, N'', N'', N'Olay', 0.0000, 10000.0000, 0, 0, N'vi', 1, 1, 0, N'falda', NULL, CAST(0x0000A3FC00000000 AS DateTime), CAST(0x0000A3FE00000000 AS DateTime), 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (61, N'molly', N'KT_CC_005', N'39', N'Dòng sản phẩm chăm sóc kinh điển là 1 trong 2 sản phẩm đầu tiên trên thế giới sử dụng dưỡng chất tơ tằm trong sản phẩm dầu gội, tạo nên một bước đột phá về độ dai, suôn, và bóng mượt cho mái tóc', N'Xịt dưỡng cung cấp 
protein với công nghệ kim cương làm cho mái tóc sắc nét và màu tóc sáng 
bóng. Tái tạo lại những hạt Protein làm cho tóc trở nên chắc khỏe và 
sáng bóng. Phục hồi lại cấu trúc tự nhiên của tóc, tăng cường dưỡng chất
giúp tóc chống lại tia cực tím.', N'/images/photoproduct/2015/6/sc_small_2076_demo999-63.jpg', N'/images/photoproduct/2015/6/sc_full_2076_demo999-63.jpg', CAST(0x0000A4AB0105FD98 AS DateTime), 1, N'', N'', N'Lancome', 0.0000, 10000.0000, 1, 0, N'vi  ', 1, 0, 0, N'molly', NULL, CAST(0x0000A3FC00000000 AS DateTime), CAST(0x0000A3FE00000000 AS DateTime), 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (62, N'kressida', N'KT_CC_004', N'39', N'Dòng sản phẩm chăm sóc kinh điển là 1 trong 2 sản phẩm đầu tiên trên thế giới sử dụng dưỡng chất tơ tằm trong sản phẩm dầu gội, tạo nên một bước đột phá về độ dai, suôn, và bóng mượt cho mái tóc', N'Xịt dưỡng cung cấp 
protein với công nghệ kim cương làm cho mái tóc sắc nét và màu tóc sáng 
bóng. Tái tạo lại những hạt Protein làm cho tóc trở nên chắc khỏe và 
sáng bóng. Phục hồi lại cấu trúc tự nhiên của tóc, tăng cường dưỡng chất
giúp tóc chống lại tia cực tím.', N'/images/photoproduct/2016/4/sc_small_2088_ghd_gold_max_styler_1376308604.png', N'/images/photoproduct/2016/4/sc_full_2088_ghd_gold_max_styler_1376308604.png', CAST(0x0000A5E901734101 AS DateTime), 1, N'', N'', N'Olay', 0.0000, 10000.0000, 0, 0, N'vi', 1, 1, 0, N'kressida', NULL, CAST(0x0000A3FB00000000 AS DateTime), CAST(0x0000A3F600000000 AS DateTime), 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (63, N'lisiteya', N'KT_NLK_001', N'41', N'Dòng sản phẩm chăm sóc kinh điển là 1 trong 2 sản phẩm đầu tiên trên thế giới sử dụng dưỡng chất tơ tằm trong sản phẩm dầu gội, tạo nên một bước đột phá về độ dai, suôn, và bóng mượt cho mái tóc', N'Xịt dưỡng cung cấp 
protein với công nghệ kim cương làm cho mái tóc sắc nét và màu tóc sáng 
bóng. Tái tạo lại những hạt Protein làm cho tóc trở nên chắc khỏe và 
sáng bóng. Phục hồi lại cấu trúc tự nhiên của tóc, tăng cường dưỡng chất
giúp tóc chống lại tia cực tím.', N'/images/photoproduct/2015/6/sc_small_2076_demo999-63.jpg', N'/images/photoproduct/2015/6/sc_full_2076_demo999-63.jpg', CAST(0x0000A4AD00C07561 AS DateTime), 1, N'', N'', N'Lancome', 0.0000, 10000.0000, 1, 0, N'vi  ', 1, 0, 0, N'lisiteya', NULL, NULL, NULL, NULL)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (64, N'scarlet', N'KT_NLK_002', N'41', N'Dòng sản phẩm chăm sóc kinh điển là 1 trong 2 sản phẩm đầu tiên trên thế giới sử dụng dưỡng chất tơ tằm trong sản phẩm dầu gội, tạo nên một bước đột phá về độ dai, suôn, và bóng mượt cho mái tóc', N'Xịt dưỡng cung cấp 
protein với công nghệ kim cương làm cho mái tóc sắc nét và màu tóc sáng 
bóng. Tái tạo lại những hạt Protein làm cho tóc trở nên chắc khỏe và 
sáng bóng. Phục hồi lại cấu trúc tự nhiên của tóc, tăng cường dưỡng chất
giúp tóc chống lại tia cực tím.', N'/images/photoproduct/2015/6/sc_small_2089_MG_0972-682x1024.jpg', N'/images/photoproduct/2015/6/sc_full_2089_MG_0972-682x1024.jpg', CAST(0x0000A4AD00BF0C69 AS DateTime), 1, N'', N'', N'Lancome', 0.0000, 10000.0000, 1, 0, N'vi  ', 1, 0, 0, N'scarlet', NULL, NULL, NULL, NULL)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (65, N'raspberry', N'KT_NLK_003', N'41', N'Dòng sản phẩm chăm sóc kinh điển là 1 trong 2 sản phẩm đầu tiên trên thế giới sử dụng dưỡng chất tơ tằm trong sản phẩm dầu gội, tạo nên một bước đột phá về độ dai, suôn, và bóng mượt cho mái tóc', N'Xịt dưỡng cung cấp 
protein với công nghệ kim cương làm cho mái tóc sắc nét và màu tóc sáng 
bóng. Tái tạo lại những hạt Protein làm cho tóc trở nên chắc khỏe và 
sáng bóng. Phục hồi lại cấu trúc tự nhiên của tóc, tăng cường dưỡng chất
giúp tóc chống lại tia cực tím.', N'/images/photoproduct/2016/4/sc_small_2088_ghd_air_professional_hairdryer_1363773072.png.jpg', N'/images/photoproduct/2016/4/sc_full_2088_ghd_air_professional_hairdryer_1363773072.png.jpg', CAST(0x0000A5E901732342 AS DateTime), 1, N'', N'', N'Revion', 0.0000, 10000.0000, 0, 0, N'vi', 1, 1, 0, N'raspberry', NULL, NULL, NULL, 2)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (66, N'lava', N'KT_NLK_004', N'41', N'Dòng sản phẩm chăm sóc kinh điển là 1 trong 2 sản phẩm đầu tiên trên thế giới sử dụng dưỡng chất tơ tằm trong sản phẩm dầu gội, tạo nên một bước đột phá về độ dai, suôn, và bóng mượt cho mái tóc', N'Xịt dưỡng cung cấp 
protein với công nghệ kim cương làm cho mái tóc sắc nét và màu tóc sáng 
bóng. Tái tạo lại những hạt Protein làm cho tóc trở nên chắc khỏe và 
sáng bóng. Phục hồi lại cấu trúc tự nhiên của tóc, tăng cường dưỡng chất
giúp tóc chống lại tia cực tím.', N'/images/photoproduct/2015/6/sc_small_2072_demo999-11.jpg', N'/images/photoproduct/2015/6/sc_full_2072_demo999-11.jpg', CAST(0x0000A4AD00BF4C17 AS DateTime), 1, N'', N'', N'Shiseido', 0.0000, 10000.0000, 1, 0, N'vi  ', 1, 0, 0, N'lava', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (67, N'sandra', N'KT_NLK_005', N'41', N'Dòng sản phẩm chăm sóc kinh điển là 1 trong 2 sản phẩm đầu tiên trên thế giới sử dụng dưỡng chất tơ tằm trong sản phẩm dầu gội, tạo nên một bước đột phá về độ dai, suôn, và bóng mượt cho mái tóc', N'Xịt dưỡng cung cấp 
protein với công nghệ kim cương làm cho mái tóc sắc nét và màu tóc sáng 
bóng. Tái tạo lại những hạt Protein làm cho tóc trở nên chắc khỏe và 
sáng bóng. Phục hồi lại cấu trúc tự nhiên của tóc, tăng cường dưỡng chất
giúp tóc chống lại tia cực tím.', N'/images/photoproduct/2015/6/sc_small_2076_demo999-63.jpg', N'/images/photoproduct/2015/6/sc_full_2076_demo999-63.jpg', CAST(0x0000A4AD00C11372 AS DateTime), 1, N'', N'', N'Shiseido', 0.0000, 10000.0000, 1, 2, N'vi  ', 1, 0, 0, N'sandra', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (68, N'marka', N'KT_QH_001', N'42', N'Dòng sản phẩm chăm sóc kinh điển là 1 trong 2 sản phẩm đầu tiên trên thế giới sử dụng dưỡng chất tơ tằm trong sản phẩm dầu gội, tạo nên một bước đột phá về độ dai, suôn, và bóng mượt cho mái tóc', N'Xịt dưỡng cung cấp 
protein với công nghệ kim cương làm cho mái tóc sắc nét và màu tóc sáng 
bóng. Tái tạo lại những hạt Protein làm cho tóc trở nên chắc khỏe và 
sáng bóng. Phục hồi lại cấu trúc tự nhiên của tóc, tăng cường dưỡng chất
giúp tóc chống lại tia cực tím.', N'/images/photoproduct/2015/6/sc_small_2078_25.jpg', N'/images/photoproduct/2015/6/sc_full_2078_25.jpg', CAST(0x0000A4AB012297ED AS DateTime), 1, N'', N'', N'Shiseido', 0.0000, 10000.0000, 1, 0, N'vi  ', 1, 0, 0, N'marka', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (69, N'maidlin', N'KT_QH_002', N'42', N'Dòng sản phẩm chăm sóc kinh điển là 1 trong 2 sản phẩm đầu tiên trên thế giới sử dụng dưỡng chất tơ tằm trong sản phẩm dầu gội, tạo nên một bước đột phá về độ dai, suôn, và bóng mượt cho mái tóc', N'Xịt dưỡng cung cấp 
protein với công nghệ kim cương làm cho mái tóc sắc nét và màu tóc sáng 
bóng. Tái tạo lại những hạt Protein làm cho tóc trở nên chắc khỏe và 
sáng bóng. Phục hồi lại cấu trúc tự nhiên của tóc, tăng cường dưỡng chất
giúp tóc chống lại tia cực tím.', N'/images/photoproduct/2016/4/sc_small_2087_coloured_hair_125ml_for_the_price_of_100ml_1363775459.png.jpg', N'/images/photoproduct/2016/4/sc_full_2087_coloured_hair_125ml_for_the_price_of_100ml_1363775459.png.jpg', CAST(0x0000A5EE00FC2F33 AS DateTime), 1, N'', N'', N'Kerastase', 0.0000, 10000.0000, 0, 0, N'vi', 1, 1, 0, N'maidlin', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (70, N'marigold', N'KT_QH_003', N'42', N'Dòng sản phẩm chăm sóc kinh điển là 1 trong 2 sản phẩm đầu tiên trên thế giới sử dụng dưỡng chất tơ tằm trong sản phẩm dầu gội, tạo nên một bước đột phá về độ dai, suôn, và bóng mượt cho mái tóc', N'Xịt dưỡng cung cấp 
protein với công nghệ kim cương làm cho mái tóc sắc nét và màu tóc sáng 
bóng. Tái tạo lại những hạt Protein làm cho tóc trở nên chắc khỏe và 
sáng bóng. Phục hồi lại cấu trúc tự nhiên của tóc, tăng cường dưỡng chất
giúp tóc chống lại tia cực tím.', N'/images/photoproduct/2015/6/sc_small_2052_MG_1416-682x1024.jpg', N'/images/photoproduct/2015/6/sc_full_2052_MG_1416-682x1024.jpg', CAST(0x0000A4AB012BB777 AS DateTime), 1, N'', N'', N'Shiseido', 0.0000, 10000.0000, 1, 0, N'vi  ', 1, 0, 0, N'marigold', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (71, N'feba', N'NT_CC_001', N'43', N'Dòng sản phẩm chăm sóc kinh điển là 1 trong 2 sản phẩm đầu tiên trên thế giới sử dụng dưỡng chất tơ tằm trong sản phẩm dầu gội, tạo nên một bước đột phá về độ dai, suôn, và bóng mượt cho mái tóc', N'Xịt dưỡng cung cấp 
protein với công nghệ kim cương làm cho mái tóc sắc nét và màu tóc sáng 
bóng. Tái tạo lại những hạt Protein làm cho tóc trở nên chắc khỏe và 
sáng bóng. Phục hồi lại cấu trúc tự nhiên của tóc, tăng cường dưỡng chất
giúp tóc chống lại tia cực tím.', N'/images/photoproduct/2016/4/sc_small_2087_calm_bain_vital.jpg', N'/images/photoproduct/2016/4/sc_full_2087_calm_bain_vital.jpg', CAST(0x0000A5E90172E8F2 AS DateTime), 1, N'', N'', N'Revion', 0.0000, 10000.0000, 0, 0, N'vi', 1, 1, 0, N'feba', NULL, NULL, NULL, 3)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (72, N'palmira', N'NT_BT_001', N'43', N'Dòng sản phẩm chăm sóc kinh điển là 1 trong 2 sản phẩm đầu tiên trên thế giới sử dụng dưỡng chất tơ tằm trong sản phẩm dầu gội, tạo nên một bước đột phá về độ dai, suôn, và bóng mượt cho mái tóc', N'Xịt dưỡng cung cấp 
protein với công nghệ kim cương làm cho mái tóc sắc nét và màu tóc sáng 
bóng. Tái tạo lại những hạt Protein làm cho tóc trở nên chắc khỏe và 
sáng bóng. Phục hồi lại cấu trúc tự nhiên của tóc, tăng cường dưỡng chất
giúp tóc chống lại tia cực tím.', N'/images/photoproduct/2015/6/sc_small_2075_4.jpg', N'/images/photoproduct/2015/6/sc_full_2075_4.jpg', CAST(0x0000A4AB0121E529 AS DateTime), 1, N'', N'', N'Shiseido', 0.0000, 10000.0000, 1, 0, N'vi  ', 1, 0, 0, N'palmira', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (73, N'enigma', N'NT_NLK_001', N'45', N'Dòng sản phẩm chăm sóc kinh điển là 1 trong 2 sản phẩm đầu tiên trên thế giới sử dụng dưỡng chất tơ tằm trong sản phẩm dầu gội, tạo nên một bước đột phá về độ dai, suôn, và bóng mượt cho mái tóc', N'Xịt dưỡng cung cấp 
protein với công nghệ kim cương làm cho mái tóc sắc nét và màu tóc sáng 
bóng. Tái tạo lại những hạt Protein làm cho tóc trở nên chắc khỏe và 
sáng bóng. Phục hồi lại cấu trúc tự nhiên của tóc, tăng cường dưỡng chất
giúp tóc chống lại tia cực tím.', N'/images/photoproduct/2016/4/sc_small_2078_116630221-1144x762.jpg', N'/images/photoproduct/2016/4/sc_full_2078_116630221-1144x762.jpg', CAST(0x0000A5EB016FF157 AS DateTime), 1, N'', N'', N'Kerastase', 0.0000, 10000.0000, 0, 0, N'vi', 1, 0, 0, N'enigma', NULL, NULL, NULL, 4)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (74, N'aime', N'NT_VP_001', N'43,45', N'Dòng sản phẩm chăm sóc kinh điển là 1 trong 2 sản phẩm đầu tiên trên thế giới sử dụng dưỡng chất tơ tằm trong sản phẩm dầu gội, tạo nên một bước đột phá về độ dai, suôn, và bóng mượt cho mái tóc', N'Xịt dưỡng cung cấp 
protein với công nghệ kim cương làm cho mái tóc sắc nét và màu tóc sáng 
bóng. Tái tạo lại những hạt Protein làm cho tóc trở nên chắc khỏe và 
sáng bóng. Phục hồi lại cấu trúc tự nhiên của tóc, tăng cường dưỡng chất
giúp tóc chống lại tia cực tím.', N'/images/photoproduct/2016/4/sc_small_2077_75025579-720x720.jpg', N'/images/photoproduct/2016/4/sc_full_2077_75025579-720x720.jpg', CAST(0x0000A5EB016FA866 AS DateTime), 1, N'', N'', N'Kerastase', 0.0000, 10000.0000, 0, 0, N'vi', 1, 0, 0, N'aime', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (75, N'amedi', N'NT_CTDV_001', N'39,40,41,43', N'Dòng sản phẩm chăm sóc kinh điển là 1 trong 2 sản phẩm đầu tiên trên thế giới sử dụng dưỡng chất tơ tằm trong sản phẩm dầu gội, tạo nên một bước đột phá về độ dai, suôn, và bóng mượt cho mái tóc', N'Xịt dưỡng cung cấp 
protein với công nghệ kim cương làm cho mái tóc sắc nét và màu tóc sáng 
bóng. Tái tạo lại những hạt Protein làm cho tóc trở nên chắc khỏe và 
sáng bóng. Phục hồi lại cấu trúc tự nhiên của tóc, tăng cường dưỡng chất
giúp tóc chống lại tia cực tím.', N'/images/photoproduct/2015/6/sc_small_2072_demo999-11.jpg', N'/images/photoproduct/2015/6/sc_full_2072_demo999-11.jpg', CAST(0x0000A57800F426F3 AS DateTime), 1, NULL, NULL, N'Shiseido', 0.0000, 10000.0000, 0, 0, N'vi', 1, 0, 0, N'amedi', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (76, N'brianna', N'NT_CC_002', N'39', N'Dòng sản phẩm chăm sóc kinh điển là 1 trong 2 sản phẩm đầu tiên trên thế giới sử dụng dưỡng chất tơ tằm trong sản phẩm dầu gội, tạo nên một bước đột phá về độ dai, suôn, và bóng mượt cho mái tóc', N'Xịt dưỡng cung cấp 
protein với công nghệ kim cương làm cho mái tóc sắc nét và màu tóc sáng 
bóng. Tái tạo lại những hạt Protein làm cho tóc trở nên chắc khỏe và 
sáng bóng. Phục hồi lại cấu trúc tự nhiên của tóc, tăng cường dưỡng chất
giúp tóc chống lại tia cực tím.', N'/images/photoproduct/2015/6/sc_small_2073_demo999-71.jpg', N'/images/photoproduct/2015/6/sc_full_2073_demo999-71.jpg', CAST(0x0000A57800DF0AAC AS DateTime), 1, NULL, NULL, N'Shiseido', 0.0000, 10000.0000, 0, 1, N'vi', 1, 0, 0, N'brianna', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (77, N'katara', N'NT_CC_003', N'43', N'Dòng sản phẩm chăm sóc kinh điển là 1 trong 2 sản phẩm đầu tiên trên thế giới sử dụng dưỡng chất tơ tằm trong sản phẩm dầu gội, tạo nên một bước đột phá về độ dai, suôn, và bóng mượt cho mái tóc', N'Xịt dưỡng cung cấp 
protein với công nghệ kim cương làm cho mái tóc sắc nét và màu tóc sáng 
bóng. Tái tạo lại những hạt Protein làm cho tóc trở nên chắc khỏe và 
sáng bóng. Phục hồi lại cấu trúc tự nhiên của tóc, tăng cường dưỡng chất
giúp tóc chống lại tia cực tím.', N'/images/photoproduct/2016/4/sc_small_2091_ghd_limited_edition_v_coral_styler_22909_1409646742.jpg', N'/images/photoproduct/2016/4/sc_full_2091_ghd_limited_edition_v_coral_styler_22909_1409646742.jpg', CAST(0x0000A5E901740C67 AS DateTime), 1, N'', N'', N'Revion', 0.0000, 10000.0000, 0, 1, N'vi', 1, 1, 0, N'katara', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (78, N'emais', N'poPfyZ', N'45', N'Dòng sản phẩm chăm sóc kinh điển là 1 trong 2 sản phẩm đầu tiên trên thế giới sử dụng dưỡng chất tơ tằm trong sản phẩm dầu gội, tạo nên một bước đột phá về độ dai, suôn, và bóng mượt cho mái tóc', N'Xịt dưỡng cung cấp 
protein với công nghệ kim cương làm cho mái tóc sắc nét và màu tóc sáng 
bóng. Tái tạo lại những hạt Protein làm cho tóc trở nên chắc khỏe và 
sáng bóng. Phục hồi lại cấu trúc tự nhiên của tóc, tăng cường dưỡng chất
giúp tóc chống lại tia cực tím.', N'/images/photoproduct/2016/4/sc_small_2079_104945627.jpg', N'/images/photoproduct/2016/4/sc_full_2079_104945627.jpg', CAST(0x0000A5EB01703807 AS DateTime), 0, N'', N'', N'Loreal', 0.0000, 0.0000, 0, 4, N'vi', 1, 0, 0, N'emais', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (79, N'keratin', N'eP2Vv0', N'45', N'Dòng sản phẩm chăm sóc kinh điển là 1 trong 2 sản phẩm đầu tiên trên thế giới sử dụng dưỡng chất tơ tằm trong sản phẩm dầu gội, tạo nên một bước đột phá về độ dai, suôn, và bóng mượt cho mái tóc', N'Xịt dưỡng cung cấp 
protein với công nghệ kim cương làm cho mái tóc sắc nét và màu tóc sáng 
bóng. Tái tạo lại những hạt Protein làm cho tóc trở nên chắc khỏe và 
sáng bóng. Phục hồi lại cấu trúc tự nhiên của tóc, tăng cường dưỡng chất
giúp tóc chống lại tia cực tím.', N'/images/photoproduct/2016/4/sc_small_2080_130215242.jpg', N'/images/photoproduct/2016/4/sc_full_2080_130215242.jpg', CAST(0x0000A5EB01707D52 AS DateTime), 0, N'', N'', N'Revion', 0.0000, 0.0000, 0, 5, N'vi', 1, 0, 0, N'keratin', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (80, N'jima', N'Y7qxVF', N'45', N'Dòng sản phẩm chăm sóc kinh điển là 1 trong 2 sản phẩm đầu tiên trên thế giới sử dụng dưỡng chất tơ tằm trong sản phẩm dầu gội, tạo nên một bước đột phá về độ dai, suôn, và bóng mượt cho mái tóc', N'Xịt dưỡng cung cấp 
protein với công nghệ kim cương làm cho mái tóc sắc nét và màu tóc sáng 
bóng. Tái tạo lại những hạt Protein làm cho tóc trở nên chắc khỏe và 
sáng bóng. Phục hồi lại cấu trúc tự nhiên của tóc, tăng cường dưỡng chất
giúp tóc chống lại tia cực tím.', N'/images/photoproduct/2016/4/sc_small_2090_171088547.jpg', N'/images/photoproduct/2016/4/sc_full_2090_171088547.jpg', CAST(0x0000A5EB017317DD AS DateTime), 0, N'', N'', N'Lancome', 0.0000, 0.0000, 0, 6, N'vi', 1, 0, 0, N'jima', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (81, N'hair black', N'Nuh3D0', N'45', N'Dòng sản phẩm chăm sóc kinh điển là 1 trong 2 sản phẩm đầu tiên trên thế giới sử dụng dưỡng chất tơ tằm trong sản phẩm dầu gội, tạo nên một bước đột phá về độ dai, suôn, và bóng mượt cho mái tóc', N'Xịt dưỡng cung cấp 
protein với công nghệ kim cương làm cho mái tóc sắc nét và màu tóc sáng 
bóng. Tái tạo lại những hạt Protein làm cho tóc trở nên chắc khỏe và 
sáng bóng. Phục hồi lại cấu trúc tự nhiên của tóc, tăng cường dưỡng chất
giúp tóc chống lại tia cực tím.', N'/images/photoproduct/2016/4/sc_small_2092_gallery12.jpg', N'/images/photoproduct/2016/4/sc_full_2092_gallery12.jpg', CAST(0x0000A5EB0173C065 AS DateTime), 0, N'', N'', N'Kerastase', 0.0000, 0.0000, 0, 7, N'vi', 1, 0, 0, N'hair-black', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (82, N'brow', N'26n4Uf', N'45', N'Dòng sản phẩm chăm sóc kinh điển là 1 trong 2 sản phẩm đầu tiên trên thế giới sử dụng dưỡng chất tơ tằm trong sản phẩm dầu gội, tạo nên một bước đột phá về độ dai, suôn, và bóng mượt cho mái tóc', N'Xịt dưỡng cung cấp 
protein với công nghệ kim cương làm cho mái tóc sắc nét và màu tóc sáng 
bóng. Tái tạo lại những hạt Protein làm cho tóc trở nên chắc khỏe và 
sáng bóng. Phục hồi lại cấu trúc tự nhiên của tóc, tăng cường dưỡng chất
giúp tóc chống lại tia cực tím.', N'/images/photoproduct/2016/4/sc_small_2094_173445464-480x480.jpg', N'/images/photoproduct/2016/4/sc_full_2094_173445464-480x480.jpg', CAST(0x0000A5EB0174546B AS DateTime), 0, N'', N'', N'Kerastase', 0.0000, 0.0000, 0, 8, N'vi', 1, 0, 0, N'brow', NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[_Product] OFF
/****** Object:  Table [dbo].[_PostTag]    Script Date: 05/06/2016 16:06:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[_PostTag](
	[PostTagID] [int] IDENTITY(1,1) NOT NULL,
	[PostID] [int] NOT NULL,
	[Tag] [nvarchar](50) NULL,
	[Link] [varchar](50) NULL,
 CONSTRAINT [PK_PostTag] PRIMARY KEY CLUSTERED 
(
	[PostTagID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[_Post]    Script Date: 05/06/2016 16:06:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_Post](
	[PostID] [int] IDENTITY(1,1) NOT NULL,
	[CatelogID] [int] NULL,
	[PostName] [nvarchar](200) NULL,
	[ImagePath] [nvarchar](200) NULL,
	[Link] [nvarchar](200) NULL,
	[Summary] [nvarchar](500) NULL,
	[PostContent] [nvarchar](max) NULL,
	[DateModified] [datetime] NULL,
	[IsHot] [bit] NULL,
	[Lang] [nvarchar](10) NULL,
	[Keyword] [nvarchar](500) NULL,
	[Description] [nvarchar](500) NULL,
	[Title] [nvarchar](500) NULL,
	[OrderDisplay] [int] NULL,
	[Approve] [bit] NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED 
(
	[PostID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[_Post] ON
INSERT [dbo].[_Post] ([PostID], [CatelogID], [PostName], [ImagePath], [Link], [Summary], [PostContent], [DateModified], [IsHot], [Lang], [Keyword], [Description], [Title], [OrderDisplay], [Approve], [CreateDate]) VALUES (4, 65, N'Nhập khẩu ôtô 2014 có thể gấp đôi năm ngoái', N'/images/newspost/2016/4/sc_small_2053_113001007.jpg', N'Nhap-khau-oto-2014-co-the-gap-doi-nam-ngoai', N'Ước tính tổng số tiền mà doanh nghiệp và người dân Việt Nam chi ra để nhập khẩu ôtô nguyên chiếc trong 10 tháng năm 2014 đã vượt qua con số 1,1 tỷ USD.', N'<p>Cụ thể, theo b&aacute;o c&aacute;o mới nhất của Tổng cục Thống k&ecirc; (Bộ Kế hoạch v&agrave; Đầu tư), tổng kim ngạch nhập khẩu &ocirc;t&ocirc; cộng dồn từ đầu năm đến th&aacute;ng 10 ước đạt 51.000 chiếc v&agrave; 1,118 tỷ USD, tăng 76,1% về lượng v&agrave; tăng 93% về gi&aacute; trị so với c&ugrave;ng kỳ năm ngo&aacute;i.<br />
<br />
B&aacute;o c&aacute;o cũng cho biết, ri&ecirc;ng mức kim ngạch của ri&ecirc;ng th&aacute;ng 10/2014 ước đạt 7.000 chiếc v&agrave; 150 triệu USD, ngang bằng về lượng v&agrave; chỉ hụt nhẹ về gi&aacute; trị so với th&aacute;ng liền trước. Lưu &yacute; rằng đ&acirc;y cũng chỉ l&agrave; con số ước t&iacute;nh n&ecirc;n ho&agrave;n to&agrave;n c&oacute; thể thay đổi.&nbsp;<br />
<br />
Trước đ&oacute;, Tổng cục Thống k&ecirc; đ&atilde; đưa ra con số ước t&iacute;nh mức kim ngạch th&aacute;ng 9 l&agrave; 7.000 chiếc v&agrave; 132 triệu USD, thấp hơn gi&aacute; trị kim ngạch thực được cập nhật tại b&aacute;o c&aacute;o mới nhất đến 28 triệu USD.<br />
<br />
C&oacute; thể nhận thấy kh&aacute; r&otilde; xu hướng tăng ổn định của &ocirc;t&ocirc; nhập khẩu nguy&ecirc;n chiếc trong v&ograve;ng một năm trở lại đ&acirc;y. V&agrave; với kim ngạch duy tr&igrave; ở mức cao c&ugrave;ng khả năng c&oacute; thể tăng tiếp v&agrave;o hai th&aacute;ng cuối năm, việc tổng kim ngạch nhập khẩu &ocirc;t&ocirc; năm 2014 cao gấp đ&ocirc;i năm 2013 l&agrave; kh&ocirc;ng n&ecirc;n loại trừ, đặc biệt l&agrave; x&eacute;t ri&ecirc;ng về gi&aacute; trị.<br />
<br />
Tr&ecirc;n thực tế, ngay tại thời điểm th&aacute;ng 10, kim ngạch nhập khẩu &ocirc;t&ocirc; năm 2014 cũng đ&atilde; vượt rất xa&nbsp;tổng kim ngạch của cả năm 2013, cụ thể l&agrave; 51.000 chiếc so với 34.500 chiếc v&agrave; 1,118 tỷ USD so với 709 triệu USD.<br />
<br />
2014 được nhận định l&agrave; năm s&ocirc;i động nhất trong v&ograve;ng nửa thập ni&ecirc;n trở lại đ&acirc;y của thị trường &ocirc;t&ocirc; Việt Nam. Do vậy, đ&agrave; tăng trưởng mạnh v&agrave; li&ecirc;n tục duy tr&igrave; ở nhịp độ cao của xe nhập khẩu nguy&ecirc;n chiếc l&agrave; ho&agrave;n to&agrave;n dễ hiểu. Một điểm kh&aacute;c biệt l&agrave; tỷ lệ tăng trưởng của xe nhập khẩu kể từ đầu năm đến nay đ&atilde; lu&ocirc;n duy tr&igrave; ở mức cao hơn hẳn so với xe lắp r&aacute;p trong nước.<br />
<br />
Sự lớn mạnh của xe nhập khẩu cũng thể hiện kh&aacute; r&otilde; tại Vietnam Motor Show 2014 dự kiến diễn ra từ ng&agrave;y 19-23/11 tại Tp.HCM. Năm thứ 3 g&oacute;p mặt tại kỳ triển l&atilde;m &ocirc;t&ocirc; lớn nhất trong năm, c&aacute;c thương hiệu &ocirc;t&ocirc; nhập khẩu đ&atilde; tăng l&ecirc;n con số 9 v&agrave; ch&iacute;nh thức c&acirc;n bằng so với c&aacute;c thương hiệu &ocirc;t&ocirc; lắp r&aacute;p trong nước thuộc Hiệp hội C&aacute;c nh&agrave; sản xuất &ocirc;t&ocirc; Việt Nam (VAMA).</p>

<table border="0" cellpadding="5" style="width:100%">
	<tbody>
		<tr>
			<td colspan="3"><strong>Kim ngạch nhập khẩu &ocirc;t&ocirc; nguy&ecirc;n chiếc 4 th&aacute;ng gần đ&acirc;y</strong></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td><strong>Lượng (chiếc)</strong></td>
			<td><strong>Gi&aacute; trị (USD)</strong></td>
		</tr>
		<tr>
			<td>Th&aacute;ng 7/2014</td>
			<td>6.000</td>
			<td>138.000.000</td>
		</tr>
		<tr>
			<td>Th&aacute;ng 8/2014</td>
			<td>6.000</td>
			<td>136.000.000</td>
		</tr>
		<tr>
			<td>Th&aacute;ng 9/2014</td>
			<td>7.000</td>
			<td>160.000.000</td>
		</tr>
		<tr>
			<td>Th&aacute;ng 10/2014&nbsp;<em>(ước t&iacute;nh)</em></td>
			<td>7.000</td>
			<td>150.000.000</td>
		</tr>
		<tr>
			<td>10 th&aacute;ng 2014 <em>(ước t&iacute;nh)</em></td>
			<td>51.000</td>
			<td>1.118.000.000</td>
		</tr>
	</tbody>
</table>

<p>Nguồn:Tổng cục Thống k&ecirc; - vneconomy.vn</p>
', CAST(0x0000A5EC00F75311 AS DateTime), 1, N'vi', N'thienand&t, logistic', N'Ước tính tổng số tiền mà doanh nghiệp và người dân Việt Nam chi ra để nhập khẩu ôtô nguyên chiếc trong 10 tháng năm 2014 đã vượt qua con số 1,1 tỷ USD.', N'Nhập khẩu ôtô 2014 có thể gấp đôi năm ngoái', 3, 1, NULL)
INSERT [dbo].[_Post] ([PostID], [CatelogID], [PostName], [ImagePath], [Link], [Summary], [PostContent], [DateModified], [IsHot], [Lang], [Keyword], [Description], [Title], [OrderDisplay], [Approve], [CreateDate]) VALUES (10, 65, N'Công bố hạ trần lãi huy động, định hướng giảm lãi cho vay', N'/images/newspost/2016/4/sc_small_2054_118092316.jpg', N'Cong-bo-ha-tran-lai-huy-dong-dinh-huong-giam-lai-cho-vay', N'Tại buổi họp báo định kỳ chiều nay (28/10), Ngân hàng Nhà nước công bố quyết định hạ trần lãi suất huy động và định hướng giảm lãi suất cho vay.', N'<p>Theo đ&oacute;, trần l&atilde;i suất huy động VND c&aacute;c kỳ hạn từ 1 th&aacute;ng đến dưới 6 th&aacute;ng giảm từ 6%/năm xuống c&ograve;n 5,5%/năm. C&ugrave;ng đ&oacute;, trần l&atilde;i suất huy động USD đối với tiền gửi c&aacute; nh&acirc;n cũng giảm từ 1%/năm xuống c&ograve;n 0,75%/năm.<br />
<br />
Việc điều chỉnh trần l&atilde;i suất của cả hai loại tiền gửi tr&ecirc;n l&agrave; một c&acirc;n đối của Ng&acirc;n h&agrave;ng Nh&agrave; nước để hạn chế t&aacute;c động đối với tỷ gi&aacute; USD/VND, theo hướng giữ ổn định gi&aacute; trị VND trong tương quan l&atilde;i suất với USD.<br />
<br />
Cơ quan điều h&agrave;nh ch&iacute;nh s&aacute;ch tiền tệ cũng thận trọng khi kh&ocirc;ng điều chỉnh c&aacute;c l&atilde;i suất điều h&agrave;nh kh&aacute;c như l&atilde;i suất t&aacute;i cấp vốn, t&aacute;i suất t&aacute;i chiết khấu, l&atilde;i suất cho vay qua đ&ecirc;m trong thanh to&aacute;n điện tử li&ecirc;n ng&acirc;n h&agrave;ng.<br />
<br />
Ngo&agrave;i ra, tại cuộc họp b&aacute;o, Ng&acirc;n h&agrave;ng Nh&agrave; nước cũng đưa ra y&ecirc;u cầu c&aacute;c ng&acirc;n h&agrave;ng thương mại xem x&eacute;t r&uacute;t l&atilde;i suất cho vay VND xuống tối đa 13%/năm đối với c&aacute;c khoản nợ cũ, như một biện ph&aacute;p để chia sẻ kh&oacute; khăn với doanh nghiệp.<br />
<br />
B&aacute;o c&aacute;o của Ng&acirc;n h&agrave;ng Nh&agrave; nước cho thấy, đến ng&agrave;y 24/10/2014, tổng phương tiện thanh to&aacute;n tăng 11,85%, huy động vốn tăng 11,88% so với cuối năm 2013. Trong khi đ&oacute;, t&iacute;n dụng to&agrave;n hệ thống tăng 7,85% so với cuối năm 2013.&nbsp;<br />
<br />
Cũng theo Ng&acirc;n h&agrave;ng Nh&agrave; nước, đến ng&agrave;y 9/10/2014, dư nợ cho vay bằng VND c&oacute; l&atilde;i suất tr&ecirc;n 15%/năm chiếm 4,12% tổng dư nợ cho vay VND; dư nợ c&oacute; l&atilde;i suất tr&ecirc;n 13%/năm chiếm 11,7% tổng dư nợ cho vay bằng VND.<br />
<br />
&quot;Sau khi điều chỉnh giảm đồng bộ c&aacute;c mức l&atilde;i suất v&agrave;o th&aacute;ng 3/2014, mặt bằng l&atilde;i suất huy động v&agrave; cho vay bằng VND đến nay đ&atilde; giảm 1,0-1,5%/năm so với cuối năm 2013, g&oacute;p phần th&aacute;o gỡ kh&oacute; khăn cho sản xuất kinh doanh nhưng vẫn đảm bảo mục ti&ecirc;u kiểm so&aacute;t lạm ph&aacute;t v&agrave; ổn định thị trường tiền tệ&quot;, Ng&acirc;n h&agrave;ng Nh&agrave; nước cho biết.</p>
', CAST(0x0000A5EC00F78909 AS DateTime), 1, N'vi', N'logistic, transport', N'Tại buổi họp báo định kỳ chiều nay (28/10), Ngân hàng Nhà nước công bố quyết định hạ trần lãi suất huy động và định hướng giảm lãi suất cho vay.', N'Công bố hạ trần lãi huy động, định hướng giảm lãi cho vay', 10, 1, NULL)
INSERT [dbo].[_Post] ([PostID], [CatelogID], [PostName], [ImagePath], [Link], [Summary], [PostContent], [DateModified], [IsHot], [Lang], [Keyword], [Description], [Title], [OrderDisplay], [Approve], [CreateDate]) VALUES (21, 66, N'Gần 300 tỷ đồng xây Trung tâm công nghiệp và Logistics Hải Phòng', N'/images/catalog/2016/1/sc_small_2094_sc_full_2036_tumblr_nmrx58px3o1qbd81ro1_1280.jpg', N'Gàn-300-ty-dong-xay-Trung-tam-cong-nghiep-va-Logistics-Hai-Phong', N'(DĐDN) -  Cty CP Dịch vụ biển Tân Cảng vừa nhận giấy chứng nhận đầu tư thực hiện Dự án Trung tâm công nghiệp và Logistics Tân Cảng Hải Phòng “tại Khu công nghiệp MP Đình Vũ” (thuộc khu kinh Đình Vũ -  Cát Hải).  ', N'<p>Dự &aacute;n c&oacute;&nbsp;vốn đầu tư&nbsp;299 tỷ đồng, dự kiến sẽ ph&aacute;t triển th&agrave;nh trung t&acirc;m&nbsp;c&ocirc;ng nghiệp&nbsp;v&agrave; Logistics c&oacute; quy m&ocirc; hiện đại, đ&aacute;p ứng nhu cầu&nbsp;h&agrave;ng ho&aacute;&nbsp;tổng hợp 1,2 triệu tấn/năm.</p>

<p>Với&nbsp;&nbsp;&nbsp;t&iacute;ch 200.000 m2, dự &aacute;n dự kiến hoạt động v&agrave;o qu&yacute; III/2015. Đ&acirc;y l&agrave; dự &aacute;n c&oacute; vốn đầu tư trong nước đầu ti&ecirc;n đầu tư v&agrave;o c&aacute;c khu c&ocirc;ng nghiệp,&nbsp;khu kinh tế&nbsp;Hải Ph&ograve;ng từ đầu năm 2014&nbsp;&nbsp;đến nay.</p>
', CAST(0x0000A58C00C417E2 AS DateTime), 1, N'en', N'keytest', N'desctest', N'Ba diva nhạc Việt khuấy động đêm festival ''Gió mùa''', 1, 1, NULL)
INSERT [dbo].[_Post] ([PostID], [CatelogID], [PostName], [ImagePath], [Link], [Summary], [PostContent], [DateModified], [IsHot], [Lang], [Keyword], [Description], [Title], [OrderDisplay], [Approve], [CreateDate]) VALUES (22, 66, N'Nhập khẩu ôtô 2014 có thể gấp đôi năm ngoái', N'/images/newspost/2014/10/281020141653DucTho-a4d20.jpg', N'Nhap-khau-oto-2014-co-the-gap-doi-nam-ngoai', N'Ước tính tổng số tiền mà doanh nghiệp và người dân Việt Nam chi ra để nhập khẩu ôtô nguyên chiếc trong 10 tháng năm 2014 đã vượt qua con số 1,1 tỷ USD.', N'<p>Cụ thể, theo b&aacute;o c&aacute;o mới nhất của Tổng cục Thống k&ecirc; (Bộ Kế hoạch v&agrave; Đầu tư), tổng kim ngạch nhập khẩu &ocirc;t&ocirc; cộng dồn từ đầu năm đến th&aacute;ng 10 ước đạt 51.000 chiếc v&agrave; 1,118 tỷ USD, tăng 76,1% về lượng v&agrave; tăng 93% về gi&aacute; trị so với c&ugrave;ng kỳ năm ngo&aacute;i.<br />
<br />
B&aacute;o c&aacute;o cũng cho biết, ri&ecirc;ng mức kim ngạch của ri&ecirc;ng th&aacute;ng 10/2014 ước đạt 7.000 chiếc v&agrave; 150 triệu USD, ngang bằng về lượng v&agrave; chỉ hụt nhẹ về gi&aacute; trị so với th&aacute;ng liền trước. Lưu &yacute; rằng đ&acirc;y cũng chỉ l&agrave; con số ước t&iacute;nh n&ecirc;n ho&agrave;n to&agrave;n c&oacute; thể thay đổi.&nbsp;<br />
<br />
Trước đ&oacute;, Tổng cục Thống k&ecirc; đ&atilde; đưa ra con số ước t&iacute;nh mức kim ngạch th&aacute;ng 9 l&agrave; 7.000 chiếc v&agrave; 132 triệu USD, thấp hơn gi&aacute; trị kim ngạch thực được cập nhật tại b&aacute;o c&aacute;o mới nhất đến 28 triệu USD.<br />
<br />
C&oacute; thể nhận thấy kh&aacute; r&otilde; xu hướng tăng ổn định của &ocirc;t&ocirc; nhập khẩu nguy&ecirc;n chiếc trong v&ograve;ng một năm trở lại đ&acirc;y. V&agrave; với kim ngạch duy tr&igrave; ở mức cao c&ugrave;ng khả năng c&oacute; thể tăng tiếp v&agrave;o hai th&aacute;ng cuối năm, việc tổng kim ngạch nhập khẩu &ocirc;t&ocirc; năm 2014 cao gấp đ&ocirc;i năm 2013 l&agrave; kh&ocirc;ng n&ecirc;n loại trừ, đặc biệt l&agrave; x&eacute;t ri&ecirc;ng về gi&aacute; trị.<br />
<br />
Tr&ecirc;n thực tế, ngay tại thời điểm th&aacute;ng 10, kim ngạch nhập khẩu &ocirc;t&ocirc; năm 2014 cũng đ&atilde; vượt rất xa&nbsp;tổng kim ngạch của cả năm 2013, cụ thể l&agrave; 51.000 chiếc so với 34.500 chiếc v&agrave; 1,118 tỷ USD so với 709 triệu USD.<br />
<br />
2014 được nhận định l&agrave; năm s&ocirc;i động nhất trong v&ograve;ng nửa thập ni&ecirc;n trở lại đ&acirc;y của thị trường &ocirc;t&ocirc; Việt Nam. Do vậy, đ&agrave; tăng trưởng mạnh v&agrave; li&ecirc;n tục duy tr&igrave; ở nhịp độ cao của xe nhập khẩu nguy&ecirc;n chiếc l&agrave; ho&agrave;n to&agrave;n dễ hiểu. Một điểm kh&aacute;c biệt l&agrave; tỷ lệ tăng trưởng của xe nhập khẩu kể từ đầu năm đến nay đ&atilde; lu&ocirc;n duy tr&igrave; ở mức cao hơn hẳn so với xe lắp r&aacute;p trong nước.<br />
<br />
Sự lớn mạnh của xe nhập khẩu cũng thể hiện kh&aacute; r&otilde; tại Vietnam Motor Show 2014 dự kiến diễn ra từ ng&agrave;y 19-23/11 tại Tp.HCM. Năm thứ 3 g&oacute;p mặt tại kỳ triển l&atilde;m &ocirc;t&ocirc; lớn nhất trong năm, c&aacute;c thương hiệu &ocirc;t&ocirc; nhập khẩu đ&atilde; tăng l&ecirc;n con số 9 v&agrave; ch&iacute;nh thức c&acirc;n bằng so với c&aacute;c thương hiệu &ocirc;t&ocirc; lắp r&aacute;p trong nước thuộc Hiệp hội C&aacute;c nh&agrave; sản xuất &ocirc;t&ocirc; Việt Nam (VAMA).</p>
<table id="table1" border="0" bordercolor="#e2ebf4" width="100%" cellpadding="5">
    <tbody>
        <tr>
            <td colspan="3" bgcolor="#f6f3f1"><strong>Kim ngạch nhập khẩu &ocirc;t&ocirc; nguy&ecirc;n chiếc 4 th&aacute;ng gần đ&acirc;y</strong></td>
        </tr>
        <tr>
            <td height="28" width="40%">&nbsp;</td>
            <td height="28" width="17%"><strong>Lượng (chiếc)</strong></td>
            <td height="28" width="20%"><strong>Gi&aacute; trị (USD)</strong></td>
        </tr>
        <tr>
            <td bgcolor="#f6f3f1" height="30" width="40%">Th&aacute;ng 7/2014</td>
            <td bgcolor="#f6f3f1" height="30" width="17%">6.000</td>
            <td bgcolor="#f6f3f1" height="30" width="20%">138.000.000</td>
        </tr>
        <tr>
            <td height="30" width="40%">Th&aacute;ng 8/2014</td>
            <td height="30" width="17%">6.000</td>
            <td height="30" width="20%">136.000.000</td>
        </tr>
        <tr>
            <td bgcolor="#f6f3f1" height="30" width="40%">Th&aacute;ng 9/2014</td>
            <td bgcolor="#f6f3f1" height="30" width="17%">7.000</td>
            <td bgcolor="#f6f3f1" height="30" width="20%">160.000.000</td>
        </tr>
        <tr>
            <td height="30" width="40%">Th&aacute;ng 10/2014&nbsp;<em>(ước t&iacute;nh)</em></td>
            <td height="30" width="17%">7.000</td>
            <td height="30" width="20%">150.000.000</td>
        </tr>
        <tr>
            <td bgcolor="#f6f3f1" height="30" width="40%">10 th&aacute;ng 2014 <em>(ước t&iacute;nh)</em></td>
            <td bgcolor="#f6f3f1" height="30" width="17%">51.000</td>
            <td bgcolor="#f6f3f1" height="30" width="20%">1.118.000.000</td>
        </tr>
    </tbody>
</table>
<p>Nguồn:Tổng cục Thống k&ecirc; - vneconomy.vn</p>', CAST(0x0000A3B900E86918 AS DateTime), 1, N'en', N'keyword', N'mô tả cho seo', N'AENEAN SOLLICITUDIN, LOREM QUIS BIBENDUM AUCTOR', 2, 1, NULL)
INSERT [dbo].[_Post] ([PostID], [CatelogID], [PostName], [ImagePath], [Link], [Summary], [PostContent], [DateModified], [IsHot], [Lang], [Keyword], [Description], [Title], [OrderDisplay], [Approve], [CreateDate]) VALUES (23, 65, N'DU LỊCH, LOGISTICS LÀ NGÀNH HÀNG XUẤT KHẨU TIỀM NĂNG', N'/images/newspost/2016/4/sc_small_2054_133623506.jpg', N'DU-LICH-LOGISTICS-LA-NGANH-HANG-XUAT-KHAU-TIEM-NANG', N'Kế hoạch phát triển xuất khẩu vùng do Bộ Công Thương vừa công bố cho thấy, logistics và du lịch là 2 ngành hàng có tiềm năng xuất khẩu tại 3 miền Bắc, Trung, Nam.', N'<p>Kế hoạch ph&aacute;t triển xuất khẩu v&ugrave;ng do b&agrave; Nguyễn Thị Thu Hằng, Tư vấn kỹ thuật cao cấp Dự &aacute;n Đ&aacute;nh gi&aacute; tiềm năng xuất khẩu Việt Nam (thuộc chương tr&igrave;nh &ldquo;n&acirc;ng cao năng lực cạnh tranh xuất khẩu cho c&aacute;c doanh nghiệp nhỏ v&agrave; vừa Việt Nam th&ocirc;ng qua hệ thống x&uacute;c tiến thương mại địa phương&rdquo;) tr&igrave;nh b&agrave;y tại hội thảo quốc gia x&acirc;y dựng kế hoạch xuất khẩu v&ugrave;ng cho thấy, 3 miền Bắc, Trung, Nam đều c&oacute; ng&agrave;nh h&agrave;ng được ưu ti&ecirc;n ph&aacute;t triển xuất khẩu.</p>

<p>Theo đ&oacute;, miền Bắc c&oacute; 7 ng&agrave;nh h&agrave;ng l&agrave; ch&egrave; xanh, quả vải, dệt may, gi&agrave;y d&eacute;p, m&acirc;y tre l&aacute;, logistics, du lịch. Miền Trung c&oacute; 9 ng&agrave;nh h&agrave;ng gồm dịch vụ, c&agrave; ph&ecirc;, hồ ti&ecirc;u, điều, mật ong, c&aacute; ngừ, xuất khẩu tại chỗ, m&acirc;y tre l&aacute;, dịch vụ logistics. Miền Nam c&oacute; 7 ng&agrave;nh h&agrave;ng l&agrave; gạo thơm, tr&aacute;i c&acirc;y tươi, c&aacute; tra, may mặc, thủ c&ocirc;ng mỹ nghệ, dịch vụ logistics v&agrave; du lịch.</p>

<p>Một điểm đ&aacute;ng ch&uacute; &yacute;, trong số c&aacute;c ng&agrave;nh h&agrave;ng được ưu ti&ecirc;n ph&aacute;t triển xuất khẩu cả 3 miền, logistics v&agrave; du lịch được cho l&agrave; 2 ng&agrave;nh h&agrave;ng xuất khẩu c&oacute; tiềm năng ở cả 3 miền.</p>

<p>B&agrave; Hằng ph&acirc;n t&iacute;ch, logistics c&oacute; tiềm năng ph&aacute;t triển lớn bởi l&agrave; nước xuất khẩu lớn nhưng logistics phụ thuộc chủ yếu v&agrave;o nước ngo&agrave;i. V&igrave; thế, ph&aacute;t triển logistics kh&ocirc;ng chỉ mang lại &yacute; nghĩa cho ri&ecirc;ng ng&agrave;nh n&agrave;y m&agrave; c&ograve;n hỗ trợ c&aacute;c ng&agrave;nh h&agrave;ng xuất khẩu kh&aacute;c.</p>

<p>Với ng&agrave;nh du lịch &ndash; ng&agrave;nh c&ocirc;ng nghiệp kh&ocirc;ng kh&oacute;i đang ph&aacute;t triển dưới tiềm năng do sản phẩm du lịch chưa đa dạng, tiếp thị c&ograve;n yếu, mối li&ecirc;n kết trong ng&agrave;nh chưa tốt&hellip; Hiện, Việt Nam đứng vị tr&iacute; 80/140 về chỉ số cạnh tranh ng&agrave;nh du lịch tr&ecirc;n thế giới, thứ 16/25 quốc gia khu vực ch&acirc;u &Aacute; - Th&aacute;i B&igrave;nh Dương.</p>

<p>Trước đ&oacute;, trong buổi c&ocirc;ng bố b&aacute;o c&aacute;o đ&aacute;nh gi&aacute; tiềm năng xuất khẩu quốc gia của Bộ C&ocirc;ng Thương, &ocirc;ng V&otilde; Tr&iacute; Th&agrave;nh, Ph&oacute; Viện trưởng Viện nghi&ecirc;n cứu Quản l&yacute; kinh tế Trung ương cũng cho rằng, tiềm năng du lịch Việt Nam kh&ocirc;ng c&ograve;n l&agrave; du lịch truyền thống m&agrave; l&agrave; du lịch thế hệ mới. &ldquo;Trước đ&acirc;y, dịch vụ du lịch truyền thống gồm 3 chữ &ldquo;S&rdquo;: Shopping (mua sắm), sex (t&igrave;nh cảm), sun (tắm biển), nhưng b&acirc;y giờ đ&atilde; đến l&uacute;c phải thay đổi.</p>

<p>&ldquo;Việt Nam cần tập trung ph&aacute;t triển c&aacute;c h&igrave;nh thức dịch vụ du lịch mới mẻ, đang được ưa chuộng như: Du lịch sinh th&aacute;i, du lịch nghỉ dưỡng, du lịch t&acirc;m linh&hellip;&rdquo;, &ocirc;ng Th&agrave;nh n&oacute;i.</p>

<p><strong>Nguồn: B&aacute;o Hải Quan</strong></p>
', CAST(0x0000A5EC00F7AB6A AS DateTime), 0, N'vi', N'logistics', N'Kế hoạch phát triển xuất khẩu vùng do Bộ Công Thương vừa công bố cho thấy, logistics và du lịch là 2 ngành hàng có tiềm năng xuất khẩu tại 3 miền Bắc, Trung, Nam.', N'Kế hoạch phát triển xuất khẩu vùng do Bộ Công Thương vừa công bố cho thấy, logistics và du lịch là 2 ngành hàng có tiềm năng xuất khẩu tại 3 miền Bắc, Trung, Nam.', 10, 1, NULL)
INSERT [dbo].[_Post] ([PostID], [CatelogID], [PostName], [ImagePath], [Link], [Summary], [PostContent], [DateModified], [IsHot], [Lang], [Keyword], [Description], [Title], [OrderDisplay], [Approve], [CreateDate]) VALUES (24, 65, N'Lượng hàng hóa qua hệ thống cảng biển tăng 22%', N'/images/newspost/2016/4/sc_small_2053_83831302.jpg', N'Luong-hang-hoa-qua-he-thong-cang-bien-tang-22', N'Sở GT-VT cho biết, tổng khối lượng hàng thông qua cảng trong 9 tháng ước đạt khoảng 44,76 triệu tấn, tăng 22% so với cùng kỳ năm 2013 (44,76/36,68 triệu tấn).', N'<p>Sở GT-VT cho biết, tổng khối lượng h&agrave;ng th&ocirc;ng qua cảng trong 9 th&aacute;ng ước đạt khoảng 44,76 triệu tấn, tăng 22% so với c&ugrave;ng kỳ năm 2013 (44,76/36,68 triệu tấn), trong đ&oacute;: h&agrave;ng container tăng 39% (17,23/12,42 triệu tấn), h&agrave;ng lỏng kh&ocirc;ng tăng, đạt 11,05 triệu tấn, h&agrave;ng kh&ocirc; tăng 25% (16,48/13,19&nbsp; triệu tấn).</p>

<p>Nguy&ecirc;n nh&acirc;n lượng h&agrave;ng container tăng đều do h&agrave;ng xuất nhập khẩu tăng 39% (888/638 ng&agrave;n TEUs) v&agrave; h&agrave;ng qu&aacute; cảnh tăng 49% (1,1 triệu/832 ng&agrave;n TEUs). Lượng h&agrave;ng kh&ocirc; tăng chủ yếu do h&agrave;ng xuất nhập khẩu v&agrave; h&agrave;ng qu&aacute; cảnh, b&ugrave; đắp lượng giảm của h&agrave;ng kh&ocirc; nội địa. Ri&ecirc;ng h&agrave;ng lỏng tiếp tục c&oacute; xu hướng chuyển từ h&agrave;ng qu&aacute; cảnh sang h&agrave;ng nội địa.</p>

<p>Lượng h&agrave;ng container v&agrave; h&agrave;ng kh&ocirc; xuất nhập khẩu tăng cho thấy dấu hiệu tiếp tục phục hồi của nền kinh tế, g&oacute;p phần n&acirc;ng cao hiệu quả hoạt động của khu vực cảng B&agrave; Rịa &ndash; Vũng T&agrave;u, đặc biệt l&agrave; khu vực C&aacute;i M&eacute;p &ndash; Thị Vải.</p>

<p>Nguồn: B&aacute;o B&agrave; Rịa - Vũng T&agrave;u điện tử</p>
', CAST(0x0000A5EC00F762B8 AS DateTime), 1, N'vi', N'logistic', N'Sở GT-VT cho biết, tổng khối lượng hàng thông qua cảng trong 9 tháng ước đạt khoảng 44,76 triệu tấn, tăng 22% so với cùng kỳ năm 2013 (44,76/36,68 triệu tấn).', N'LƯỢNG HÀNG HÓA QUA HỆ THỐNG CẢNG BIỂN TĂNG 22%', 3, 1, NULL)
INSERT [dbo].[_Post] ([PostID], [CatelogID], [PostName], [ImagePath], [Link], [Summary], [PostContent], [DateModified], [IsHot], [Lang], [Keyword], [Description], [Title], [OrderDisplay], [Approve], [CreateDate]) VALUES (25, 65, N'Sắc xanh ngày Hè', N'/images/newspost/2016/4/sc_small_2056_106507418.jpg', N'Sac-xanh-ngay-He', N'Hồi đầu năm, mốt xanh lá thống trị các thảm đỏ, cho đến tận mùa Hè năm nay, màu xanh vẫn là màu sắc thịnh hành thu hút những cô gái. Hãy chọn cho mình những chiếc váy xanh, những bộ cánh xuyệt tông bắt mắt, kể cả các phụ kiện hợp thời…', N'<p><img alt="" src="/images/images/20150222055237_duVTa.jpeg" style="height:960px; width:640px" /></p>

<p>Ca sĩ Taylor Swift khoe d&aacute;ng chuẩn trong v&aacute;y xẻ của Julien Macdonald.</p>

<p><img alt="" src="/images/images/image2.jpeg" style="height:938px; width:640px" /></p>

<p>Người đẹp Scarlett Johansson xuất hiện lộng lẫy tại Lễ trao giải Oscar với đầm của Atelier Versace v&agrave; v&ograve;ng cổ Swarovski.</p>

<p><img alt="" src="/images/images/image3.jpeg" style="height:825px; width:550px" /></p>

<p>Julianne Moore gợi cảm trong đầm xanh đ&iacute;nh cườm của Givenchy tại Lễ trao giải SAG 2015.</p>

<p><img alt="" src="/images/images/image4.jpeg" style="height:548px; width:780px" /></p>

<p>Tạp ch&iacute; Vogue Trung Quốc th&aacute;ng 6 cũng lăng x&ecirc; m&agrave;u xanh với nguy&ecirc;n set đồ.</p>

<p><img alt="" src="/images/images/image5.jpeg" style="height:473px; width:630px" /></p>

<p>Những ca sỹ h&agrave;ng đầu đều chọn trang sức ngọc lục bảo.</p>

<p><img alt="" src="/images/images/image6.jpeg" style="height:715px; width:1000px" />M&agrave;u xanh c&ograve;n l&agrave; m&agrave;u mang lại may mắn cho những người đẹp Hollywood.</p>

<p><img alt="" src="/images/images/image7.jpeg" style="height:411px; width:572px" /></p>

<p>V&iacute; cầm tay da c&aacute; sấu m&agrave;u xanh l&aacute; của Hermes.</p>

<p><img alt="" src="/images/images/image8.jpeg" style="height:612px; width:612px" /></p>

<p>Đ&ocirc;i gi&agrave;y bệt đ&iacute;nh kim c&aacute; t&iacute;nh của Christian Louboutin.</p>

<p><img alt="" src="/images/images/image9.jpeg" style="height:600px; width:600px" />T&uacute;i x&aacute;ch Yves Saint Laurent cũng g&acirc;y sốt trong dịp H&egrave; n&agrave;y.</p>
', CAST(0x0000A5EC00F815F1 AS DateTime), 1, N'vi', N'concept fashion', N'concept fashion', N'concept fashion', 4, 1, NULL)
SET IDENTITY_INSERT [dbo].[_Post] OFF
/****** Object:  Table [dbo].[_Payment]    Script Date: 05/06/2016 16:06:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[_Payment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceID] [int] NULL,
	[Amount] [float] NULL,
	[CreateDate] [smalldatetime] NULL,
	[PaymentContent] [nvarchar](4000) NULL,
	[PaymentMenthod] [nvarchar](50) NULL,
	[TransactionInfor] [nvarchar](250) NULL,
	[TranscactionStatus] [varchar](10) NULL,
	[Payment_type] [int] NULL,
	[Net_amount] [float] NULL,
	[Fee_amount] [float] NULL,
	[Merchant_id] [int] NULL,
	[Customer_name] [nvarchar](150) NULL,
	[Customer_email] [varchar](50) NULL,
	[Customer_phone] [varchar](50) NULL,
 CONSTRAINT [PK__Payment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[_Pages]    Script Date: 05/06/2016 16:06:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_Pages](
	[PageID] [int] IDENTITY(1,1) NOT NULL,
	[PageName] [nvarchar](100) NOT NULL,
	[Link] [nvarchar](100) NULL,
	[ImagePath] [nvarchar](200) NULL,
	[Summary] [nvarchar](500) NULL,
	[PageContent] [ntext] NULL,
	[DateModified] [datetime] NULL,
	[Show] [bit] NULL,
	[Lang] [nvarchar](10) NULL,
	[Keyword] [nvarchar](500) NULL,
	[Description] [nvarchar](500) NULL,
	[Title] [nvarchar](500) NULL,
	[OrderDisplay] [int] NULL,
 CONSTRAINT [PK__Pages] PRIMARY KEY CLUSTERED 
(
	[PageID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[_Pages] ON
INSERT [dbo].[_Pages] ([PageID], [PageName], [Link], [ImagePath], [Summary], [PageContent], [DateModified], [Show], [Lang], [Keyword], [Description], [Title], [OrderDisplay]) VALUES (2, N'Chúng tôi Belle Salon', N'Chung-toi-Belle-Salon', N'0', N'Chúng tôi Belle Salon', N'<video autoplay loop poster="https://s3-us-west-2.amazonaws.com/s.cdpn.io/4273/polina.jpg" id="bgvid" >
<source src="http://dm8ek3es6mvef.cloudfront.net/output/webm/yEasIjJRH6oXkbXuFmA2_Belle%20Hair%20salon.%20clip.webm" type="video/webm">
<source src="http://dm8ek3es6mvef.cloudfront.net/output/mp4/yEasIjJRH6oXkbXuFmA2_Belle%20Hair%20salon.%20clip.mp4" type="video/mp4">
</video>
      <!--<div style="position: fixed; z-index: -99; width:100%;height:100%" id="bgvid">          
          <iframe frameborder="0" height="100%" width="100%" src="https://www.youtube.com/embed/WiDHE28Z_TE?loop=1&autoplay=1&controls=0&showinfo=0&autohide=1" allowfullscreen></iframe>
      </div>-->
<div id="polina">
<h1>Sinh nhật lần thứ 3 Belle Salon</h1>
<p><a href="https://www.facebook.com/Belle-Hair-Salon-450987675084279/?fref=ts">Belle facebook page</a>
<p>Chỉ còn mấy ngày nữa Belle sẽ tròn 3 tuổi và gia đình của Belle sẽ tổ chức một bữa tiệc mừng sinh nhật cho Belle từ ngày 23 đến ngày 26 nhé mọi người và rất mong các anh các chị sẽ đến chung vui cùng Belle. Bữa tiệc sẽ bắt đầu lúc 9h và rất nhiều chương trình ữu đãi dành cho các bạn không những vậy sẽ còn những phần quà hấp dẫn dành cho mọi người.
Một lần nữa Belle xin chân thành cảm ơn và mong mọi người inbox trả lời để gia đình Belle được chăm sóc chu đáo hơn nữa ạ</p>
<button>Pause</button>
</div>
    <style>
        body.ozy-page-locked #main, body.no-page-title #main {
             margin-top: 0px !important; 
        }
        #main {
             padding-top: 0px; 
        }
        #main {
            /* margin-top: 150px; */
            /* padding-top: 35px; */
        }
        body {
          margin: 0;
          /*background: #000;*/ 
        }
        video { 
            position: fixed;
            top: 50%;
            left: 50%;
            min-width: 100%;
            min-height: 100%;
            width: auto;
            height: auto;
            z-index: -100;
            -webkit-transform: translateX(-50%) translateY(-50%);
                    transform: translateX(-50%) translateY(-50%);
         background: url(''//demosthenes.info/assets/images/polina.jpg'') no-repeat;
          background-size: cover;
          -webkit-transition: 1s opacity;
          transition: 1s opacity;
        }
        .stopfade { 
           opacity: .5;
        }

        #polina { 
          /*font-family: Agenda-Light, Agenda Light, Agenda, Arial Narrow, sans-serif;*/
          font-weight:100; 
          background: rgba(0,0,0,0.3);
          color: white;
          padding: 2rem;
          width: 33%;
          margin:12rem 2rem 2rem 2rem;
          float: right;
          /*font-size: 1.2rem;*/
        }
        h1 {
          color:white !important;
          font-size: 3rem !important;
          margin-top: 0;
          letter-spacing: .3rem !important;
        }
        #polina button { 
          display: block;
          width: 80%;
          padding: .4rem;
          border: none; 
          margin: 1rem auto; 
          font-size: 1.3rem;
          background: rgba(255,255,255,0.23);
          color: #fff;
          border-radius: 3px; 
          cursor: pointer;
          -webkit-transition: .3s background;
          transition: .3s background;
        }
        #polina button:hover { 
           background: rgba(0,0,0,0.5);
        }

        a:hover{
          background:rgba(0,0,0,0.9);
        }
        @media screen and (max-width: 500px) { 
          div{width:70%;} 
        }
        @media screen and (max-device-width: 800px) {
          html { background: url(//demosthenes.info/assets/images/polina.jpg) #000 no-repeat center center fixed; }
          #bgvid { display: none; }
        }
    </style>
   <script>
       var vid = document.getElementById("bgvid");
       var pauseButton = document.querySelector("#polina button");

       function vidFade() {
           vid.classList.add("stopfade");
       }

       vid.addEventListener(''ended'', function () {
           //// only functional if "loop" is removed 
           vid.pause();
           //// to capture IE10
           vidFade();
       });


       pauseButton.addEventListener("click", function () {
           vid.classList.toggle("stopfade");
           if (vid.paused) {
               vid.play();
               pauseButton.innerHTML = "Pause";
           } else {
               vid.pause();
               pauseButton.innerHTML = "Paused";
           }
       })
   </script>', CAST(0x0000A5FE010600D5 AS DateTime), 1, N'vi', N'Chúng tôi Belle Salon', N'Chúng tôi Belle Salon', N'Chúng tôi Belle Salon', 1)
INSERT [dbo].[_Pages] ([PageID], [PageName], [Link], [ImagePath], [Summary], [PageContent], [DateModified], [Show], [Lang], [Keyword], [Description], [Title], [OrderDisplay]) VALUES (8, N'Belle Stylelist', N'Belle-Stylelist', N'/images/static/2016/1/sc_small_2083_462015115tumblr_nlhshjutot1qbd81ro1_1280.jpg', N'', N'<p>def</p>
', CAST(0x0000A5FE00AAE3AB AS DateTime), 1, N'vi', N'Belle Stylelist', N'Belle Stylelist', N'Belle Stylelist', 2)
SET IDENTITY_INSERT [dbo].[_Pages] OFF
/****** Object:  Table [dbo].[_Link]    Script Date: 05/06/2016 16:06:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_Link](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NULL,
	[Summary] [nvarchar](500) NULL,
	[LinkContent] [ntext] NULL,
	[Link] [nvarchar](200) NULL,
	[ImagePath] [nvarchar](200) NULL,
	[Type] [nchar](2) NULL,
	[OrderDisplay] [int] NULL,
	[Lang] [nvarchar](10) NULL,
 CONSTRAINT [PK_Link] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[_Link] ON
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (4, N'Olay', N'', N'', N'', N'/images/link/2016/4/sc_original_2068_partner_logo1.png', N'DT', 1, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (5, N'so 1', N'', N'', N'#', N'/images/link/30920141837advertise-1.jpg', N'AF', 1, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (6, N'so 2', N'', N'', N'#', N'/images/link/30920141837advertise-2.jpg', N'AF', 1, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (7, N'so 3', N'', N'', N'#', N'/images/link/30920141837advertise-3.jpg', N'AF', 1, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (16, N'background1', N'', N'', N'', N'/images/link/sc_small_2076_12.jpg', N'BG', 1, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (17, N'background2', N'', N'', N'', N'/images/link/sc_small_2076_24.jpg', N'BG', 2, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (19, N'Revion', N'', N'', N'', N'/images/link/2016/4/sc_original_2068_partner_logo2.png', N'DT', 2, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (20, N'background1', N'', N'', N'', N'/images/link/111120142148slive1.jpg', N'BG', 1, N'en')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (21, N'background2', N'', N'', N'', N'/images/link/111120142149slive3.jpg', N'BG', 3, N'en')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (22, N'background3', N'', N'', N'', N'/images/link/111120142148team.jpg', N'BG', 2, N'en')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (26, N'Lancome', N'', N'', N'', N'/images/link/2016/4/sc_original_2068_partner_logo3.png', N'DT', 3, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (27, N'Shiseido', N'', N'', N'', N'/images/link/2016/4/sc_original_2069_partner_logo4.png', N'DT', 4, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (28, N'Redken', N'', N'', N'', N'/images/link/2016/4/sc_original_2069_partner_logo5.png', N'DT', 5, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (29, N'Loreal', N'', N'', N'', N'/images/link/2016/4/sc_original_2070_partner_logo6.png', N'DT', 6, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (32, N'background3', N'', N'', N'', N'/images/link/sc_small_2077_10.jpg', N'BG', 3, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (37, N'slide 2', N'', N'', N'', N'/images/link/sc_small_2066_banner54.jpg', N'SL', 2, N'en')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (38, N'slide 3', N'', N'', N'', N'/images/link/sc_small_2056_banner53.jpg', N'SL', 3, N'en')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (39, N'dự án vận chuyển mẫu', N'regular code_x', N'', N'', N'/images/link/11120141929portfolio3-1.png', N'PR', 1, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (40, N'dự án giới thiệu 2', N'tall code_x', N'', N'', N'/images/link/11120141929portfolio3-2.png', N'PR', 2, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (41, N'dự án mẫu 3', N'wide code_x', N'', N'', N'/images/link/11120141929portfolio3-3.png', N'PR', 3, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (42, N'dự án mẫu 4', N'regular code_x', N'', N'', N'/images/link/11120141939portfolio3-4.png', N'PR', 4, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (43, N'dự án mẫu 5', N'regular code_x', N'', N'', N'/images/link/11120141941portfolio3-5.png', N'PR', 5, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (44, N'dự án mẫu 6', N'regular code_y', N'', N'', N'/images/link/11120141943portfolio3-6.png', N'PR', 6, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (45, N'dự án mẫu 7', N'tall code_y', N'', N'', N'/images/link/11120141935portfolio3-7.png', N'PR', 7, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (46, N'dự án mẫu 8', N'regular code_y', N'', N'', N'/images/link/11120141825portfolio3-8.png', N'PR', 8, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (47, N'dự án mẫu 9', N'regular code_y', N'', N'', N'/images/link/11120141825portfolio3-9.png', N'PR', 9, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (48, N'dự án mẫu 10', N'regular code_z', N'', N'', N'/images/link/1112014193portfolio3-10.png', N'PR', 10, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (49, N'dự án mẫu 11', N'regular code_z', N'', N'', N'/images/link/11120141826portfolio3-11.png', N'PR', 11, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (50, N'dự án mẫu 12', N'regular code_z', N'', N'', N'/images/link/11120141826portfolio3-12.png', N'PR', 12, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (51, N'dự án mẫu 13', N'regular code_z', N'', N'', N'/images/link/11120141822portfolio3-13.png', N'PR', 13, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (52, N'dự án mẫu 14', N'wide code_z', N'', N'', N'/images/link/11120141930portfolio3-14.png', N'PR', 14, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (53, N'dự án vận chuyển mẫu', N'regular code_x', N'', N'', N'/images/link/11120141929portfolio3-1.png', N'PR', 1, N'en')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (54, N'dự án giới thiệu 2', N'tall code_x', N'', N'', N'/images/link/11120141929portfolio3-2.png', N'PR', 2, N'en')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (55, N'dự án mẫu 3', N'wide code_x', N'', N'', N'/images/link/11120141929portfolio3-3.png', N'PR', 3, N'en')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (56, N'dự án mẫu 4', N'regular code_x', N'', N'', N'/images/link/11120141939portfolio3-4.png', N'PR', 4, N'en')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (57, N'dự án mẫu 5', N'regular code_x', N'', N'', N'/images/link/11120141941portfolio3-5.png', N'PR', 5, N'en')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (58, N'dự án mẫu 6', N'regular code_y', N'', N'', N'/images/link/11120141943portfolio3-6.png', N'PR', 6, N'en')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (59, N'dự án mẫu 7', N'tall code_y', N'', N'', N'/images/link/11120141935portfolio3-7.png', N'PR', 7, N'en')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (60, N'dự án mẫu 8', N'regular code_y', N'', N'', N'/images/link/11120141825portfolio3-8.png', N'PR', 8, N'en')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (61, N'dự án mẫu 9', N'regular code_y', N'', N'', N'/images/link/11120141825portfolio3-9.png', N'PR', 9, N'en')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (62, N'dự án mẫu 10', N'regular code_z', N'', N'', N'/images/link/1112014193portfolio3-10.png', N'PR', 10, N'en')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (63, N'dự án mẫu 11', N'regular code_z', N'', N'', N'/images/link/11120141826portfolio3-11.png', N'PR', 11, N'en')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (64, N'dự án mẫu 12', N'regular code_z', N'', N'', N'/images/link/11120141826portfolio3-12.png', N'PR', 12, N'en')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (65, N'dự án mẫu 13', N'regular code_z', N'', N'', N'/images/link/11120141822portfolio3-13.png', N'PR', 13, N'en')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (66, N'dự án mẫu 14', N'wide code_z', N'', N'', N'/images/link/11120141930portfolio3-14.png', N'PR', 14, N'en')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (67, N'Chăm sóc và khắc phục tóc khô', N'Làm mềm tóc và mượt tóc trên nền tóc đã khô với các sản phẩm chất lượng cao', N'', N'', N'/images/link/2016/4/sc_original_2120_slide4.jpg', N'SL', 2, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (68, N'Robert Green', N'FPT', N'Voluptatem accusantium dolorem laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore.Voluptatem accusantium doVoluptatem accusantium dolorem laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore.lorem laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore', N'', N'/images/link/11120141930portfolio3-14.png', N'TE', 1, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (69, N'Son Nguyen', N'SETA', N'Voluptatem accusantium dolorem laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore.Voluptatem accusantium doVoluptatem accusantium dolorem laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore.lorem laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore', N'', N'/images/link/11120141930portfolio3-14.png', N'TE', 2, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (70, N'Hoang Duong', N'Orenj', N'Voluptatem accusantium dolorem laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore.Voluptatem accusantium doVoluptatem accusantium dolorem laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore.lorem laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore', N'', N'/images/link/11120141930portfolio3-14.png', N'TE', 3, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (71, N'title 1', N'', N'', N'', N'/images/link/sc_small_2057_banner51.jpg', N'SL', 1, N'en')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (72, N'Nguyễn Văn B', N'Một trong 10 nhà tiếp thị Internet hàng đầu tại Mỹ, Alex Mandossian cũng là một diễn giả tràn đầy năng lượng, nhà đào tạo bán hàng và tác giả của nhiều cuốn sách. Ông hiện đang là Giám đốc điều hành của một công ty xuất bản và tiếp thị điện tử có tên là Heritage House Publishing, là người sáng lập ra Viện Tiếp thị điện tử (Electronic Marketing Institute).', N'<h3>Primary Skills</h3>

<ul>
	<li><a href="#">Web and graphich Design</a></li>
	<li><a href="#">Website development</a></li>
	<li><a href="#">Mobile game design</a></li>
	<li><a href="#">Mobile app developmemt</a></li>
	<li><a href="#">CMS integration</a></li>
	<li><a href="#">Mobile games</a></li>
	<li><a href="#">Software development</a></li>
</ul>
', N'Nguyen-Van-B', N'/images/link/sc_small_2077_2.jpg', N'SP', 1, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (73, N'Nguyễn Văn C', N'Ông Nguyễn Văn C', N'<p>&Ocirc;ng Nguyễn Văn C</p>
', N'Nguyen-Van-C', N'/images/link/sc_small_2082_4.jpg', N'SP', 10, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (74, N'Nguyễn Thị D', N'Bà Nguyễn Thị D', N'<p>&nbsp;B&agrave; Nguyễn Thị D</p>
', N'Nguyen-Thi-D', N'/images/link/sc_small_2081_5.jpg', N'SP', 10, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (75, N'Nguyễn Anh T', N'Nguyễn Anh T', N'<p>&nbsp;Nguyễn Anh T</p>
', N'Nguyen-Anh-T', N'/images/link/sc_small_2077_1.jpg', N'SP', 2, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (76, N'Nguyễn Tuấn G', N'Nguyễn Tuấn G', N'<p>Nguyễn Tuấn G</p>
', N'Nguyen-Tuan-G', N'/images/link/sc_small_2082_6.jpg', N'SP', 3, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (77, N'Video 1', N'', N'<div style="width:263px;">aaa</div>', N'', N'0', N'VD', 1, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (78, N'Video 2', N'', N'<div style="width:263px;">bbb</div>', N'', N'0', N'VD', 2, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (79, N'video 3', N'', N'<div style="width:263px;">ccc</div>', N'', N'0', N'VD', 3, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (80, N'Thiết kế & Tạo mẫu tóc', N'Chất lượng quốc tế giá thành Việt Nam', N'<p>Lu&ocirc;n đồng h&agrave;nh để mang đến cho bạn những dịch vụ tốt nhất gi&uacute;p c&aacute;c bạn g&aacute;i lu&ocirc;n xinh đẹp trong mọi ho&agrave;n cảnh xuất hiện, hệ thống hair salon Belle mang đến bạn trọn g&oacute;i dịch vụ l&agrave;m t&oacute;c chuy&ecirc;n nghiệp nhất.</p>
', N'', N'/images/link/2016/4/sc_original_2107_slide7.jpg', N'SL', 1, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (84, N'Tư vấn thiết kế', N'', N'', N'', N'/images/link/231220141524feature_1.png', N'SR', 1, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (85, N'Xây dựng cơ bản', N'', N'', N'', N'/images/link/231220141525feature_2.png', N'SR', 10, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (86, N'Cầu đường', N'', N'', N'', N'/images/link/231220141525feature_3.png', N'SR', 3, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (87, N'Xây dựng công nghiệp', N'', N'', N'', N'/images/link/231220141525feature_4.png', N'SR', 4, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (88, N'background4', N'', N'', N'', N'/images/link/sc_small_2080_18.jpg', N'BG', 4, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (89, N'background4', N'', N'', N'', N'/images/link/111120142149slive3.jpg', N'BG', 4, N'en')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (91, N'title 4', N'slide 4', N'', N'', N'/images/link/sc_small_2057_banner52.jpg', N'SL', 4, N'en')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (92, N'Nối tóc chuyên nghiệp – Đẳng cấp tạo lên sự khác biệt ', N'Làm thế nào để hô biến một bộ tóc ngắn cá tính thành một mái tóc dài mềm mại thướt tha mà bao người mơ ước, đó không còn là bài toán khó khi đến với Belle hair salon ', N'', N'', N'/images/link/2016/4/sc_original_2108_slide3.jpg', N'SL', 3, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (93, N'Đào tạo & Dạy nghề tóc chuyên nghiệp & Năng động !', N'Hệ thống Belle hair salon hiện nay có rất nhiều chuyên viên kỹ thuật đẳng cấp trong lĩnh vực này.Các bạn nào thực sự muốn tìm hểu hãy tìm đến Belle hair salon nhà tạo mẫu tóc Mr Thịnh và đồng hành là một đội ngũ chuyên viên tay nghề đẳng cấp đã được khẳng định trực tiếp truyền đạt.', N'', N'', N'/images/link/2016/4/sc_original_2111_slide8.jpg', N'SL', 4, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (94, N'Christian Dior Paris', N'', N'', N'', N'/images/link/2016/4/sc_original_2071_partner_logo7.png', N'DT', 7, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (95, N'Kerastase', N'', N'', N'', N'/images/link/2016/4/sc_original_2071_partner_logo8.png', N'DT', 8, N'vi')
SET IDENTITY_INSERT [dbo].[_Link] OFF
/****** Object:  Table [dbo].[_Languages]    Script Date: 05/06/2016 16:06:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_Languages](
	[LangKey] [nchar](4) NOT NULL,
	[LangValue] [nvarchar](50) NULL,
	[OrderDisplay] [int] NULL,
	[IsUser] [bit] NULL,
 CONSTRAINT [PK__Languages] PRIMARY KEY CLUSTERED 
(
	[LangKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[_Languages] ([LangKey], [LangValue], [OrderDisplay], [IsUser]) VALUES (N'en  ', N'English', 2, 1)
INSERT [dbo].[_Languages] ([LangKey], [LangValue], [OrderDisplay], [IsUser]) VALUES (N'vi  ', N'Tiếng việt', 1, 1)
/****** Object:  Table [dbo].[_Invoices]    Script Date: 05/06/2016 16:06:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[_Invoices](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[OrderCode] [varchar](8) NULL,
	[CreateDate] [smalldatetime] NULL,
	[InvoiceContent] [nvarchar](4000) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK__Invoices] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[_Invoices] ON
INSERT [dbo].[_Invoices] ([id], [OrderCode], [CreateDate], [InvoiceContent], [Status]) VALUES (1, N'AMJTFW9B', CAST(0xA586035C AS SmallDateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[_Invoices] OFF
/****** Object:  StoredProcedure [dbo].[_General_Update]    Script Date: 05/06/2016 16:06:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[_General_Update]
	@GeneralName      nvarchar(100)
	,@GeneralContent      nvarchar(MAX)
	,@Datemodified      smalldatetime
	,@Show      bit
	,@Lang      nvarchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @count int
	SET @count = (select count(GeneralName) from dbo._General 
					where GeneralName=@GeneralName and Lang = @Lang)
	if (@count = 0)
		begin
			INSERT INTO [dbo].[_General]
			   ([GeneralName]
			   ,[GeneralContent]
			   ,[Datemodified]
			   ,[Show]
			   ,[Lang])
		 VALUES
			   (@GeneralName
				,@GeneralContent
				,@Datemodified
				,@Show
				,@Lang
				)
		end
	else
		begin
			UPDATE [dbo].[_General]
			   SET GeneralContent  =  @GeneralContent
					,Datemodified  =  @Datemodified
					,Show  =  @Show
					,Lang  =  @Lang
			 WHERE GeneralName  =  @GeneralName
					and Lang = @Lang
		end
	
END
GO
/****** Object:  Table [dbo].[_General]    Script Date: 05/06/2016 16:06:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_General](
	[GeneralID] [int] IDENTITY(1,1) NOT NULL,
	[GeneralName] [nvarchar](100) NOT NULL,
	[GeneralContent] [nvarchar](max) NULL,
	[Datemodified] [smalldatetime] NULL,
	[Show] [bit] NULL,
	[Lang] [nvarchar](10) NULL,
 CONSTRAINT [PK__General] PRIMARY KEY CLUSTERED 
(
	[GeneralID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[_General] ON
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (1, N'pagename', N'Belle Hair Salon', CAST(0xA5EE056D AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (3, N'contact', N'', CAST(0xA4A00381 AS SmallDateTime), 1, N'vi  ')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (5, N'description', N'Belle hair salon', CAST(0xA5EE056D AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (6, N'support', NULL, CAST(0xA5EE056D AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (7, N'aboutshort', N'<h2>TRUNG T&Acirc;M CHĂM S&Oacute;C SẮC ĐẸP BELLE BEAUTE</h2>

<p>Đến với Belle Beaute Hair &amp; Spa, kh&aacute;ch h&agrave;ng c&oacute; thể tha hồ lựa chọn cho m&igrave;nh rất nhiều dịch vụ về t&oacute;c v&agrave; spa kh&aacute;c nhau để c&oacute; được một m&aacute;i t&oacute;c hợp thời trang, một l&agrave;n da đẹp, một cơ thể khỏe mạnh... gi&uacute;p bạn giảm bớt mệt mỏi sau những giờ l&agrave;m việc căng thẳng.</p>
', CAST(0xA4F8040F AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (8, N'aboutcontent', N'<div class="slide1">
<h2>Trung t&acirc;m chăm s&oacute;c sắc đẹp BELLE BEAUTE</h2>

<p>Đến với Belle Beaute Hair &amp; Spa, kh&aacute;ch h&agrave;ng c&oacute; thể tha hồ lựa chọn cho m&igrave;nh rất nhiều dịch vụ về t&oacute;c v&agrave; spa kh&aacute;c nhau để c&oacute; được một m&aacute;i t&oacute;c hợp thời trang, một l&agrave;n da đẹp, một cơ thể khỏe mạnh... gi&uacute;p bạn giảm bớt mệt mỏi sau những giờ l&agrave;m việc căng thẳng.</p>

<p><img alt="" src="/images/images/IMG_8266.JPG" style="width:100%" /></p>

<p>Tất cả c&aacute;c trang thiết bị, sản phẩm mỹ phẩm của Trung t&acirc;m đều được nhập khẩu từ c&aacute;c quốc gia uy t&iacute;n như Nhật Bản, H&agrave;n Quốc với c&ocirc;ng nghệ hiện đại, cao cấp. Belle Beauty Hair &amp; Spa cam kết chỉ sử dụng những d&ograve;ng mỹ phẩm chất lượng cao, c&oacute; nguồn gốc từ thi&ecirc;n nhi&ecirc;n, đảm bảo kh&ocirc;ng g&acirc;y k&iacute;ch ứng, mang lại hiệu quả r&otilde; r&agrave;ng cho kh&aacute;ch h&agrave;ng.&nbsp;</p>

<p>Th&acirc;n mến,</p>

<p>Belle Beaute Hair &amp; Spa</p>
</div>
', CAST(0xA4F8040F AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (9, N'contactdetail', N'<h3>Địa chỉ</h3>

<p>Số 20 Ho&agrave;ng Ngọc Ph&aacute;ch, L&aacute;ng Hạ, Đống Đa,H&agrave; Nội.</p>

<hr />
<h3>Contact Phone</h3>

<p>099.666.111.2 -&nbsp;094.666.111.2<br />
0976.30.33.86 - 0989.56.96.56</p>

<hr />
<h3>E-mail</h3>

<p>info@bellebeaute.vn</p>
', CAST(0xA4130000 AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (10, N'banner', N'', CAST(0xA0870434 AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (11, N'productcontent', N'', CAST(0x9E3903FE AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (12, N'yahoo', N'', CAST(0xA0870434 AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (28, N'abouthome', N'<p>Sed ut perspiciatis, unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt, explicabo.</p>
<p>Nemo enim ipsam voluptatem, quia voluptas sit, aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos, qui ratione voluptatem sequi nesciunt, neque porro quisquam. </p>', CAST(0xA14D04BD AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (41, N'keywords', N'hair salon', CAST(0xA5EE056D AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (110, N'productcontent', N'', CAST(0x9E3903FE AS SmallDateTime), 1, N'en')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (118, N'yahoo', N'', CAST(0x9EBD0229 AS SmallDateTime), 1, N'en')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (127, N'abouthome', N'<p>Sed ut perspiciatis, unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt, explicabo.</p>', CAST(0xA14D04BD AS SmallDateTime), 1, N'en')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (141, N'google_analysis', N'<!--<script>
  (function(i,s,o,g,r,a,m){i[''GoogleAnalyticsObject'']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,''script'',''//www.google-analytics.com/analytics.js'',''ga'');

  ga(''create'', ''UA-57643586-1'', ''auto'');
  ga(''send'', ''pageview'');

</script>-->', CAST(0xA4A0037E AS SmallDateTime), 1, N'vi  ')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (142, N'app_extend_one', N'<!--<script type=''text/javascript''>window._sbzq||function(e){e._sbzq=[];var t=e._sbzq;t.push(["_setAccount",14844]);var n=e.location.protocol=="https:"?"https:":"http:";var r=document.createElement("script");r.type="text/javascript";r.async=true;r.src=n+"//static.subiz.com/public/js/loader.js";var i=document.getElementsByTagName("script")[0];i.parentNode.insertBefore(r,i)}(window);</script>-->', CAST(0xA4A0037E AS SmallDateTime), 1, N'vi  ')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (143, N'contact', N'', CAST(0xA4790264 AS SmallDateTime), 1, N'en  ')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (144, N'advstop', N'<div class="service-block  block2">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="header-for-black">
                        <h2>Featured Services</h2>
                        <p>We have more and more  service for you and select sign up to the mailing list to receive updates on new arrivals, special offers and other discount information.</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-6">
                    <div class="block-feature">
                        <i class="ion-ios-navigate-outline"></i>
                        <a href="#">More Features</a>
                        <p>
                            Excepteur sint occaecat cupidatat non proident.
                        </p>
                    </div>

                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="block-feature">
                        <i class="ion-ios-paper-outline"></i>
                        <a href="#">Clean Design</a>
                        <p>Ut magna aliqua enim ad minim veniam, quis nostrud</p>
                    </div>

                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="block-feature">
                        <i class="ion-ios-people-outline"></i>
                        <a href="#">Best Usability</a>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing </p>
                    </div>

                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="block-feature">
                        <i class="ion-ios-photos-outline"></i>
                        <a href="#">Layer Style</a>
                        <p>Duis aute irure dolor in reprehe nderit velit esse.</p>
                    </div>

                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-sm-6">
                    <div class="block-feature">
                        <i class="ion-ios-play-outline"></i>
                        <a href="#">HTML Video</a>
                        <p>
                            Excepteur sint occaecat cupidatat non proident.
                        </p>
                    </div>

                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="block-feature">
                        <i class="ion-ios-reload"></i>
                        <a href="#">Always Upgradable  </a>
                        <p>Ut magna aliqua enim ad minim veniam, quis nostrud</p>
                    </div>

                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="block-feature">
                        <i class="ion-ios-speedometer-outline"></i>
                        <a href="#">Fast Work</a>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing </p>
                    </div>

                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="block-feature">
                        <i class="ion-ios-rose-outline"></i>
                        <a href="#">Creative Ideas</a>
                        <p>Duis aute irure dolor in reprehe nderit velit esse.</p>
                    </div>

                </div>
            </div>

        </div>
        <br>
    </div>', CAST(0xA52B03EB AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (145, N'advsbottom', N'<div class="block2 color-scheme-2">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-6">
                    <div class="block-feature-icon center">
                        <div class="icon hi-icon-color hi-icon-effect">
                            <span class="hi-icon"><i class="ion-ios-refresh-outline"></i></span>
                        </div>
                        <div class="block-title">
                            <h4>Money exchange</h4>

                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="block-feature-icon center">
                        <div class="icon hi-icon-color hi-icon-effect">
                            <span class="hi-icon"><i class="ion-social-euro"></i></span>
                        </div>
                        <div class="block-title">
                            <h4>Money Back</h4>

                        </div>

                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="block-feature-icon center">
                        <div class="icon hi-icon-color hi-icon-effect">
                            <span class="hi-icon"><i class="ion-ios-briefcase-outline"></i></span>
                        </div>

                        <div class="block-title">
                            <h4>Free shipping</h4>

                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="block-feature-icon center">
                        <div class="icon hi-icon-color hi-icon-effect">
                            <span class="hi-icon"><i class="ion-ios-world-outline"></i></span>
                        </div>

                        <div class="block-title">
                            <h4>Support 7/24</h4>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>', CAST(0xA52B03EE AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (146, N'advsbottom', N'<div class="block2 color-scheme-2">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-6">
                    <div class="block-feature-icon center">
                        <div class="icon hi-icon-color hi-icon-effect">
                            <span class="hi-icon"><i class="ion-ios-refresh-outline"></i></span>
                        </div>
                        <div class="block-title">
                            <h4>Money exchange</h4>

                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="block-feature-icon center">
                        <div class="icon hi-icon-color hi-icon-effect">
                            <span class="hi-icon"><i class="ion-social-euro"></i></span>
                        </div>
                        <div class="block-title">
                            <h4>Money Back</h4>

                        </div>

                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="block-feature-icon center">
                        <div class="icon hi-icon-color hi-icon-effect">
                            <span class="hi-icon"><i class="ion-ios-briefcase-outline"></i></span>
                        </div>

                        <div class="block-title">
                            <h4>Free shipping</h4>

                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="block-feature-icon center">
                        <div class="icon hi-icon-color hi-icon-effect">
                            <span class="hi-icon"><i class="ion-ios-world-outline"></i></span>
                        </div>

                        <div class="block-title">
                            <h4>Support 7/24</h4>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>', CAST(0xA52B03EE AS SmallDateTime), 1, N'en')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (149, N'advstop', N'<div class="service-block  block2">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="header-for-black">
                        <h2>Featured Services</h2>
                        <p>We have more and more  service for you and select sign up to the mailing list to receive updates on new arrivals, special offers and other discount information.</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-6">
                    <div class="block-feature">
                        <i class="ion-ios-navigate-outline"></i>
                        <a href="#">More Features</a>
                        <p>
                            Excepteur sint occaecat cupidatat non proident.
                        </p>
                    </div>

                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="block-feature">
                        <i class="ion-ios-paper-outline"></i>
                        <a href="#">Clean Design</a>
                        <p>Ut magna aliqua enim ad minim veniam, quis nostrud</p>
                    </div>

                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="block-feature">
                        <i class="ion-ios-people-outline"></i>
                        <a href="#">Best Usability</a>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing </p>
                    </div>

                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="block-feature">
                        <i class="ion-ios-photos-outline"></i>
                        <a href="#">Layer Style</a>
                        <p>Duis aute irure dolor in reprehe nderit velit esse.</p>
                    </div>

                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-sm-6">
                    <div class="block-feature">
                        <i class="ion-ios-play-outline"></i>
                        <a href="#">HTML Video</a>
                        <p>
                            Excepteur sint occaecat cupidatat non proident.
                        </p>
                    </div>

                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="block-feature">
                        <i class="ion-ios-reload"></i>
                        <a href="#">Always Upgradable  </a>
                        <p>Ut magna aliqua enim ad minim veniam, quis nostrud</p>
                    </div>

                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="block-feature">
                        <i class="ion-ios-speedometer-outline"></i>
                        <a href="#">Fast Work</a>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing </p>
                    </div>

                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="block-feature">
                        <i class="ion-ios-rose-outline"></i>
                        <a href="#">Creative Ideas</a>
                        <p>Duis aute irure dolor in reprehe nderit velit esse.</p>
                    </div>

                </div>
            </div>

        </div>
        <br>
    </div>', CAST(0xA52B03EF AS SmallDateTime), 1, N'en')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (150, N'advsleft', N'', CAST(0xA52B03F0 AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (151, N'advsleft', N'', CAST(0xA52B03F0 AS SmallDateTime), 1, N'en')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (152, N'advsright', N'', CAST(0xA52B03F1 AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (153, N'advsright', N'', CAST(0xA52B03F1 AS SmallDateTime), 1, N'en')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (154, N'advsmiddle', N'<div class="big-banner">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-sm-6 col-md-offset-6 col-sm-offset-6">
                <a href="#">
                    <img alt="" class="img-responsive" src="/Content/themes/shop/img/bg/bg_banner.png">
                </a>
            </div>
        </div>
    </div>
</div>', CAST(0xA52B03F1 AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (155, N'advsmiddle', N'<div class="big-banner">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-sm-6 col-md-offset-6 col-sm-offset-6">
                <a href="#">
                    <img alt="" class="img-responsive" src="/Content/themes/shop/img/bg/bg_banner.png">
                </a>
            </div>
        </div>
    </div>
</div>', CAST(0xA52B03F1 AS SmallDateTime), 1, N'en')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (156, N'content_shipping', N'<div class="widget-block">
                                <div class="panel-group" id="accordion">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" class="collapsed">
                                                    Phí giao hàng được tính và thu như thế nào?
                                                </a>
                                            </h4>
                                        </div>
                                        <div id="collapseOne" class="panel-collapse collapse in">
                                            <div class="panel-body">
                                               <p> - Phí giao hàng là chi phí phát sinh đối với những đơn hàng có tổng giá trị ≤ 150.000đ.</p>
					       <p> - Phí giao hàng sẽ được hệ thống tính  35.000đ/01 đơn hàng và cộng gộp vào tiền hàng khi Quý khách đặt hàng.</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" class="collapsed">
                                                    Khi đặt hàng làm thế nào để kiểm tra phí giao hàng cho đơn hàng đó?
                                                </a>
                                            </h4>
                                        </div>
                                        <div id="collapseTwo" class="panel-collapse collapse">
                                            <div class="panel-body">                                                
                                        	Khi Quý khách thao tác đặt hàng nếu đơn hàng có tổng giá trị ≤ 150.000đ, hệ thống sẽ thông báo đơn hàng phát sinh phí giao hàng là 35.000đ.                                    
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree" class="collapsed">
                                                    Tại sao tôi phải trả phí giao hàng?
                                                </a>
                                            </h4>
                                        </div>
                                        <div id="collapseThree" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                Chúng tôi chỉ thu phí giao hàng khi đơn hàng ≤ 150.000đ.
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>', CAST(0xA52B03F1 AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (157, N'content_shipping', N'<table style="width:80%;margin-left:20px;">
	                                    <tbody>
		                                    <tr>
			                                    <td style="vertical-align:top">The delivery standards</td>
		                                    </tr>
		                                    <tr>
			                                    <td style="vertical-align:top">The delivery time is expected after 2 working days from the time of purchase.</td>
		                                    </tr>
	                                    </tbody>
                                    </table>', CAST(0xA52B03F1 AS SmallDateTime), 1, N'en')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (158, N'email_order_confirm', N'<div class="WordSection1">
<p>&nbsp;</p>

<table border="1" cellpadding="0" cellspacing="0" class="a0" style="border-collapse:collapse; border:none; width:624px">
	<tbody>
		<tr>
			<td style="height:135.0pt; width:183.75pt">
			<p><img id="image01.png" src="/images/images/logo.png" style="height:95px; width:79px" /></p>

			<p><span style="color:#CCCCCC; font-family:arial; font-size:12.0pt">{store_name}</span></p>

			<p><strong><span style="font-family:arial; font-size:14pt">X&Aacute;C NHẬN ĐƠN H&Agrave;NG</span></strong></p>
			</td>
			<td style="height:135.0pt; width:284.25pt">
			<p style="text-align:right">&nbsp;</p>

			<table border="1" cellpadding="0" cellspacing="0" class="a" style="border-collapse:collapse; border:none; width:376px">
				<tbody>
					<tr>
						<td style="width:177.0pt">
						<p style="text-align:right"><strong><span style="font-family:arial; font-size:10.0pt">Ng&agrave;y tạo đơn h&agrave;ng </span></strong></p>
						</td>
						<td style="width:105.0pt">
						<p style="text-align:right"><span style="font-family:arial; font-size:10.0pt">{order_date}</span></p>
						</td>
					</tr>
					<tr>
						<td style="width:177.0pt">
						<p style="text-align:right"><strong><span style="font-family:arial; font-size:10.0pt">T&igrave;nh trạng đơn h&agrave;ng </span></strong></p>
						</td>
						<td style="width:105.0pt">
						<p style="text-align:right"><span style="font-family:arial; font-size:10.0pt">{order_status}</span></p>
						</td>
					</tr>
					<tr>
						<td style="width:177.0pt">
						<p style="text-align:right"><strong><span style="font-family:arial; font-size:10.0pt">Thanh to&aacute;n</span></strong></p>
						</td>
						<td style="width:105.0pt">
						<p style="text-align:right"><span style="font-family:arial; font-size:10.0pt">{payment_status}</span></p>
						</td>
					</tr>
					<tr>
						<td style="width:177.0pt">
						<p style="text-align:right"><strong><span style="font-family:arial; font-size:10.0pt">M&atilde; đơn h&agrave;ng</span></strong></p>
						</td>
						<td style="width:105.0pt">
						<p style="text-align:right"><span style="font-family:arial; font-size:10.0pt">{order_id} </span></p>
						</td>
					</tr>
					<tr>
						<td style="width:177.0pt">
						<p style="text-align:right"><strong><span style="font-family:arial; font-size:10.0pt">Người đặt h&agrave;ng </span></strong></p>
						</td>
						<td style="width:105.0pt">
						<p style="text-align:right"><span style="font-family:arial; font-size:10.0pt">{order_name}</span></p>
						</td>
					</tr>
				</tbody>
			</table>

			<p>&nbsp;</p>

			<p>&nbsp;</p>
			</td>
		</tr>
	</tbody>
</table>

<p>&nbsp;</p>

<table border="1" cellpadding="0" cellspacing="0" class="a1" style="border-collapse:collapse; border:none; width:624px">
	<tbody>
		<tr>
			<td style="height:114.0pt; width:3.25in">
			<p><strong><span style="color:#999999; font-family:arial; font-size:10.0pt">TH&Ocirc;NG TIN ĐƠN H&Agrave;NG</span></strong></p>

			<p>&nbsp;</p>

			<p><span style="font-family:arial; font-size:10.0pt">{order_address}</span></p>

			<p><span style="font-family:arial; font-size:10.0pt">{order_content}</span></p>

			<p>&nbsp;</p>

			<p><strong><span style="font-family:arial; font-size:10.0pt">Điện thoại:</span></strong><span style="font-family:arial; font-size:10.0pt">&nbsp;&nbsp;&nbsp; {order_phone}</span></p>

			<p><strong><span style="font-family:arial; font-size:10.0pt">Email:</span></strong><span style="font-family:arial; font-size:10.0pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {order_email}</span></p>
			</td>
		</tr>
	</tbody>
</table>

<p>&nbsp;</p>

<p>&nbsp;</p>
{order_list}

<table border="1" cellpadding="0" cellspacing="0" class="a2" style="border-collapse:collapse; border:none; width:624px">
	<tbody>
		<tr>
			<td style="width:31.5pt">
			<p style="text-align:center"><strong><span style="color:white; font-family:arial; font-size:10.0pt">Số lượng</span></strong></p>
			</td>
			<td style="width:309.0pt">
			<p><strong><span style="color:white; font-family:arial; font-size:10.0pt">T&ecirc;n sản phẩm</span></strong></p>
			</td>
			<td style="width:63.0pt">
			<p style="text-align:center"><strong><span style="color:white; font-family:arial; font-size:10.0pt">Đơn gi&aacute;</span></strong></p>
			</td>
			<td style="width:64.5pt">
			<p style="text-align:right"><strong><span style="color:white; font-family:arial; font-size:10.0pt">Th&agrave;nh tiền</span></strong></p>
			</td>
		</tr>
	</tbody>
</table>

<p style="text-align:right">&nbsp;</p>

<table border="1" cellpadding="0" cellspacing="0" class="a3" style="border-collapse:collapse; border:none; width:624px">
	<tbody>
		<tr>
			<td style="width:403.5pt">
			<p style="text-align:right"><strong><span style="font-family:arial; font-size:10.0pt">Tổng tiền </span></strong></p>
			</td>
			<td style="width:64.5pt">
			<p style="text-align:right"><span style="font-family:arial; font-size:10.0pt">{order_total}</span></p>
			</td>
		</tr>
	</tbody>
</table>

<p>&nbsp;</p>

<p><span style="color:#666666; font-family:arial">{store_name} xin ch&acirc;n th&agrave;nh cảm ơn Qu&yacute; kh&aacute;ch đ&atilde; tin tưởng v&agrave; đăng k&yacute; sử dụng dịch vụ của ch&uacute;ng t&ocirc;i. </span></p>

<p>&nbsp;</p>

<p><a href="{domain}"><span style="color:#CCCCCC; font-family:arial; font-size:10.0pt">{domain}</span></a><span style="color:#CCCCCC; font-family:arial; font-size:10.0pt">&nbsp;&nbsp; /&nbsp;&nbsp;&nbsp; </span><a href="{email}"><span style="color:#CCCCCC; font-family:arial; font-size:10.0pt">{email}</span></a></p>
</div>
', CAST(0xA52B03F1 AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (159, N'email_order_confirm', N'<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="Generator" content="Microsoft Word 14 (filtered)">
    <style>
        <!--
        /* Font Definitions */
        @font-face {
            font-family: Tahoma;
        }

        @font-face {
            font-family: Georgia;
        }

        @font-face {
            font-family: Arial;
        }
        /* Style Definitions */
        p.MsoNormal, li.MsoNormal, div.MsoNormal {
            margin: 0in;
            margin-bottom: .0001pt;
            line-height: 115%;
            font-size: 11.0pt;
            font-family: Arial,sans-serif;
            color: black;
        }

        h1 {
            margin-top: 24.0pt;
            margin-right: 0in;
            margin-bottom: 6.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 24.0pt;
            font-family: Arial,sans-serif;
            color: black;
        }

            h1.CxSpFirst {
                margin-top: 24.0pt;
                margin-right: 0in;
                margin-bottom: 0in;
                margin-left: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 24.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h1.CxSpMiddle {
                margin: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 24.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h1.CxSpLast {
                margin-top: 0in;
                margin-right: 0in;
                margin-bottom: 6.0pt;
                margin-left: 0in;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 24.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

        h2 {
            margin-top: .25in;
            margin-right: 0in;
            margin-bottom: 4.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 18.0pt;
            font-family: Arial,sans-serif;
            color: black;
        }

            h2.CxSpFirst {
                margin-top: .25in;
                margin-right: 0in;
                margin-bottom: 0in;
                margin-left: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 18.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h2.CxSpMiddle {
                margin: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 18.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h2.CxSpLast {
                margin-top: 0in;
                margin-right: 0in;
                margin-bottom: 4.0pt;
                margin-left: 0in;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 18.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

        h3 {
            margin-top: 14.0pt;
            margin-right: 0in;
            margin-bottom: 4.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 14.0pt;
            font-family: Arial,sans-serif;
            color: black;
        }

            h3.CxSpFirst {
                margin-top: 14.0pt;
                margin-right: 0in;
                margin-bottom: 0in;
                margin-left: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 14.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h3.CxSpMiddle {
                margin: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 14.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h3.CxSpLast {
                margin-top: 0in;
                margin-right: 0in;
                margin-bottom: 4.0pt;
                margin-left: 0in;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 14.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

        h4 {
            margin-top: 12.0pt;
            margin-right: 0in;
            margin-bottom: 2.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 12.0pt;
            font-family: Arial,sans-serif;
            color: black;
        }

            h4.CxSpFirst {
                margin-top: 12.0pt;
                margin-right: 0in;
                margin-bottom: 0in;
                margin-left: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 12.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h4.CxSpMiddle {
                margin: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 12.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h4.CxSpLast {
                margin-top: 0in;
                margin-right: 0in;
                margin-bottom: 2.0pt;
                margin-left: 0in;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 12.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

        h5 {
            margin-top: 11.0pt;
            margin-right: 0in;
            margin-bottom: 2.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 11.0pt;
            font-family: Arial,sans-serif;
            color: black;
        }

            h5.CxSpFirst {
                margin-top: 11.0pt;
                margin-right: 0in;
                margin-bottom: 0in;
                margin-left: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 11.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h5.CxSpMiddle {
                margin: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 11.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h5.CxSpLast {
                margin-top: 0in;
                margin-right: 0in;
                margin-bottom: 2.0pt;
                margin-left: 0in;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 11.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

        h6 {
            margin-top: 10.0pt;
            margin-right: 0in;
            margin-bottom: 2.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 10.0pt;
            font-family: Arial,sans-serif;
            color: black;
        }

            h6.CxSpFirst {
                margin-top: 10.0pt;
                margin-right: 0in;
                margin-bottom: 0in;
                margin-left: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 10.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h6.CxSpMiddle {
                margin: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 10.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h6.CxSpLast {
                margin-top: 0in;
                margin-right: 0in;
                margin-bottom: 2.0pt;
                margin-left: 0in;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 10.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

        p.MsoTitle, li.MsoTitle, div.MsoTitle {
            margin-top: 24.0pt;
            margin-right: 0in;
            margin-bottom: 6.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 36.0pt;
            font-family: Arial,sans-serif;
            color: black;
            font-weight: bold;
        }

        p.MsoTitleCxSpFirst, li.MsoTitleCxSpFirst, div.MsoTitleCxSpFirst {
            margin-top: 24.0pt;
            margin-right: 0in;
            margin-bottom: 0in;
            margin-left: 0in;
            margin-bottom: .0001pt;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 36.0pt;
            font-family: Arial,sans-serif;
            color: black;
            font-weight: bold;
        }

        p.MsoTitleCxSpMiddle, li.MsoTitleCxSpMiddle, div.MsoTitleCxSpMiddle {
            margin: 0in;
            margin-bottom: .0001pt;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 36.0pt;
            font-family: Arial,sans-serif;
            color: black;
            font-weight: bold;
        }

        p.MsoTitleCxSpLast, li.MsoTitleCxSpLast, div.MsoTitleCxSpLast {
            margin-top: 0in;
            margin-right: 0in;
            margin-bottom: 6.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 36.0pt;
            font-family: Arial,sans-serif;
            color: black;
            font-weight: bold;
        }

        p.MsoSubtitle, li.MsoSubtitle, div.MsoSubtitle {
            margin-top: .25in;
            margin-right: 0in;
            margin-bottom: 4.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 24.0pt;
            font-family: Georgia;
            color: #666666;
            font-style: italic;
        }

        p.MsoSubtitleCxSpFirst, li.MsoSubtitleCxSpFirst, div.MsoSubtitleCxSpFirst {
            margin-top: .25in;
            margin-right: 0in;
            margin-bottom: 0in;
            margin-left: 0in;
            margin-bottom: .0001pt;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 24.0pt;
            font-family: Georgia;
            color: #666666;
            font-style: italic;
        }

        p.MsoSubtitleCxSpMiddle, li.MsoSubtitleCxSpMiddle, div.MsoSubtitleCxSpMiddle {
            margin: 0in;
            margin-bottom: .0001pt;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 24.0pt;
            font-family: Georgia;
            color: #666666;
            font-style: italic;
        }

        p.MsoSubtitleCxSpLast, li.MsoSubtitleCxSpLast, div.MsoSubtitleCxSpLast {
            margin-top: 0in;
            margin-right: 0in;
            margin-bottom: 4.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 24.0pt;
            font-family: Georgia;
            color: #666666;
            font-style: italic;
        }

        p.MsoAcetate, li.MsoAcetate, div.MsoAcetate {
            mso-style-link: "Balloon Text Char";
            margin: 0in;
            margin-bottom: .0001pt;
            font-size: 8.0pt;
            font-family: Tahoma,sans-serif;
            color: black;
        }

        span.BalloonTextChar {
            mso-style-name: "Balloon Text Char";
            mso-style-link: "Balloon Text";
            font-family: Tahoma,sans-serif;
        }

        .MsoChpDefault {
            font-family: Arial,sans-serif;
            color: black;
        }

        .MsoPapDefault {
            line-height: 115%;
        }

        @page WordSection1 {
            size: 8.5in 11.0in;
            /*margin:1.0in 1.0in 1.0in 1.0in;*/
        }

        div.WordSection1 {
            page: WordSection1;
            width: 624px;
            margin: 0px auto;
        }
        -->
    </style>

</head>

<body bgcolor="white" lang="EN-US">

    <div class="WordSection1">

        <p class="MsoNormal" style="line-height: normal">&nbsp;</p>

        <table class="a0" border="1" cellspacing="0" cellpadding="0" width="624"
            style="border-collapse: collapse; border: none">
            <tr style="height: 135.0pt">
                <td width="245" valign="top" style="width: 183.75pt; border: solid white 1.0pt; padding: 0in 0in 0in 0in; height: 135.0pt">
                    <p class="MsoNormal" style="line-height: normal">
                        <img width="79" height="95"
                            id="image01.png" src="{domain}/images/logo.png">
                    </p>
                    <p class="MsoNormal">
                        <span style="font-size: 12.0pt; line-height: 115%; font-family: Arial; color: #CCCCCC">{store_name}</span>
                    </p>
                    <p class="MsoNormal">
                        <b><span style="font-size: 14pt; line-height: 115%; font-family: Arial">XÁC NHẬN ĐƠN HÀNG</span></b>
                    </p>
                </td>
                <td width="379" valign="top" style="width: 284.25pt; border: solid white 1.0pt; border-left: none; padding: 0in 0in 0in 0in; height: 135.0pt">
                    <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">&nbsp;</p>
                    <table class="a" border="1" cellspacing="0" cellpadding="0" width="376"
                        style="border-collapse: collapse; border: none">
                        <tr>
                            <td width="236" valign="top" style="width: 177.0pt; border: solid #CCCCCC 1.0pt; padding: .05in .05in .05in .05in">
                                <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                                    <b><span
                                        style="font-size: 10.0pt; font-family: Arial">Ngày tạo đơn hàng </span></b>
                                </p>
                            </td>
                            <td width="140" valign="top" style="width: 105.0pt; border: solid #CCCCCC 1.0pt; border-left: none; padding: .05in .05in .05in .05in">
                                <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                                    <span
                                        style="font-size: 10.0pt; font-family: Arial">{order_date}</span>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td width="236" valign="top" style="width: 177.0pt; border: solid #CCCCCC 1.0pt; border-top: none; padding: .05in .05in .05in .05in">
                                <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                                    <b><span
                                        style="font-size: 10.0pt; font-family: Arial">Tình trạng đơn hàng </span></b>
                                </p>
                            </td>
                            <td width="140" valign="top" style="width: 105.0pt; border-top: none; border-left: none; border-bottom: solid #CCCCCC 1.0pt; border-right: solid #CCCCCC 1.0pt; background: #FFFF99; padding: .05in .05in .05in .05in">
                                <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                                    <span
                                        style="font-size: 10.0pt; font-family: Arial">{order_status}</span>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td width="236" valign="top" style="width: 177.0pt; border: solid #CCCCCC 1.0pt; border-top: none; padding: .05in .05in .05in .05in">
                                <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                                    <b><span
                                        style="font-size: 10.0pt; font-family: Arial">Thanh toán</span></b>
                                </p>
                            </td>
                            <td width="140" valign="top" style="width: 105.0pt; border-top: none; border-left: none; border-bottom: solid #CCCCCC 1.0pt; border-right: solid #CCCCCC 1.0pt; padding: .05in .05in .05in .05in">
                                <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                                    <span
                                        style="font-size: 10.0pt; font-family: Arial">{payment_status}</span>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td width="236" valign="top" style="width: 177.0pt; border: solid #CCCCCC 1.0pt; border-top: none; padding: .05in .05in .05in .05in">
                                <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                                    <b><span
                                        style="font-size: 10.0pt; font-family: Arial">Mã đơn hàng</span></b>
                                </p>
                            </td>
                            <td width="140" valign="top" style="width: 105.0pt; border-top: none; border-left: none; border-bottom: solid #CCCCCC 1.0pt; border-right: solid #CCCCCC 1.0pt; padding: .05in .05in .05in .05in">
                                <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                                    <span
                                        style="font-size: 10.0pt; font-family: Arial">{order_id} </span>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td width="236" valign="top" style="width: 177.0pt; border: solid #CCCCCC 1.0pt; border-top: none; padding: .05in .05in .05in .05in">
                                <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                                    <b><span
                                        style="font-size: 10.0pt; font-family: Arial">Người đặt hàng </span></b>
                                </p>
                            </td>
                            <td width="140" valign="top" style="width: 105.0pt; border-top: none; border-left: none; border-bottom: solid #CCCCCC 1.0pt; border-right: solid #CCCCCC 1.0pt; padding: .05in .05in .05in .05in">
                                <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                                    <span
                                        style="font-size: 10.0pt; font-family: Arial">{order_name}</span>
                                </p>
                            </td>
                        </tr>
                    </table>
                    <p class="MsoNormal" style="line-height: normal">&nbsp;</p>
                    <p class="MsoNormal" style="line-height: normal">
                        <span style="font-size: 10.0pt; font-family: Arial"></span>
                    </p>
                </td>
            </tr>
        </table>

        <p class="MsoNormal">&nbsp;</p>

        <table class="a1" border="1" cellspacing="0" cellpadding="0" width="624"
            style="border-collapse: collapse; border: none">
            <tr style="height: 114.0pt">
                <td width="312" valign="top" style="width: 3.25in; border: solid white 1.0pt; padding: 0in 0in 0in 0in; height: 114.0pt">
                    <p class="MsoNormal">
                        <b><span style="font-size: 10.0pt; line-height: 115%; font-family: Arial; color: #999999">THÔNG TIN ĐƠN HÀNG</span></b>
                    </p>
                    <p class="MsoNormal">&nbsp;</p>
                    <p class="MsoNormal">
                        <span style="font-size: 10.0pt; line-height: 115%; font-family: Arial">{order_address}</span>
                    </p>
                    <p class="MsoNormal">
                        <span style="font-size: 10.0pt; line-height: 115%; font-family: Arial">{order_content}</span>
                    </p>                    
                    <p class="MsoNormal">&nbsp;</p>
                    <p class="MsoNormal">
                        <b><span style="font-size: 10.0pt; line-height: 115%; font-family: Arial">Điện thoại:</span></b><span style="font-size: 10.0pt; line-height: 115%; font-family: Arial">    {order_phone}</span>
                    </p>
                    <p class="MsoNormal">
                        <b><span style="font-size: 10.0pt; line-height: 115%; font-family: Arial">Email:</span></b><span style="font-size: 10.0pt; line-height: 115%; font-family: Arial">           {order_email}</span>
                    </p>
                </td>                
            </tr>
        </table>

        <p class="MsoNormal" style="line-height: 150%">&nbsp;</p>

        <p class="MsoNormal">&nbsp;</p>

        <table class="a2" border="1" cellspacing="0" cellpadding="0" width="624"
            style="border-collapse: collapse; border: none">
            <tr>
                <td width="42" valign="top" style="width: 31.5pt; border: solid silver 1.0pt; background: #006600; padding: .05in .05in .05in .05in">
                    <p class="MsoNormal" align="center" style="text-align: center; line-height: normal">
                        <b><span
                            style="font-size: 10.0pt; font-family: Arial; color: white">Số lượng</span></b>
                    </p>
                </td>
                <td width="412" valign="top" style="width: 309.0pt; border: solid silver 1.0pt; border-left: none; background: #006600; padding: .05in .05in .05in .05in">
                    <p class="MsoNormal" style="line-height: normal">
                        <b><span style="font-size: 10.0pt; font-family: Arial; color: white">Tên sản phẩm</span></b>
                    </p>
                </td>
                <td width="84" valign="top" style="width: 63.0pt; border: solid silver 1.0pt; border-left: none; background: #006600; padding: .05in .05in .05in .05in">
                    <p class="MsoNormal" align="center" style="text-align: center; line-height: normal">
                        <b><span
                            style="font-size: 10.0pt; font-family: Arial; color: white">Đơn giá</span></b>
                    </p>
                </td>
                <td width="86" valign="top" style="width: 64.5pt; border: solid silver 1.0pt; border-left: none; background: #006600; padding: .05in .05in .05in .05in">
                    <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                        <b><span
                            style="font-size: 10.0pt; font-family: Arial; color: white">Thành tiền</span></b>
                    </p>
                </td>
            </tr>
            {order_list}
        </table>

        <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">&nbsp;</p>

        <table class="a3" border="1" cellspacing="0" cellpadding="0" width="624"
            style="border-collapse: collapse; border: none">
            <tr>
                <td width="538" valign="top" style="width: 403.5pt; border: solid #CCCCCC 1.0pt; padding: .05in .05in .05in .05in">
                    <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                        <b><span
                            style="font-size: 10.0pt; font-family: Arial">Tổng tiền </span></b>
                    </p>
                </td>
                <td width="86" valign="top" style="width: 64.5pt; border: solid #CCCCCC 1.0pt; border-left: none; padding: .05in .05in .05in .05in">
                    <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                        <span
                            style="font-size: 10.0pt; font-family: Arial">{order_total}</span>
                    </p>
                </td>
            </tr>
        </table>

        <p class="MsoNormal">&nbsp;</p>

        <p class="MsoNormal">
            <span
                style="font-family: Arial; color: #666666"> {store_name} xin chân thành cảm ơn Quý khách đã tin tưởng và đăng ký sử dụng dịch vụ của chúng tôi. 
            </span>
        </p>

        <p class="MsoNormal">&nbsp;</p>

        <p class="MsoNormal">
            <a href="{domain}"><span style="font-size: 10.0pt; line-height: 115%; font-family: Arial; color: #CCCCCC">{dommain}</span></a><span
                style="font-size: 10.0pt; line-height: 115%; font-family: Arial; color: #CCCCCC">  
/    </span><a href="{email}"><span style="font-size: 10.0pt; line-height: 115%; font-family: Arial; color: #CCCCCC">{email}</span></a>
        </p>

    </div>

</body>

</html>', CAST(0xA52B03F1 AS SmallDateTime), 1, N'en')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (160, N'email_order_payment_change_status', N'<div class="WordSection1">
<p>&nbsp;</p>

<table border="1" cellpadding="0" cellspacing="0" class="a0" style="border-collapse:collapse; border:none; width:624px">
	<tbody>
		<tr>
			<td style="height:135.0pt; width:183.75pt">
			<p><img id="image01.png" src="/images/images/logo.png" style="height:95px; width:79px" /></p>

			<p><span style="color:#CCCCCC; font-family:arial; font-size:12.0pt">{store_name}</span></p>

			<p><strong><span style="font-family:arial; font-size:14pt">X&Aacute;C NHẬN THANH TO&Aacute;N</span></strong></p>
			</td>
			<td style="height:135.0pt; width:284.25pt">
			<p style="text-align:right">&nbsp;</p>

			<table border="1" cellpadding="0" cellspacing="0" class="a" style="border-collapse:collapse; border:none; width:376px">
				<tbody>
					<tr>
						<td style="width:177.0pt">
						<p style="text-align:right"><strong><span style="font-family:arial; font-size:10.0pt">Ng&agrave;y tạo đơn h&agrave;ng </span></strong></p>
						</td>
						<td style="width:105.0pt">
						<p style="text-align:right"><span style="font-family:arial; font-size:10.0pt">{order_date}</span></p>
						</td>
					</tr>
					<tr>
						<td style="width:177.0pt">
						<p style="text-align:right"><strong><span style="font-family:arial; font-size:10.0pt">T&igrave;nh trạng đơn h&agrave;ng </span></strong></p>
						</td>
						<td style="width:105.0pt">
						<p style="text-align:right"><span style="font-family:arial; font-size:10.0pt">{order_status}</span></p>
						</td>
					</tr>
					<tr>
						<td style="width:177.0pt">
						<p style="text-align:right"><strong><span style="font-family:arial; font-size:10.0pt">Thanh to&aacute;n</span></strong></p>
						</td>
						<td style="width:105.0pt">
						<p style="text-align:right"><span style="font-family:arial; font-size:10.0pt">{payment_status}</span></p>
						</td>
					</tr>
					<tr>
						<td style="width:177.0pt">
						<p style="text-align:right"><strong><span style="font-family:arial; font-size:10.0pt">M&atilde; đơn h&agrave;ng</span></strong></p>
						</td>
						<td style="width:105.0pt">
						<p style="text-align:right"><span style="font-family:arial; font-size:10.0pt">{order_id} </span></p>
						</td>
					</tr>
					<tr>
						<td style="width:177.0pt">
						<p style="text-align:right"><strong><span style="font-family:arial; font-size:10.0pt">Người đặt h&agrave;ng </span></strong></p>
						</td>
						<td style="width:105.0pt">
						<p style="text-align:right"><span style="font-family:arial; font-size:10.0pt">{order_name}</span></p>
						</td>
					</tr>
				</tbody>
			</table>

			<p>&nbsp;</p>

			<p>&nbsp;</p>
			</td>
		</tr>
	</tbody>
</table>

<p>&nbsp;</p>

<table border="1" cellpadding="0" cellspacing="0" class="a1" style="border-collapse:collapse; border:none; width:624px">
	<tbody>
		<tr>
			<td style="height:114.0pt; width:3.25in">
			<p><strong><span style="color:#999999; font-family:arial; font-size:10.0pt">TH&Ocirc;NG TIN ĐƠN H&Agrave;NG</span></strong></p>

			<p>&nbsp;</p>

			<p><span style="font-family:arial; font-size:10.0pt">{order_address}</span></p>

			<p><span style="font-family:arial; font-size:10.0pt">{order_content}</span></p>

			<p>&nbsp;</p>

			<p><strong><span style="font-family:arial; font-size:10.0pt">Điện thoại:</span></strong><span style="font-family:arial; font-size:10.0pt">&nbsp;&nbsp;&nbsp; {order_phone}</span></p>

			<p><strong><span style="font-family:arial; font-size:10.0pt">Email:</span></strong><span style="font-family:arial; font-size:10.0pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {order_email}</span></p>
			</td>
			<td style="height:114.0pt; width:3.25in">
			<p><strong><span style="color:#999999; font-family:arial; font-size:10.0pt">TH&Ocirc;NG TIN THANH TO&Aacute;N</span></strong></p>

			<p>&nbsp;</p>

			<p><span style="font-family:arial; font-size:10.0pt">Thanh to&aacute;n từ :{payment_gate}</span></p>

			<p><span style="font-family:arial; font-size:10.0pt">Kết quả :{payment_status}</span></p>

			<p>&nbsp;</p>

			<p><span style="font-family:arial; font-size:10.0pt">&nbsp;&nbsp;&nbsp; {payment_content}</span></p>
			</td>
		</tr>
	</tbody>
</table>

<p>&nbsp;</p>

<p>&nbsp;</p>
{order_list}

<table border="1" cellpadding="0" cellspacing="0" class="a2" style="border-collapse:collapse; border:none; width:624px">
	<tbody>
		<tr>
			<td style="width:31.5pt">
			<p style="text-align:center"><strong><span style="color:white; font-family:arial; font-size:10.0pt">Số lượng</span></strong></p>
			</td>
			<td style="width:309.0pt">
			<p><strong><span style="color:white; font-family:arial; font-size:10.0pt">T&ecirc;n sản phẩm</span></strong></p>
			</td>
			<td style="width:63.0pt">
			<p style="text-align:center"><strong><span style="color:white; font-family:arial; font-size:10.0pt">Đơn gi&aacute;</span></strong></p>
			</td>
			<td style="width:64.5pt">
			<p style="text-align:right"><strong><span style="color:white; font-family:arial; font-size:10.0pt">Th&agrave;nh tiền</span></strong></p>
			</td>
		</tr>
	</tbody>
</table>

<p style="text-align:right">&nbsp;</p>

<table border="1" cellpadding="0" cellspacing="0" class="a3" style="border-collapse:collapse; border:none; width:624px">
	<tbody>
		<tr>
			<td style="width:403.5pt">
			<p style="text-align:right"><strong><span style="font-family:arial; font-size:10.0pt">Tổng tiền </span></strong></p>
			</td>
			<td style="width:64.5pt">
			<p style="text-align:right"><span style="font-family:arial; font-size:10.0pt">{order_total}</span></p>
			</td>
		</tr>
	</tbody>
</table>

<p>&nbsp;</p>

<p><span style="color:#666666; font-family:arial">{store_name} xin ch&acirc;n th&agrave;nh cảm ơn Qu&yacute; kh&aacute;ch đ&atilde; tin tưởng v&agrave; đăng k&yacute; sử dụng dịch vụ của ch&uacute;ng t&ocirc;i. </span></p>

<p>&nbsp;</p>

<p><a href="{domain}"><span style="color:#CCCCCC; font-family:arial; font-size:10.0pt">{domain}</span></a><span style="color:#CCCCCC; font-family:arial; font-size:10.0pt">&nbsp;&nbsp; /&nbsp;&nbsp;&nbsp; </span><a href="{email}"><span style="color:#CCCCCC; font-family:arial; font-size:10.0pt">{email}</span></a></p>
</div>
', CAST(0xA52B03F1 AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (161, N'email_order_payment_change_status', N'<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <style>
        <!--
        /* Font Definitions */
        @font-face {
            font-family: Tahoma;
        }

        @font-face {
            font-family: Georgia;
        }

        @font-face {
            font-family: Arial;
        }
        /* Style Definitions */
        p.MsoNormal, li.MsoNormal, div.MsoNormal {
            margin: 0in;
            margin-bottom: .0001pt;
            line-height: 115%;
            font-size: 11.0pt;
            font-family: Arial,sans-serif;
            color: black;
        }

        h1 {
            margin-top: 24.0pt;
            margin-right: 0in;
            margin-bottom: 6.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 24.0pt;
            font-family: Arial,sans-serif;
            color: black;
        }

            h1.CxSpFirst {
                margin-top: 24.0pt;
                margin-right: 0in;
                margin-bottom: 0in;
                margin-left: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 24.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h1.CxSpMiddle {
                margin: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 24.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h1.CxSpLast {
                margin-top: 0in;
                margin-right: 0in;
                margin-bottom: 6.0pt;
                margin-left: 0in;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 24.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

        h2 {
            margin-top: .25in;
            margin-right: 0in;
            margin-bottom: 4.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 18.0pt;
            font-family: Arial,sans-serif;
            color: black;
        }

            h2.CxSpFirst {
                margin-top: .25in;
                margin-right: 0in;
                margin-bottom: 0in;
                margin-left: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 18.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h2.CxSpMiddle {
                margin: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 18.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h2.CxSpLast {
                margin-top: 0in;
                margin-right: 0in;
                margin-bottom: 4.0pt;
                margin-left: 0in;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 18.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

        h3 {
            margin-top: 14.0pt;
            margin-right: 0in;
            margin-bottom: 4.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 14.0pt;
            font-family: Arial,sans-serif;
            color: black;
        }

            h3.CxSpFirst {
                margin-top: 14.0pt;
                margin-right: 0in;
                margin-bottom: 0in;
                margin-left: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 14.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h3.CxSpMiddle {
                margin: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 14.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h3.CxSpLast {
                margin-top: 0in;
                margin-right: 0in;
                margin-bottom: 4.0pt;
                margin-left: 0in;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 14.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

        h4 {
            margin-top: 12.0pt;
            margin-right: 0in;
            margin-bottom: 2.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 12.0pt;
            font-family: Arial,sans-serif;
            color: black;
        }

            h4.CxSpFirst {
                margin-top: 12.0pt;
                margin-right: 0in;
                margin-bottom: 0in;
                margin-left: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 12.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h4.CxSpMiddle {
                margin: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 12.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h4.CxSpLast {
                margin-top: 0in;
                margin-right: 0in;
                margin-bottom: 2.0pt;
                margin-left: 0in;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 12.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

        h5 {
            margin-top: 11.0pt;
            margin-right: 0in;
            margin-bottom: 2.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 11.0pt;
            font-family: Arial,sans-serif;
            color: black;
        }

            h5.CxSpFirst {
                margin-top: 11.0pt;
                margin-right: 0in;
                margin-bottom: 0in;
                margin-left: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 11.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h5.CxSpMiddle {
                margin: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 11.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h5.CxSpLast {
                margin-top: 0in;
                margin-right: 0in;
                margin-bottom: 2.0pt;
                margin-left: 0in;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 11.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

        h6 {
            margin-top: 10.0pt;
            margin-right: 0in;
            margin-bottom: 2.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 10.0pt;
            font-family: Arial,sans-serif;
            color: black;
        }

            h6.CxSpFirst {
                margin-top: 10.0pt;
                margin-right: 0in;
                margin-bottom: 0in;
                margin-left: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 10.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h6.CxSpMiddle {
                margin: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 10.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h6.CxSpLast {
                margin-top: 0in;
                margin-right: 0in;
                margin-bottom: 2.0pt;
                margin-left: 0in;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 10.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

        p.MsoTitle, li.MsoTitle, div.MsoTitle {
            margin-top: 24.0pt;
            margin-right: 0in;
            margin-bottom: 6.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 36.0pt;
            font-family: Arial,sans-serif;
            color: black;
            font-weight: bold;
        }

        p.MsoTitleCxSpFirst, li.MsoTitleCxSpFirst, div.MsoTitleCxSpFirst {
            margin-top: 24.0pt;
            margin-right: 0in;
            margin-bottom: 0in;
            margin-left: 0in;
            margin-bottom: .0001pt;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 36.0pt;
            font-family: Arial,sans-serif;
            color: black;
            font-weight: bold;
        }

        p.MsoTitleCxSpMiddle, li.MsoTitleCxSpMiddle, div.MsoTitleCxSpMiddle {
            margin: 0in;
            margin-bottom: .0001pt;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 36.0pt;
            font-family: Arial,sans-serif;
            color: black;
            font-weight: bold;
        }

        p.MsoTitleCxSpLast, li.MsoTitleCxSpLast, div.MsoTitleCxSpLast {
            margin-top: 0in;
            margin-right: 0in;
            margin-bottom: 6.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 36.0pt;
            font-family: Arial,sans-serif;
            color: black;
            font-weight: bold;
        }

        p.MsoSubtitle, li.MsoSubtitle, div.MsoSubtitle {
            margin-top: .25in;
            margin-right: 0in;
            margin-bottom: 4.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 24.0pt;
            font-family: Georgia;
            color: #666666;
            font-style: italic;
        }

        p.MsoSubtitleCxSpFirst, li.MsoSubtitleCxSpFirst, div.MsoSubtitleCxSpFirst {
            margin-top: .25in;
            margin-right: 0in;
            margin-bottom: 0in;
            margin-left: 0in;
            margin-bottom: .0001pt;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 24.0pt;
            font-family: Georgia;
            color: #666666;
            font-style: italic;
        }

        p.MsoSubtitleCxSpMiddle, li.MsoSubtitleCxSpMiddle, div.MsoSubtitleCxSpMiddle {
            margin: 0in;
            margin-bottom: .0001pt;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 24.0pt;
            font-family: Georgia;
            color: #666666;
            font-style: italic;
        }

        p.MsoSubtitleCxSpLast, li.MsoSubtitleCxSpLast, div.MsoSubtitleCxSpLast {
            margin-top: 0in;
            margin-right: 0in;
            margin-bottom: 4.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 24.0pt;
            font-family: Georgia;
            color: #666666;
            font-style: italic;
        }

        p.MsoAcetate, li.MsoAcetate, div.MsoAcetate {
            mso-style-link: "Balloon Text Char";
            margin: 0in;
            margin-bottom: .0001pt;
            font-size: 8.0pt;
            font-family: Tahoma,sans-serif;
            color: black;
        }

        span.BalloonTextChar {
            mso-style-name: "Balloon Text Char";
            mso-style-link: "Balloon Text";
            font-family: Tahoma,sans-serif;
        }

        .MsoChpDefault {
            font-family: Arial,sans-serif;
            color: black;
        }

        .MsoPapDefault {
            line-height: 115%;
        }

        @page WordSection1 {
            size: 8.5in 11.0in;
            /*margin:1.0in 1.0in 1.0in 1.0in;*/
        }

        div.WordSection1 {
            page: WordSection1;
            width: 624px;
            margin: 0px auto;
        }
        -->
    </style>

</head>

<body bgcolor="white" lang="EN-US">

    <div class="WordSection1">

        <p class="MsoNormal" style="line-height: normal">&nbsp;</p>

        <table class="a0" border="1" cellspacing="0" cellpadding="0" width="624"
            style="border-collapse: collapse; border: none">
            <tr style="height: 135.0pt">
                <td width="245" valign="top" style="width: 183.75pt; border: solid white 1.0pt; padding: 0in 0in 0in 0in; height: 135.0pt">
                    <p class="MsoNormal" style="line-height: normal">
                        <img width="79" height="95"
                            id="image01.png" src="{domain}/images/logo.png">
                    </p>
                    <p class="MsoNormal">
                        <span style="font-size: 12.0pt; line-height: 115%; font-family: Arial; color: #CCCCCC">{store_name}</span>
                    </p>
                    <p class="MsoNormal">
                        <b><span style="font-size: 14pt; line-height: 115%; font-family: Arial">XÁC NHẬN THANH TOÁN</span></b>
                    </p>
                </td>
                <td width="379" valign="top" style="width: 284.25pt; border: solid white 1.0pt; border-left: none; padding: 0in 0in 0in 0in; height: 135.0pt">
                    <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">&nbsp;</p>
                    <table class="a" border="1" cellspacing="0" cellpadding="0" width="376"
                        style="border-collapse: collapse; border: none">
                        <tr>
                            <td width="236" valign="top" style="width: 177.0pt; border: solid #CCCCCC 1.0pt; padding: .05in .05in .05in .05in">
                                <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                                    <b><span
                                        style="font-size: 10.0pt; font-family: Arial">Ngày tạo đơn hàng </span></b>
                                </p>
                            </td>
                            <td width="140" valign="top" style="width: 105.0pt; border: solid #CCCCCC 1.0pt; border-left: none; padding: .05in .05in .05in .05in">
                                <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                                    <span
                                        style="font-size: 10.0pt; font-family: Arial">{order_date}</span>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td width="236" valign="top" style="width: 177.0pt; border: solid #CCCCCC 1.0pt; border-top: none; padding: .05in .05in .05in .05in">
                                <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                                    <b><span
                                        style="font-size: 10.0pt; font-family: Arial">Tình trạng đơn hàng </span></b>
                                </p>
                            </td>
                            <td width="140" valign="top" style="width: 105.0pt; border-top: none; border-left: none; border-bottom: solid #CCCCCC 1.0pt; border-right: solid #CCCCCC 1.0pt; background: #FFFF99; padding: .05in .05in .05in .05in">
                                <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                                    <span
                                        style="font-size: 10.0pt; font-family: Arial">{order_status}</span>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td width="236" valign="top" style="width: 177.0pt; border: solid #CCCCCC 1.0pt; border-top: none; padding: .05in .05in .05in .05in">
                                <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                                    <b><span
                                        style="font-size: 10.0pt; font-family: Arial">Thanh toán</span></b>
                                </p>
                            </td>
                            <td width="140" valign="top" style="width: 105.0pt; border-top: none; border-left: none; border-bottom: solid #CCCCCC 1.0pt; border-right: solid #CCCCCC 1.0pt; padding: .05in .05in .05in .05in">
                                <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                                    <span
                                        style="font-size: 10.0pt; font-family: Arial">{payment_status}</span>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td width="236" valign="top" style="width: 177.0pt; border: solid #CCCCCC 1.0pt; border-top: none; padding: .05in .05in .05in .05in">
                                <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                                    <b><span
                                        style="font-size: 10.0pt; font-family: Arial">Mã đơn hàng</span></b>
                                </p>
                            </td>
                            <td width="140" valign="top" style="width: 105.0pt; border-top: none; border-left: none; border-bottom: solid #CCCCCC 1.0pt; border-right: solid #CCCCCC 1.0pt; padding: .05in .05in .05in .05in">
                                <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                                    <span
                                        style="font-size: 10.0pt; font-family: Arial">{order_id} </span>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td width="236" valign="top" style="width: 177.0pt; border: solid #CCCCCC 1.0pt; border-top: none; padding: .05in .05in .05in .05in">
                                <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                                    <b><span
                                        style="font-size: 10.0pt; font-family: Arial">Người đặt hàng </span></b>
                                </p>
                            </td>
                            <td width="140" valign="top" style="width: 105.0pt; border-top: none; border-left: none; border-bottom: solid #CCCCCC 1.0pt; border-right: solid #CCCCCC 1.0pt; padding: .05in .05in .05in .05in">
                                <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                                    <span
                                        style="font-size: 10.0pt; font-family: Arial">{order_name}</span>
                                </p>
                            </td>
                        </tr>
                    </table>
                    <p class="MsoNormal" style="line-height: normal">&nbsp;</p>
                    <p class="MsoNormal" style="line-height: normal">
                        <span style="font-size: 10.0pt; font-family: Arial"></span>
                    </p>
                </td>
            </tr>
        </table>

        <p class="MsoNormal">&nbsp;</p>

        <table class="a1" border="1" cellspacing="0" cellpadding="0" width="624"
            style="border-collapse: collapse; border: none">
            <tr style="height: 114.0pt">
                <td width="312" valign="top" style="width: 3.25in; border: solid white 1.0pt; padding: 0in 0in 0in 0in; height: 114.0pt">
                    <p class="MsoNormal">
                        <b><span style="font-size: 10.0pt; line-height: 115%; font-family: Arial; color: #999999">THÔNG TIN ĐƠN HÀNG</span></b>
                    </p>
                    <p class="MsoNormal">&nbsp;</p>
                    <p class="MsoNormal">
                        <span style="font-size: 10.0pt; line-height: 115%; font-family: Arial">{order_address}</span>
                    </p>
                    <p class="MsoNormal">
                        <span style="font-size: 10.0pt; line-height: 115%; font-family: Arial">{order_content}</span>
                    </p>                    
                    <p class="MsoNormal">&nbsp;</p>
                    <p class="MsoNormal">
                        <b><span style="font-size: 10.0pt; line-height: 115%; font-family: Arial">Điện thoại:</span></b><span style="font-size: 10.0pt; line-height: 115%; font-family: Arial">    {order_phone}</span>
                    </p>
                    <p class="MsoNormal">
                        <b><span style="font-size: 10.0pt; line-height: 115%; font-family: Arial">Email:</span></b><span style="font-size: 10.0pt; line-height: 115%; font-family: Arial">           {order_email}</span>
                    </p>
                </td>
                
                <td width="312" valign="top" style="width: 3.25in; border: solid white 1.0pt; padding: 0in 0in 0in 0in; height: 114.0pt">
                    <p class="MsoNormal">
                        <b><span style="font-size: 10.0pt; line-height: 115%; font-family: Arial; color: #999999">THÔNG TIN THANH TOÁN</span></b>
                    </p>
                    <p class="MsoNormal">&nbsp;</p>
                    <p class="MsoNormal">
                        <span style="font-size: 10.0pt; line-height: 115%; font-family: Arial">Thanh toán từ :{payment_gate}</span>
                    </p>
                    <p class="MsoNormal">
                        <span style="font-size: 10.0pt; line-height: 115%; font-family: Arial">Kết quả :{payment_status}</span>
                    </p>                    
                    <p class="MsoNormal">&nbsp;</p>
                    <p class="MsoNormal">
                        <span style="font-size: 10.0pt; line-height: 115%; font-family: Arial">    {payment_content}</span>
                    </p>                    
                </td>                
            </tr>
        </table>

        <p class="MsoNormal" style="line-height: 150%">&nbsp;</p>

        <p class="MsoNormal">&nbsp;</p>

        <table class="a2" border="1" cellspacing="0" cellpadding="0" width="624"
            style="border-collapse: collapse; border: none">
            <tr>
                <td width="42" valign="top" style="width: 31.5pt; border: solid silver 1.0pt; background: #006600; padding: .05in .05in .05in .05in">
                    <p class="MsoNormal" align="center" style="text-align: center; line-height: normal">
                        <b><span
                            style="font-size: 10.0pt; font-family: Arial; color: white">Số lượng</span></b>
                    </p>
                </td>
                <td width="412" valign="top" style="width: 309.0pt; border: solid silver 1.0pt; border-left: none; background: #006600; padding: .05in .05in .05in .05in">
                    <p class="MsoNormal" style="line-height: normal">
                        <b><span style="font-size: 10.0pt; font-family: Arial; color: white">Tên sản phẩm</span></b>
                    </p>
                </td>
                <td width="84" valign="top" style="width: 63.0pt; border: solid silver 1.0pt; border-left: none; background: #006600; padding: .05in .05in .05in .05in">
                    <p class="MsoNormal" align="center" style="text-align: center; line-height: normal">
                        <b><span
                            style="font-size: 10.0pt; font-family: Arial; color: white">Đơn giá</span></b>
                    </p>
                </td>
                <td width="86" valign="top" style="width: 64.5pt; border: solid silver 1.0pt; border-left: none; background: #006600; padding: .05in .05in .05in .05in">
                    <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                        <b><span
                            style="font-size: 10.0pt; font-family: Arial; color: white">Thành tiền</span></b>
                    </p>
                </td>
            </tr>
            {order_list}
        </table>

        <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">&nbsp;</p>

        <table class="a3" border="1" cellspacing="0" cellpadding="0" width="624"
            style="border-collapse: collapse; border: none">
            <tr>
                <td width="538" valign="top" style="width: 403.5pt; border: solid #CCCCCC 1.0pt; padding: .05in .05in .05in .05in">
                    <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                        <b><span
                            style="font-size: 10.0pt; font-family: Arial">Tổng tiền </span></b>
                    </p>
                </td>
                <td width="86" valign="top" style="width: 64.5pt; border: solid #CCCCCC 1.0pt; border-left: none; padding: .05in .05in .05in .05in">
                    <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                        <span
                            style="font-size: 10.0pt; font-family: Arial">{order_total}</span>
                    </p>
                </td>
            </tr>
        </table>

        <p class="MsoNormal">&nbsp;</p>

        <p class="MsoNormal">
            <span
                style="font-family: Arial; color: #666666"> {store_name} xin chân thành cảm ơn Quý khách đã tin tưởng và đăng ký sử dụng dịch vụ của chúng tôi. 
            </span>
        </p>

        <p class="MsoNormal">&nbsp;</p>

        <p class="MsoNormal">
            <a href="{domain}"><span style="font-size: 10.0pt; line-height: 115%; font-family: Arial; color: #CCCCCC">{domain}</span></a><span
                style="font-size: 10.0pt; line-height: 115%; font-family: Arial; color: #CCCCCC">  
/    </span><a href="{email}"><span style="font-size: 10.0pt; line-height: 115%; font-family: Arial; color: #CCCCCC">{email}</span></a>
        </p>

    </div>

</body>

</html>', CAST(0xA52B03F1 AS SmallDateTime), 1, N'en')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (162, N'email_confirm_forgot_password', N'<div class="WordSection1">
<p>&nbsp;</p>

<p>Xin ch&agrave;o bạn {email_client},</p>

<p>Bạn vừa gửi y&ecirc;u cầu lấy lại mật khẩu tại {domain}. Bạn cần nhập m&atilde; sau v&agrave;o &ocirc; x&aacute;c thực.</p>

<p>M&atilde; x&aacute;c thực:</p>

<p><strong>{code}</strong></p>

<p>H&atilde;y click v&agrave;o link : {link} để tiếp tục qu&aacute; tr&igrave;nh lấy lại mật khẩu.</p>

<p>Nếu bạn kh&ocirc;ng y&ecirc;u cầu lấy lại mật khẩu hoặc c&oacute; nhầm lẫn vui l&ograve;ng bỏ qua email n&agrave;y.</p>

<p>Xin cảm ơn bạn đ&atilde; sử dụng dịch vụ của ch&uacute;ng t&ocirc;i!</p>

<p>Lưu &yacute;: Đ&acirc;y l&agrave; email trả lời tự động, bạn vui l&ograve;ng kh&ocirc;ng gửi phản hồi về email n&agrave;y.</p>

<p><span style="color:#666666; font-family:arial">{store_name} xin ch&acirc;n th&agrave;nh cảm ơn Qu&yacute; kh&aacute;ch đ&atilde; tin tưởng v&agrave; đăng k&yacute; sử dụng dịch vụ của ch&uacute;ng t&ocirc;i. </span></p>

<p>&nbsp;</p>

<p><a href="{domain}"><span style="color:#CCCCCC; font-family:arial; font-size:10.0pt">{domain}</span></a><span style="color:#CCCCCC; font-family:arial; font-size:10.0pt">&nbsp;&nbsp; /&nbsp;&nbsp;&nbsp; </span><a href="{email}"><span style="color:#CCCCCC; font-family:arial; font-size:10.0pt">{email}</span></a></p>
</div>
', CAST(0xA52B03F1 AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (163, N'email_confirm_forgot_password', N'<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <style>
        <!--
        /* Font Definitions */
        @font-face {
            font-family: Tahoma;
        }

        @font-face {
            font-family: Georgia;
        }

        @font-face {
            font-family: Arial;
        }
        /* Style Definitions */
        p.MsoNormal, li.MsoNormal, div.MsoNormal {
            margin: 0in;
            margin-bottom: .0001pt;
            line-height: 115%;
            font-size: 11.0pt;
            font-family: Arial,sans-serif;
            color: black;
        }

        h1 {
            margin-top: 24.0pt;
            margin-right: 0in;
            margin-bottom: 6.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 24.0pt;
            font-family: Arial,sans-serif;
            color: black;
        }

            h1.CxSpFirst {
                margin-top: 24.0pt;
                margin-right: 0in;
                margin-bottom: 0in;
                margin-left: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 24.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h1.CxSpMiddle {
                margin: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 24.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h1.CxSpLast {
                margin-top: 0in;
                margin-right: 0in;
                margin-bottom: 6.0pt;
                margin-left: 0in;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 24.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

        h2 {
            margin-top: .25in;
            margin-right: 0in;
            margin-bottom: 4.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 18.0pt;
            font-family: Arial,sans-serif;
            color: black;
        }

            h2.CxSpFirst {
                margin-top: .25in;
                margin-right: 0in;
                margin-bottom: 0in;
                margin-left: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 18.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h2.CxSpMiddle {
                margin: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 18.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h2.CxSpLast {
                margin-top: 0in;
                margin-right: 0in;
                margin-bottom: 4.0pt;
                margin-left: 0in;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 18.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

        h3 {
            margin-top: 14.0pt;
            margin-right: 0in;
            margin-bottom: 4.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 14.0pt;
            font-family: Arial,sans-serif;
            color: black;
        }

            h3.CxSpFirst {
                margin-top: 14.0pt;
                margin-right: 0in;
                margin-bottom: 0in;
                margin-left: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 14.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h3.CxSpMiddle {
                margin: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 14.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h3.CxSpLast {
                margin-top: 0in;
                margin-right: 0in;
                margin-bottom: 4.0pt;
                margin-left: 0in;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 14.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

        h4 {
            margin-top: 12.0pt;
            margin-right: 0in;
            margin-bottom: 2.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 12.0pt;
            font-family: Arial,sans-serif;
            color: black;
        }

            h4.CxSpFirst {
                margin-top: 12.0pt;
                margin-right: 0in;
                margin-bottom: 0in;
                margin-left: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 12.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h4.CxSpMiddle {
                margin: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 12.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h4.CxSpLast {
                margin-top: 0in;
                margin-right: 0in;
                margin-bottom: 2.0pt;
                margin-left: 0in;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 12.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

        h5 {
            margin-top: 11.0pt;
            margin-right: 0in;
            margin-bottom: 2.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 11.0pt;
            font-family: Arial,sans-serif;
            color: black;
        }

            h5.CxSpFirst {
                margin-top: 11.0pt;
                margin-right: 0in;
                margin-bottom: 0in;
                margin-left: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 11.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h5.CxSpMiddle {
                margin: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 11.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h5.CxSpLast {
                margin-top: 0in;
                margin-right: 0in;
                margin-bottom: 2.0pt;
                margin-left: 0in;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 11.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

        h6 {
            margin-top: 10.0pt;
            margin-right: 0in;
            margin-bottom: 2.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 10.0pt;
            font-family: Arial,sans-serif;
            color: black;
        }

            h6.CxSpFirst {
                margin-top: 10.0pt;
                margin-right: 0in;
                margin-bottom: 0in;
                margin-left: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 10.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h6.CxSpMiddle {
                margin: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 10.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h6.CxSpLast {
                margin-top: 0in;
                margin-right: 0in;
                margin-bottom: 2.0pt;
                margin-left: 0in;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 10.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

        p.MsoTitle, li.MsoTitle, div.MsoTitle {
            margin-top: 24.0pt;
            margin-right: 0in;
            margin-bottom: 6.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 36.0pt;
            font-family: Arial,sans-serif;
            color: black;
            font-weight: bold;
        }

        p.MsoTitleCxSpFirst, li.MsoTitleCxSpFirst, div.MsoTitleCxSpFirst {
            margin-top: 24.0pt;
            margin-right: 0in;
            margin-bottom: 0in;
            margin-left: 0in;
            margin-bottom: .0001pt;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 36.0pt;
            font-family: Arial,sans-serif;
            color: black;
            font-weight: bold;
        }

        p.MsoTitleCxSpMiddle, li.MsoTitleCxSpMiddle, div.MsoTitleCxSpMiddle {
            margin: 0in;
            margin-bottom: .0001pt;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 36.0pt;
            font-family: Arial,sans-serif;
            color: black;
            font-weight: bold;
        }

        p.MsoTitleCxSpLast, li.MsoTitleCxSpLast, div.MsoTitleCxSpLast {
            margin-top: 0in;
            margin-right: 0in;
            margin-bottom: 6.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 36.0pt;
            font-family: Arial,sans-serif;
            color: black;
            font-weight: bold;
        }

        p.MsoSubtitle, li.MsoSubtitle, div.MsoSubtitle {
            margin-top: .25in;
            margin-right: 0in;
            margin-bottom: 4.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 24.0pt;
            font-family: Georgia;
            color: #666666;
            font-style: italic;
        }

        p.MsoSubtitleCxSpFirst, li.MsoSubtitleCxSpFirst, div.MsoSubtitleCxSpFirst {
            margin-top: .25in;
            margin-right: 0in;
            margin-bottom: 0in;
            margin-left: 0in;
            margin-bottom: .0001pt;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 24.0pt;
            font-family: Georgia;
            color: #666666;
            font-style: italic;
        }

        p.MsoSubtitleCxSpMiddle, li.MsoSubtitleCxSpMiddle, div.MsoSubtitleCxSpMiddle {
            margin: 0in;
            margin-bottom: .0001pt;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 24.0pt;
            font-family: Georgia;
            color: #666666;
            font-style: italic;
        }

        p.MsoSubtitleCxSpLast, li.MsoSubtitleCxSpLast, div.MsoSubtitleCxSpLast {
            margin-top: 0in;
            margin-right: 0in;
            margin-bottom: 4.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 24.0pt;
            font-family: Georgia;
            color: #666666;
            font-style: italic;
        }

        p.MsoAcetate, li.MsoAcetate, div.MsoAcetate {
            mso-style-link: "Balloon Text Char";
            margin: 0in;
            margin-bottom: .0001pt;
            font-size: 8.0pt;
            font-family: Tahoma,sans-serif;
            color: black;
        }

        span.BalloonTextChar {
            mso-style-name: "Balloon Text Char";
            mso-style-link: "Balloon Text";
            font-family: Tahoma,sans-serif;
        }

        .MsoChpDefault {
            font-family: Arial,sans-serif;
            color: black;
        }

        .MsoPapDefault {
            line-height: 115%;
        }

        @page WordSection1 {
            size: 8.5in 11.0in;
            /*margin:1.0in 1.0in 1.0in 1.0in;*/
        }

        div.WordSection1 {
            page: WordSection1;
            width: 624px;
            margin: 0px auto;
        }
        -->
    </style>

</head>

<body bgcolor="white" lang="EN-US">

    <div class="WordSection1">

        <p class="MsoNormal" style="line-height: normal">&nbsp;</p>
        
        <p class="MsoNormal">Xin chào bạn {email_client},</p>

		<p class="MsoNormal">Bạn vừa gửi yêu cầu lấy lại mật khẩu tại {domain}. Bạn cần nhập mã sau vào ô xác thực hoặc click vào {link} này để tiếp tục quá trình lấy lại mật khẩu.</p>

		<p class="MsoNormal">Mã xác thực:</p>

		<p class="MsoNormal"><strong>{code}</strong></p>
		
		<p class="MsoNormal">Nếu bạn không yêu cầu lấy lại mật khẩu hoặc có nhầm lẫn vui lòng bỏ qua email này.</p>

		<p class="MsoNormal">Xin cảm ơn bạn đã sử dụng dịch vụ của chúng tôi!</p>

		<p class="MsoNormal">Lưu ý: Đây là email trả lời tự động, bạn vui lòng không gửi phản hồi về email này.</p>

        <p class="MsoNormal">
            <span
                style="font-family: Arial; color: #666666"> {store_name} xin chân thành cảm ơn Quý khách đã tin tưởng và đăng ký sử dụng dịch vụ của chúng tôi. 
            </span>
        </p>

        <p class="MsoNormal">&nbsp;</p>

        <p class="MsoNormal">
            <a href="{domain}"><span style="font-size: 10.0pt; line-height: 115%; font-family: Arial; color: #CCCCCC">{domain}</span></a><span
                style="font-size: 10.0pt; line-height: 115%; font-family: Arial; color: #CCCCCC">  
/    </span><a href="{email}"><span style="font-size: 10.0pt; line-height: 115%; font-family: Arial; color: #CCCCCC">{email}</span></a>
        </p>

    </div>

</body>

</html>', CAST(0xA52B03F1 AS SmallDateTime), 1, N'en')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (164, N'contactdetail', N'<h3><i class="fa fa-thumb-tack"></i>Our Address</h3>
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.                                    
                                </p>
                                <hr>
                                <h3><i class="fa fa-phone"></i>Contact Phone</h3>
                                <p>
                                    (123) 456 789 101 <br>    (789) 456 789 202                               
                                </p>
                                <hr>
                                <h3><i class="fa fa-envelope-o"></i>E-mail</h3>
                                <p>
                                    support@yousite.com <br>    send@message.com                               
                                </p>', CAST(0xA4130000 AS SmallDateTime), 1, N'en')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (166, N'keywords', N'hair salon', CAST(0xA5EE056D AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (168, N'pagename', N'Belle Hair Salon', CAST(0xA57F039A AS SmallDateTime), 1, N'en')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (170, N'description', N'Belle hair salon', CAST(0xA57F039A AS SmallDateTime), 1, N'en')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (171, N'pagefooter1', N'<h4>Cam kết</h4>
    <div class="menu-about-us-menu-container">
        <p>
            Belle Beauty Hair & Spa cam kết chỉ sử dụng những dòng mỹ phẩm chất lượng cao, có nguồn gốc từ thiên nhiên, đảm bảo không gây kích ứng, mang lại hiệu quả rõ ràng cho khách hàng.
        </p>
    </div>', CAST(0xA57F039A AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (172, N'pagefooter1', N'<div class="header-footer">
                        <h3>About us</h3>
                    </div>
                    <div class="inner-block">
                        <p>
                            We are <a href="#">MosaicDesign</a> group and we make modern, creative templetes. Our team created Responsive Premiuem E-commerce template 
                        </p>
                    </div>', CAST(0xA57F039A AS SmallDateTime), 1, N'en')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (173, N'pagefooter2', N'<h4>Dịch vụ</h4>
    <div class="menu-about-us-menu-container">
        <ul id="menu-about-us-menu" class="menu">
            <li id="menu-item-973" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-973"><a href="#"><span>Uốn tóc</span></a></li>
            <li id="menu-item-974" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-974"><a href="#"><span>Nhuộm hấp</span></a></li>
            <li id="menu-item-975" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-975"><a href="#"><span>Thiết kế tạo mẫu</span></a></li>
            <li id="menu-item-976" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-976"><a href="#"><span>Cắt tóc nam</span></a></li>
            <li id="menu-item-977" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-977"><a href="#"><span>Chắm sóc tóc đẹp</span></a></li>
        </ul>
    </div>', CAST(0xA57F039A AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (174, N'pagefooter2', N'<div class="inner-block">
                        <div class="header-footer">
                            <h3>My Account</h3>
                        </div>
                        <ul class="footer-categories list-unstyled">
                            <li><a href="#">My Account</a></li>
                            <li><a href="#">Wish List</a></li>
                            <li><a href="#">Order History</a></li>
                            <li><a href="#">Brands</a></li>
                            <li><a href="#">Specials</a></li>
                            <li><a href="#">Newsletter</a></li>
                            <li><a href="#">Secure payment</a></li>
                        </ul>
                    </div>', CAST(0xA57F039A AS SmallDateTime), 1, N'en')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (175, N'pagefooter3', N'<h4>Bella Hair Salon</h4>
    <div class="menu-about-us-menu-container">
        <ul id="menu-about-us-menu" class="menu">
            <li id="menu-item-973" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-973">Số 20 Hoàng Ngọc Phách, Láng Hạ, Đống Đa,Hà Nội</li>
            <li id="menu-item-974" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-974">0996661112</li>
            <li id="menu-item-975" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-975">0946661112</li>
            <li id="menu-item-976" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-976">info@bellebeaute.vn</li>
        </ul>
    </div>', CAST(0xA57F039A AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (176, N'pagefooter3', N'<div class="inner-block clearfix">
                        <div class="header-footer">
                            <h3>Instagram</h3>
                        </div>
                        <ul class="list-unstyled flickr">
                            <li><a href="#">
                                <img src="/Content/themes/shop/img/preview/blog1.jpg" class="img-responsive" alt=""></a></li>
                            <li><a href="#">
                                <img src="/Content/themes/shop/img/preview/blog2.jpg" class="img-responsive" alt=""></a></li>
                            <li><a href="#">
                                <img src="/Content/themes/shop/img/preview/blog5.jpg" class="img-responsive" alt=""></a></li>
                            <li><a href="#">
                                <img src="/Content/themes/shop/img/preview/blog3.jpg" class="img-responsive" alt=""></a></li>
                            <li><a href="#">
                                <img src="/Content/themes/shop/img/preview/blog4.jpg" class="img-responsive" alt=""></a></li>
                            <li><a href="#">
                                <img src="/Content/themes/shop/img/preview/blog6.jpg" class="img-responsive" alt=""></a></li>
                            <li><a href="#">
                                <img src="/Content/themes/shop/img/preview/blog7.jpg" class="img-responsive" alt=""></a></li>
                            <li><a href="#">
                                <img src="/Content/themes/shop/img/preview/blog8.jpg" class="img-responsive" alt=""></a></li>
                        </ul>
                    </div>', CAST(0xA57F039A AS SmallDateTime), 1, N'en')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (177, N'pagefooter4', N'<h4 class="footer-widget-title">OPENING TIME</h4>
                    <dl>
                        <dt>Monday</dt>
                        <dd>08:00 - 17:30</dd>
                    </dl>
                    <dl>
                        <dt>Tuesday</dt>
                        <dd>08:00 - 17:30</dd>
                    </dl>
                    <dl>
                        <dt>Wednesday</dt>
                        <dd>08:00 - 17:30</dd>
                    </dl>
                    <dl>
                        <dt>Thursday</dt>
                        <dd>08:00 - 17:30</dd>
                    </dl>
                    <dl>
                        <dt>Friday</dt>
                        <dd>08:00 - 17:30</dd>
                    </dl>
                    <dl>
                        <dt>Saturday</dt>
                        <dd>12:00 - 17:30</dd>
                    </dl>
                    <dl>
                        <dt>Sunday</dt>
                        <dd>CLOSED</dd>
                    </dl>', CAST(0xA57F039A AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (178, N'pagefooter4', N'<div class="inner-block">
                        <div class="header-footer">
                            <h3>Address</h3>
                        </div>
                        <ul class="footer-categories list-unstyled">
                            <li><i class="fa fa-map-marker fa-lg"></i>&nbsp; 2901 Marmora Road, Glassgow, Seattle, WA 98122-1090</li>
                            <li><i class="fa fa-phone"></i>&nbsp; 9 - 876 - 543 - 210 </li>
                            <li><i class="fa fa-print"></i>&nbsp; 1 - 234 - 567 - 890</li>
                            <li><a href="mailto:info@yourdomain.com"><i class="fa fa-envelope"></i>&nbsp; info@yourdomain.com</a></li>
                            <li><a href="mailto:support@yourdomain.com"><i class="fa fa-envelope"></i>&nbsp; support@yourdomain.com</a></li>
                            <li><a href="#"><i class="fa fa-thumb-tack"></i>&nbsp;&nbsp; Location in Google Maps</a></li>
                        </ul>
                    </div>', CAST(0xA57F039A AS SmallDateTime), 1, N'en')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (179, N'pagefooter5', N'Design by soncoi.net', CAST(0xA57F039A AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (180, N'pagefooter5', N'<a href="https://www.facebook.com/Belle-Hair-Salon-450987675084279" target="_blank" class="symbol-facebook"><span class="tooltip symbol" title="Facebook">&#xe027;</span></a>', CAST(0xA57F039A AS SmallDateTime), 1, N'en')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (181, N'address', N'Số 20 Hoàng Ngọc Phách, Láng Hạ, Đống Đa, Hà Nội', CAST(0xA5EE056D AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (182, N'address', N'3D buildings, Duy Tan Street, Cau Giay District, Hanoi', CAST(0xA57F039A AS SmallDateTime), 1, N'en')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (183, N'pagefooter', N'© 2016 Belle - All Rights Reserved', CAST(0xA57F039A AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (184, N'pagefooter', N'<div class="col-md-6">
                    <div class="socials">
                        <a href="#"><i class="fa fa-skype"></i></a>
                        <a href="#"><i class="fa fa-linkedin"></i></a>
                        <a href="#"><i class="fa fa-facebook"></i></a>
                        <a href="#"><i class="fa fa-twitter"></i></a>
                        <a href="#"><i class="fa fa-google-plus"></i></a>
                    </div>
                </div>
                <div class="col-md-6">
                    <ul class="footer-payments pull-right">
                        <li>
                            <img src="/Content/themes/shop/img/payment-maestro.jpg" alt="payment" /></li>
                        <li>
                            <img src="/Content/themes/shop/img/payment-discover.jpg" alt="payment" /></li>
                        <li>
                            <img src="/Content/themes/shop/img/payment-visa.jpg" alt="payment" /></li>
                        <li>
                            <img src="/Content/themes/shop/img/payment-american-express.jpg" alt="payment" /></li>
                        <li>
                            <img src="/Content/themes/shop/img/payment-paypal.jpg" alt="payment" /></li>
                    </ul>
                </div>', CAST(0xA57F039A AS SmallDateTime), 1, N'en')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (185, N'slogan', N'Làm đẹp theo cách của bạn!', CAST(0xA5EE056D AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (186, N'slogan', N'Làm đẹp theo cách của bạn!', CAST(0xA57F039A AS SmallDateTime), 1, N'en')
SET IDENTITY_INSERT [dbo].[_General] OFF
/****** Object:  Table [dbo].[_Contact]    Script Date: 05/06/2016 16:06:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[_Contact](
	[ContactId] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](250) NULL,
	[email] [nvarchar](50) NULL,
	[contents] [nvarchar](4000) NULL,
	[phone] [varchar](30) NULL,
	[address] [nvarchar](150) NULL,
	[createdate] [datetime] NULL,
 CONSTRAINT [PK__Contact] PRIMARY KEY CLUSTERED 
(
	[ContactId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[_Contact] ON
INSERT [dbo].[_Contact] ([ContactId], [name], [email], [contents], [phone], [address], [createdate]) VALUES (17, N'a', N'a', N'a', N'a', N'a', CAST(0x0000A58900A36348 AS DateTime))
SET IDENTITY_INSERT [dbo].[_Contact] OFF
/****** Object:  StoredProcedure [dbo].[_Catalog_GetParent]    Script Date: 05/06/2016 16:06:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[_Catalog_GetParent]
	@CatalogID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	--declare @CatalogID int
	declare @CatalogParent int
	declare @IsTop int
	--set @CatalogID = 10
	set @CatalogParent = @CatalogID
	set @IsTop=1

	while(@IsTop <> -1)
	begin
		set @CatalogParent = @CatalogID
		set @IsTop = (select ParentID from dbo._CatalogProduct where CatalogID=@CatalogID)
		if (@IsTop =0) 
			begin set @IsTop =-1 end
		else  
			begin set @CatalogID = @IsTop end
	end
	select @CatalogParent as CatalogParent
END
GO
/****** Object:  StoredProcedure [dbo].[_Catalog_GetByProductHot]    Script Date: 05/06/2016 16:06:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[_Catalog_GetByProductHot]
	@Lang nvarchar(10)
AS
BEGIN
	select DISTINCT c.* from _Product p CROSS APPLY [dbo].ConvertDelimitedListIntoTable(p.CatalogID,',') prop 
	inner join _Catalog c on prop.item = c.CatalogID Where p.IsHot = 'true' 
	AND LTRIM(RTRIM(c.Lang)) = LTRIM(RTRIM(@Lang))
END
GO
/****** Object:  Table [dbo].[_Catalog]    Script Date: 05/06/2016 16:06:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_Catalog](
	[CatalogID] [int] IDENTITY(1,1) NOT NULL,
	[ParentID] [int] NULL,
	[CategoryName] [nvarchar](100) NULL,
	[Link] [nvarchar](100) NULL,
	[ImagePath] [nvarchar](200) NULL,
	[Intro] [nvarchar](max) NULL,
	[MoreInfo] [nvarchar](max) NULL,
	[Lang] [nvarchar](10) NULL,
	[Show] [bit] NULL,
	[Keyword] [nvarchar](500) NULL,
	[Description] [nvarchar](500) NULL,
	[Title] [nvarchar](500) NULL,
	[Type] [nvarchar](50) NULL,
	[OrderDisplay] [int] NULL,
 CONSTRAINT [PK_CatalogProduct] PRIMARY KEY CLUSTERED 
(
	[CatalogID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[_Catalog] ON
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (39, 0, N'Áo Phông', N'Ao-Phong', N'/images/photoproduct/2015/12/sc_small_2069_auto2.jpg', N'abc', N'<p>def</p>
', N'vi', 1, N' T shirts', N' T shirts', N' T shirts', N'SP', 1)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (40, 0, N'Quần', N'Quan', N'0', N'', N'', N'vi  ', 1, N'Pants', N'Pants', N'Pants', N'SP', 2)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (41, 0, N'Bộ váy', N'Bo-vay', N'0', N'', N'', N'vi  ', 1, N'Dresses', N'Dresses', N'Dresses', N'SP', 3)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (42, 41, N'Váy đơn', N'Vay-don', N'0', N'', N'', N'vi', 1, N'Skirts', N'Skirts', N'Váy đơn', N'SP', 4)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (43, 0, N'Phong cách', N'Phong-cach', N'0', N'', N'', N'vi  ', 1, N'Signature line', N'Signature line', N'Signature line', N'SP', 5)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (44, 0, N'Xuân hè 2015', N'Xuan-he-2015', N'/images/catalog/2016/4/sc_small_2078_185720033.jpg', N'', N'', N'vi', 1, N'xuân hè', N'Xuân hè 2015', N'Xuân hè 2015', N'CL', 1)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (45, 0, N'Thu đông 2015', N'Thu-dong-2015', N'/images/catalog/2016/4/sc_small_2080_gallery19-1024x992.jpg', N'', N'', N'vi', 1, N'Thu đông 2015', N'Thu đông 2015', N'Thu đông 2015', N'CL', 2)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (46, 0, N'Sinh nhật 3s Belle salon', N'Sinh-nhat-3s-Belle-salon', N'/images/catalog/2016/4/sc_small_2129_img_8375.jpg', N'Sinh nhật 3s Belle salon', N'', N'vi', 1, N'Sinh nhật 3s Belle salon', N'Sinh nhật 3s Belle salon', N'Sinh nhật 3s Belle salon', N'LB', 1)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (47, 0, N'Sinh nhật phần 2', N'Sinh-nhat-phan-2', N'/images/catalog/2016/5/sc_small_2085_img_8303.jpg', N'Sinh nhật', N'', N'vi', 1, N'Sinh nhật', N'Sinh nhật Belle', N'Sinh nhật', N'LB', 2)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (48, 0, N'Nyala', N'Nyala', N'/images/catalog/4620151057tumblr_nml4t3mQTM1qbd81ro1_1280.jpg', N'<p>Nyala</p>
', N'', N'vi  ', 1, N'Nyala', N'Nyala', N'Nyala', N'GL', 1)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (49, 0, N'Ly Nguyen', N'Ly-Nguyen', N'/images/catalog/4620151057tumblr_nlno9nzVjk1qbd81ro1_1280.jpg', N'<p>Ly Nguyen</p>
', N'', N'vi  ', 1, N'Ly Nguyen', N'Ly Nguyen', N'Ly Nguyen', N'GL', 2)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (50, 0, N'lookbook Hà Nội', N'lookbook-Ha-Noi', N'/images/catalog/2016/4/sc_small_2075_171088547.jpg', N'', N'', N'vi', 1, N'lookbook', N'lookbook', N'lookbook', N'LB', 3)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (51, 0, N'lookbook Đà Nẵng', N'lookbook-Da-Nang', N'/images/catalog/2016/4/sc_small_2075_173445464.jpg', N'', N'', N'vi', 1, N'lookbook Đà Nẵng', N'lookbook Đà Nẵng', N'lookbook Đà Nẵng', N'LB', 4)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (52, 0, N'lookbook Sài Gòn', N'lookbook-Sai-Gon', N'/images/catalog/2016/4/sc_small_2075_185720033.jpg', N'', N'', N'vi', 1, N'lookbook Sài Gòn', N'lookbook Sài Gòn', N'lookbook Sài Gòn', N'LB', 5)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (53, 0, N'lookbook free style', N'lookbook-free-style', N'/images/catalog/2016/4/sc_small_2076_gallery6.jpg', N'', N'', N'vi', 1, N'lookbook free style', N'lookbook free style', N'lookbook free style', N'LB', 6)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (54, 0, N'Trần Thu Lê', N'Tran-Thu-Le', N'/images/catalog/462015111tumblr_nlno94mQTl1qbd81ro1_1280.jpg', N'', N'', N'vi  ', 1, N'Trần Thu Lê', N'Trần Thu Lê', N'Trần Thu Lê', N'GL', 3)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (55, 0, N'Nataly', N'Nataly', N'/images/catalog/462015112tumblr_nmrx1feU5c1qbd81ro1_1280.jpg', N'', N'', N'vi  ', 1, N'Nataly', N'Nataly', N'Nataly', N'GL', 4)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (56, 0, N'Lan Anh', N'Lan-Anh', N'/images/catalog/462015112tumblr_nn3zpqYPc11qbd81ro1_1280.jpg', N'', N'', N'vi  ', 1, N'Lan Anh', N'Lan Anh', N'Lan Anh', N'GL', 4)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (57, 0, N'Như Mai', N'Nhu-Mai', N'/images/catalog/462015113tumblr_nlkky2w4tX1qbd81ro1_1280.jpg', N'', N'', N'vi  ', 1, N'Như Mai', N'Như Mai', N'Như Mai', N'GL', 5)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (58, 0, N'Hoàng Anh', N'Hoang-Anh', N'/images/catalog/462015115tumblr_nlhshjUTOt1qbd81ro1_1280.jpg', N'', N'', N'vi  ', 1, N'Hoàng Anh', N'Hoàng Anh', N'Hoàng Anh', N'GL', 6)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (59, 0, N'Áo dài', N'Ao-dai', N'/images/catalog/4620151343demo999 (45).jpg', N'', N'', N'vi  ', 1, N'Áo dài', N'Áo dài', N'Áo dài', N'GL', 3)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (60, 0, N'Men Collection', N'Men-Collection', N'/images/catalog/2016/4/sc_small_2081_156881834.jpg', N'', N'', N'vi', 1, N'', N'', N'Men Collection', N'CL', 3)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (61, 0, N'Women Collection', N'Women-Collection', N'/images/catalog/2016/4/sc_small_2081_122622229.jpg', N'', N'', N'vi', 1, N'', N'', N'Women Collection', N'CL', 4)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (65, 0, N'Blog', N'Blog', N'/images/catalog/2016/1/sc_small_2060_car-sales.jpg', N'Blog', N'', N'vi', 1, N'', N'', N'Blog', N'TT', 1)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (66, 0, N'blog', N'blog', N'0', N'', N'', N'en', 1, N'', N'', N'blog', N'TT', 1)
SET IDENTITY_INSERT [dbo].[_Catalog] OFF
/****** Object:  Default [DF__Contact_createdate]    Script Date: 05/06/2016 16:06:32 ******/
ALTER TABLE [dbo].[_Contact] ADD  CONSTRAINT [DF__Contact_createdate]  DEFAULT (getdate()) FOR [createdate]
GO
/****** Object:  Default [DF_Product_Store]    Script Date: 05/06/2016 16:06:32 ******/
ALTER TABLE [dbo].[_Product] ADD  CONSTRAINT [DF_Product_Store]  DEFAULT ((0)) FOR [Store]
GO
/****** Object:  Default [DF_Product_PriceOld]    Script Date: 05/06/2016 16:06:32 ******/
ALTER TABLE [dbo].[_Product] ADD  CONSTRAINT [DF_Product_PriceOld]  DEFAULT ((0)) FOR [PriceOld]
GO
/****** Object:  Default [DF_Product_Views]    Script Date: 05/06/2016 16:06:32 ******/
ALTER TABLE [dbo].[_Product] ADD  CONSTRAINT [DF_Product_Views]  DEFAULT ((1)) FOR [Views]
GO
/****** Object:  Default [DF_Product_OrderDisplay]    Script Date: 05/06/2016 16:06:32 ******/
ALTER TABLE [dbo].[_Product] ADD  CONSTRAINT [DF_Product_OrderDisplay]  DEFAULT ((1)) FOR [OrderDisplay]
GO
/****** Object:  Default [DF_Product_Lang]    Script Date: 05/06/2016 16:06:32 ******/
ALTER TABLE [dbo].[_Product] ADD  CONSTRAINT [DF_Product_Lang]  DEFAULT (N'vn') FOR [Lang]
GO
/****** Object:  Default [DF_Product_IsShow]    Script Date: 05/06/2016 16:06:32 ******/
ALTER TABLE [dbo].[_Product] ADD  CONSTRAINT [DF_Product_IsShow]  DEFAULT ((1)) FOR [IsShow]
GO
/****** Object:  Default [DF_Product_IsHot]    Script Date: 05/06/2016 16:06:32 ******/
ALTER TABLE [dbo].[_Product] ADD  CONSTRAINT [DF_Product_IsHot]  DEFAULT ((0)) FOR [IsHot]
GO
/****** Object:  Default [DF_Product_IsPromotion]    Script Date: 05/06/2016 16:06:32 ******/
ALTER TABLE [dbo].[_Product] ADD  CONSTRAINT [DF_Product_IsPromotion]  DEFAULT ((0)) FOR [IsPromotion]
GO
