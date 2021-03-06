USE [master]
GO
/****** Object:  Database [themanor]    Script Date: 6/22/2018 6:53:34 PM ******/
CREATE DATABASE [themanor]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'themanor', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\themanor.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'themanor_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\themanor_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [themanor] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [themanor].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [themanor] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [themanor] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [themanor] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [themanor] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [themanor] SET ARITHABORT OFF 
GO
ALTER DATABASE [themanor] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [themanor] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [themanor] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [themanor] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [themanor] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [themanor] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [themanor] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [themanor] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [themanor] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [themanor] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [themanor] SET  DISABLE_BROKER 
GO
ALTER DATABASE [themanor] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [themanor] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [themanor] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [themanor] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [themanor] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [themanor] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [themanor] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [themanor] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [themanor] SET  MULTI_USER 
GO
ALTER DATABASE [themanor] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [themanor] SET DB_CHAINING OFF 
GO
ALTER DATABASE [themanor] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [themanor] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [themanor]
GO
/****** Object:  StoredProcedure [dbo].[_Catalog_GetByProductHot]    Script Date: 6/22/2018 6:53:34 PM ******/
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
/****** Object:  StoredProcedure [dbo].[_Catalog_GetParent]    Script Date: 6/22/2018 6:53:34 PM ******/
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
/****** Object:  StoredProcedure [dbo].[_General_Update]    Script Date: 6/22/2018 6:53:34 PM ******/
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
/****** Object:  StoredProcedure [dbo].[_Product_GetByCatalogType]    Script Date: 6/22/2018 6:53:34 PM ******/
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
		select * from(
			select 
			ProductID,ProductName,ProductCode,CatalogID,Summary,Content,ImagePath,ImageBigPath,DateModify,Store,
			Promotion,Warranty,Manufacture,PriceOld,PriceNew,Views,OrderDisplay,Lang,IsShow,IsHot,
			IsPromotion,Link,Approve,StartDate,EndDate,Rating,ROW_NUMBER() OVER (PARTITION BY CatalogID ORDER BY OrderDisplay DESC) as pos
			from _Product p 
			where p.ProductID in (
			select DISTINCT p.ProductID from _Product p CROSS APPLY [dbo].ConvertDelimitedListIntoTable(p.CatalogID,',') prop 
			inner join _Catalog c on prop.item = c.CatalogID 
			where c.Type = @Type )
			--Order by p.CatalogID,p.OrderDisplay Asc
		)as all_table Order by pos asc
		--Order by CatalogID,OrderDisplay Asc
	end
	else
	begin 
		select * from(
		select 
		ProductID,ProductName,ProductCode,CatalogID,Summary,Content,ImagePath,ImageBigPath,DateModify,Store,
		Promotion,Warranty,Manufacture,PriceOld,PriceNew,Views,OrderDisplay,Lang,IsShow,IsHot,
		IsPromotion,Link,Approve,StartDate,EndDate,Rating,ROW_NUMBER() OVER (PARTITION BY CatalogID ORDER BY OrderDisplay DESC) as pos
		from _Product p 
		where p.ProductID in (
		select DISTINCT p.ProductID from _Product p CROSS APPLY [dbo].ConvertDelimitedListIntoTable(p.CatalogID,',') prop 
		inner join _Catalog c on prop.item = c.CatalogID 
		where c.Type in ('SP','CL'))
		--Order by p.CatalogID,p.OrderDisplay Asc
		)as all_table Order by pos asc
		--Order by CatalogID,OrderDisplay Asc
	end
END

--exec [_Product_GetByCatalogType] 'SP'

GO
/****** Object:  StoredProcedure [dbo].[_Statistic_All]    Script Date: 6/22/2018 6:53:34 PM ******/
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
/****** Object:  StoredProcedure [dbo].[_ThongKe_Edit]    Script Date: 6/22/2018 6:53:34 PM ******/
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
/****** Object:  StoredProcedure [dbo].[_UserInfor_Statistic]    Script Date: 6/22/2018 6:53:34 PM ******/
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
/****** Object:  StoredProcedure [dbo].[_WebInfo_Update]    Script Date: 6/22/2018 6:53:34 PM ******/
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
/****** Object:  StoredProcedure [dbo].[create_order_code]    Script Date: 6/22/2018 6:53:34 PM ******/
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
/****** Object:  UserDefinedFunction [dbo].[ConvertDelimitedListIntoTable]    Script Date: 6/22/2018 6:53:34 PM ******/
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
/****** Object:  Table [dbo].[_Catalog]    Script Date: 6/22/2018 6:53:34 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[_Contact]    Script Date: 6/22/2018 6:53:34 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[_Email]    Script Date: 6/22/2018 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[_Email](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](150) NULL,
	[email] [varchar](100) NULL,
	[phone] [varchar](30) NULL,
	[address] [nvarchar](150) NULL,
	[note] [nvarchar](4000) NULL,
	[status] [bit] NULL,
	[createdate] [datetime] NULL,
 CONSTRAINT [PK__Email] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[_EmailTemplate]    Script Date: 6/22/2018 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_EmailTemplate](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[template] [ntext] NULL,
	[createdate] [datetime] NULL,
 CONSTRAINT [PK__EmailTemplate] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[_General]    Script Date: 6/22/2018 6:53:34 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[_Invoices]    Script Date: 6/22/2018 6:53:34 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[_Languages]    Script Date: 6/22/2018 6:53:34 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[_Link]    Script Date: 6/22/2018 6:53:34 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[_Pages]    Script Date: 6/22/2018 6:53:34 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[_Payment]    Script Date: 6/22/2018 6:53:34 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[_Post]    Script Date: 6/22/2018 6:53:34 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[_PostTag]    Script Date: 6/22/2018 6:53:34 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[_Product]    Script Date: 6/22/2018 6:53:34 PM ******/
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
	[Store] [int] NOT NULL CONSTRAINT [DF_Product_Store]  DEFAULT ((0)),
	[Promotion] [nvarchar](512) NULL,
	[Warranty] [nvarchar](250) NULL,
	[Manufacture] [nvarchar](512) NULL,
	[PriceOld] [money] NOT NULL CONSTRAINT [DF_Product_PriceOld]  DEFAULT ((0)),
	[PriceNew] [money] NULL,
	[Views] [int] NOT NULL CONSTRAINT [DF_Product_Views]  DEFAULT ((1)),
	[OrderDisplay] [int] NOT NULL CONSTRAINT [DF_Product_OrderDisplay]  DEFAULT ((1)),
	[Lang] [nvarchar](10) NULL CONSTRAINT [DF_Product_Lang]  DEFAULT (N'vn'),
	[IsShow] [bit] NOT NULL CONSTRAINT [DF_Product_IsShow]  DEFAULT ((1)),
	[IsHot] [bit] NOT NULL CONSTRAINT [DF_Product_IsHot]  DEFAULT ((0)),
	[IsPromotion] [bit] NOT NULL CONSTRAINT [DF_Product_IsPromotion]  DEFAULT ((0)),
	[Link] [nvarchar](500) NULL,
	[Approve] [bit] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Rating] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[_ProductProperty]    Script Date: 6/22/2018 6:53:34 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[_ProductTag]    Script Date: 6/22/2018 6:53:34 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[_Rating]    Script Date: 6/22/2018 6:53:34 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[_Role]    Script Date: 6/22/2018 6:53:34 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[_Statistic]    Script Date: 6/22/2018 6:53:34 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[_User]    Script Date: 6/22/2018 6:53:34 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[_UserInfo]    Script Date: 6/22/2018 6:53:34 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[_UserPage]    Script Date: 6/22/2018 6:53:34 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[_UserPermission]    Script Date: 6/22/2018 6:53:34 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[_WebInfo]    Script Date: 6/22/2018 6:53:34 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[City]    Script Date: 6/22/2018 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[CityID] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [nvarchar](100) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DetailOrder]    Script Date: 6/22/2018 6:53:34 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[District]    Script Date: 6/22/2018 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[District](
	[DistrictID] [int] IDENTITY(1,1) NOT NULL,
	[CityID] [int] NOT NULL,
	[DistrictName] [nvarchar](255) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_District] PRIMARY KEY CLUSTERED 
(
	[DistrictID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ImageAlbums]    Script Date: 6/22/2018 6:53:34 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ImageProducts]    Script Date: 6/22/2018 6:53:34 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Logs]    Script Date: 6/22/2018 6:53:34 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[orders]    Script Date: 6/22/2018 6:53:34 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Showroom]    Script Date: 6/22/2018 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Showroom](
	[ShowroomID] [int] IDENTITY(1,1) NOT NULL,
	[DistrictID] [int] NOT NULL,
	[Latitude] [nvarchar](255) NOT NULL,
	[Longitude] [nvarchar](255) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](255) NOT NULL,
	[Image] [nvarchar](255) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Showroom] PRIMARY KEY CLUSTERED 
(
	[ShowroomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[_Catalog] ON 

INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (39, 0, N'Dưỡng da', N'Duong-da', N'/images/catalog/2016/5/sc_small_2058_shampoo.png', N'Dưỡng da', N'<p>Dưỡng da</p>
', N'vi', 1, N'Dưỡng da', N'Dưỡng da', N'Dưỡng da', N'SP', 1)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (40, 0, N'Làm sạch', N'Lam-sach', N'/images/catalog/2016/5/sc_small_2059_products_full.png', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Làm sạch', N'Làm sạch', N'Làm sạch', N'SP', 2)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (41, 0, N'Toàn thân', N'Toan-than', N'/images/catalog/2016/5/sc_small_2059_awarded_product.jpg', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Toàn thân', N'Toàn thân', N'Toàn thân', N'SP', 3)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (43, 0, N'Trang điểm', N'Trang-diem', N'/images/catalog/2016/5/sc_small_2059_shampoo.png', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Trang điểm', N'Trang điểm', N'Trang điểm', N'SP', 4)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (46, 0, N'Sinh nhật 3s Belle salon', N'Sinh-nhat-3s-Belle-salon', N'/images/catalog/2016/4/sc_small_2129_img_8375.jpg', N'Sinh nhật 3s Belle salon', N'', N'vi', 1, N'Sinh nhật 3s Belle salon', N'Sinh nhật 3s Belle salon', N'Sinh nhật 3s Belle salon', N'LB', 1)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (47, 0, N'Sinh nhật phần 2', N'Sinh-nhat-phan-2', N'/images/catalog/2016/5/sc_small_2085_img_8303.jpg', N'Sinh nhật', N'', N'vi', 1, N'Sinh nhật', N'Sinh nhật Belle', N'Sinh nhật', N'LB', 2)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (48, 0, N'Nyala', N'Nyala', N'/images/catalog/4620151057tumblr_nml4t3mQTM1qbd81ro1_1280.jpg', N'<p>Nyala</p>
', N'', N'vi  ', 1, N'Nyala', N'Nyala', N'Nyala', N'GL', 1)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (49, 0, N'Ly Nguyen', N'Ly-Nguyen', N'/images/catalog/4620151057tumblr_nlno9nzVjk1qbd81ro1_1280.jpg', N'<p>Ly Nguyen</p>
', N'', N'vi  ', 1, N'Ly Nguyen', N'Ly Nguyen', N'Ly Nguyen', N'GL', 2)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (50, 0, N'lookbook Hà Nội', N'lookbook-Ha-Noi', N'/images/catalog/2016/5/sc_small_2070_img_8791.jpg', N'', N'', N'vi', 1, N'lookbook', N'lookbook', N'lookbook', N'LB', 3)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (51, 0, N'lookbook Đà Nẵng', N'lookbook-Da-Nang', N'/images/catalog/2016/5/sc_small_2071_img_9094.jpg', N'', N'', N'vi', 1, N'lookbook Đà Nẵng', N'lookbook Đà Nẵng', N'lookbook Đà Nẵng', N'LB', 4)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (52, 0, N'lookbook Sài Gòn', N'lookbook-Sai-Gon', N'/images/catalog/2016/5/sc_small_2072_img_8393.jpg', N'', N'', N'vi', 1, N'lookbook Sài Gòn', N'lookbook Sài Gòn', N'lookbook Sài Gòn', N'LB', 5)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (53, 0, N'lookbook free style', N'lookbook-free-style', N'/images/catalog/2016/5/sc_small_2073_sile-3.jpg', N'', N'', N'vi', 1, N'lookbook free style', N'lookbook free style', N'lookbook free style', N'LB', 6)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (54, 0, N'Trần Thu Lê', N'Tran-Thu-Le', N'/images/catalog/462015111tumblr_nlno94mQTl1qbd81ro1_1280.jpg', N'', N'', N'vi  ', 1, N'Trần Thu Lê', N'Trần Thu Lê', N'Trần Thu Lê', N'GL', 3)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (55, 0, N'Nataly', N'Nataly', N'/images/catalog/462015112tumblr_nmrx1feU5c1qbd81ro1_1280.jpg', N'', N'', N'vi  ', 1, N'Nataly', N'Nataly', N'Nataly', N'GL', 4)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (56, 0, N'Lan Anh', N'Lan-Anh', N'/images/catalog/462015112tumblr_nn3zpqYPc11qbd81ro1_1280.jpg', N'', N'', N'vi  ', 1, N'Lan Anh', N'Lan Anh', N'Lan Anh', N'GL', 4)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (57, 0, N'Như Mai', N'Nhu-Mai', N'/images/catalog/462015113tumblr_nlkky2w4tX1qbd81ro1_1280.jpg', N'', N'', N'vi  ', 1, N'Như Mai', N'Như Mai', N'Như Mai', N'GL', 5)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (58, 0, N'Hoàng Anh', N'Hoang-Anh', N'/images/catalog/462015115tumblr_nlhshjUTOt1qbd81ro1_1280.jpg', N'', N'', N'vi  ', 1, N'Hoàng Anh', N'Hoàng Anh', N'Hoàng Anh', N'GL', 6)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (59, 0, N'Áo dài', N'Ao-dai', N'/images/catalog/4620151343demo999 (45).jpg', N'', N'', N'vi  ', 1, N'Áo dài', N'Áo dài', N'Áo dài', N'GL', 3)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (65, 0, N'Khuyến mại', N'Khuyen-mai', N'/images/catalog/2016/5/sc_small_2081_blog_bg8ad4.jpg', N'Tóc đẹp Belle hair salon, chia sẻ những bí quyết làm đẹp tóc, hình ảnh tóc đẹp, những kiểu tóc đẹp nhất năm 2016, tư vấn cách chọn kiểu tóc đẹp.', N'<p>&nbsp;</p>
', N'vi', 1, N'Khuyến mại', N'Khuyến mại', N'Khuyến mại', N'TT', 1)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (66, 0, N'blog', N'blog', N'0', N'', N'', N'en', 1, N'', N'', N'blog', N'TT', 1)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (76, 0, N'Sự kiện', N'su-kien', N'/images/catalog/2016/5/sc_small_2082_168703469.jpg', N'Hướng dẫn nhuộm tóc nam đẹp hoàn hảo, thời thượng. Nhuộm tóc không còn là việc quá xa lạ đối với đấng mày râu trong thời buổi hiện tại.', N'<p>&nbsp;</p>
', N'vi', 1, N'Sự kiện', N'Sự kiện', N'Sự kiện', N'TT', 2)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (77, 0, N'Đào tạo', N'dao-tao', N'0', N'', N'', N'vi', 1, N'Tuyển dụng', N'Tuyển dụng', N'Tuyển dụng', N'TT', 1)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (78, 0, N'Education', N'education', N'0', N'', N'', N'en', 1, N'Recruitment', N'Recruitment', N'Recruitment', N'TT', 1)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (79, 0, N'Tin nội bộ', N'tin-noi-bo', N'0', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Tin nội bộ', N'Tin nội bộ', N'Tin nội bộ', N'TT', 4)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (80, 0, N'Mẹo làm đẹp', N'meo-lam-dep', N'0', N'Mẹo làm đẹp', N'<p>Mẹo l&agrave;m đẹp</p>
', N'vi', 1, N'Mẹo làm đẹp', N'Mẹo làm đẹp', N'Mẹo làm đẹp', N'TT', 5)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (81, 0, N'Phụ kiện', N'Phu-kien', N'0', N'Phụ kiện', N'<p>Phụ kiện</p>
', N'vi', 1, N'Phụ kiện', N'Phụ kiện', N'Phụ kiện', N'SP', 5)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (82, 39, N'Nước hoa hồng', N'Nuoc-hoa-hong', N'0', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Nước hoa hồng', N'Nước hoa hồng', N'Nước hoa hồng', N'SP', 1)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (83, 39, N'Sữa dưỡng', N'Sua-duong', N'0', N'', N'<p>Sữa dưỡng</p>
', N'vi', 1, N'Sữa dưỡng', N'Sữa dưỡng', N'Sữa dưỡng', N'SP', 2)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (84, 39, N'Tinh chất', N'Tinh-chat', N'0', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Tinh chất', N'Tinh chất', N'Tinh chất', N'SP', 3)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (85, 39, N'Kem dưỡng da', N'Kem-duong-da', N'0', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Kem dưỡng da', N'Kem dưỡng da', N'Kem dưỡng da', N'SP', 4)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (86, 39, N'Kem dưỡng mắt', N'Kem-duong-mat', N'0', N'Kem dưỡng mắt', N'<p>Kem dưỡng mắt</p>
', N'vi', 1, N'Kem dưỡng mắt', N'Kem dưỡng mắt', N'Kem dưỡng mắt', N'SP', 5)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (87, 39, N'Xịt khoáng', N'Xit-khoang', N'0', N'Xịt khoáng', N'<p>Xịt kho&aacute;ng</p>
', N'vi', 1, N'Xịt khoáng', N'Xịt khoáng', N'Xịt khoáng', N'SP', 6)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (88, 39, N'Skincare Set', N'Skincare-Set', N'0', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Skincare Set', N'Skincare Set', N'Skincare Set', N'SP', 7)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (89, 39, N'Chống nắng', N'Chong-nang', N'0', N'Chống nắng', N'<p>Chống nắng</p>
', N'vi', 1, N'Chống nắng', N'Chống nắng', N'Chống nắng', N'SP', 8)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (90, 39, N'Chăm sóc đặc biệt', N'Cham-soc-dac-biet', N'0', N'Chăm sóc đặc biệt', N'<p>Chăm s&oacute;c đặc biệt</p>
', N'vi', 1, N'Chăm sóc đặc biệt', N'Chăm sóc đặc biệt', N'Chăm sóc đặc biệt', N'SP', 9)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (91, 40, N'Sữa rửa mặt', N'Sua-rua-mat', N'0', N'Sữa rửa mặt', N'<p>Sữa rửa mặt</p>
', N'vi', 1, N'Sữa rửa mặt', N'Sữa rửa mặt', N'Sữa rửa mặt', N'SP', 1)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (92, 40, N'Mặt nạ ngủ', N'Mat-na-ngu', N'0', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Mặt nạ ngủ', N'Mặt nạ ngủ', N'Mặt nạ ngủ', N'SP', 2)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (93, 40, N'Tẩy trang', N'Tay-trang', N'0', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Tẩy trang', N'Tẩy trang', N'Tẩy trang', N'SP', 3)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (94, 40, N'Tẩy tế bào chết', N'Tay-te-bao-chet', N'0', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Tẩy tế bào chết', N'Tẩy tế bào chết', N'Tẩy tế bào chết', N'SP', 4)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (95, 40, N'Massage & đắp mặt', N'Massage--dap-mat', N'0', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Massage & đắp mặt', N'Massage & đắp mặt', N'Massage & đắp mặt', N'SP', 5)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (96, 40, N'Loại khác', N'Loai-khac', N'0', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Loại khác', N'Loại khác', N'Loại khác', N'SP', 6)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (97, 41, N'Sữa tắm', N'Sua-tam', N'0', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Sữa tắm', N'Sữa tắm', N'Sữa tắm', N'SP', 1)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (98, 41, N'Dưỡng thể', N'Duong-the', N'0', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Dưỡng thể', N'Dưỡng thể', N'Dưỡng thể', N'SP', 2)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (99, 41, N'Chăm sóc da tay chân', N'Cham-soc-da-tay-chan', N'0', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Chăm sóc da tay chân', N'Chăm sóc da tay chân', N'Chăm sóc da tay chân', N'SP', 3)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (100, 43, N'Kem CC & BB', N'Kem-CC--BB', N'0', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Kem CC & BB', N'Kem CC & BB', N'Kem CC & BB', N'SP', 1)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (101, 43, N'Phấn bột dạng nén và phấn phủ', N'Phan-bot-dang-nen-va-phan-phu', N'0', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Phấn bột dạng nén và phấn phủ', N'Phấn bột dạng nén và phấn phủ', N'Phấn bột dạng nén và phấn phủ', N'SP', 2)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (102, 43, N'Che khuyết', N'Che-khuyet', N'0', N'Che khuyết', N'<p>Che khuyết</p>
', N'vi', 1, N'Che khuyết', N'Che khuyết', N'Che khuyết', N'SP', 3)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (103, 43, N'Phấn má', N'Phan-ma', N'0', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Phấn má', N'Phấn má', N'Phấn má', N'SP', 4)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (104, 43, N'Son môi', N'Son-moi', N'0', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Son môi', N'Son môi', N'Son môi', N'SP', 5)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (105, 43, N'Trang điểm mày', N'Trang-diem-may', N'0', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Trang điểm mày', N'Trang điểm mày', N'Trang điểm mày', N'SP', 6)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (106, 43, N'Trang điểm mày', N'Trang-diem-may', NULL, N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Trang điểm mày', N'Trang điểm mày', N'Trang điểm mày', N'SP', 7)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (107, 43, N'Chuốt mi', N'Chuot-mi', N'0', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Chuốt mi', N'Chuốt mi', N'Chuốt mi', N'SP', 8)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (108, 43, N'Kẻ mắt', N'Ke-mat', N'0', N'Kẻ mắt', N'<p>Kẻ mắt</p>
', N'vi', 1, N'Kẻ mắt', N'Kẻ mắt', N'Kẻ mắt', N'SP', 9)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (109, 43, N'Sơn móng tay', N'Son-mong-tay', N'0', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Sơn móng tay', N'Sơn móng tay', N'Sơn móng tay', N'SP', 10)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (110, 0, N'Trị liệu công nghệ cao', N'Tri-lieu-cong-nghe-cao', N'0', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Trị liệu công nghệ cao', N'Trị liệu công nghệ cao', N'Trị liệu công nghệ cao', N'DV', 1)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (111, 0, N'Spa thư giãn', N'Spa-thu-gian', N'0', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Spa thư giãn', N'Spa thư giãn', N'Spa thư giãn', N'DV', 2)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (112, 110, N'Triệt lông', N'Triet-long', N'/images/catalog/2016/7/sc_small_2088_1.jpg', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Triệt lông', N'Triệt lông', N'Triệt lông', N'DV', 1)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (113, 110, N'Xóa xăm bằng công nghệ Laser Q-Switch ND yag', N'Xoa-xam-bang-cong-nghe-Laser-Q-Switch-ND-yag', N'/images/catalog/2016/7/sc_small_2097_2.jpg', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Xóa xăm bằng công nghệ Laser Q-Switch ND yag', N'Xóa xăm bằng công nghệ Laser Q-Switch ND yag', N'Xóa xăm bằng công nghệ Laser Q-Switch ND yag', N'DV', 2)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (114, 110, N'Giảm béo không phẫu thuật', N'Giam-beo-khong-phau-thuat', N'/images/catalog/2016/7/sc_small_2104_3.jpg', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Giảm béo không phẫu thuật', N'Giảm béo không phẫu thuật', N'Giảm béo không phẫu thuật', N'DV', 3)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (115, 110, N'Trẻ hóa da, nâng cơ mặt', N'Tre-hoa-da-nang-co-mat', N'/images/catalog/2016/7/sc_small_2108_4.jpg', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Trẻ hóa da, nâng cơ mặt', N'Trẻ hóa da, nâng cơ mặt', N'Trẻ hóa da, nâng cơ mặt', N'DV', 4)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (116, 110, N'Điều trị sẹo lõm với kim lăn Dermaroller', N'Dieu-tri-seo-lom-voi-kim-lan-Dermaroller', N'/images/catalog/2016/7/sc_small_2109_5.jpg', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Điều trị sẹo lõm với kim lăn Dermaroller', N'Điều trị sẹo lõm với kim lăn Dermaroller', N'Điều trị sẹo lõm với kim lăn Dermaroller', N'DV', 5)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (117, 111, N'Chăm sóc da mặt', N'Cham-soc-da-mat', N'/images/catalog/2016/7/sc_small_2111_6.jpg', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Chăm sóc da mặt', N'Chăm sóc da mặt', N'Chăm sóc da mặt', N'DV', 1)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (118, 111, N'Chăm sóc vùng mắt', N'Cham-soc-vung-mat', N'/images/catalog/2016/7/sc_small_2112_1.jpg', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Chăm sóc vùng mắt', N'Chăm sóc vùng mắt', N'Chăm sóc vùng mắt', N'DV', 2)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (119, 111, N'Tắm trắng', N'Tam-trang', N'/images/catalog/2016/7/sc_small_2112_2.jpg', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Tắm trắng', N'Tắm trắng', N'Tắm trắng', N'DV', 2)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (120, 111, N'Massage body', N'Massage-body', N'/images/catalog/2016/7/sc_small_2113_3.jpg', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Massage body', N'Massage body', N'Massage body', N'DV', 4)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (121, 111, N'Thông kinh lạc thu nhỏ eo, tạo đường cong chữ S', N'Thong-kinh-lac-thu-nho-eo-tao-duong-cong-chu-S', N'/images/catalog/2016/7/sc_small_2115_4.jpg', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Thông kinh lạc thu nhỏ eo, tạo đường cong chữ S', N'Thông kinh lạc thu nhỏ eo, tạo đường cong chữ S', N'Thông kinh lạc thu nhỏ eo, tạo đường cong chữ S', N'DV', 5)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (122, 117, N'Chăm sóc da cơ bản', N'Cham-soc-da-co-ban', N'/images/catalog/2016/7/sc_small_2116_6.jpg', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Chăm sóc da cơ bản', N'Chăm sóc da cơ bản', N'Chăm sóc da cơ bản', N'DV', 1)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (123, 117, N'Thắp sáng làn da', N'Thap-sang-lan-da', N'/images/catalog/2016/7/sc_small_2116_2.jpg', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Thắp sáng làn da', N'Thắp sáng làn da', N'Thắp sáng làn da', N'DV', 2)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (124, 117, N'Chống lão hóa da', N'Chong-lao-hoa-da', N'/images/catalog/2016/7/sc_small_2059_3.jpg', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Chống lão hóa da', N'Chống lão hóa da', N'Chống lão hóa da', N'DV', 3)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (125, 117, N'Điều trị mụn chuyên sau bằng hệ thống ', N'Dieu-tri-mun-chuyen-sau-bang-he-thong', N'/images/catalog/2016/7/sc_small_2060_5.jpg', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Điều trị mụn chuyên sau bằng hệ thống ', N'Điều trị mụn chuyên sau bằng hệ thống ', N'Điều trị mụn chuyên sau bằng hệ thống ', N'DV', 4)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (126, 117, N'Chăm sóc da mùa hanh khô', N'Cham-soc-da-mua-hanh-kho', N'/images/catalog/2016/7/sc_small_2061_6.jpg', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Chăm sóc da mùa hanh khô', N'Chăm sóc da mùa hanh khô', N'Chăm sóc da mùa hanh khô', N'DV', 5)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (127, 117, N'Tái tạo da sau 5 ngày', N'Tai-tao-da-sau-5-ngay', N'/images/catalog/2016/7/sc_small_2062_1.jpg', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Tái tạo da sau 5 ngày', N'Tái tạo da sau 5 ngày', N'Tái tạo da sau 5 ngày', N'DV', 6)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (128, 120, N'Massage đá nóng', N'Massage-da-nong', N'/images/catalog/2016/7/sc_small_2063_3.jpg', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Massage đá nóng', N'Massage đá nóng', N'Massage đá nóng', N'DV', 1)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (129, 120, N'Massage Thụy Điển', N'Massage-Thuy-Dien', N'/images/catalog/2016/7/sc_small_2064_4.jpg', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Massage Thụy Điển', N'Massage Thụy Điển', N'Massage Thụy Điển', N'DV', 2)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (130, 120, N'Massage thảo dược', N'Massage-thao-duoc', N'/images/catalog/2016/7/sc_small_2064_5.jpg', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Massage thảo dược', N'Massage thảo dược', N'Massage thảo dược', N'DV', 3)
SET IDENTITY_INSERT [dbo].[_Catalog] OFF
SET IDENTITY_INSERT [dbo].[_Email] ON 

INSERT [dbo].[_Email] ([id], [name], [email], [phone], [address], [note], [status], [createdate]) VALUES (32, N'soncoi', N'nguyenson1303@gmail.com', N'0967 962 562', N'Hà Nội', N'', NULL, CAST(N'2018-06-21 16:09:03.170' AS DateTime))
INSERT [dbo].[_Email] ([id], [name], [email], [phone], [address], [note], [status], [createdate]) VALUES (33, N'son 2', N'', N'324234324324', N'', N'', NULL, CAST(N'2018-06-21 16:11:34.887' AS DateTime))
SET IDENTITY_INSERT [dbo].[_Email] OFF
SET IDENTITY_INSERT [dbo].[_EmailTemplate] ON 

INSERT [dbo].[_EmailTemplate] ([id], [name], [template], [createdate]) VALUES (1, N'Testing', N'Testing', CAST(N'2016-06-06 00:00:00.000' AS DateTime))
INSERT [dbo].[_EmailTemplate] ([id], [name], [template], [createdate]) VALUES (3, N'Email marketingaaaaaaaaaaa', N'<p>Testingaaaaaaaaaa</p>
', CAST(N'2016-06-06 00:00:00.000' AS DateTime))
INSERT [dbo].[_EmailTemplate] ([id], [name], [template], [createdate]) VALUES (4, N'SonNV', N'Testing', CAST(N'2016-06-06 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[_EmailTemplate] OFF
SET IDENTITY_INSERT [dbo].[_General] ON 

INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (1, N'pagename', N'THE MANOR CENTRAL PARK', CAST(N'2018-06-22 17:26:00' AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (3, N'contact', N'', CAST(N'2015-05-22 14:57:00' AS SmallDateTime), 1, N'vi  ')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (5, N'description', N'THE MANOR CENTRAL PARK', CAST(N'2018-06-22 17:26:00' AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (6, N'support', NULL, CAST(N'2018-06-22 17:26:00' AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (7, N'aboutshort', N'<div class="col-md-6 vk-clear-padding">
<div class="vk-sparta-dark-about-left">&nbsp;</div>
</div>

<div class="col-md-6 vk-clear-padding vk-sparta-dark-about-right-bg">
<div class="vk-sparta-dark-about-right">
<div class="vk-dark-about-right-header">
<h3>Khu đ&ocirc; thị</h3>

<h2>THE MANOR CENTRAL PARK</h2>

<div class="clearfix">&nbsp;</div>

<div class="vk-dark-about-border">&nbsp;</div>
</div>

<div class="vk-dark-about-right-content">
<p>Được phát tri&ecirc;̉n bởi Bitexco, dự án trong giai đoạn 1 hứa hẹn mang đ&ecirc;́n nhi&ecirc;̀u sự lựa chọn đa dạng và cao c&acirc;́p tới quý cư d&acirc;n. Từ sự k&ecirc;́t hợp giữa nhà ở và cửa hàng kinh doanh như nhà ph&ocirc;́ thương mại g&ocirc;̀m 382 căn với di&ecirc;̣n tích 99m2 và 75m2 (4 hoặc 5 t&acirc;̀ng cùng 1 t&acirc;̀ng lửng), cho tới nhà li&ecirc;̀n k&ecirc;̀ với 56 căn g&ocirc;̀m hai loại hình Vàng và Bạch Kim, di&ecirc;̣n tích từ 99m2 đ&ecirc;́n 120m2 hay các ng&ocirc;i bi&ecirc;̣t thự song l&acirc;̣p cùng khoảng kh&ocirc;ng gian ngoài trời xanh tươi với di&ecirc;̣n tích 160m2 &ndash;227m2 tạo n&ecirc;n m&ocirc;̣t kh&ocirc;ng gian s&ocirc;́ng tuy&ecirc;̣t vời.</p>
</div>

<div class="vk-dark-about-right-author">
<p>Bitexco</p>
</div>
</div>

<div class="vk-sparta-dark-about-right-down">
<div class="col-md-4 col-sm-4 vk-clear-padding"><img alt="" class="img-responsive" src="/Content/themes/themanorcentralpark/images/01_02_dark_background/welcome/1.jpg" /></div>

<div class="col-md-4 col-sm-4 vk-clear-padding"><img alt="" class="img-responsive" src="/Content/themes/themanorcentralpark/images/01_02_dark_background/welcome/2.jpg" /></div>

<div class="col-md-4 col-sm-4 vk-clear-padding"><img alt="" class="img-responsive" src="/Content/themes/themanorcentralpark/images/01_02_dark_background/welcome/3.jpg" /></div>
</div>
</div>
', CAST(N'2015-08-18 17:19:00' AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (8, N'aboutcontent', N'
<div class="vk-restaurant-about">
	<div class="container">
		<div class="vk-restaurant-header">
			<h3>Dự án</h3>
			<h2>THE MANOR CENTRAL PARK</h2>
			<div class="vk-restaurant-border"></div>
		</div>
		<div class="vk-restaurant-item-about">
			<div class="row">
				<div class="col-md-6 col-md-push-6">
					<div class="vk-resstaurant-item-img">
						<img src="/Content/themes/themanorcentralpark/images/themanor1.jpg" alt="" class="img-responsive">
					</div>
				</div>
				<div class="col-md-6 col-md-pull-6 vk-restaurant-item-info">
					<div class="vk-restaurant-about-item">
						<h3>Tổng quan dự án</h3>
						<p>
							Nằm trên mảnh đất vàng ở phía Tây Nam của Hà nội, The Manor Central Park là một trong những dự án về khu đô thị phức hợp hiện đại bậc nhất nội đô. Quần thể đô thị và công viên Chu Văn An rộng 200 ha, là nơi tôn vinh những giá trị lịch sử dân tộc nhưng vẫn mang trong mình phong cách sống hiện đại nhộp nhịp. Khác biệt bởi The Manor Central Park được quy hoạch để trở thành một khu đô thị phức hợp thiên về nhà ở và kinh doanh. Môi trường đi bộ và không gian cây xanh hồ nước được ưu tiên và chú trọng, song song với đó cộng hưởng từ chuỗi kinh tế như các trung tâm thương mại, tuyến phố mua sắm, khu văn phòng hay các khu vực sinh hoạt cộng đồng. Các chức năng được kiểm soát, điều tiết, tương hỗ lẫn nhau tạo nên một cộng đồng phát triển bền vững.
						</p>
					</div>
				</div>
			</div>
		</div>
		<div class="vk-restaurant-item-about">
			<div class="row">
				<div class="col-md-6">
					<div class="vk-resstaurant-item-img">
						<img src="/Content/themes/themanorcentralpark/images/The-manor-central-park2.jpg" alt="" class="img-responsive">
					</div>
				</div>
				<div class="col-md-6 vk-restaurant-item-info">
					<div class="vk-restaurant-about-item">
						<h3>Quy hoạch quần thể</h3>
						<p>
							Với mục đích phát triển tương lai lâu dài, quần thể The Manor Central Park và các công viên rộng 200 ha được kết hợp giữa khoảng xanh và tiện ích đô thị vượt trội như trường học, phố đi bộ, trung tâm thương mại, khu thể thao, bể bơi...
						</p>
					</div>
				</div>
			</div>
		</div>
		<div class="vk-restaurant-item-about">
			<div class="row">
				<div class="col-md-6 col-md-push-6">
					<div class="vk-resstaurant-item-img">
						<img src="/Content/themes/themanorcentralpark/images/the-manor-central-park.jpg" alt="" class="img-responsive">
					</div>
				</div>
				<div class="col-md-6 col-md-pull-6 vk-restaurant-item-info">
					<div class="vk-restaurant-about-item">
						<h3>Vị trí chiến lược</h3>
						<p>
							Dự án tọa lạc tại phía Tây Nam thành phố, phía bắc tiếp giáp với đường Nguyễn Xiển và phía nam với công viên Chu Văn An, sẽ là mạng lưới giao thông hiện đại kết nối thuận tiện đến trung tâm thành phố, sân bay quốc tế Nội Bài....
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>', CAST(N'2015-08-18 17:19:00' AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (9, N'contactdetail', N'<div class="vk-sparta-dark-contact-us-info-header">
	<h3>Vị trí địa lý</h3>
	<h2>CÁC TIỆN ÍCH XUNG QUANH</h2>
	<div class="clearfix"></div>
	<div class="vk-dark-contact-border"></div>
</div>
<div class="vk-sparta-dark-contact-us-info-text">
	<ul>
		<li>
			<div class="vk-sparta-dark-contact-us-info-text-icon">
				<i class="fa fa-star-o" aria-hidden="true"></i>
			</div>
			<div class="vk-sparta-dark-contact-us-info-text-right">
				<h4>HÀ NỘI - TRUNG TÂM THÀNH PHỐ</h4>
				<p>8 Km - 20 phút</p>
			</div>
		</li>
		<li>
			<div class="vk-sparta-dark-contact-us-info-text-icon">
				<i class="fa fa-graduation-cap" aria-hidden="true"></i>
			</div>
			<div class="vk-sparta-dark-contact-us-info-text-right">
				<h4>ĐẠI HỌC THĂNG LONG</h4>
				<p>0.5 Km - 2 phút</p>
			</div>
		</li>
		<li>
			<div class="vk-sparta-dark-contact-us-info-text-icon">
				<i class="fa fa-plane" aria-hidden="true"></i>
			</div>
			<div class="vk-sparta-dark-contact-us-info-text-right">
				<h4>SÂN BAY QUỐC TẾ NỘI BÀI</h4>
				<p>25 Km - 30 phút</p>
			</div>
		</li>
		<li>
			<div class="vk-sparta-dark-contact-us-info-text-icon">
				<i class="fa fa-university" aria-hidden="true"></i>
			</div>
			<div class="vk-sparta-dark-contact-us-info-text-right">
				<h4>TRUNG TÂM HỘI NGHỊ QUỐC GIA</h4>
				<p>5 Km - 5 phút</p>
			</div>
		</li>
		<li>
			<div class="vk-sparta-dark-contact-us-info-text-icon">
				<i class="fa fa-tree" aria-hidden="true"></i>
			</div>
			<div class="vk-sparta-dark-contact-us-info-text-right">
				<h4>HỒ LINH ĐÀM</h4>
				<p>2 Km - 5 phút</p>
			</div>
		</li>
	</ul>
</div>', CAST(N'2015-01-01 00:00:00' AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (10, N'banner', N'', CAST(N'2012-07-07 17:56:00' AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (11, N'productcontent', N'', CAST(N'2010-11-25 17:02:00' AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (12, N'yahoo', N'', CAST(N'2012-07-07 17:56:00' AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (28, N'abouthome', N'<p>Sed ut perspiciatis, unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt, explicabo.</p>
<p>Nemo enim ipsam voluptatem, quia voluptas sit, aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos, qui ratione voluptatem sequi nesciunt, neque porro quisquam. </p>', CAST(N'2013-01-21 20:13:00' AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (41, N'keywords', N'THE MANOR CENTRAL PARK', CAST(N'2018-06-22 17:26:00' AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (110, N'productcontent', N'', CAST(N'2010-11-25 17:02:00' AS SmallDateTime), 1, N'en')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (118, N'yahoo', N'', CAST(N'2011-04-06 09:13:00' AS SmallDateTime), 1, N'en')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (127, N'abouthome', N'<p>Sed ut perspiciatis, unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt, explicabo.</p>', CAST(N'2013-01-21 20:13:00' AS SmallDateTime), 1, N'en')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (143, N'contact', N'', CAST(N'2015-04-13 10:12:00' AS SmallDateTime), 1, N'en  ')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (144, N'advstop', N'<p style="text-align: center;"><img alt="" src="/images/images/banner_top_4(1).png" style="width: 1348px; height: 249px;" /></p>
', CAST(N'2015-10-08 16:43:00' AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (145, N'advsbottom', N'<p><img alt="" src="/images/images/banner_bottom_fw.png" style="width: 774px; height: 286px;" /></p>
', CAST(N'2015-10-08 16:46:00' AS SmallDateTime), 1, N'vi')
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
    </div>', CAST(N'2015-10-08 16:46:00' AS SmallDateTime), 1, N'en')
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
    </div>', CAST(N'2015-10-08 16:47:00' AS SmallDateTime), 1, N'en')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (150, N'advsleft', N'<p><a class="bg-image" href="#"><img src="/images/images/banner_left_1.jpg" style="width: 757px; height: 402px;" /></a></p>
', CAST(N'2015-10-08 16:48:00' AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (151, N'advsleft', N'', CAST(N'2015-10-08 16:48:00' AS SmallDateTime), 1, N'en')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (152, N'advsright', N'<p><a class="bg-image" href="/vi/news/posts/80/Meo-lam-dep"><img src="/images/images/banner_top_3.jpg" style="width: 522px; height: 199px;" /></a></p>
', CAST(N'2015-10-08 16:49:00' AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (153, N'advsright', N'', CAST(N'2015-10-08 16:49:00' AS SmallDateTime), 1, N'en')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (154, N'advsmiddle', N'<p><a class="bg-image" href="#"><img src="/images/images/banner_middle.jpg" style="width: 521px; height: 191px;" /></a></p>
', CAST(N'2015-10-08 16:49:00' AS SmallDateTime), 1, N'vi')
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
</div>', CAST(N'2015-10-08 16:49:00' AS SmallDateTime), 1, N'en')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (156, N'content_shipping', N'<div class="widget-block">
<div class="panel-group" id="accordion">
<div class="panel panel-default">
<div class="panel-heading">
<h4 class="panel-title"><a class="collapsed" data-parent="#accordion" data-toggle="collapse" href="#collapseOne">Ph&iacute; giao h&agrave;ng được t&iacute;nh v&agrave; thu như thế n&agrave;o? </a></h4>
</div>

<div class="panel-collapse collapse in" id="collapseOne">
<div class="panel-body">
<p>- Với đơn h&agrave;ng dưới 1 triệu, qu&yacute; kh&aacute;ch sẽ tự thanh to&aacute;n tiền chuyển h&agrave;ng. Với đơn h&agrave;ng tr&ecirc;n 1 triệu ph&iacute;a c&ocirc;ng ty sẽ hỗ trợ to&agrave;n bộ chi ph&iacute; vận chuyển h&agrave;ng</p>
</div>
</div>
</div>
</div>
</div>
', CAST(N'2015-10-08 16:49:00' AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (157, N'content_shipping', N'<table style="width:80%;margin-left:20px;">
	                                    <tbody>
		                                    <tr>
			                                    <td style="vertical-align:top">The delivery standards</td>
		                                    </tr>
		                                    <tr>
			                                    <td style="vertical-align:top">The delivery time is expected after 2 working days from the time of purchase.</td>
		                                    </tr>
	                                    </tbody>
                                    </table>', CAST(N'2015-10-08 16:49:00' AS SmallDateTime), 1, N'en')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (158, N'email_order_confirm', N'<html>

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
            <a href="{domain}"><span style="font-size: 10.0pt; line-height: 115%; font-family: Arial; color: #CCCCCC">{domain}</span></a><span
                style="font-size: 10.0pt; line-height: 115%; font-family: Arial; color: #CCCCCC">  
/    </span><a href="{email}"><span style="font-size: 10.0pt; line-height: 115%; font-family: Arial; color: #CCCCCC">{email}</span></a>
        </p>

    </div>

</body>

</html>', CAST(N'2015-10-08 16:49:00' AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (159, N'email_order_confirm', N'<html>

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
            <a href="{domain}"><span style="font-size: 10.0pt; line-height: 115%; font-family: Arial; color: #CCCCCC">{domain}</span></a><span
                style="font-size: 10.0pt; line-height: 115%; font-family: Arial; color: #CCCCCC">  
/    </span><a href="{email}"><span style="font-size: 10.0pt; line-height: 115%; font-family: Arial; color: #CCCCCC">{email}</span></a>
        </p>

    </div>

</body>

</html>', CAST(N'2015-10-08 16:49:00' AS SmallDateTime), 1, N'en')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (160, N'email_order_payment_change_status', N'<html>

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

</html>', CAST(N'2015-10-08 16:49:00' AS SmallDateTime), 1, N'vi')
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

</html>', CAST(N'2015-10-08 16:49:00' AS SmallDateTime), 1, N'en')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (162, N'email_confirm_forgot_password', N'<html>

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

		<p class="MsoNormal">Bạn vừa gửi yêu cầu lấy lại mật khẩu tại {domain}. Bạn cần nhập mã sau vào ô xác thực.
		
		<p class="MsoNormal">Mã xác thực:</p>

		<p class="MsoNormal"><strong>{code}</strong></p>
		
		<p class="MsoNormal"> Hãy click vào {link} này để tiếp tục quá trình lấy lại mật khẩu.</p>
		
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

</html>', CAST(N'2015-10-08 16:49:00' AS SmallDateTime), 1, N'vi')
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

</html>', CAST(N'2015-10-08 16:49:00' AS SmallDateTime), 1, N'en')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (164, N'contactdetail', N'<div class="vk-sparta-dark-contact-us-info-header">
	<h3>Vị trí địa lý</h3>
	<h2>CÁC TIỆN ÍCH XUNG QUANH</h2>
	<div class="clearfix"></div>
	<div class="vk-dark-contact-border"></div>
</div>
<div class="vk-sparta-dark-contact-us-info-text">
	<ul>
		<li>
			<div class="vk-sparta-dark-contact-us-info-text-icon">
				<span class="ti-location-pin"></span>
			</div>
			<div class="vk-sparta-dark-contact-us-info-text-right">
				<h4>HÀ NỘI - TRUNG TÂM THÀNH PHỐ</h4>
				<p>8 Km - 20 phút</p>
			</div>
		</li>
		<li>
			<div class="vk-sparta-dark-contact-us-info-text-icon">
				<span class="ti-email"></span>
			</div>
			<div class="vk-sparta-dark-contact-us-info-text-right">
				<h4>ĐẠI HỌC THĂNG LONG</h4>
				<p>0.5 Km - 2 phút</p>
			</div>
		</li>
		<li>
			<div class="vk-sparta-dark-contact-us-info-text-icon">
				<span class="ti-mobile"></span>
			</div>
			<div class="vk-sparta-dark-contact-us-info-text-right">
				<h4>SÂN BAY QUỐC TẾ NỘI BÀI</h4>
				<p>25 Km - 30 phút</p>
			</div>
		</li>
		<li>
			<div class="vk-sparta-dark-contact-us-info-text-icon">
				<span class="ti-mobile"></span>
			</div>
			<div class="vk-sparta-dark-contact-us-info-text-right">
				<h4>TRUNG TÂM HỘI NGHỊ QUỐC GIA</h4>
				<p>5 Km - 5 phút</p>
			</div>
		</li>
		<li>
			<div class="vk-sparta-dark-contact-us-info-text-icon">
				<span class="ti-mobile"></span>
			</div>
			<div class="vk-sparta-dark-contact-us-info-text-right">
				<h4>HỒ LINH ĐÀM</h4>
				<p>2 Km - 5 phút</p>
			</div>
		</li>
	</ul>
</div>', CAST(N'2015-01-01 00:00:00' AS SmallDateTime), 1, N'en')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (166, N'keywords', N'THE MANOR CENTRAL PARK', CAST(N'2018-06-22 17:26:00' AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (168, N'pagename', N'Belle Hair Salon', CAST(N'2015-12-31 15:22:00' AS SmallDateTime), 1, N'en')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (170, N'description', N'Belle hair salon', CAST(N'2015-12-31 15:22:00' AS SmallDateTime), 1, N'en')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (171, N'pagefooter1', N'<div class="vk-widget-content-info">
	<p><span class="ti-mobile"></span> (+233) 123 456789</p>
	<p><span class="ti-email"></span> contact@sparta.com</p>
	<p><span class="ti-location-pin"></span> 45 Queen''s Park Rd, Brighton, BN2 0GJ, UK</p>
</div>
<div class="vk-widget-content-share">
	<p>
		<a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
		<a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
		<a href="#"><i class="fa fa-google-plus" aria-hidden="true"></i></a>
		<a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a>
	</p>
</div>', CAST(N'2015-12-31 15:22:00' AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (172, N'pagefooter1', N'<div class="header-footer">
                        <h3>About us</h3>
                    </div>
                    <div class="inner-block">
                        <p>
                            We are <a href="#">MosaicDesign</a> group and we make modern, creative templetes. Our team created Responsive Premiuem E-commerce template 
                        </p>
                    </div>', CAST(N'2015-12-31 15:22:00' AS SmallDateTime), 1, N'en')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (173, N'pagefooter2', N'<h5 class="ev-widget-title">MY ACCOUNT</h5>
                        <ul class="ev-account">
                            <li><a href="#">Site map</a></li>
                            <li><a href="#"> Privacy Policy</a></li>
                            <li><a href="#">Your Account</a></li>
                            <li><a href="#">Advanced Search</a></li>
                        </ul>', CAST(N'2015-12-31 15:22:00' AS SmallDateTime), 1, N'vi')
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
                    </div>', CAST(N'2015-12-31 15:22:00' AS SmallDateTime), 1, N'en')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (175, N'pagefooter3', N'<h5 class="ev-widget-title">Customer Service</h5>
                        <ul class="ev-account">
                            <li><a href="#">Shipping Policy</a></li>
                            <li><a href="#"> Compensation First</a></li>
                            <li><a href="#">My Account</a></li>
                            <li><a href="#">Return Policy</a></li>
                        </ul>', CAST(N'2015-12-31 15:22:00' AS SmallDateTime), 1, N'vi')
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
                    </div>', CAST(N'2015-12-31 15:22:00' AS SmallDateTime), 1, N'en')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (177, N'pagefooter4', N'<h5 class="ev-widget-title">Our Upcoming events</h5>
                        <ul class="ev-adderss">
                            <li>
                                <i class="fa fa-map-marker"></i><span>40 Baria Sreet 133/2  NewYork City, United States.</span>
                            </li>
                            <li>
                                <i class="fa fa-phone"></i><span>0(1234) 567 890</span>
                            </li>
                            <li>
                                <i class="fa fa-fax"></i><span>0(1234) 567 890</span>
                            </li>
                            <li>
                                <i class="fa fa-envelope"></i><span>Infor@chairman.com</span>
                            </li>
                        </ul>', CAST(N'2015-12-31 15:22:00' AS SmallDateTime), 1, N'vi')
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
                    </div>', CAST(N'2015-12-31 15:22:00' AS SmallDateTime), 1, N'en')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (179, N'pagefooter5', N'<li><a href="http://soncoi.net">Design by soncoi.net</a></li>
<li><a href="#">@ 2018</a></li>', CAST(N'2015-12-31 15:22:00' AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (180, N'pagefooter5', N'<a href="https://www.facebook.com/Belle-Hair-Salon-450987675084279" target="_blank" class="symbol-facebook"><span class="tooltip symbol" title="Facebook">&#xe027;</span></a>', CAST(N'2015-12-31 15:22:00' AS SmallDateTime), 1, N'en')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (181, N'address', N'ĐƯỜNG NGUYỄN XIỂN 
HOÀNG MAI, HÀ NỘI', CAST(N'2018-06-22 17:26:00' AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (182, N'address', N'3D buildings, Duy Tan Street, Cau Giay District, Hanoi', CAST(N'2015-12-31 15:22:00' AS SmallDateTime), 1, N'en')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (183, N'pagefooter', N'© 2018 <span>THE MANOR CENTRAL PARK</span> - Kỷ nguyên mới trong lòng Hà Nội. </span>', CAST(N'2015-12-31 15:22:00' AS SmallDateTime), 1, N'vi')
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
                </div>', CAST(N'2015-12-31 15:22:00' AS SmallDateTime), 1, N'en')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (185, N'slogan', N'Kỷ nguyên mới <br/>
Trong lòng Hà Nội', CAST(N'2018-06-22 17:26:00' AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (186, N'slogan', N'Làm đẹp theo cách của bạn!', CAST(N'2015-12-31 15:22:00' AS SmallDateTime), 1, N'en')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (187, N'advsbottomleft', N'<p><a href="#"><img alt="" src="/images/images/shop2.png" style="width: 420px; height: 289px;" /></a></p>
', CAST(N'2015-12-31 15:22:00' AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (188, N'advsbottomleft', NULL, CAST(N'2015-12-31 15:22:00' AS SmallDateTime), 1, N'en')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (189, N'payment_guide', N'<p>- Qu&yacute; kh&aacute;ch c&oacute; thể tiến h&agrave;nh thanh to&aacute;n online qua c&aacute;c cổng thanh to&aacute;n Ng&acirc;n lượng hoặc Bảo kim.</p>

<p>1. Thanh to&aacute;n qua Bảo Kim ,&nbsp;Xin vui l&ograve;ng t&igrave;m hiểu th&ecirc;m tại <a href="https://www.baokim.vn/trang-chu" target="_blank">đ&acirc;y</a></p>

<p>2. Thanh to&aacute;n qua Ng&acirc;n Lượng , Xin vui l&ograve;ng t&igrave;m hiểu th&ecirc;m tại <a href="https://www.nganluong.vn/nganluong/home.html" target="_blank">đ&acirc;y</a>.</p>

<p>- Hoặc&nbsp;Qu&yacute; kh&aacute;ch tiến h&agrave;nh chuyển tiền cho ch&uacute;ng t&ocirc;i theo TK sau:</p>

<p>1. T&agrave;i Khoản Vietcombank - H&agrave; Nội</p>

<p><strong>Chủ t&agrave;i khoản:&nbsp;Đo&agrave;n Thị Mỵ</strong></p>

<p><strong><strong>Ng&acirc;n h&agrave;ng Vietcombank-&nbsp; Ph&ograve;ng giao dịch số 15, CN H&agrave; Nội.</strong></strong></p>

<p><strong>Số t&agrave;i khoản VNĐ: 0011003939117</strong></p>

<p>2. T&agrave;i Khoản Vietcombank - Hồ Ch&iacute; Minh</p>

<p><strong>TRẦN THỊ TH&Ugrave;Y LINH&nbsp;<br />
STK : 0331000457114<br />
CHI NH&Aacute;NH B&Ugrave;I THỊ XU&Acirc;N, Q1. TP.HCM</strong></p>

<p>3. T&agrave;i Khoản BIDV - H&agrave; Nội</p>

<p><strong>Chủ t&agrave;i khoản:&nbsp;Đo&agrave;n Thị Mỵ</strong></p>

<p><strong><strong>Ng&acirc;n h&agrave;ng BIDV-&nbsp; CN T&acirc;y H&agrave; Nội.</strong></strong></p>

<p><strong>Số t&agrave;i khoản VNĐ: 26010000558629</strong></p>

<p>- Số tiền qu&yacute; kh&aacute;ch chuyển cho ch&uacute;ng t&ocirc;i gồm:&nbsp;Gi&aacute; trị đơn h&agrave;ng cần mua&nbsp;(chưa bao gồm ph&iacute; vận chuyển)</p>

<p>- Sau khi chuyển tiền cho ch&uacute;ng t&ocirc;i đề nghị qu&yacute; kh&aacute;ch h&agrave;ng th&ocirc;ng b&aacute;o cho ch&uacute;ng t&ocirc;i qua số m&aacute;y :&nbsp;<strong>0986.100.578</strong>&nbsp;để ch&uacute;ng t&ocirc;i c&oacute; thể đ&oacute;ng g&oacute;i v&agrave; chuyển h&agrave;ng cho qu&yacute; kh&aacute;ch nhanh nhất.<br />
- Sau khi nhận được tiền, ch&uacute;ng t&ocirc;i sẽ tiến h&agrave;nh xuất h&agrave;ng &amp; gửi h&agrave;ng ngay cho qu&yacute; kh&aacute;ch theo đường chuyển ph&aacute;t nhanh.&nbsp;<br />
- Thời gian nhận h&agrave;ng: Từ 1 đến 3 ng&agrave;y.</p>

<p>Mọi phản hồi về h&agrave;ng h&oacute;a sẽ được giải đ&aacute;p sau 3 ng&agrave;y kể từ ng&agrave;y bạn nhận được h&agrave;ng.Bạn h&atilde;y kiểm tra kỹ th&ocirc;ng tin h&agrave;ng trước khi đặt để tr&aacute;nh nhầm lẫn.</p>
', CAST(N'2015-12-31 15:22:00' AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (190, N'payment_guide', NULL, CAST(N'2015-12-31 15:22:00' AS SmallDateTime), 1, N'en')
SET IDENTITY_INSERT [dbo].[_General] OFF
SET IDENTITY_INSERT [dbo].[_Invoices] ON 

INSERT [dbo].[_Invoices] ([id], [OrderCode], [CreateDate], [InvoiceContent], [Status]) VALUES (1, N'AMJTFW9B', CAST(N'2016-01-07 14:20:00' AS SmallDateTime), NULL, 1)
INSERT [dbo].[_Invoices] ([id], [OrderCode], [CreateDate], [InvoiceContent], [Status]) VALUES (2, N'GJ4Q5UMY', CAST(N'2016-06-29 10:14:00' AS SmallDateTime), NULL, 1)
INSERT [dbo].[_Invoices] ([id], [OrderCode], [CreateDate], [InvoiceContent], [Status]) VALUES (3, N'NRLE5UM0', CAST(N'2016-07-13 11:35:00' AS SmallDateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[_Invoices] OFF
INSERT [dbo].[_Languages] ([LangKey], [LangValue], [OrderDisplay], [IsUser]) VALUES (N'en  ', N'English', 2, 1)
INSERT [dbo].[_Languages] ([LangKey], [LangValue], [OrderDisplay], [IsUser]) VALUES (N'vi  ', N'Tiếng việt', 1, 1)
SET IDENTITY_INSERT [dbo].[_Link] ON 

INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (67, N'banner 2', N'', N'<p>&nbsp;</p>
', N'', N'/images/link/2018/6/sc_original_2091_banner2.jpg', N'SL', 3, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (68, N'CÔNG VIÊN CHU VĂN AN', N'', N'Là một dự án của TP rộng gần 110 ha đang dần được hình thành ngay bên cạnh quần thể The Manor Central Park, nơi tưởng niệm cụ Chu Văn An, một danh nhân kiệt xuất của dân tộc. Nơi đây cũng đóng vai trò là một “lá phổi Xanh” đang thối sức sống trong lành vào khu đô thị. Quý cư dân có thể thả mình vào thiên nhiên tươi mát với những thảm cỏ trải dài mênh mông, các hồ nước lớn, các công viên nhỏ hay những con đường rợp ngát bóng cây. Tất cả tạo nên một tổng hòa hoàn hảo giữa thiên nhiên và tâm linh, một vị trí đắc địa linh kiệt của The Manor Central Park.', N'', N'0', N'TE', 1, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (69, N'TUYẾN PHỐ THƯƠNG MẠI', N'', N'Không chỉ tôn vinh những giá trị truyền thống, khu đô thị The Manor Central Park còn ghi dấu những giá trị của một Hà Nội đương đại với “36 phố phường”. Những tuyến phố thương mại chính giữa khu biệt thư là nơi mà ngày nghỉ cuối tuần quý cư dân có thể thỏa sức tản bộ thư giãn hay hòa mình vào với không gian sôi động, đầy màu sắc. Trải nghiệm khám phá vô cùng mới lạ từ những sự kiện được thay đổi mỗi tuần như hội chợ thủ công mỹ nghệ, ẩm thực từ các quốc gia khác nhau…', N'', N'0', N'TE', 2, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (70, N'CÔNG VIÊN TRUNG TÂM', N'', N'Với diện tích tương đương hồ Hoàn Kiếm, công viên Trung Tâm đóng vai trò là TRÁI TIM của khu đô thị, tạo nên một “dòng máu Xanh” kết nối không gian trong một thể thống nhất dọc theo trục Bắc Nam, bắt đầu từ đại lộ Nguyễn Xiển. Công viên tiếp tục lan tỏa theo trục Đông Tây, kết nối với hơn 100 ha không gian xanh và mặt nước của công viên Chu Văn An, nơi đây hứa hẹn sẽ trở thành một không gian lý tưởng cho những hoạt động cộng đồng sôi nổi và tràn đầy sức sống.', N'', N'0', N'TE', 3, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (80, N'banner 1', N'', N'<p>&nbsp;</p>
', N'/vi/news/posts', N'/images/link/2018/6/sc_original_2091_banner.jpg', N'SL', 2, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (104, N'Liên kết 1', N'', N'<p>&nbsp;</p>
', N'http://soncoi.net', N'0', N'LK', 1, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (105, N'Video vimeo test', N'', N'', N'1', N'/images/link/2018/6/sc_original_2074_themanor1.mp4', N'SL', 1, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (1105, N'TIỆN ÍCH VƯỢT TRỘI', N'', N'The Manor Central Park quy tụ mọi yếu tố của một khu đô thị phức hợp hiện đại. Với các trường mầm non xuyên suốt khu đô thị và trường học quốc tế sẽ mang đến một môi trường giáo dục đẳng cấp. Cùng chuỗi tổ hợp khu văn phòng & trung tâm thương mại, khu vực sinh hoạt cộng đồng, phố đi bộ, khu thể thao phức hợp, bể bơi ngoài trời và nhiều tiện ích đa dạng được bố trí trong bán kính phục vụ hợp lí, kết nối thuận tiện an toàn tới khu dân cư. Dịch vụ bảo vệ chuyên nghiệp tới từng gia đình đáp ứng trọn vẹn mọi nhu cầu về không gian sống lý tưởng.', N'', N'0', N'TE', 4, N'vi')
SET IDENTITY_INSERT [dbo].[_Link] OFF
SET IDENTITY_INSERT [dbo].[_Pages] ON 

INSERT [dbo].[_Pages] ([PageID], [PageName], [Link], [ImagePath], [Summary], [PageContent], [DateModified], [Show], [Lang], [Keyword], [Description], [Title], [OrderDisplay]) VALUES (2, N'Central Park', N'Central-Park', N'0', N'Là nơi giao thoa hoàn hảo giữa thiên nhiên và con người cũng như những giá trị lịch sử và tầm nhìn về tương lai của Hà Nội trong thế ký 21. Kèm theo hàng loạt những tiện ích đẳng cấp, The Manor Central Park được hứa hẹn sẽ là một trong những khu đô thị sinh thái bậc nhất nội đô.', N'
<div class="vk-restaurant-about">
	<div class="container">
		<div class="vk-restaurant-header">
			<h3>Dự án</h3>
			<h2>THE MANOR CENTRAL PARK</h2>
			<div class="vk-restaurant-border"></div>
		</div>
		<div class="vk-restaurant-item-about">
			<div class="row">
				<div class="col-md-6 col-md-push-6">
					<div class="vk-resstaurant-item-img">
						<img src="/Content/themes/themanorcentralpark/images/themanor1.jpg" alt="" class="img-responsive">
					</div>
				</div>
				<div class="col-md-6 col-md-pull-6 vk-restaurant-item-info">
					<div class="vk-restaurant-about-item">
						<h3>Tổng quan dự án</h3>
						<p>
							Nằm trên mảnh đất vàng ở phía Tây Nam của Hà nội, The Manor Central Park là một trong những dự án về khu đô thị phức hợp hiện đại bậc nhất nội đô. Quần thể đô thị và công viên Chu Văn An rộng 200 ha, là nơi tôn vinh những giá trị lịch sử dân tộc nhưng vẫn mang trong mình phong cách sống hiện đại nhộp nhịp. Khác biệt bởi The Manor Central Park được quy hoạch để trở thành một khu đô thị phức hợp thiên về nhà ở và kinh doanh. Môi trường đi bộ và không gian cây xanh hồ nước được ưu tiên và chú trọng, song song với đó cộng hưởng từ chuỗi kinh tế như các trung tâm thương mại, tuyến phố mua sắm, khu văn phòng hay các khu vực sinh hoạt cộng đồng. Các chức năng được kiểm soát, điều tiết, tương hỗ lẫn nhau tạo nên một cộng đồng phát triển bền vững.
						</p>
					</div>
				</div>
			</div>
		</div>
		<div class="vk-restaurant-item-about">
			<div class="row">
				<div class="col-md-6">
					<div class="vk-resstaurant-item-img">
						<img src="/Content/themes/themanorcentralpark/images/The-manor-central-park2.jpg" alt="" class="img-responsive">
					</div>
				</div>
				<div class="col-md-6 vk-restaurant-item-info">
					<div class="vk-restaurant-about-item">
						<h3>Quy hoạch quần thể</h3>
						<p>
							Với mục đích phát triển tương lai lâu dài, quần thể The Manor Central Park và các công viên rộng 200 ha được kết hợp giữa khoảng xanh và tiện ích đô thị vượt trội như trường học, phố đi bộ, trung tâm thương mại, khu thể thao, bể bơi...
						</p>
					</div>
				</div>
			</div>
		</div>
		<div class="vk-restaurant-item-about">
			<div class="row">
				<div class="col-md-6 col-md-push-6">
					<div class="vk-resstaurant-item-img">
						<img src="/Content/themes/themanorcentralpark/images/the-manor-central-park.jpg" alt="" class="img-responsive">
					</div>
				</div>
				<div class="col-md-6 col-md-pull-6 vk-restaurant-item-info">
					<div class="vk-restaurant-about-item">
						<h3>Vị trí chiến lược</h3>
						<p>
							Dự án tọa lạc tại phía Tây Nam thành phố, phía bắc tiếp giáp với đường Nguyễn Xiển và phía nam với công viên Chu Văn An, sẽ là mạng lưới giao thông hiện đại kết nối thuận tiện đến trung tâm thành phố, sân bay quốc tế Nội Bài....
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>', CAST(N'2018-06-22 18:42:50.707' AS DateTime), 1, N'vi', N'THE MANOR CENTRAL PARK', N'THE MANOR CENTRAL PARK', N'THE MANOR CENTRAL PARK', 1)
INSERT [dbo].[_Pages] ([PageID], [PageName], [Link], [ImagePath], [Summary], [PageContent], [DateModified], [Show], [Lang], [Keyword], [Description], [Title], [OrderDisplay]) VALUES (9, N'Quy hoạch quần thể', N'Quy-hoach-quan-the', N'0', N'Với mục đích phát triển tương lai lâu dài, quần thể The Manor Central Park và các công viên rộng 200 ha được kết hợp giữa khoảng xanh và tiện ích đô thị vượt trội như trường học, phố đi bộ, trung tâm thương mại, khu thể thao, bể bơi...', N'
<div class="vk-restaurant-about">
	<div class="container">
		<div class="vk-restaurant-header">
			<h3>Dự án</h3>
			<h2>THE MANOR CENTRAL PARK</h2>
			<div class="vk-restaurant-border"></div>
		</div>
		<div class="vk-restaurant-item-about">
			<div class="row">
				<div class="col-md-6 col-md-push-6">
					<div class="vk-resstaurant-item-img">
						<img src="/Content/themes/themanorcentralpark/images/themanor1.jpg" alt="" class="img-responsive">
					</div>
				</div>
				<div class="col-md-6 col-md-pull-6 vk-restaurant-item-info">
					<div class="vk-restaurant-about-item">
						<h3>Tổng quan dự án</h3>
						<p>
							Nằm trên mảnh đất vàng ở phía Tây Nam của Hà nội, The Manor Central Park là một trong những dự án về khu đô thị phức hợp hiện đại bậc nhất nội đô. Quần thể đô thị và công viên Chu Văn An rộng 200 ha, là nơi tôn vinh những giá trị lịch sử dân tộc nhưng vẫn mang trong mình phong cách sống hiện đại nhộp nhịp. Khác biệt bởi The Manor Central Park được quy hoạch để trở thành một khu đô thị phức hợp thiên về nhà ở và kinh doanh. Môi trường đi bộ và không gian cây xanh hồ nước được ưu tiên và chú trọng, song song với đó cộng hưởng từ chuỗi kinh tế như các trung tâm thương mại, tuyến phố mua sắm, khu văn phòng hay các khu vực sinh hoạt cộng đồng. Các chức năng được kiểm soát, điều tiết, tương hỗ lẫn nhau tạo nên một cộng đồng phát triển bền vững.
						</p>
					</div>
				</div>
			</div>
		</div>
		<div class="vk-restaurant-item-about">
			<div class="row">
				<div class="col-md-6">
					<div class="vk-resstaurant-item-img">
						<img src="/Content/themes/themanorcentralpark/images/The-manor-central-park2.jpg" alt="" class="img-responsive">
					</div>
				</div>
				<div class="col-md-6 vk-restaurant-item-info">
					<div class="vk-restaurant-about-item">
						<h3>Quy hoạch quần thể</h3>
						<p>
							Với mục đích phát triển tương lai lâu dài, quần thể The Manor Central Park và các công viên rộng 200 ha được kết hợp giữa khoảng xanh và tiện ích đô thị vượt trội như trường học, phố đi bộ, trung tâm thương mại, khu thể thao, bể bơi...
						</p>
					</div>
				</div>
			</div>
		</div>
		<div class="vk-restaurant-item-about">
			<div class="row">
				<div class="col-md-6 col-md-push-6">
					<div class="vk-resstaurant-item-img">
						<img src="/Content/themes/themanorcentralpark/images/the-manor-central-park.jpg" alt="" class="img-responsive">
					</div>
				</div>
				<div class="col-md-6 col-md-pull-6 vk-restaurant-item-info">
					<div class="vk-restaurant-about-item">
						<h3>Vị trí chiến lược</h3>
						<p>
							Dự án tọa lạc tại phía Tây Nam thành phố, phía bắc tiếp giáp với đường Nguyễn Xiển và phía nam với công viên Chu Văn An, sẽ là mạng lưới giao thông hiện đại kết nối thuận tiện đến trung tâm thành phố, sân bay quốc tế Nội Bài....
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>', CAST(N'2018-06-22 18:43:00.820' AS DateTime), 1, N'vi', N'THE MANOR CENTRAL PARK', N'THE MANOR CENTRAL PARK', N'THE MANOR CENTRAL PARK', 2)
SET IDENTITY_INSERT [dbo].[_Pages] OFF
SET IDENTITY_INSERT [dbo].[_Payment] ON 

INSERT [dbo].[_Payment] ([id], [InvoiceID], [Amount], [CreateDate], [PaymentContent], [PaymentMenthod], [TransactionInfor], [TranscactionStatus], [Payment_type], [Net_amount], [Fee_amount], [Merchant_id], [Customer_name], [Customer_email], [Customer_phone]) VALUES (1, 3, 83600, CAST(N'2016-07-13 11:35:00' AS SmallDateTime), NULL, N'', N'Admin approve: admin', N'1', 3, NULL, NULL, NULL, N'Kenvil', N'duynvtest@gmail.com', N'0988693490')
SET IDENTITY_INSERT [dbo].[_Payment] OFF
SET IDENTITY_INSERT [dbo].[_Post] ON 

INSERT [dbo].[_Post] ([PostID], [CatelogID], [PostName], [ImagePath], [Link], [Summary], [PostContent], [DateModified], [IsHot], [Lang], [Keyword], [Description], [Title], [OrderDisplay], [Approve], [CreateDate]) VALUES (4, 76, N'Hướng dẫn nhuộm tóc nam đẹp hoàn hảo, thời thượng', N'/images/newspost/2016/5/sc_small_2105_5.jpg', N'Huong-dan-nhuom-toc-nam-dep-hoan-hao-thoi-thuong', N'Nhuộm tóc không còn là việc quá xa lạ đối với đấng mày râu trong thời buổi hiện tại. Khi mà chính màu tóc cũng đang tạo nên một cơn sốt trong làng thẩm mĩ thì việc lựa chọn cho mình một màu tóc để đánh bật lên phong cách, cá tính, thu hút người đối diện là điều hoàn toàn nên làm.', N'<p>Tuy nhi&ecirc;n mỗi người lại c&oacute; mỗi quan điểm kh&aacute;c nhau. C&oacute; người th&iacute;ch giữ lại m&agrave;u t&oacute;c đen truyền thống, c&oacute; người th&iacute;ch chạy theo xu hướng v&agrave; c&oacute; người th&iacute;ch l&agrave;m mới m&igrave;nh. Nhưng kh&ocirc;ng phải ai cũng biết c&aacute;ch l&agrave;m sao để c&oacute; một m&aacute;i&nbsp;<strong><a href="/vi/news/posts/76/Toc-nam" target="_blank" title="Tóc đẹp">t&oacute;c đẹp</a></strong>&nbsp;ho&agrave;n hảo nhất cho d&ugrave; c&oacute; nhuộm hay kh&ocirc;ng.</p>

<p><img alt="Hướng dẫn nhuộm tóc nam đẹp hoàn hảo, thời thượng" src="/images/images/stylist1.jpg" style="height:844px; width:600px" /></p>

<p><strong>Cập nhật xu hướng</strong></p>

<p>Việc chọn lựa m&agrave;u t&oacute;c kh&ocirc;ng chỉ đ&aacute;p ứng ti&ecirc;u ch&iacute; đẹp m&agrave; c&ograve;n phải hợp thời. Hiện nay c&oacute; những m&agrave;u t&oacute;c nam đang tạo n&ecirc;n một cơn sốt ch&iacute;nh l&agrave;: x&aacute;m kh&oacute;i, n&acirc;u đỏ, xanh r&ecirc;u...</p>

<p>Bạn phải chọn lựa cho m&igrave;nh được m&agrave;u t&oacute;c ph&ugrave; hợp để kh&ocirc;ng bị lạc l&otilde;ng so với xu hướng hiện nay.</p>

<p><strong>Ph&acirc;n t&iacute;ch bản th&acirc;n</strong></p>

<p>Bạn phải x&aacute;c định được m&agrave;u da của m&igrave;nh l&agrave; s&aacute;ng hay tối, ph&ugrave; hợp với t&ocirc;ng m&agrave;u n&agrave;o. Đối với những ai c&oacute; l&agrave;n da s&aacute;ng, ngo&agrave;i những t&ocirc;ng m&agrave;u nổi bật th&igrave; c&aacute;c m&agrave;u tối cũng rất đ&aacute;ng để thử.</p>

<p>Ngược lại nếu những anh ch&agrave;ng c&oacute; nước da ngăm chỉ n&ecirc;n chọn những m&agrave;u sắc ở mức độ trung t&iacute;nh. M&agrave;u n&acirc;u c&oacute; lẽ l&agrave; v&iacute; dụ điển h&igrave;nh.</p>

<p><strong>Thương hiệu tạo n&ecirc;n đẳng cấp</strong></p>

<p>Bạn n&ecirc;n tham khảo một số thương hiệu thuốc nhuộm tr&ecirc;n thị trường để biết được d&ograve;ng n&agrave;o l&agrave; tốt với t&oacute;c bạn. Bởi nếu sử dụng thuốc nhuộm kh&ocirc;ng đảm bảo chất lượng chẳng những sẽ kh&ocirc;ng l&ecirc;n m&agrave;u như &yacute; m&agrave; c&ograve;n ảnh hưởng rất lớn đến da đầu, về l&acirc;u về d&agrave;i c&oacute; thể dẫn đến ung thư da.</p>

<p>Ngo&agrave;i ra, bạn n&ecirc;n chọn c&aacute;c salon uy t&iacute;n v&igrave; để nhuộm t&oacute;c nam đẹp v&agrave; l&ecirc;n đ&uacute;ng m&agrave;u cần phải đ&uacute;ng c&ocirc;ng đoạn v&agrave; quan trọng nhất l&agrave; c&aacute;ch pha m&agrave;u.</p>

<p><strong>Chăm s&oacute;c sau khi nhuộm</strong></p>

<p>Bất cứ việc g&igrave; cũng vậy, cần phải c&oacute; sự chăm s&oacute;c để duy tr&igrave; vẻ đẹp. Sau khi nhuộm, thời gian đầu t&oacute;c sẽ rất yếu v&agrave; cần được chăm s&oacute;c. Bạn c&oacute; thể sử dụng c&aacute;c loại dầu gội phục hồi t&oacute;c, b&ecirc;n cạnh đ&oacute; n&ecirc;n sử dụng c&aacute;c serum giữ m&agrave;u cho t&oacute;c để c&oacute; m&agrave;u t&oacute;c đẹp như mơ.</p>
', CAST(N'2016-07-27 10:36:04.400' AS DateTime), 0, N'vi', N'tóc nam', N'Hướng dẫn nhuộm tóc nam đẹp hoàn hảo, thời thượng', N'Hướng dẫn nhuộm tóc nam đẹp hoàn hảo, thời thượng', 1, 1, NULL)
INSERT [dbo].[_Post] ([PostID], [CatelogID], [PostName], [ImagePath], [Link], [Summary], [PostContent], [DateModified], [IsHot], [Lang], [Keyword], [Description], [Title], [OrderDisplay], [Approve], [CreateDate]) VALUES (10, 65, N'Sẽ là hối tiếc nếu trong đời chưa một lần để tóc mái xoăn!', N'/images/newspost/2016/6/sc_small_2069_10.jpg', N'Se-la-hoi-tiec-neu-trong-doi-chua-mot-lan-de-toc-mai-xoan', N'Mốt tóc mái xoăn với những biến tấu cực ấn tượng mang tới phái đẹp vẻ đẹp sành điệu khiến nhiều người khao khát.', N'<p>Những kiểu&nbsp;<strong>t&oacute;c m&aacute;i xoăn</strong>&nbsp;mang tới vẻ đẹp lạ lẫm v&agrave; cực thu h&uacute;t cho chị em ph&aacute;i đẹp. C&oacute; nhiều c&aacute;ch biến tấu với t&oacute;c m&aacute;i xoăn, chị em&nbsp;phụ nữ&nbsp;c&oacute; thể lựa chọn cho m&igrave;nh kiểu&nbsp;<a href="/vi/news/posts/65/Toc-dep" target="_blank">t&oacute;c đẹp</a>&nbsp;v&agrave; ph&ugrave; hợp nhất với khu&ocirc;n mặt của m&igrave;nh.</p>

<p>H&atilde;y l&agrave; người ti&ecirc;n phong trong xu hướng l&agrave;m đẹp với m&aacute;i xoăn s&agrave;nh điệu để bạn trở th&agrave;nh người đẹp nhất mỗi nơi bạn xuất hiện.</p>

<p><img alt="Phần tóc mái mỏng được uống xoăn nhẹ rất tự nhiên, trông nhưng một phần tóc con nhưng được vào nếp gọn gàng. Kiểu tóc này khiến bạn như trẻ ra thêm vài tuổi, giống một nữ sinh trung học." src="/images/images/222.jpg" style="height:613px; width:500px" /></p>

<p>Phần t&oacute;c m&aacute;i mỏng được uống xoăn nhẹ rất tự nhi&ecirc;n, tr&ocirc;ng nhưng một phần t&oacute;c con nhưng được v&agrave;o nếp&nbsp;gọn g&agrave;ng. Kiểu t&oacute;c n&agrave;y khiến bạn như trẻ ra th&ecirc;m v&agrave;i tuổi, giống một nữ sinh trung học.</p>

<p><img alt="Biến tấu phần mái dài bằng cách uốn xoăn nhẹ nhàng mang tới vẻ đẹp tự nhiên cho toàn bộ khuôn mặt của bạn." src="/images/images/223.jpg" style="height:432px; width:500px" /></p>

<p>Biến tấu phần m&aacute;i d&agrave;i bằng c&aacute;ch uốn xoăn nhẹ nh&agrave;ng mang tới vẻ đẹp tự nhi&ecirc;n cho to&agrave;n bộ khu&ocirc;n mặt của bạn.</p>

<p><img alt="Kiểu tóc này rất phù hợp cho những nàng sở hữu tính cách năng động và cá tính. " src="/images/images/224.jpg" style="height:557px; width:500px" /></p>

<p>Kiểu t&oacute;c n&agrave;y rất ph&ugrave; hợp cho những n&agrave;ng sở hữu t&iacute;nh c&aacute;ch năng động v&agrave; c&aacute; t&iacute;nh.&nbsp;</p>

<p><img alt="Một chút nổi loạn với kiểu tóc mái xoăn đánh rối vô cùng thời trang." src="/images/images/225.jpg" style="height:650px; width:500px" /></p>

<p><img alt="Một chút nổi loạn với kiểu tóc mái xoăn đánh rối vô cùng thời trang." src="/images/images/226.jpg" style="height:587px; width:500px" /></p>

<p>Một ch&uacute;t nổi loạn với kiểu t&oacute;c m&aacute;i xoăn đ&aacute;nh rối v&ocirc; c&ugrave;ng thời trang.</p>

<p><img alt="Kiểu tóc đầy nữ tính, cực dễ chiều lòng mọi khuôn mặt và chẳng bao giờ lạc hậu." src="/images/images/228.jpg" style="height:340px; width:500px" /></p>

<p>Kiểu t&oacute;c đầy nữ t&iacute;nh, cực dễ chiều l&ograve;ng mọi khu&ocirc;n mặt v&agrave; chẳng bao giờ lạc hậu.</p>

<p>theo&nbsp;eva.vn</p>
', CAST(N'2016-07-27 10:36:06.080' AS DateTime), 0, N'vi', N'tóc đẹp', N'Sẽ là hối tiếc nếu trong đời chưa một lần để tóc mái xoăn!', N'Sẽ là hối tiếc nếu trong đời chưa một lần để tóc mái xoăn!', 10, 1, NULL)
INSERT [dbo].[_Post] ([PostID], [CatelogID], [PostName], [ImagePath], [Link], [Summary], [PostContent], [DateModified], [IsHot], [Lang], [Keyword], [Description], [Title], [OrderDisplay], [Approve], [CreateDate]) VALUES (23, 65, N'7 kiểu tóc gọn gàng cho ngày hè nắng nóng', N'/images/newspost/2016/6/sc_small_2070_12.jpg', N'7-kieu-toc-gon-gang-cho-ngay-he-nang-nong', N'Với những biến tấu tóc này, chị em vẫn có thể tha hồ điệu mặc cho ngày hè oi bức cùng với mồ hôi gây cảm giác bí bách, khó chịu.', N'<p>M&ugrave;a h&egrave; đến l&agrave; dịp ph&aacute;i đẹp tung tăng với nhiều kiểu trang phục như v&aacute;y ngắn, quần shorts, &aacute;o hai d&acirc;y&hellip; Tuy nhi&ecirc;n đối với kiểu t&oacute;c th&igrave; dường như kh&ocirc;ng c&oacute; nhiều sự lựa chọn. Hầu hết đều trung th&agrave;nh với t&oacute;c b&uacute;i cao hoặc buộc đu&ocirc;i ngựa bởi nhiều chị em ngại mồ h&ocirc;i khiến cho t&oacute;c bị bết r&iacute;t, kh&ocirc;ng v&agrave;o nếp, l&agrave;m hỏng mất kiểu&nbsp;<a href="/vi/news/posts/65/Toc-dep" target="_blank">t&oacute;c đẹp</a>. Dưới đ&acirc;y l&agrave; một số gợi &yacute; biến tấu với m&aacute;i t&oacute;c d&agrave;nh cho ng&agrave;y h&egrave; m&agrave; chị em c&oacute; thể &aacute;p dụng kh&ocirc;ng chỉ ở nơi c&ocirc;ng sở m&agrave; c&ograve;n tại ph&ograve;ng tập gym, lớp yoga hoặc những buổi tụ họp, tiệc t&ugrave;ng.</p>

<p><strong>1. T&oacute;c b&uacute;i cổ điển</strong></p>

<p>Kiểu t&oacute;c n&agrave;y tuy đơn giản nhưng tạo được ấn tượng sang trọng, qu&yacute; ph&aacute;i v&agrave; đứng đắn nếu kết hợp với trang phục đơn giản, thanh nh&atilde;. T&oacute;c b&uacute;i cổ điển gọn g&agrave;ng vừa ph&ugrave; hợp với chị em trong nhiều dịp v&agrave; nhiều hoạt động kh&aacute;c nhau vừa g&oacute;p phần gi&uacute;p khu&ocirc;n mặt s&aacute;ng sủa, thanh tho&aacute;t hơn.</p>

<p><img alt="tóc búi cổ điển" src="/images/images/229.jpg" style="height:667px; width:500px" /></p>

<p>T&oacute;c b&uacute;i cổ điển gọn g&agrave;ng, gi&uacute;p khu&ocirc;n mặt&nbsp;thanh tho&aacute;t hơn lại ph&ugrave; hợp với c&ocirc;ng sở lẫn tiệc t&ugrave;ng</p>

<p><strong>2. T&oacute;c m&aacute;i hất ngược ra sau</strong></p>

<p>Kiểu t&oacute;c n&agrave;y chưa mất đến một ph&uacute;t để ho&agrave;n th&agrave;nh, chỉ cần t&uacute;m lại phần t&oacute;c m&aacute;i rồi vuốt ngược ra ph&iacute;a sau v&agrave; cố định bằng cặp ghim l&agrave; bạn đ&atilde; c&oacute; ngay diện mạo mới năng động v&agrave; c&aacute; t&iacute;nh.</p>

<p><img alt="tóc hất ngược ra phía sau" src="/images/images/230.jpg" style="height:667px; width:500px" /></p>

<p>Cặp ngược t&oacute;c m&aacute;i ra sau vừa gi&uacute;p gương mặt gọn g&agrave;ng, đem lại cảm gi&aacute;c thoải m&aacute;i, m&aacute;t mẻ trong ng&agrave;y h&egrave; n&oacute;ng bức vừa gi&uacute;p l&agrave;n da th&ocirc;ng tho&aacute;ng v&agrave; bớt nguy cơ bị mụn v&ugrave;ng tr&aacute;n trong những ng&agrave;y thời tiết kh&oacute; chịu</p>

<p><strong>3. T&oacute;c đu&ocirc;i ngựa biến tấu</strong></p>

<p>Tương tự kiểu t&oacute;c đu&ocirc;i ngựa th&ocirc;ng thường, nhưng điểm nhấn nằm ở chỗ chiếc d&acirc;y buộc t&oacute;c của bạn sẽ bị che đi bằng một lọn t&oacute;c kh&aacute;c. Thay v&igrave; t&oacute;m gọn hết t&oacute;c v&agrave; buộc lại, c&aacute;c n&agrave;ng h&atilde;y chừa ra một lọn t&oacute;c với dộ d&agrave;y bằng khoảng một chiếc ống h&uacute;t. Sau khi buộc t&oacute;c bằng d&acirc;y thun, d&ugrave;ng lọn t&oacute;c n&agrave;y quấn quanh chỗ buộc để che đi sợi thun v&agrave; cố định lọn t&oacute;c n&agrave;y bằng kẹp tăm.</p>

<p><img alt="" src="/images/images/231.jpg" style="height:667px; width:500px" /></p>

<p>Điểm nhấn của kiểu đu&ocirc;i ngựa biến tấu so với truyền thống nằm ở lọn t&oacute;c quấn kh&eacute;o để&nbsp;giấu đi chiếc d&acirc;y thun buộc t&oacute;c.</p>

<p><strong>4. C&agrave;i băng đ&ocirc;</strong></p>

<p>M&oacute;n phụ kiện n&agrave;y gi&uacute;p cố định phần t&oacute;c m&aacute;i v&agrave; l&agrave;m điểm nhấn trong trường hợp chị em trang điểm theo phong c&aacute;ch tự nhi&ecirc;n v&agrave; lựa chọn trang phục tương đối đơn giản. Khi chọn băng đ&ocirc;, n&ecirc;n lưu &yacute; đến h&igrave;nh d&aacute;ng của khu&ocirc;n mặt: mặt tr&ograve;n th&iacute;ch hợp với băng đ&ocirc; bản to dẹt, mặt V-line n&ecirc;n lựa chọn băng đ&ocirc; mỏng bản nhỏ, v&agrave; băng đ&ocirc; d&agrave;y &ldquo;hợp cạ&rdquo; nhất với n&agrave;ng mặt tr&aacute;i xoan.</p>

<p><img alt="" src="/images/images/232.jpg" style="height:667px; width:500px" /></p>

<p>Băng đ&ocirc; l&agrave; một phụ kiện hữu &iacute;ch&nbsp;vừa gi&uacute;p chị&nbsp;em th&ecirc;m nổi bật vừa gi&uacute;p cố định m&aacute;i t&oacute;c gọn g&agrave;ng trong m&ugrave;a n&oacute;ng</p>

<p><strong>5. T&oacute;c buộc thấp vểnh sau g&aacute;y</strong></p>

<p><strong>C</strong>hỉ cần kh&eacute;o l&eacute;o t&aacute;ch phần m&aacute;i rồi t&uacute;m gọn chỗ t&oacute;c c&ograve;n lại ra ph&iacute;a sau g&aacute;y, gấp phần đu&ocirc;i t&oacute;c l&ecirc;n sau đ&oacute; cố định bằng chun, bạn đ&atilde; sở hữu một kiểu t&oacute;c vừa gọn vừa dịu d&agrave;ng rồi đấy. Kiểu t&oacute;c n&agrave;y đặc biệt th&iacute;ch hợp với người c&oacute; m&aacute;i t&oacute;c d&agrave;i ngang vai v&agrave; kh&aacute; thuận tiện khi đội mũ bảo hiểm bởi bạn sẽ kh&ocirc;ng bị sụp cả b&uacute;i t&oacute;c xuống như khi b&uacute;i cao hoặc buộc đu&ocirc;i ngựa.</p>

<p><img alt="" src="/images/images/233.jpg" style="height:667px; width:500px" /></p>

<p>T&oacute;c buộc thấp vểnh sau g&aacute;y rất&nbsp;thuận tiện khi đội mũ bảo hiểm&nbsp;</p>

<p><strong>6. T&oacute;c tết đu&ocirc;i c&aacute;</strong></p>

<p>T&oacute;c tết kiểu n&agrave;y rất gọn g&agrave;ng, tr&aacute;nh g&acirc;y rối t&oacute;c n&ecirc;n cũng rất thuận tiện với trường hợp đội mũ bảo hiểm trong khi phải tr&ugrave;m mũ của &aacute;o kho&aacute;c chống nắng ra ngo&agrave;i.</p>

<p><img alt="" src="/images/images/234.jpg" style="height:667px; width:500px" /></p>

<p>Hơi tốn thời gian chuẩn bị một ch&uacute;t nhưng t&oacute;c đu&ocirc;i c&aacute; gọn g&agrave;ng vừa&nbsp;gi&uacute;p chị em tỏa s&aacute;ng vừa&nbsp;di chuyển thuận tiện khi đội mũ bảo hiểm</p>

<p><strong>7. Tết m&aacute;i kiểu vương miện</strong></p>

<p>Vừa cố định t&oacute;c m&aacute;i gọn g&agrave;ng để khu&ocirc;n mặt tho&aacute;ng v&agrave; s&aacute;ng sủa vừa đem lại hiệu ứng dịu d&agrave;ng, cổ điển n&ecirc;n kiểu t&oacute;c n&agrave;y rất được l&ograve;ng chị em. Nếu kh&ocirc;ng muốn những lọn t&oacute;c m&aacute;i l&ograve;a x&ograve;a tr&ecirc;n mặt c&ugrave;ng với mồ h&ocirc;i tr&aacute;n l&agrave;m lem phấn v&agrave; mascara trang điểm, c&aacute;c n&agrave;ng n&ecirc;n thử m&aacute;i t&oacute;c tết vương miện n&agrave;y.</p>

<p><img alt="Tóc mái tết hình vương miện điệu đà cũng là một gợi ý hay chị em nên thử" src="/images/images/235.jpg" style="height:667px; width:500px" /></p>

<p>T&oacute;c m&aacute;i tết h&igrave;nh vương miện điệu đ&agrave; cũng l&agrave; một gợi &yacute; hay chị em n&ecirc;n thử.</p>

<p>theo eva.vn</p>
', CAST(N'2016-07-27 10:36:06.927' AS DateTime), 0, N'vi', N'tóc đẹp', N'Với những biến tấu tóc này, chị em vẫn có thể tha hồ điệu mặc cho ngày hè oi bức cùng với mồ hôi gây cảm giác bí bách, khó chịu.', N'7 kiểu tóc gọn gàng cho ngày hè nắng nóng', 10, 1, NULL)
INSERT [dbo].[_Post] ([PostID], [CatelogID], [PostName], [ImagePath], [Link], [Summary], [PostContent], [DateModified], [IsHot], [Lang], [Keyword], [Description], [Title], [OrderDisplay], [Approve], [CreateDate]) VALUES (24, 80, N'Kiểu tóc ngắn “quyến rũ” Miranda Kerr “khuấy động” mùa Hè', N'/images/newspost/2016/5/sc_small_2109_1.jpg', N'Kieu-toc-ngan-“quyen-ru”-Miranda-Kerr-“khuay-dong”-mua-He', N'Tạm biệt mái tóc dài thướt tha, Miranda Kerr vẫn rất nổi bật với nhiều kiểu tóc ngắn đẹp vô cùng sang trọng và cá tính.', N'<p>D&ugrave; đ&atilde; kh&ocirc;ng c&ograve;n gắn liền với&nbsp;biệt danh &lsquo;thi&ecirc;n thần Victoria Secret&rsquo; quyến rũ nữa nhưng kiều nữ Miranda Kerr vẫn chưa hề mất đi sự quyến rũ vốn c&oacute; của m&igrave;nh. Si&ecirc;u mẫu 33 tuổi lu&ocirc;n nổi bật v&agrave; rạng ngời mỗi khi xuất hiện trước c&ocirc;ng ch&uacute;ng với một vẻ ngo&agrave;i đ&aacute;ng ngưỡng mộ.<br />
Những kiểu t&oacute;c của n&agrave;ng cũng l&agrave; một trong những ti&ecirc;u điểm ch&uacute; &yacute; của ph&aacute;i đẹp tr&ecirc;n khắp thế giới. Trong những lần xuất hiện gần đ&acirc;y, Miranda tiếp tục chứng tỏ sức h&uacute;t của m&igrave;nh với những kiểu t&oacute;c ngắn&nbsp;mới lạ b&ecirc;n cạnh th&acirc;n h&igrave;nh quyến rũ. H&atilde;y c&ugrave;ng xem c&ocirc; n&agrave;ng đ&atilde; biến tấu như thế n&agrave;o cho m&aacute;i t&oacute;c ngắn của m&igrave;nh nh&eacute;!</p>

<p><img alt="Tóc retro quyến rũ" src="/images/images/Miranda-Kerr-Hair-Makeup-2016%20(5).jpg" style="height:1024px; width:682px" /></p>

<p>Trong lần xuất hiện tại bữa tiệc sau lễ trao giải Oscar năm nay, Miranda v&ocirc; c&ugrave;ng quyến rũ với m&aacute;i t&oacute;c xoăn retro lượn s&oacute;ng. Những nếp t&oacute;c phồng nhẹ tr&ecirc;n đầu được tiếp nối tự nhi&ecirc;n với những lọn xoăn mềm mại b&ecirc;n dưới. C&ugrave;ng với đ&ocirc;i m&ocirc;i đỏ, m&aacute;i t&oacute;c khiến cho người ta gợi nhớ đến h&igrave;nh ảnh của Marilyn Monroe nhưng vẫn kh&ocirc;ng thể qu&ecirc;n đi gương mặt h&uacute;t hồn của si&ecirc;u mẫu.</p>

<p><img alt="/Miranda Kerr " src="/images/images/Miranda-Kerr-Hair-Makeup-2016%20(1).jpg" style="height:841px; width:634px" /></p>

<p><em><strong>theo REUTERS</strong></em></p>
', CAST(N'2016-07-27 10:37:03.577' AS DateTime), 1, N'vi', N'tóc ngắn', N'Kiểu tóc ngắn “quyến rũ” Miranda Kerr “khuấy động” mùa Hè', N'Kiểu tóc ngắn “quyến rũ” Miranda Kerr “khuấy động” mùa Hè', 1, 1, NULL)
INSERT [dbo].[_Post] ([PostID], [CatelogID], [PostName], [ImagePath], [Link], [Summary], [PostContent], [DateModified], [IsHot], [Lang], [Keyword], [Description], [Title], [OrderDisplay], [Approve], [CreateDate]) VALUES (26, 77, N'Học để trở thành nhà tạo mẫu tóc chuyên nghiệp', N'/images/newspost/2016/5/sc_small_2109_3.jpg', N'Hoc-de-tro-thanh-nha-tao-mau-toc-chuyen-nghiep', N'Trong bối cảnh nhu cầu làm đẹp ngày càng tăng, vai trò của nhà tạo mẫu tóc theo đó mà được nhìn nhận cao hơn so với trước đây. Hiện nay, không ít những trung tâm đào tạo về tóc được xây dựng nhằm thu hút các bạn trẻ theo học, nhưng một thực trạng không thể tránh khỏi, đó lào tạo càng nhiều, thất nghiệp càng cao. ', N'<p>Nguy&ecirc;n nh&acirc;n ch&iacute;nh l&agrave; do những salon t&oacute;c lu&ocirc;n đặt y&ecirc;u cầu về kinh nghiệm, tr&igrave;nh độ tay nghề của người thợ khi tuyển dụng. Đ&acirc;y l&agrave; một điều kiện hết sức kh&oacute; khăn cho bạn mới vừa tham gia học ng&agrave;nh t&oacute;c, chỉ vừa được đ&agrave;o tạo về l&yacute; thuyết m&agrave; chưa c&oacute; thời gian trải nghiệm thực tế.</p>

<p><strong>Y&ecirc;u cầu cao về đ&agrave;o tạo kỹ năng</strong></p>

<p>Khi bắt đầu tham gia kho&aacute; học Nh&agrave; tạo mẫu t&oacute;c chuy&ecirc;n nghiệp tại Belle beaute, học vi&ecirc;n sẽ được tiếp x&uacute;c với m&ocirc;i trường học th&acirc;n thiện, tận t&acirc;m do những nh&agrave; tạo mẫu đang l&agrave;m việc tại hệ thống trực tiếp giảng dạy.</p>

<p><img alt="Trung tâm đào tạo Belle hair salon" src="/images/images/C360_2016-04-18-15-58-12-289.jpg" style="height:638px; width:850px" /></p>

<p>Chương tr&igrave;nh học được x&acirc;y dựng đặc biệt sẽ khiến bạn phải nỗ lực hết c&ocirc;ng sức từ thứ 2 đến thứ 7, thậm ch&iacute; cả những ng&agrave;y chủ nhật d&agrave;nh cho thực h&agrave;nh. Trong 3 th&aacute;ng đầu, giảng vi&ecirc;n tại trung t&acirc;m đ&agrave;o tạo sẽ theo s&aacute;t để k&egrave;m cặp, nhằm đảm bảo bạn nắm được những kiến thức căn bản, tiếp cận với c&aacute;c m&aacute;y m&oacute;c trang thiết bị hiện đại v&agrave; c&aacute;c c&ocirc;ng nghệ ti&ecirc;n tiến như uốn s&oacute;ng nước, uốn dợn s&oacute;ng, uốn c&uacute;p phồng, uốn bay, duỗi dợn, duỗi c&uacute;p, nhuộm 3D v&agrave; c&aacute;c c&aacute;ch cắt tạo kiểu mới nhất. Bạn sẽ được ph&aacute;t huy c&aacute;c kiến thức đ&oacute; tại c&aacute;c chi nh&aacute;nh Belle salon từ 1-2 tuần sau đ&oacute;. Trước khi trở th&agrave;nh một nh&acirc;n vi&ecirc;n ch&iacute;nh thức, bạn sẽ c&oacute; &iacute;t nhất một th&aacute;ng nữa để ho&agrave;n th&agrave;nh việc trang bị c&aacute;c kỹ năng ban đầu.</p>

<p><strong>Đ&agrave;o tạo con người v&agrave; chuy&ecirc;n m&ocirc;n</strong></p>

<p>Ngo&agrave;i việc đ&agrave;o tạo về kỹ năng chuy&ecirc;n m&ocirc;n, tại đ&acirc;y c&ograve;n đặt mục ti&ecirc;u truyền đạt cho học vi&ecirc;n c&aacute;c kiến thức về c&aacute;c kỹ năng tư vấn, giao tiếp, khả năng nắm bắt t&acirc;m l&yacute; kh&aacute;ch h&agrave;ng&hellip; cũng được trang bị bởi giảng vi&ecirc;n thạc sĩ am hiểu trong ng&agrave;nh l&agrave;m đẹp. Đặc biệt hơn, c&aacute;c buổi chia sẻ về kỹ năng sống, sao cho c&oacute; &iacute;ch cho bản th&acirc;n v&agrave; x&atilde; hội li&ecirc;n tục được tổ chức nhằm ph&aacute;t triển tư duy c&aacute;n bộ nh&acirc;n vi&ecirc;n.</p>

<p><img alt="Chuyên gia hàng đầu về tóc tham gia giảng dạy." src="/images/images/C360_2016-04-18-18-15-38-066.jpg" style="height:638px; width:850px" /></p>

<p>Đ&acirc;y sẽ l&agrave; nơi hội tụ của những nh&agrave; tạo mẫu t&oacute;c xuất sắc nhất c&ugrave;ng với trang thiết bị m&aacute;y m&oacute;c, c&ocirc;ng nghệ hiện đại. Ngo&agrave;i định hướng ph&aacute;t triển tr&ecirc;n tất cả c&aacute;c th&agrave;nh phố tại Việt Nam.</p>

<p>Điện thoại <strong>0946661112&nbsp;</strong> để được tư vấn v&agrave; hướng dẫn chi tiết.</p>
', CAST(N'2016-07-27 10:37:04.470' AS DateTime), 1, N'vi', N'Đào tạo ', N'Đào tạo ', N'Học để trở thành nhà tạo mẫu tóc chuyên nghiệp', 1, 1, CAST(N'2016-05-13 17:49:49.420' AS DateTime))
INSERT [dbo].[_Post] ([PostID], [CatelogID], [PostName], [ImagePath], [Link], [Summary], [PostContent], [DateModified], [IsHot], [Lang], [Keyword], [Description], [Title], [OrderDisplay], [Approve], [CreateDate]) VALUES (27, 65, N'Giải đáp 11 thắc mắc về chăm sóc tóc', N'/images/newspost/2016/5/sc_small_2109_4.jpg', N'Giai-dap-11-thac-mac-ve-cham-soc-toc', N'Làm sao để tóc bóng mượt và chắc khỏe? Có nên lo lắng quá khi tóc gãy rụng? Xử lý tóc khô và cong veo thế nào? Làm sao để giữ màu tóc lâu bền? Hãy để các chuyên gia giải đáp thắc mắc về chăm sóc tóc và tư vấn cho bạn những bí quyết hay nhất để có mái tóc khỏe đẹp và hợp mốt.
', N'<p><em><strong>1. L&agrave;m c&aacute;ch n&agrave;o để duy tr&igrave; m&aacute;i t&oacute;c b&oacute;ng mượt v&agrave; chắc khỏe?</strong></em></p>

<p>So s&aacute;nh với ch&acirc;n t&oacute;c, ngọn t&oacute;c của ch&uacute;ng ta c&oacute; thể mất nhiều hơn gấp 3 lần lượng protein, th&agrave;nh phần ch&iacute;nh trong cấu tr&uacute;c của mỗi lớp biểu b&igrave; t&oacute;c. Sự mất protein khiến m&aacute;i t&oacute;c trở n&ecirc;n xốp hơn v&agrave; dễ tổn thương, chẻ ngọn. V&igrave; thế, d&ugrave;ng dầu gội tăng cường t&iacute;nh năng tạo sự &oacute;ng mượt. D&ugrave;ng dầu xả dưỡng ẩm đến tận phần ch&acirc;n t&oacute;c, gi&uacute;p m&aacute;i t&oacute;c tr&aacute;nh bị kh&ocirc;.</p>

<p><em><strong>2. C&oacute; n&ecirc;n qu&aacute; lo lắng khi t&oacute;c g&atilde;y rụng?</strong></em></p>

<p>Th&ocirc;ng thường c&oacute; khoảng 50 đến 100 sợi t&oacute;c rụng đi mỗi ng&agrave;y, nhưng nếu phần gốc t&oacute;c (với phần viền trắng) kh&ocirc;ng c&oacute; trong phần t&oacute;c rụng, đ&oacute; l&agrave; dấu hiệu t&oacute;c bị g&atilde;y. Theo chuy&ecirc;n gia của Pantene, c&oacute; nhiều nguy&ecirc;n nh&acirc;n khiến t&oacute;c g&atilde;y rụng: ăn uống thiếu khoa học dẫn đến thiếu hụt protein v&agrave; vitamin B, lạm dụng h&oacute;a chất tạo kiểu v&agrave; những biện ph&aacute;p l&agrave;m đẹp t&oacute;c tạm thời. Để ngăn chặn t&oacute;c g&atilde;y rụng, bạn cần gi&uacute;p cho t&oacute;c khỏe từ b&ecirc;n trong, sử dụng c&aacute;c sản phẩm c&oacute; bổ sung protein v&agrave; Pro vitamin, tr&aacute;nh tối đa việc tiếp x&uacute;c với h&oacute;a chất tạo kiểu, nước hồ bơi&hellip;</p>

<p><em><strong>3. L&agrave;m c&aacute;ch n&agrave;o để bảo vệ t&oacute;c khỏi tổn thương do m&ocirc;i trường?</strong></em></p>

<p>Một sản phẩm dưỡng ẩm hoặc serum bảo vệ khỏi tia UV gi&uacute;p tăng độ ẩm cho biểu b&igrave; t&oacute;c v&agrave; tạo lớp bảo vệ, gi&uacute;p hạn chế tối đa những tổn thương từ &ocirc; nhiễm m&ocirc;i trường.</p>

<p><strong><em>4. T&ocirc;i n&ecirc;n d&ugrave;ng c&aacute;c loại thực phẩm g&igrave; để m&aacute;i t&oacute;c khỏe mạnh?</em></strong></p>

<p>B&aacute;c sĩ Minh Hạnh, trung t&acirc;m dinh dưỡng TP. HCM, khuyến kh&iacute;ch chế độ ăn gi&agrave;u protein v&agrave; c&aacute;c dưỡng chất như kẽm, ma-gi&ecirc;, sắt v&agrave; vitamin B. B&ecirc;n cạnh đ&oacute;, h&atilde;y uống &iacute;t nhất từ 8 đến 10 ly nước mỗi ng&agrave;y.</p>

<p><em><strong>5. T&ocirc;i thực sự ch&aacute;n nản với m&aacute;i t&oacute;c kh&ocirc; v&agrave; cong veo của m&igrave;nh.</strong></em></p>

<p>Nếu bạn d&ugrave;ng m&aacute;y tạo kiểu bằng nhiệt, h&atilde;y t&igrave;m những loại c&oacute; c&ocirc;ng nghệ ion. Trị liệu bằng dầu mỗi tuần cũng rất quan trọng. H&atilde;y thoa một &iacute;t dầu dưỡng t&oacute;c Moroccanoil Treatment l&ecirc;n t&oacute;c trước khi sấy. Th&agrave;nh phần dầu argan nhanh ch&oacute;ng thẩm thấu tạo độ s&aacute;ng b&oacute;ng cải thiện độ đ&agrave;n hồi, bảo vệ t&oacute;c khỏi c&aacute;c nh&acirc;n tố g&acirc;y hại từ m&ocirc;i trường v&agrave; cắt giảm thời gian sấy kh&ocirc; t&oacute;c tới 40%.</p>

<p><a href="/images/photoproduct/2016/5/sc_full_2057_32.jpg" target="_blank"><img alt="Dầu dưỡng Moroccanoil chứa thành phần dầu argan" src="/images/photoproduct/2016/5/sc_full_2057_32.jpg" style="height:500px; width:500px" /></a></p>

<p>Dầu dưỡng Moroccanoil chứa th&agrave;nh phần dầu argan</p>

<p><em><strong>6. L&agrave;m c&aacute;ch n&agrave;o để giữ m&agrave;u t&oacute;c l&acirc;u bền?</strong></em></p>

<p>H&atilde;y d&ugrave;ng những sản phẩm d&agrave;nh ri&ecirc;ng cho t&oacute;c nhuộm. Chuy&ecirc;n gia tạo mẫu t&oacute;c của L&rsquo;Or&eacute;al Professionnel khuy&ecirc;n: &ldquo;Nếu bạn bơi lội thường xuy&ecirc;n, h&atilde;y d&ugrave;ng c&aacute;c sản phẩm c&oacute; t&iacute;nh lọc tia UV v&agrave; chứa c&ocirc;ng thức dưỡng. M&agrave;u đỏ lu&ocirc;n phai nhanh nhất, v&igrave; vậy, đừng gội qu&aacute; nhiều nếu sở hữu m&agrave;u t&oacute;c n&agrave;y. Những t&ocirc;ng m&agrave;u v&agrave;ng thường c&oacute; vẻ ngo&agrave;i kh&ocirc;, do đ&oacute;, h&atilde;y d&ugrave;ng serum để dưỡng ẩm cho t&oacute;c&rdquo;.</p>

<p><em><strong>7. T&ocirc;i c&oacute; thể dặm m&agrave;u cho t&oacute;c tại nh&agrave; chứ?</strong></em></p>

<p>Chuy&ecirc;n gia của L&rsquo;Or&eacute;al Professionnel n&oacute;i:&nbsp;&ldquo;H&atilde;y d&ugrave;ng những sản phẩm trước nhuộm v&agrave; khi nhuộm, h&atilde;y nhuộm từ phần gốc. Trải m&agrave;u đều tr&ecirc;n t&oacute;c v&agrave; để trong khoảng 40 ph&uacute;t. Gội lại bằng nước ấm v&agrave; m&aacute;t-xa nhẹ nh&agrave;ng. &ETH;ừng d&ugrave;ng dầu gội. Thay v&agrave;o đ&oacute;, d&ugrave;ng dầu xả v&agrave; giữ trong khoảng 2 ph&uacute;t trước khi xả lại.</p>

<p>B&iacute; quyết: Thoa s&aacute;p dưỡng l&ecirc;n v&ugrave;ng tr&aacute;n, ph&iacute;a sau tai v&agrave; phần cổ để tr&aacute;nh d&iacute;nh m&agrave;u l&ecirc;n da.</p>

<p><em><strong>8. L&agrave;m sao để chữa trị da đầu kh&ocirc;, bong tr&oacute;c?</strong></em></p>

<p>Việc dưỡng dầu thường xuy&ecirc;n v&agrave; d&ugrave;ng c&aacute;c loại dầu gội nhẹ c&oacute; thể trị da đầu kh&ocirc;. Nếu c&oacute; bệnh về da, h&atilde;y nhờ b&aacute;c sĩ da liễu tư vấn. Những loại dầu gội chứa nhựa tar hoặc axit salycilic gi&uacute;p c&aacute;c mảng bong tr&oacute;c rơi ra. Trong khi đ&oacute;, dầu gội chứa Ketoconazole v&agrave; Pyrithione kẽm gi&uacute;p trị da đầu vi&ecirc;m nhiễm.</p>

<p><em><strong>9. T&ocirc;i th&iacute;ch để kiểu t&oacute;c bồng bouffant của những năm 1960. Nếu chải ngược th&igrave; t&oacute;c t&ocirc;i c&oacute; bị tổn thương kh&ocirc;ng?</strong></em></p>

<p>Nh&agrave; tạo mẫu t&oacute;c Andr&eacute; của Ynot salon cho biết: &ldquo;Chải ngược qu&aacute; nhiều chắc chắn sẽ khiến t&oacute;c bị chẻ ngọn, t&oacute;c sẽ bị g&atilde;y rụng, đặc biệt l&agrave; ở đỉnh đầu trở n&ecirc;n dễ g&atilde;y&rdquo;. Thay v&igrave; chải ngược, h&atilde;y sử dụng c&aacute;c sản phẩm tạo độ bồng.</p>

<p><a href="/vi/product/product/74/Keo-bot-tao-do-phong-cho-toc-manh-Alfaparf-Volume-125ml" target="_blank"><img alt="" src="/images/photoproduct/2016/5/sc_full_2081_5.jpg" style="height:500px; width:500px" /></a></p>

<p>KEO BỌT TẠO ĐỘ PHỒNG CHO T&Oacute;C MẢNH ALFAPARF VOLUME</p>

<p><em><strong>10. T&ocirc;i kh&ocirc;ng thể sống thiếu m&aacute;y duỗi t&oacute;c. L&agrave;m c&aacute;ch n&agrave;o để tr&aacute;nh tổn thương m&aacute;i t&oacute;c?</strong></em></p>

<p>C&aacute;c loại m&aacute;y tạo kiểu d&ugrave;ng nhiệt khiến protein t&oacute;c (Keratin) bị bong tr&oacute;c. V&igrave; vậy, nhớ sấy t&oacute;c kh&ocirc; ho&agrave;n to&agrave;n trước khi tạo kiểu. D&ugrave;ng một sản phẩm chịu nhiệt d&agrave;nh ri&ecirc;ng cho c&aacute;c loại m&aacute;y n&agrave;y.</p>

<p><em><strong>11. L&agrave;m c&aacute;ch n&agrave;o để c&oacute; kiểu bob đẹp?</strong></em></p>

<p>Nh&agrave; tạo mẫu t&oacute;c Andr&eacute; tiết lộ: &ldquo;H&atilde;y tỉa hoặc tạo kiểu 6 đến 8 tuần để duy tr&igrave; kiểu d&aacute;ng v&agrave; cũng để chống chẻ ngọn. M&aacute;t-xa da đầu thường xuy&ecirc;n gi&uacute;p da đầu v&agrave; m&aacute;i t&oacute;c khỏe&rdquo;.</p>

<p><strong>theo&nbsp;elle.vn</strong></p>
', CAST(N'2016-07-27 10:37:05.737' AS DateTime), 1, N'vi', N'chăm sóc tóc , tóc đẹp', N'Làm sao để tóc bóng mượt và chắc khỏe? Có nên lo lắng quá khi tóc gãy rụng? Xử lý tóc khô và cong veo thế nào? Làm sao để giữ màu tóc lâu bền?', N'Giải đáp 11 thắc mắc về chăm sóc tóc', 1, 1, CAST(N'2016-05-17 10:32:36.947' AS DateTime))
INSERT [dbo].[_Post] ([PostID], [CatelogID], [PostName], [ImagePath], [Link], [Summary], [PostContent], [DateModified], [IsHot], [Lang], [Keyword], [Description], [Title], [OrderDisplay], [Approve], [CreateDate]) VALUES (28, 65, N'Bí quyết chăm sóc tóc hư tổn với Ntm Thịnh Nguyễn', N'/images/newspost/2016/5/sc_small_2073_2.jpg', N'Bi-quyet-cham-soc-toc-hu-ton-voi-Ntm-Thinh-Nguyen', N'Phụ nữ hiện nay thích nhuộm và uốn tóc, mà hóa chất thì sẽ không tốt cho tóc. Có cách nào để khôi phục lại vẻ bóng mượt?
Nhà tạo mẫu Thịnh Nguyễn chia sẻ nhiều thông tin hữu ích về chăm sóc tóc hư tổn.', N'<p><strong>Phụ nữ hiện nay th&iacute;ch nhuộm v&agrave; uốn t&oacute;c, m&agrave; h&oacute;a chất th&igrave; sẽ kh&ocirc;ng tốt cho t&oacute;c. C&oacute; c&aacute;ch n&agrave;o để kh&ocirc;i phục lại vẻ b&oacute;ng mượt?</strong></p>

<p>Sau một số lần l&agrave;m h&oacute;a chất, t&oacute;c sẽ bị hư tổn &iacute;t nhiều, để khắc phục bạn cần tham khảo tư vấn của thợ l&agrave;m t&oacute;c chuy&ecirc;n nghiệp trước khi chọn mua sản phẩm. Nếu t&oacute;c bị hỏng nhẹ n&ecirc;n sử dụng c&aacute;c loại dầu hấp dưỡng ẩm s&acirc;u. Nếu t&oacute;c đ&atilde; bị hỏng nặng tới mức sờ v&agrave;o thấy th&ocirc; r&aacute;p, kh&ocirc; v&agrave; thậm ch&iacute; sợi t&oacute;c đứt th&agrave;nh từng đoạn, thời kỳ n&agrave;y cần d&ugrave;ng c&aacute;c chữa trị s&acirc;u tăng cường. Phương ph&aacute;p n&agrave;y kh&ocirc;ng l&agrave;m l&agrave;nh t&oacute;c 100%, nhưng n&oacute; sẽ khắc phục được rất nhiều t&igrave;nh trạng hư tổn, gi&uacute;p t&oacute;c bạn đanh chắc hơn, dễ chải v&agrave; cho cảm gi&aacute;c mượt m&agrave;, dễ chịu.</p>

<p><img alt="Mái tóc khô và hư tổn" src="/images/images/241.jpg" /></p>

<p>M&aacute;i t&oacute;c kh&ocirc; v&agrave; hư tổn v&agrave;o m&ugrave;a đ&ocirc;ng.</p>

<p><strong>Thường th&igrave; phụ nữ rất quan t&acirc;m đến chăm s&oacute;c da nhưng lại qu&ecirc;n đi m&aacute;i</strong><strong>&nbsp;t&oacute;c. Mong anh tư vấn cho độc giả c&aacute;ch chăm s&oacute;c t&oacute;c dễ &aacute;p dụng.</strong></p>

<p>Hiệu quả nhất l&agrave; chăm s&oacute;c ph&ugrave; hợp với t&igrave;nh trạng t&oacute;c v&agrave; da đầu ở từng thời điểm, thể hiện qua 3 yếu tố: chất liệu t&oacute;c (mỏng, d&agrave;y, khỏe, đ&atilde; qua xử l&yacute; h&oacute;a chất, t&oacute;c hư tổn&hellip;), t&igrave;nh trạng da đầu (da đầu c&oacute; g&agrave;u, da đầu nhờn, hay kh&ocirc;&hellip;) v&agrave; kiểu t&oacute;c (t&oacute;c d&agrave;i, ngắn, uốn, duỗi hay nhuộm&hellip;).</p>

<p>V&iacute; dụ: nếu t&oacute;c bạn khỏe, kh&ocirc;ng hỏng, kh&ocirc;ng c&oacute; vấn đề về da đầu v&agrave; xoăn, bạn c&oacute; thể chỉ cần sử dụng 2 sản phẩm l&agrave; dầu gội v&agrave; xả d&agrave;nh cho t&oacute;c xoăn, đồng thời bạn c&oacute; thể hấp dầu &ocirc;-z&ocirc;n 1 tuần/lần để dưỡng ẩm v&agrave; l&agrave;m khỏe t&oacute;c v&igrave; t&oacute;c xoăn thường hay bị kh&ocirc;.</p>

<p><img alt="Tóc sau khi được chăm sóc tại Belle hair salon" src="/images/images/242.jpg" /></p>

<p><strong>Nhiều phụ nữ rất th&iacute;ch hấp dầu, c&oacute; thể gọi l&agrave; lạm dụng qu&aacute; mức. Điều n&agrave;y c&oacute; tốt cho t&oacute;c?</strong></p>

<p>Hấp dầu l&agrave; việc sử dụng sản phẩm chăm s&oacute;c c&oacute; độ PH thấp, c&oacute; chứa h&agrave;m lượng dưỡng ẩm lớn v&agrave; dưỡng chất tăng cường sức khỏe, độ su&ocirc;n mềm v&agrave; b&oacute;ng mượt cho t&oacute;c. Việc hấp dầu t&ugrave;y thuộc v&agrave;o sức khỏe t&oacute;c ở từng thời điểm cụ thể. Nếu sợi t&oacute;c d&agrave;y, đanh tự nhi&ecirc;n v&agrave; khỏe th&igrave; c&oacute; thể hấp dầu 1 lần/tuần, sử dụng hấp &ocirc; z&ocirc;n nhiệt độ cao. Nếu sợi t&oacute;c mỏng tự nhi&ecirc;n, khỏe cũng c&oacute; thể hấp dầu &ocirc; z&ocirc;n 1 lần/tuần với nguồn nhiệt thấp hơn. Đối với t&oacute;c hỏng v&agrave; đ&atilde; qua xử l&yacute; h&oacute;a chất nhiều lần, kh&ocirc;ng n&ecirc;n d&ugrave;ng nhiệt l&uacute;c n&agrave;y v&igrave; nhiệt c&oacute; t&aacute;c dụng mở bề mặt t&oacute;c s&acirc;u hơn, tốt nhất n&ecirc;n hấp nguội. Kh&ocirc;ng n&ecirc;n hấp dầu qu&aacute; nhiều lần v&igrave; nếu t&oacute;c khỏe b&igrave;nh thường hấp nhiều c&oacute; thể khiến t&oacute;c bị bết, nặng, t&oacute;c kh&ocirc;ng nhẹ, tơi v&agrave; l&atilde;ng ph&iacute;.</p>

<p>NTM Thịnh Nguyễn</p>
', CAST(N'2016-07-27 10:36:01.220' AS DateTime), 0, N'vi', N'chăm sóc tóc, tóc khô, tóc hư tổn', N'Phụ nữ hiện nay thích nhuộm và uốn tóc, mà hóa chất thì sẽ không tốt cho tóc. Có cách nào để khôi phục lại vẻ bóng mượt?
Nhà tạo mẫu Thịnh Nguyễn chia sẻ nhiều thông tin hữu ích về chăm sóc tóc hư tổn.', N'Bí quyết chăm sóc tóc hư tổn với Ntm Thịnh Nguyễn', 1, 1, CAST(N'2016-05-17 11:13:59.757' AS DateTime))
INSERT [dbo].[_Post] ([PostID], [CatelogID], [PostName], [ImagePath], [Link], [Summary], [PostContent], [DateModified], [IsHot], [Lang], [Keyword], [Description], [Title], [OrderDisplay], [Approve], [CreateDate]) VALUES (29, 65, N'The argan oil story of Moroccanoil', N'/images/newspost/2016/6/sc_small_2069_1.jpg', N'The-argan-oil-story-of-Moroccanoil', N'Argan trees grow and tenaciously survive in semi-desert areas of the Mediterranean. The deep roots and small leaves of the argan tree allow it to resist arid winds and water loss, resulting in a nut with a unique oil profile.', N'<p><img alt="" src="/images/images/argan_secondary.jpg" style="float:left; height:426px; margin-left:10px; margin-right:10px; width:400px" /><span style="font-family:arial,helvetica,sans-serif"><span style="font-size:20px">The argan oil story of Moroccanoil</span></span></p>

<p>Argan trees grow and tenaciously survive in semi-desert areas of the Mediterranean. The deep roots and small leaves of the argan tree allow it to resist arid winds and water loss, resulting in a nut with a unique oil profile.<br />
Pure argan oil is a rare and precious oil that is harvested and extracted from the nut of the argan tree. For centuries, women across the Mediterranean have used argan oil in their beauty regimen for vibrant, healthy-looking skin and hair.</p>

<p>&nbsp;</p>

<p><span style="font-family:arial,helvetica,sans-serif"><span style="font-size:20px">ARGAN OIL BENEFITS</span></span></p>

<p>Moroccanoil was inspired by the transformative power of argan oil. Rich in vitamins, minerals and antioxidants, this age-old beauty secret has many uses, helping to hydrate and soften your hair, face, body and nails.&nbsp;<br />
<br />
With its high content of antioxidants, essential fatty acids and Vitamin E, the benefits of argan oil naturally help revitalize skin, increase hair&rsquo;s elasticity and consistently restore shine to dull, lifeless hair. It is a powerful antioxidant, UV-protector and free-radical neutralizer.</p>

<p><br />
Argan oil for hair leaves it beautiful, shiny and nourished with each use. Argan oil for skin luxuriously hydrates and infuses it with moisture. Argan oil has also been known to help reduce the appearance of wrinkles.</p>

<p><img alt="" src="/images/images/argan_benefits_1.jpg" style="float:right; height:300px; margin-left:10px; margin-right:10px; width:400px" />&nbsp;</p>

<p><span style="font-size:18px">ARGAN OIL BENEFITS123</span></p>

<p>MOROCCANOIL WAS INSPIRED BY THE TRANSFORMATIVE POWER OF ARGAN OIL. RICH IN VITAMINS, MINERALS AND ANTIOXIDANTS, THIS AGE-OLD BEAUTY SECRET HAS MANY USES, HELPING TO HYDRATE AND SOFTEN YOUR HAIR, FACE, BODY AND NAILS.&nbsp;<br />
<br />
WITH ITS HIGH CONTENT OF ANTIOXIDANTS, ESSENTIAL FATTY ACIDS AND VITAMIN E, THE BENEFITS OF ARGAN OIL NATURALLY HELP REVITALIZE SKIN, INCREASE HAIR&rsquo;S ELASTICITY AND CONSISTENTLY RESTORE SHINE TO DULL, LIFELESS HAIR. IT IS A POWERFUL ANTIOXIDANT, UV-PROTECTOR AND FREE-RADICAL NEUTRALIZER.&nbsp;<br />
<br />
ARGAN OIL FOR HAIR LEAVES IT BEAUTIFUL, SHINY AND NOURISHED WITH EACH USE. ARGAN OIL FOR SKIN LUXURIOUSLY HYDRATES AND INFUSES IT WITH MOISTURE. ARGAN OIL HAS ALSO BEEN KNOWN TO HELP REDUCE THE APPEARANCE OF WRINKLES.</p>

<p>Moroccanoil began with the simple wish to share the transformative powers of our rejuvenating argan-oil infused formulas and adopted this tradition as the philosophy for the brand. All Moroccanoil products for hair, body and skin are infused with argan oil&mdash;signature to the brand.&nbsp;<br />
<br />
Moroccanoil only sources the highest quality argan oil originating from argan trees grown in Morocco. The argan oil used in all our hair products and skin products are manufactured by a cold-press process.<br />
<br />
Pure Argan Oil by Moroccanoil Body&trade; is 100% pure, with no additives, colorants or preservatives. It is fragrance-free, and is perfect to use on your skin or hair for a luxurious and invigorating experience.&nbsp;<br />
<br />
Moroccanoil continues to be the leader in oil-infused hair and body products. It is our passion to deliver argan oil-infused beauty, every day, with products that truly outshine the rest.&nbsp;<br />
<br />
We believe in #ArganEveryDay.</p>
', CAST(N'2016-07-27 10:36:02.520' AS DateTime), 0, N'vi', N'The argan oil story of Moroccanoil', N'The argan oil story of Moroccanoil', N'The argan oil story of Moroccanoil', 1, 1, CAST(N'2016-05-17 17:20:57.257' AS DateTime))
INSERT [dbo].[_Post] ([PostID], [CatelogID], [PostName], [ImagePath], [Link], [Summary], [PostContent], [DateModified], [IsHot], [Lang], [Keyword], [Description], [Title], [OrderDisplay], [Approve], [CreateDate]) VALUES (30, 65, N'The argan oil story of Moroccanoil', N'/images/newspost/2016/6/sc_small_2069_1.jpg', N'The-argan-oil-story-of-Moroccanoil', N'Argan trees grow and tenaciously survive in semi-desert areas of the Mediterranean. The deep roots and small leaves of the argan tree allow it to resist arid winds and water loss, resulting in a nut with a unique oil profile.', N'<p><img alt="" src="/images/images/argan_secondary.jpg" style="float:left; height:426px; margin-left:10px; margin-right:10px; width:400px" /><span style="font-family:arial,helvetica,sans-serif"><span style="font-size:20px">The argan oil story of Moroccanoil</span></span></p>', CAST(N'2016-06-01 10:36:43.020' AS DateTime), NULL, N'vi', N'The argan oil story of Moroccanoil', N'The argan oil story of Moroccanoil', N'The argan oil story of Moroccanoil', 1, 1, CAST(N'2016-05-17 17:20:57.257' AS DateTime))
INSERT [dbo].[_Post] ([PostID], [CatelogID], [PostName], [ImagePath], [Link], [Summary], [PostContent], [DateModified], [IsHot], [Lang], [Keyword], [Description], [Title], [OrderDisplay], [Approve], [CreateDate]) VALUES (32, 80, N'The argan oil story of Moroccanoil', N'/images/newspost/2016/6/sc_small_2069_1.jpg', N'The-argan-oil-story-of-Moroccanoil', N'Argan trees grow and tenaciously survive in semi-desert areas of the Mediterranean. The deep roots and small leaves of the argan tree allow it to resist arid winds and water loss, resulting in a nut with a unique oil profile.', N'<p><img alt="" src="/images/images/argan_secondary.jpg" style="float:left; height:426px; margin-left:10px; margin-right:10px; width:400px" /><span style="font-family:arial,helvetica,sans-serif"><span style="font-size:20px">The argan oil story of Moroccanoil</span></span></p>', CAST(N'2016-06-01 10:36:43.020' AS DateTime), NULL, N'vi', N'The argan oil story of Moroccanoil', N'The argan oil story of Moroccanoil', N'The argan oil story of Moroccanoil', 1, 1, CAST(N'2016-05-17 17:20:57.257' AS DateTime))
INSERT [dbo].[_Post] ([PostID], [CatelogID], [PostName], [ImagePath], [Link], [Summary], [PostContent], [DateModified], [IsHot], [Lang], [Keyword], [Description], [Title], [OrderDisplay], [Approve], [CreateDate]) VALUES (33, 113, N'Ứng dụng công nghệ laser –YAG trong xóa xăm.', N'/images/newspost/2016/7/sc_small_2106_beautiful-asian-girl-tattoo-on-arm-1.jpg', N'Ung-dung-cong-nghe-laser-–YAG-trong-xoa-xam', N'Hình xăm thể hiện tính thẩm mỹ, ấn tượng về tính cách mạnh bạo, được du nhập vào Việt Nam. Tuy nhiên với nền văn hóa Phương Đông ngàn năm gốc rễ vốn ăn sâu vào tiềm thức của mỗi người thì làn da “thanh bạch” được tôn trọng hơn, cả về góc độ đạo đức và thẩm mỹ.', N'<p>Với những vết xăm, theo thời gian ch&uacute;ng sẽ nh&ograve;a đi, biến dạng v&agrave; xấu x&iacute;, hơn nữa ở mỗi thời điểm suy nghĩ v&agrave; vị tr&iacute; x&atilde; hội của mỗi người thay đổi do đ&oacute; h&igrave;nh xăm cũng kh&ocirc;ng c&ograve;n ph&ugrave; hợp. Vậy c&oacute; thể x&oacute;a c&aacute;c h&igrave;nh xăm đ&atilde; ăn s&acirc;u v&agrave;o da thịt ch&uacute;ng ta hay kh&ocirc;ng?</p>

<p><img alt="" src="/images/images/3.jpg" style="width: 717px; height: 538px;" /></p>

<p>C&oacute; rất nhiều c&aacute;ch để x&oacute;a xăm, như:</p>

<p>1. Xăm chồng l&ecirc;n h&igrave;nh xăm cũ để lấp đi, hoặc xăm mới;</p>

<p>2. Cắt bỏ lớp da xăm v&agrave; may lại: Với phương ph&aacute;p n&agrave;y c&oacute; thể phải cắt l&agrave;m nhiều lần, nếu h&igrave;nh xăm lớn - tốn k&eacute;m;</p>

<p>3. Sử dụng axit ăn m&ograve;n, d&ugrave;ng nhiệt, d&ugrave;ng muối&hellip; để ph&aacute; lớp da c&oacute; mực xăm b&ecirc;n dưới&hellip;;</p>

<p>4. Sử dụng Laser CO2 đốt lột bỏ mực xăm kh&ocirc;ng chọn lọc.</p>

<p>C&aacute;c phương ph&aacute;p n&agrave;y sẽ để lại sẹo xấu, hoặc mất sắc tố... g&acirc;y hậu quả k&eacute;m thẩm mỹ cũng như g&acirc;y đau đớn cho bệnh nh&acirc;n.</p>

<p>C&ocirc;ng nghệ laser YAG thẩm mỹ l&agrave; phương ph&aacute;p x&oacute;a h&igrave;nh xăm hiện đại nhất đang được ứng dụng phổ biến tr&ecirc;n thế giới v&agrave; ở Việt Nam hiện nay. C&aacute;c sắc tố da bị nhiễm mực xăm hấp thụ năng lượng tia laser sẽ bị vỡ ra th&agrave;nh v&ocirc; số những hạt li ti. C&aacute;c hạt m&agrave;u n&agrave;y được hệ thống bạch huyết của cơ thể đ&agrave;o thải ra ngo&agrave;i, h&igrave;nh xăm sẽ mất m&agrave; kh&ocirc;ng g&acirc;y đau đớn, kh&aacute;ch h&agrave;ng hoạt động b&igrave;nh thường sau trị liệu.</p>

<p><img alt="" src="/images/images/4(1).JPG" style="width: 717px; height: 960px;" /></p>

<p>Nhờ &ldquo;C&aacute;c xung&rdquo; laser YAG tập trung năng lượng cao độ v&agrave; được chọn lọc để hấp thụ những sắc tố da c&oacute; m&agrave;u mực xăm (tức l&agrave; chỉ c&oacute; c&aacute;c tế b&agrave;o bị nhiễm mực xăm&nbsp; bị hấp thụ, do đ&oacute; kh&ocirc;ng g&acirc;y tổn thương tới c&aacute;c tế b&agrave;o v&agrave; m&ocirc; l&acirc;n cận). Tia laser YAG đi xuy&ecirc;n qua da chỉ t&aacute;c động ph&acirc;n hủy từng nh&oacute;m m&agrave;u mực xăm ph&ugrave; hợp với bước s&oacute;ng của tia. Laser với bước s&oacute;ng 1.064nm ph&ugrave; hợp với ph&acirc;n hủy m&agrave;u mực xăm đen, xanh đen, trong khi bước s&oacute;ng 532nm ph&ugrave; hợp với ph&acirc;n hủy m&agrave;u đỏ, 585nm ph&acirc;n hủy m&agrave;u xanh da trời, 650 nm ph&acirc;n hủy m&agrave;u xanh l&aacute; c&acirc;y&hellip; C&aacute;c m&agrave;u mực xăm đen, xanh đen, đỏ tương đối dễ ph&acirc;n hủy (dễ x&oacute;a) hơn c&aacute;c m&agrave;u xanh l&aacute;, v&agrave;ng, xanh da trời&hellip;.</p>

<p><img alt="" src="/images/images/Truoc-xoa-sam.jpg" style="width: 267px; height: 300px;" /><img alt="" src="/images/images/sau-xoa-xam.jpg" style="width: 450px; height: 300px;" /></p>

<p style="text-align: center;"><em>Trước v&agrave; sau x&oacute;a xăm tại Spa Linh linh</em></p>

<p>Việc x&oacute;a xăm được thực hiện ở hầu hết c&aacute;c cơ sở thẩm mỹ, tuy nhi&ecirc;n người ti&ecirc;u d&ugrave;ng th&ocirc;ng th&aacute;i n&ecirc;n chọn những cơ sở lớn, uy t&iacute;n l&acirc;u năm , với đội ngũ y b&aacute;c sỹ v&agrave; chuy&ecirc;n vi&ecirc;n c&oacute; tay nghề cao trong việc chăm s&oacute;c sắc đẹp để đạt được kết quả mong muốn</p>

<p><img alt="" src="/images/images/xoa-hinh-xam-1.jpg" style="width: 717px; height: 478px;" /></p>

<p style="text-align: center;"><i>Chuy&ecirc;n vi&ecirc;n kỹ thuật thực hiện x&oacute;a xăm bằng c&ocirc;ng nghệ Laser</i></p>

<p><i><img alt="" src="/images/images/xoa_xam.jpg" style="width: 432px; height: 163px;" /></i></p>

<p><i>Kết quả x&oacute;a xăm bằng c&ocirc;ng nghệ Laser Q-Switched</i><i>&nbsp;</i></p>

<p align="right">Tham khảo gi&aacute; c&aacute;c dịch vụ của Spa Linh Linh tại&nbsp;<a href="/#">đ&acirc;y</a></p>
', CAST(N'2016-07-26 13:44:16.350' AS DateTime), 0, N'vi', N'Ứng dụng công nghệ laser –YAG trong xóa xăm.', N'Ứng dụng công nghệ laser –YAG trong xóa xăm.', N'Ứng dụng công nghệ laser –YAG trong xóa xăm.', 1, 1, CAST(N'2016-07-26 13:41:07.907' AS DateTime))
INSERT [dbo].[_Post] ([PostID], [CatelogID], [PostName], [ImagePath], [Link], [Summary], [PostContent], [DateModified], [IsHot], [Lang], [Keyword], [Description], [Title], [OrderDisplay], [Approve], [CreateDate]) VALUES (34, 114, N'Giảm béo an toàn với Lipo X Cool', N'/images/newspost/2016/7/sc_small_2066_dayluicondaudau1.jpg', N'Giam-beo-an-toan-voi-Lipo-X-Cool', N'Spalinhlinh ơi, Em năm nay mới 24 tuổi nhưng đã có mỡ bụng.Có lẽ là do làm việc văn phòng ít vận động quá. Em rất ngại khi đi biển mặc bikini hoặc là mặc những bộ quần áo bó sát. Em cũng có tham gia một số lớp thể dục, dùng thuốc giảm cân nhưng chưa hiệu quả và lâu dài. Em có tìm hiểu được biết công nghệ Lipo X Cool của bên mình. Spalinhlinh có thể tư vấn giúp em về công nghệ này không ạ? (Thu Hằng, Hà Nội)', N'<p>Cảm ơn bạn Thu Hằng đ&atilde; gửi c&acirc;u hỏi đến Spalinhlinh. Hiện nay do c&ocirc;ng việc ngồi văn ph&ograve;ng &iacute;t hoạt động n&ecirc;n nhiều bạn g&aacute;i gặp lo lắng với v&ograve;ng 2 kh&ocirc;ng thon gọn.</p>

<p>Tr&ecirc;n thị trường c&oacute; rất nhiều loại thuốc giảm b&eacute;o nhưng l&acirc;u c&oacute; hiệu quả. Ngo&agrave;i ra nếu uống thuốc m&agrave; kh&ocirc;ng c&oacute; sự chỉ dẫn của b&aacute;c sĩ th&igrave; sẽ rất c&oacute; hại cho sức khỏe. Tuy nhi&ecirc;n, bạn Hằng kh&ocirc;ng n&ecirc;n qu&aacute; lo lắng v&igrave; với c&aacute;c c&ocirc;ng nghệ giảm b&eacute;o ti&ecirc;n tiến hiện nay th&igrave; việc giảm b&eacute;o an to&agrave;n v&agrave; hiệu quả l&acirc;u d&agrave;i l&agrave; trong tầm với.</p>

<p><img alt="" src="/images/images/cong-nghe-tri-lipo.jpg" style="width: 450px; height: 318px;" /></p>

<p>Đ&uacute;ng như bạn Hằng c&oacute; n&oacute;i, Spalinhlinh đang ứng dụng c&ocirc;ng nghệ Lipo X Cool v&agrave;o dịch vụ giảm b&eacute;o. Đ&acirc;y được đ&aacute;nh gi&aacute; l&agrave; c&ocirc;ng nghệ giảm b&eacute;o h&agrave;ng đầu tr&ecirc;n thế giới. Với c&ocirc;ng nghệ từ Hoa Kỳ, to&agrave;n bộ m&ocirc; mỡ thừa sẽ được h&oacute;a lỏng ho&agrave;n to&agrave;n dưới t&aacute;c động của s&oacute;ng si&ecirc;u &acirc;m hội tụ, c&aacute;c b&oacute; cơ v&agrave; da sẽ được k&eacute;o căng tối đa nhờ t&aacute;c động của hệ thống &aacute;nh s&aacute;ng hồng ngoại đa chiều sau 1 liệu tr&igrave;nh. Nhờ vậy, lượng mỡ thừa sẽ được đưa ra ngo&agrave;i m&agrave; da sẽ trở l&ecirc;n săn chắc hơn.</p>

<p><img alt="" src="/images/images/Hut-mo-dui-bang-cong-nghe-lipo-matic-2.jpg" style="width: 450px; height: 300px;" /></p>

<p>Bạn c&oacute; thể ho&agrave;n to&agrave;n y&ecirc;n t&acirc;m rằng mọi rủi ro, nguy cơ gặp phải khi giảm b&eacute;o bằng c&aacute;c c&ocirc;ng nghệ kh&aacute;c sẽ kh&ocirc;ng xảy ra với Lipo X Cool. C&ocirc;ng nghệ n&agrave;y đ&atilde; được Bộ Y Tế, tổ chức FDA cấp chứng nhận về mức độ an to&agrave;n đối với người sử dụng. Rất nhiều kh&aacute;ch h&agrave;ng ở nhiều độ tuổi đ&atilde; trải nghiệm dịch vụ giảm b&eacute;o bằng Lipo X Cool tại Spalinhlinh v&agrave; ho&agrave;n to&agrave;n h&agrave;i l&ograve;ng về chất lượng.</p>

<p>Nếu c&ograve;n băn khoăn hay thắc mắc g&igrave;, bạn Thu Hằng c&oacute; thể qua trực tiếp Spalinhlinh để được tư vấn cụ thể v&agrave; chi tiết hơn. Hoặc bạn c&oacute; thể gọi điện đến<strong>&nbsp;</strong><strong>Hotline 0966 256 666&nbsp;</strong>để được giải đ&aacute;p chu đ&aacute;o hơn nh&eacute;.</p>

<p>Ch&uacute;c bạn sớm tự tin diện những bộ quần &aacute;o gợi cảm với th&acirc;n h&igrave;nh thon gọn.&nbsp;</p>
', CAST(N'2016-07-26 14:03:55.720' AS DateTime), 0, N'vi', N'Giảm béo an toàn với Lipo X Cool', N'Giảm béo an toàn với Lipo X Cool', N'Giảm béo an toàn với Lipo X Cool', 1, 1, CAST(N'2016-07-26 14:03:55.720' AS DateTime))
SET IDENTITY_INSERT [dbo].[_Post] OFF
SET IDENTITY_INSERT [dbo].[_Product] ON 

INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (56, N'The Hayan Cherry Blossom Whitening Cream', N'KT_CC_002', N'85', N'', N'<p>&nbsp;</p>
', N'/images/photoproduct/2018/6/sc_small_2070_img-1.jpg', N'/images/photoproduct/2018/6/sc_full_2070_img-1.jpg', CAST(N'2018-06-22 18:06:04.997' AS DateTime), 1, N'60ml', N'', N'', 0.0000, 880000.0000, 0, 6, N'vi', 1, 1, 1, N'The-Hayan-Cherry-Blossom-Whitening-Cream', 0, CAST(N'2014-11-20 00:00:00.000' AS DateTime), CAST(N'2014-11-25 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (59, N'Timeless Ferment Snail Toner', N'KT_BT_002', N'82', N'', N'<h3>&nbsp;</h3>
', N'/images/photoproduct/2018/6/sc_small_2077_img-2.jpg', N'/images/photoproduct/2018/6/sc_full_2077_img-2.jpg', CAST(N'2018-06-22 18:13:05.413' AS DateTime), 1, N'150ml', N'', N'', 0.0000, 1630000.0000, 0, 22, N'vi', 1, 1, 0, N'Timeless-Ferment-Snail-Toner', NULL, CAST(N'2014-12-09 00:00:00.000' AS DateTime), CAST(N'2014-12-11 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (67, N'Naturalth Goat Milk Whitening Emulsion', N'KT_NLK_005', N'83', N'', N'<h2>&nbsp;</h2>
', N'/images/photoproduct/2018/6/sc_small_2077_img.jpg', N'/images/photoproduct/2018/6/sc_full_2077_img.jpg', CAST(N'2018-06-22 18:13:21.773' AS DateTime), 1, N'150ml', N'', N'', 0.0000, 985000.0000, 0, 27, N'vi', 1, 1, 0, N'Naturalth-Goat-Milk-Whitening-Emulsion', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (101, N'The Chok Chok Green Tea Watery Lotion', N'4YXZCb', N'83', N'', N'<p>&nbsp;</p>
', N'/images/photoproduct/2018/6/sc_small_2076_img-3.jpg', N'/images/photoproduct/2018/6/sc_full_2076_img-3.jpg', CAST(N'2018-06-22 18:12:51.147' AS DateTime), 1, N'160ml', N'', N'', 0.0000, 547000.0000, 0, 13, N'vi', 1, 1, 0, N'The-Chok-Chok-Green-Tea-Watery-Lotion', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (125, N'Luxury Gem Gold 24K Mask', N'SxG98u', N'95', N'', N'<p>&nbsp;</p>
', N'/images/photoproduct/2018/6/sc_small_2076_img-1.jpg', N'/images/photoproduct/2018/6/sc_full_2076_img-1.jpg', CAST(N'2018-06-22 18:12:32.977' AS DateTime), 1, N'100ml', N'', N'', 0.0000, 715000.0000, 0, 8, N'vi', 1, 1, 0, N'Luxury-Gem-Gold-24K-Mask', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (130, N'Floria Nurtra Energy Foam Cleanser', N'jygQlP', N'91', N'', N'<p>&nbsp;</p>
', N'/images/photoproduct/2018/6/sc_small_2066_img.jpg', N'/images/photoproduct/2018/6/sc_full_2066_img.jpg', CAST(N'2018-06-22 18:12:19.760' AS DateTime), 1, N'150ml', N'', N'', 0.0000, 267000.0000, 0, 1, N'vi', 1, 1, 0, N'Floria-Nurtra-Energy-Foam-Cleanser', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (149, N'Aquaporine Water Bomb Sleeping Pack', N'FPHarq', N'92', N'', N'<p>&nbsp;</p>
', N'/images/photoproduct/2018/6/sc_small_2076_img-4.jpg', N'/images/photoproduct/2018/6/sc_full_2076_img-4.jpg', CAST(N'2018-06-22 18:12:11.003' AS DateTime), 1, N'100ml', N'', N'', 0.0000, 395000.0000, 0, 3, N'vi', 1, 0, 0, N'Aquaporine-Water-Bomb-Sleeping-Pack', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (174, N'Timeless Ferment Snail BB Cream', N'6QLZWQ', N'100', N'', N'<p>&nbsp;</p>
', N'/images/photoproduct/2018/6/sc_small_2070_img-4.jpg', N'/images/photoproduct/2018/6/sc_full_2070_img-4.jpg', CAST(N'2018-06-22 18:06:50.480' AS DateTime), 1, N'50ml', N'', N'', 0.0000, 828000.0000, 0, 2, N'vi', 1, 0, 0, N'Timeless-Ferment-Snail-BB-Cream', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (182, N'BC Dation Water Pact', N'qPSosS', N'101', N'', N'<p>&nbsp;</p>
', N'/images/photoproduct/2018/6/sc_small_2067_img-3.jpg', N'/images/photoproduct/2018/6/sc_full_2067_img-3.jpg', CAST(N'2018-06-22 18:12:22.057' AS DateTime), 1, N'15 g', N'', N'', 0.0000, 820000.0000, 0, 2, N'vi', 1, 1, 0, N'BC-Dation-Water-Pact', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (183, N'Aqua Aura UV Moist Cushion', N'ZMJc8H', N'101', N'', N'<p>&nbsp;</p>
', N'/images/photoproduct/2018/6/sc_small_2068_img-4.jpg', N'/images/photoproduct/2018/6/sc_full_2068_img-4.jpg', CAST(N'2018-06-22 18:04:03.797' AS DateTime), 1, N'12 g', N'', N'', 0.0000, 702000.0000, 0, 3, N'vi', 1, 0, 0, N'Aqua-Aura-UV-Moist-Cushion', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (184, N'Aqua Aura Jelly Cushion SPF 36 PA ++', N'byFLCZ', N'101', N'', N'<p>&nbsp;</p>
', N'/images/photoproduct/2018/6/sc_small_2069_img-1.jpg', N'/images/photoproduct/2018/6/sc_full_2069_img-1.jpg', CAST(N'2018-06-22 18:05:16.857' AS DateTime), 1, N'13 g', N'', N'', 0.0000, 702000.0000, 0, 4, N'vi', 1, 0, 0, N'Aqua-Aura-Jelly-Cushion-SPF-36-PA', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (187, N'Face Mix Oil Paper Powder', N'qfMa0U', N'101', N'', N'<p>&nbsp;</p>
', N'/images/photoproduct/2018/6/sc_small_2068_img.jpg', N'/images/photoproduct/2018/6/sc_full_2068_img.jpg', CAST(N'2018-06-22 18:04:27.743' AS DateTime), 1, N'', N'', N'', 0.0000, 387000.0000, 0, 7, N'vi', 1, 0, 0, N'Face-Mix-Oil-Paper-Powder', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (188, N'Timeless Carat Dual Concenaler', N'jSfoxI', N'102', N'', N'<p>&nbsp;</p>
', N'/images/photoproduct/2018/6/sc_small_2067_img-2.jpg', N'/images/photoproduct/2018/6/sc_full_2067_img-2.jpg', CAST(N'2018-06-22 18:03:20.110' AS DateTime), 1, N'4.2g + 4.5 ml', N'', N'', 0.0000, 295000.0000, 0, 1, N'vi', 1, 0, 0, N'Timeless-Carat-Dual-Concenaler', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (189, N'Face Mix Primer Lip Concealer', N'SXjpuf', N'102', N'', N'<p>&nbsp;</p>
', N'/images/photoproduct/2018/6/sc_small_2067_img-1.jpg', N'/images/photoproduct/2018/6/sc_full_2067_img-1.jpg', CAST(N'2018-06-22 18:12:20.997' AS DateTime), 1, N'9g', N'', N'', 0.0000, 147000.0000, 0, 2, N'vi', 1, 1, 0, N'Face-Mix-Primer-Lip-Concealer', NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[_Product] OFF
SET IDENTITY_INSERT [dbo].[_ProductProperty] ON 

INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (33, N'yellow', N'#eef206', N'COL', 2)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (33, N'blue', N'#2400ff', N'COL', 5)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (33, N'S', N'S', N'SIZ', 8)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (52, N'S', N'S', N'SIZ', 15)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (56, N'S', N'S', N'SIZ', 16)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (57, N'S', N'S', N'SIZ', 17)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (59, N'S', N'S', N'SIZ', 19)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (63, N'S', N'S', N'SIZ', 23)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (67, N'S', N'S', N'SIZ', 27)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (68, N'S', N'S', N'SIZ', 28)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (69, N'S', N'S', N'SIZ', 29)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (70, N'S', N'S', N'SIZ', 30)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (77, N'S', N'S', N'SIZ', 37)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (33, N'M', N'M', N'SIZ', 38)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (52, N'M', N'M', N'SIZ', 45)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (56, N'M', N'M', N'SIZ', 46)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (57, N'M', N'M', N'SIZ', 47)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (59, N'M', N'M', N'SIZ', 49)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (63, N'M', N'M', N'SIZ', 53)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (67, N'M', N'M', N'SIZ', 57)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (68, N'M', N'M', N'SIZ', 58)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (69, N'M', N'M', N'SIZ', 59)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (70, N'M', N'M', N'SIZ', 60)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (77, N'M', N'M', N'SIZ', 67)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (33, N'L', N'L', N'SIZ', 68)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (52, N'L', N'L', N'SIZ', 75)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (56, N'L', N'L', N'SIZ', 76)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (57, N'L', N'L', N'SIZ', 77)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (59, N'L', N'L', N'SIZ', 79)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (63, N'L', N'L', N'SIZ', 83)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (67, N'L', N'L', N'SIZ', 87)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (68, N'L', N'L', N'SIZ', 88)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (69, N'L', N'L', N'SIZ', 89)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (70, N'L', N'L', N'SIZ', 90)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (77, N'L', N'L', N'SIZ', 97)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (33, N'white', N'#ffffff', N'COL', 98)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (52, N'white', N'#ffffff', N'COL', 105)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (56, N'white', N'#ffffff', N'COL', 106)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (57, N'white', N'#ffffff', N'COL', 107)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (59, N'white', N'#ffffff', N'COL', 109)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (63, N'white', N'#ffffff', N'COL', 113)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (67, N'white', N'#ffffff', N'COL', 117)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (68, N'white', N'#ffffff', N'COL', 118)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (69, N'white', N'#ffffff', N'COL', 119)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (70, N'white', N'#ffffff', N'COL', 120)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (77, N'white', N'#ffffff', N'COL', 127)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (33, N'red', N'#ff0000', N'COL', 128)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (52, N'red', N'#ff0000', N'COL', 135)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (56, N'red', N'#ff0000', N'COL', 136)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (57, N'red', N'#ff0000', N'COL', 137)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (59, N'red', N'#ff0000', N'COL', 139)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (63, N'red', N'#ff0000', N'COL', 143)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (67, N'red', N'#ff0000', N'COL', 147)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (68, N'red', N'#ff0000', N'COL', 148)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (69, N'red', N'#ff0000', N'COL', 149)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (70, N'red', N'#ff0000', N'COL', 150)
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
GO
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 223)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 224)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 225)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 226)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 227)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 228)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 229)
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
GO
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 323)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 324)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 325)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 326)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 327)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 328)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 329)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 330)
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
SET IDENTITY_INSERT [dbo].[_ProductTag] ON 

INSERT [dbo].[_ProductTag] ([ProductTagID], [ProductID], [Tag], [Link]) VALUES (3, 1, N'mạch nạp', N'mach-nap')
INSERT [dbo].[_ProductTag] ([ProductTagID], [ProductID], [Tag], [Link]) VALUES (4, 1, N'arm', N'arm')
SET IDENTITY_INSERT [dbo].[_ProductTag] OFF
SET IDENTITY_INSERT [dbo].[_Rating] ON 

INSERT [dbo].[_Rating] ([RatingId], [Rating], [ip], [name], [email], [contents], [itemId]) VALUES (2, 5, N'127.0.0.1', N'b', N'abc123@gmai.com', N'aaaa', 75)
SET IDENTITY_INSERT [dbo].[_Rating] OFF
SET IDENTITY_INSERT [dbo].[_Role] ON 

INSERT [dbo].[_Role] ([ID], [RoleName], [Des], [Role]) VALUES (1, N'Admin', N'Quản trị cao nhất', N'Admin')
INSERT [dbo].[_Role] ([ID], [RoleName], [Des], [Role]) VALUES (2, N'Client', N'Người dùng', N'Client')
SET IDENTITY_INSERT [dbo].[_Role] OFF
SET IDENTITY_INSERT [dbo].[_Statistic] ON 

INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (155, CAST(N'2018-06-20 18:36:36.093' AS DateTime), 32, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (156, CAST(N'2018-06-21 18:11:16.207' AS DateTime), 48, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (157, CAST(N'2018-06-22 18:01:46.170' AS DateTime), 44, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[_Statistic] OFF
INSERT [dbo].[_User] ([Username], [Password], [Role], [Online], [LastLogin], [IP]) VALUES (N'abc123@gmail.com', N'E10ADC3949BA59ABBE56E057F20F883E', 2, 0, CAST(N'2015-11-09 09:51:20.190' AS DateTime), N'not login')
INSERT [dbo].[_User] ([Username], [Password], [Role], [Online], [LastLogin], [IP]) VALUES (N'abc1234@gmail.com', N'E10ADC3949BA59ABBE56E057F20F883E', 2, 1, CAST(N'2016-08-29 09:40:54.673' AS DateTime), N'127.0.0.1')
INSERT [dbo].[_User] ([Username], [Password], [Role], [Online], [LastLogin], [IP]) VALUES (N'Admin', N'E10ADC3949BA59ABBE56E057F20F883E', 1, 1, CAST(N'2018-06-22 17:35:06.453' AS DateTime), N'127.0.0.1')
INSERT [dbo].[_User] ([Username], [Password], [Role], [Online], [LastLogin], [IP]) VALUES (N'coicoi0101@gmail.com', N'25D55AD283AA400AF464C76D713C07AD', 2, 0, CAST(N'2015-12-04 14:52:17.733' AS DateTime), N'::1')
INSERT [dbo].[_User] ([Username], [Password], [Role], [Online], [LastLogin], [IP]) VALUES (N'duynvtest@gmail.com', N'E10ADC3949BA59ABBE56E057F20F883E', 2, 1, CAST(N'2016-07-13 11:19:37.130' AS DateTime), N'122.216.10.180')
INSERT [dbo].[_User] ([Username], [Password], [Role], [Online], [LastLogin], [IP]) VALUES (N'nguyenson1303@gmail.com', N'E10ADC3949BA59ABBE56E057F20F883E', 2, 1, CAST(N'2016-07-10 16:11:25.473' AS DateTime), N'1.52.126.129')
INSERT [dbo].[_User] ([Username], [Password], [Role], [Online], [LastLogin], [IP]) VALUES (N'soncoi', N'E10ADC3949BA59ABBE56E057F20F883E', 1, 1, CAST(N'2016-07-22 13:43:41.267' AS DateTime), N'127.0.0.1')
INSERT [dbo].[_User] ([Username], [Password], [Role], [Online], [LastLogin], [IP]) VALUES (N'sonnguyenvan1986@gmail.com', N'E10ADC3949BA59ABBE56E057F20F883E', 2, 1, CAST(N'2016-05-21 12:30:57.807' AS DateTime), N'113.160.57.22')
INSERT [dbo].[_User] ([Username], [Password], [Role], [Online], [LastLogin], [IP]) VALUES (N'Test', N'E10ADC3949BA59ABBE56E057F20F883E', 1, 0, CAST(N'2016-01-13 12:22:03.437' AS DateTime), N'::1')
SET IDENTITY_INSERT [dbo].[_UserInfo] ON 

INSERT [dbo].[_UserInfo] ([InforId], [FName], [LName], [Phone], [Address], [Email], [EventId], [Birthday], [Location], [Note], [DateJoin], [DateRegister]) VALUES (1, N'a', N'a', N'04214213', N'adasd', N'aaaa@gmail.com', 41, CAST(N'2014-11-11 00:00:00.000' AS DateTime), N'Hà Nội', N'', NULL, CAST(N'2014-12-18 11:34:37.190' AS DateTime))
INSERT [dbo].[_UserInfo] ([InforId], [FName], [LName], [Phone], [Address], [Email], [EventId], [Birthday], [Location], [Note], [DateJoin], [DateRegister]) VALUES (2, N'coi', NULL, NULL, NULL, N'abc123@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[_UserInfo] ([InforId], [FName], [LName], [Phone], [Address], [Email], [EventId], [Birthday], [Location], [Note], [DateJoin], [DateRegister]) VALUES (3, N'soncoi', NULL, NULL, NULL, N'abc1234@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[_UserInfo] ([InforId], [FName], [LName], [Phone], [Address], [Email], [EventId], [Birthday], [Location], [Note], [DateJoin], [DateRegister]) VALUES (4, N'nguyen coi', NULL, NULL, NULL, N'coicoi0101@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[_UserInfo] ([InforId], [FName], [LName], [Phone], [Address], [Email], [EventId], [Birthday], [Location], [Note], [DateJoin], [DateRegister]) VALUES (5, N'soncoi', NULL, N'0967962562', N'Son La', N'abc1234@gmail.com', NULL, CAST(N'1986-03-13 00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[_UserInfo] ([InforId], [FName], [LName], [Phone], [Address], [Email], [EventId], [Birthday], [Location], [Note], [DateJoin], [DateRegister]) VALUES (6, N'Son ', NULL, NULL, NULL, N'nguyenson1303@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[_UserInfo] ([InforId], [FName], [LName], [Phone], [Address], [Email], [EventId], [Birthday], [Location], [Note], [DateJoin], [DateRegister]) VALUES (7, N'Bình', NULL, NULL, NULL, N'sonnguyenvan1986@gmail.com', 0, NULL, NULL, N'Facebook login', NULL, CAST(N'2016-05-21 12:09:59.337' AS DateTime))
INSERT [dbo].[_UserInfo] ([InforId], [FName], [LName], [Phone], [Address], [Email], [EventId], [Birthday], [Location], [Note], [DateJoin], [DateRegister]) VALUES (8, N'Kenvil', NULL, NULL, NULL, N'duynvtest@gmail.com', 0, NULL, NULL, N'Facebook login', NULL, CAST(N'2016-07-13 11:05:58.100' AS DateTime))
SET IDENTITY_INSERT [dbo].[_UserInfo] OFF
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
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (16, N'list_link', N'adminLink', N'Button danh mục sản phẩm ', 0, N'BG', 76, 2, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (17, N'list_link', N'adminLink', N'Nơi sản xuất', 0, N'DT', 69, 10, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (18, N'list_link', N'adminLink', N'Danh sách dự án', 0, N'PR', 76, 8, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (19, N'list_link', N'adminLink', N'Danh sách Testimonials', 0, N'TE', 76, 6, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (20, N'list_link', N'adminLink', N'Danh sách Video', 0, N'VD', 76, 7, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (21, N'list_link', N'adminLink', N'Danh sách thành viên', 0, N'MB', 76, 4, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (22, N'list_link', N'adminLink', N'Danh sách dịch vụ', 0, N'SR', 76, 5, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (23, N'list_link', N'adminLink', N'Slide trang sản phẩm', 0, N'AF', 76, 9, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (24, N'list_link', N'adminLink', N'Danh sách liên kết', 1, N'LK', 76, 10, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (25, N'change_link', N'adminLink', N'Thêm Slide', 0, N'SL', 76, 17, N'<i class="icon-double-angle-right"></i>', N'add')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (26, N'change_link', N'adminLink', N'Thêm Background Slide', 0, N'BG', 76, 16, N'<i class="icon-double-angle-right"></i>', N'add')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (27, N'change_link', N'adminLink', N'Thêm Brand', 0, N'DT', 69, 11, N'<i class="icon-double-angle-right"></i>', N'add')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (28, N'change_link', N'adminLink', N'Thêm project', 0, N'PR', 76, 19, N'<i class="icon-double-angle-right"></i>', N'add')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (29, N'change_link', N'adminLink', N'Thêm Testimonials', 0, N'TE', 76, 20, N'<i class="icon-double-angle-right"></i>', N'add')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (30, N'change_link', N'adminLink', N'Thêm Video', 0, N'VD', 76, 21, N'<i class="icon-double-angle-right"></i>', N'add')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (31, N'change_link', N'adminLink', N'Thêm thành viên', 0, N'MB', 76, 22, N'<i class="icon-double-angle-right"></i>', N'add')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (32, N'change_link', N'adminLink', N'Thêm service', 0, N'SR', 76, 23, N'<i class="icon-double-angle-right"></i>', N'add')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (33, N'change_link', N'adminLink', N'Thêm Silde sản phẩm ', 0, N'AF', 76, 24, N'<i class="icon-double-angle-right"></i>', N'add')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (34, N'change_link', N'adminLink', N'Thêm liên kết', 0, N'LK', 76, 25, N'<i class="icon-double-angle-right"></i>', N'add')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (35, N'list_album_images', N'adminLink', N'Ảnh Lookbook', 1, N'LB', 70, 1, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (36, N'list_album_images', N'adminLink', N'Ảnh Gallery', 0, N'GL', 70, 4, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (37, N'system_config', N'adminGeneral', N'Cấu hình chung', 1, N'', 75, 6, N'<i class="icon-double-angle-right"></i>', N'edit')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (38, N'system_email', N'adminGeneral', N'Cấu hình email', 1, N'', 75, 7, N'<i class="icon-double-angle-right"></i>', N'edit')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (39, N'change_general', N'adminGeneral', N'Cập nhật quảng cáo trái', 0, N'advsleft', 76, 11, N'<i class="icon-double-angle-right"></i>', N'edit')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (40, N'change_general', N'adminGeneral', N'Cập nhật quảng cáo phải', 0, N'advsright', 76, 12, N'<i class="icon-double-angle-right"></i>', N'edit')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (41, N'change_general', N'adminGeneral', N'Cập nhật quảng cáo trên', 0, N'advstop', 76, 14, N'<i class="icon-double-angle-right"></i>', N'edit')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (42, N'change_general', N'adminGeneral', N'Cập nhật quảng cáo giữa', 0, N'advsmiddle', 76, 13, N'<i class="icon-double-angle-right"></i>', N'edit')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (43, N'change_general', N'adminGeneral', N'Cập nhật quảng cáo dưới phải', 0, N'advsbottom', 76, 15, N'<i class="icon-double-angle-right"></i>', N'edit')
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
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (55, N'change_catalog', N'adminCatalog', N'Thêm danh mục Collection', 0, N'CL', 69, 6, N'<i class="icon-double-angle-right"></i>', N'add')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (56, N'change_general', N'adminGeneral', N'Giới thiệu ngắn', 1, N'aboutshort', 75, 2, N'<i class="icon-double-angle-right"></i>', N'edit')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (57, N'change_general', N'adminGeneral', N'Giới thiệu', 1, N'aboutcontent', 75, 1, N'<i class="icon-double-angle-right"></i>', N'edit')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (58, N'change_general', N'adminGeneral', N'Liên hệ', 1, N'contactdetail', 75, 3, N'<i class="icon-double-angle-right"></i>', N'edit')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (59, N'change_general', N'adminGeneral', N'Liên hệ ngắn', 1, N'contact', 75, 4, N'<i class="icon-double-angle-right"></i>', N'edit')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (60, N'footer', N'adminGeneral', N'Footer', 1, N'', 75, 8, N'<i class="icon-double-angle-right"></i>', N'edit')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (61, N'list_catalog', N'adminCatalog', N'Danh mục Collection', 0, N'CL', 69, 5, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (62, N'list_contact', N'adminGeneral', N'Ý kiến khách hàng', 1, N'', 78, 1, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (63, N'list_Rating', N'adminProduct', N'Bình luận và đánh giá', 0, N'', 69, 8, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (69, N'', N'', N'Quản lý Sản phẩm ', 1, N'', 0, 1, N'<i class="icon-certificate"></i>', N'')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (70, N'', N'', N'Quản lý Gallery ', 0, N'', 0, 2, N'<i class="icon-picture"></i>', N'')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (71, N'', N'', N'Quản lý Đơn hàng ', 0, N'', 0, 3, N'<i class="icon-barcode"></i>', N'')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (72, N'', N'', N' Tin tức & Bài viết', 1, N'', 0, 4, N'<i class="icon-text-width"></i>', N'')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (73, N'', N'', N'Trang nội dung khác', 1, N'', 0, 5, N'<i class="icon-desktop"></i>', N'')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (74, N'', N'', N'Quản lý Thành viên ', 1, N'', 0, 6, N'<i class="icon-user"></i>', N'')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (75, N'', N'', N'Cấu hình Website ', 1, N'', 0, 7, N'<i class="icon-cogs"></i>', N'')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (76, N'', N'', N'Quảng cáo ', 1, N'', 0, 8, N'<i class="icon-globe"></i>', N'')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (77, N'', N'', N'Shipping ', 0, N'', 0, 9, N'<i class="icon-list-alt"></i>', N'')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (78, N'', N'', N'Ý kiến khách hàng ', 0, N'', 0, 10, N'<i class="icon-comments"></i>', N'')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (79, N'', N'', N'Email Template', 1, N'', 0, 11, N'<i class="icon-leaf"></i>', N'')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (80, N'list_log', N'adminUser', N'Log system', 1, N'', 74, 4, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (81, N'comment_facebook', N'adminProduct', N'Bình luận Facebook', 0, N'', 69, 9, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (82, N'list_user', N'adminUser', N'Danh sách Khách hàng', 1, N'Client', 74, 4, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (83, N'change_user', N'adminUser', N'Thông tin khách hàng', 0, N'Client', 74, 5, N'<i class="icon-double-angle-right"></i>', N'edit')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (84, N'change_general', N'adminGeneral', N'Cập nhật quảng cáo dưới trái', 0, N'advsbottomleft', 76, 16, N'<i class="icon-double-angle-right"></i>', N'edit')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (85, N'list_email', N'adminEmail', N'Email marketing', 1, N'Admin', 75, 8, N'<i class="icon-double-angle-right"></i>', N'edit')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (86, N'list_emailtemplate', N'adminEmail', N'Danh sách email template', 1, N'Admin', 79, 3, N'<i class="icon-double-angle-right"></i>', N'edit')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (87, N'change_emailtemplate', N'adminEmail', N'Thêm email template', 1, N'Admin', 79, 3, N'<i class="icon-double-angle-right"></i>', N'edit')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (88, N'change_general', N'adminGeneral', N'Hướng dẫn thanh toán', 1, N'payment_guide', 77, 2, N'<i class="icon-double-angle-right"></i>', N'edit')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (89, N'', N'', N'Quản lý Showroom', 0, N'', 0, 12, N'<i class="icon-leaf"></i>', N'')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (90, N'change_showroom', N'adminShowroom', N'Thêm Showroom', 1, N'Admin', 89, 1, N'<i class="icon-double-angle-right"></i>', N'add')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (91, N'list_showroom', N'adminShowroom', N'Danh sách Showroom', 1, N'Admin', 89, 1, N'<i class="icon-double-angle-right"></i>', N'edit')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (92, N'list_catalog', N'adminCatalog', N'Danh mục dịch vụ', 1, N'DV', 98, 1, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (93, N'change_catalog', N'adminCatalog', N'Thêm danh mục dịch vụ', 1, N'DV', 98, 2, N'<i class="icon-double-angle-right"></i>', N'add')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (94, N'list_post', N'adminPost', N'Dịch vụ', 1, N'DV', 98, 3, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (95, N'change_post', N'adminPost', N'Thêm dịch vụ', 1, N'DV', 98, 4, N'<i class="icon-double-angle-right"></i>', N'add')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (96, N'list_post', N'adminPost', N'Khuyến mãi', 1, N'KM', 99, 1, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (97, N'change_post', N'adminPost', N'Thêm khuyến mãi', 1, N'KM', 99, 2, N'<i class="icon-double-angle-right"></i>', N'add')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (98, N'', N'', N'Dịch vụ', 0, N'', 0, 13, N'<i class="icon-double-angle-right"></i>', N'')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (99, N'', N'', N'Khuyến mãi', 0, N'', 0, 14, N'<i class="icon-double-angle-right"></i>', N'')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (100, N'list_link', N'adminLink', N'Tiện ích', 1, N'TE', 76, 11, N'<i class="icon-double-angle-right"></i>', N'view')
SET IDENTITY_INSERT [dbo].[_UserPage] OFF
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
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (12, 12, 0, 0, 0, 1, N'soncoi')
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
GO
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (100, 46, 1, 1, 1, 1, N'Admin')
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
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (141, 84, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (142, 85, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (143, 86, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (144, 87, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (145, 88, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (146, 89, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (147, 90, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (148, 91, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (149, 81, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (150, 80, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (151, 82, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (152, 83, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (153, 85, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (154, 84, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (155, 88, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (156, 86, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (157, 87, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (158, 90, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (159, 91, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (160, 92, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (161, 93, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (162, 94, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (163, 95, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (164, 96, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (165, 97, 1, 1, 1, 1, N'Admin')
SET IDENTITY_INSERT [dbo].[_UserPermission] OFF
SET IDENTITY_INSERT [dbo].[_WebInfo] ON 

INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (1, N'smtphost', N'smtp.gmail.com', CAST(N'2018-06-22 16:28:00' AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (2, N'smtpport', N'587', CAST(N'2018-06-22 16:28:00' AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (3, N'smtpuser', N'tempaids005@gmail.com', CAST(N'2018-06-22 16:28:00' AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (4, N'smtppass', N'Abc@123456', CAST(N'2018-06-22 16:28:00' AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (5, N'email', N'nguyenson1303@gmail.com', CAST(N'2018-06-22 16:28:00' AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (6, N'hotline', N'0967 962 562', CAST(N'2018-06-22 17:26:00' AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (9, N'banner', N'<img width="760" height="221" src="/UserFiles/Image/slide.jpg" alt="" />', CAST(N'2010-12-04 23:19:00' AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (10, N'newstop', N'TRANSMECO <a href="#">đạt giải thưởng &quot;SAO V&Agrave;NG ĐẤT VIỆT 2009&quot; </a>[11.11.2009]', CAST(N'2010-12-04 23:19:00' AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (11, N'video', N'qG58VXLH9aA', CAST(N'2010-12-04 23:19:00' AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (18, N'facebook', N'https://www.facebook.com/superoil.vn/', CAST(N'2018-06-22 17:26:00' AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (20, N'price_min', N'0', CAST(N'2015-05-22 14:54:00' AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (21, N'price_max', N'100', CAST(N'2015-05-22 14:54:00' AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (22, N'latitude', N'21.015906', CAST(N'2018-06-22 17:26:00' AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (23, N'longitude', N'105.812098', CAST(N'2018-06-22 17:26:00' AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (24, N'google_analysis', NULL, CAST(N'2018-06-22 17:26:00' AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (25, N'app_extend_one', N'<!-- Load Facebook SDK for JavaScript -->
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = ''https://connect.facebook.net/vi_VN/sdk/xfbml.customerchat.js#xfbml=1&version=v2.12&autoLogAppEvents=1'';
  fjs.parentNode.insertBefore(js, fjs);
}(document, ''script'', ''facebook-jssdk''));</script>

<!-- Your customer chat code -->
<div class="fb-customerchat"
  attribution=setup_tool
  page_id="700246993338711"
  theme_color="#0084ff"
  logged_in_greeting="Chào bạn ! Tôi có thể giúp gì cho bạn ?"
  logged_out_greeting="Chào bạn ! Tôi có thể giúp gì cho bạn ?">
</div>', CAST(N'2018-06-22 17:26:00' AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (26, N'app_extend_two', NULL, CAST(N'2018-06-22 17:26:00' AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (27, N'tax', N'0.1', CAST(N'2018-06-22 17:26:00' AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (28, N'fees', N'0', CAST(N'2018-06-22 17:26:00' AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (29, N'min_fees', N'0', CAST(N'2018-06-22 17:26:00' AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (30, N'Skyper', NULL, CAST(N'2018-06-22 17:26:00' AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (31, N'imgmap', N'0', CAST(N'2018-06-22 17:26:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[_WebInfo] OFF
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([CityID], [CityName], [CreateDate]) VALUES (2, N'Hà Nội', CAST(N'2016-06-29 00:00:00.000' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [CreateDate]) VALUES (6, N'Hồ Chí Minh', CAST(N'2016-06-29 00:00:00.000' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [CreateDate]) VALUES (7, N'Đà Nẵng', CAST(N'2016-06-29 00:00:00.000' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [CreateDate]) VALUES (8, N'Cần Thơ', CAST(N'2016-06-29 00:00:00.000' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [CreateDate]) VALUES (9, N'Hải Phòng', CAST(N'2016-06-29 00:00:00.000' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [CreateDate]) VALUES (10, N'Nam Định', CAST(N'2016-06-29 00:00:00.000' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [CreateDate]) VALUES (11, N'Bắc Giang', CAST(N'2016-06-29 00:00:00.000' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [CreateDate]) VALUES (12, N'Sơn La', CAST(N'2016-06-29 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[City] OFF
SET IDENTITY_INSERT [dbo].[DetailOrder] ON 

INSERT [dbo].[DetailOrder] ([id], [OrderID], [ProductID], [ProductName], [Quantity], [Price], [TotalPrice], [Propertices], [Code]) VALUES (1, 0, 97, N'Dầu gội dưỡng phục hồi Nashi Argan Shampoo 500 ml', 1, 629000, 629000, N'', N'MFTYBQN5')
INSERT [dbo].[DetailOrder] ([id], [OrderID], [ProductID], [ProductName], [Quantity], [Price], [TotalPrice], [Propertices], [Code]) VALUES (2, 0, 42, N'Dầu hấp chăm sóc tóc hư tổn L''Oreal Serie Expert Absolut Repair Lipidium Masque 500ml', 1, 910000, 910000, N'white,S', N'B1VAHD67')
INSERT [dbo].[DetailOrder] ([id], [OrderID], [ProductID], [ProductName], [Quantity], [Price], [TotalPrice], [Propertices], [Code]) VALUES (3, 0, 62, N'Kem hấp chăm sóc và bảo vệ màu tóc nhuộm L''Oreal Vitamino Color A-OX 500ml', 2, 910000, 1820000, N',', N'B1VAHD67')
INSERT [dbo].[DetailOrder] ([id], [OrderID], [ProductID], [ProductName], [Quantity], [Price], [TotalPrice], [Propertices], [Code]) VALUES (4, 0, 58, N' Dầu gội ngăn ngừa rụng tóc Alfaparf Scalp Care 1000ml', 4, 689000, 2756000, N'', N'GJ4Q5UMY')
INSERT [dbo].[DetailOrder] ([id], [OrderID], [ProductID], [ProductName], [Quantity], [Price], [TotalPrice], [Propertices], [Code]) VALUES (5, 0, 117, N'The Chok Chok Green Tea Watery Mist 50ml', 1, 302000, 302000, N'', N'JHXW6NBY')
INSERT [dbo].[DetailOrder] ([id], [OrderID], [ProductID], [ProductName], [Quantity], [Price], [TotalPrice], [Propertices], [Code]) VALUES (6, 0, 97, N'The Chok Chok Green Tea Watery Mist 150ml', 1, 516000, 516000, N'', N'JHXW6NBY')
INSERT [dbo].[DetailOrder] ([id], [OrderID], [ProductID], [ProductName], [Quantity], [Price], [TotalPrice], [Propertices], [Code]) VALUES (7, 0, 120, N'Master Lab Hyaluronic Acid Mask', 1, 76000, 76000, N'', N'NRLE5UM0')
SET IDENTITY_INSERT [dbo].[DetailOrder] OFF
SET IDENTITY_INSERT [dbo].[District] ON 

INSERT [dbo].[District] ([DistrictID], [CityID], [DistrictName], [CreateDate]) VALUES (1, 2, N'Cầu Giấy', CAST(N'2016-06-29 00:00:00.000' AS DateTime))
INSERT [dbo].[District] ([DistrictID], [CityID], [DistrictName], [CreateDate]) VALUES (2, 2, N'Hai Bà Trưng', CAST(N'2016-06-29 00:00:00.000' AS DateTime))
INSERT [dbo].[District] ([DistrictID], [CityID], [DistrictName], [CreateDate]) VALUES (3, 2, N'Đống Đa', CAST(N'2016-06-29 00:00:00.000' AS DateTime))
INSERT [dbo].[District] ([DistrictID], [CityID], [DistrictName], [CreateDate]) VALUES (4, 2, N'Long Biên', CAST(N'2016-06-29 00:00:00.000' AS DateTime))
INSERT [dbo].[District] ([DistrictID], [CityID], [DistrictName], [CreateDate]) VALUES (5, 2, N'Nam Từ Liêm', CAST(N'2016-06-29 00:00:00.000' AS DateTime))
INSERT [dbo].[District] ([DistrictID], [CityID], [DistrictName], [CreateDate]) VALUES (6, 2, N'Hoàn Kiếm', CAST(N'2016-06-29 00:00:00.000' AS DateTime))
INSERT [dbo].[District] ([DistrictID], [CityID], [DistrictName], [CreateDate]) VALUES (7, 2, N'Thanh Xuân', CAST(N'2016-06-29 00:00:00.000' AS DateTime))
INSERT [dbo].[District] ([DistrictID], [CityID], [DistrictName], [CreateDate]) VALUES (8, 2, N'Ba Đình', CAST(N'2016-06-29 00:00:00.000' AS DateTime))
INSERT [dbo].[District] ([DistrictID], [CityID], [DistrictName], [CreateDate]) VALUES (11, 6, N'Quận 5', CAST(N'2016-06-29 00:00:00.000' AS DateTime))
INSERT [dbo].[District] ([DistrictID], [CityID], [DistrictName], [CreateDate]) VALUES (12, 6, N'Quận 7', CAST(N'2016-06-29 00:00:00.000' AS DateTime))
INSERT [dbo].[District] ([DistrictID], [CityID], [DistrictName], [CreateDate]) VALUES (13, 6, N'Quận 10', CAST(N'2016-06-29 00:00:00.000' AS DateTime))
INSERT [dbo].[District] ([DistrictID], [CityID], [DistrictName], [CreateDate]) VALUES (14, 6, N'Quận Gò Vấp', CAST(N'2016-06-29 00:00:00.000' AS DateTime))
INSERT [dbo].[District] ([DistrictID], [CityID], [DistrictName], [CreateDate]) VALUES (15, 7, N'Quận Hải Châu', CAST(N'2016-06-29 00:00:00.000' AS DateTime))
INSERT [dbo].[District] ([DistrictID], [CityID], [DistrictName], [CreateDate]) VALUES (16, 7, N'Quận Ninh Kiều', CAST(N'2016-06-29 00:00:00.000' AS DateTime))
INSERT [dbo].[District] ([DistrictID], [CityID], [DistrictName], [CreateDate]) VALUES (17, 10, N'Nam Định', CAST(N'2016-06-29 00:00:00.000' AS DateTime))
INSERT [dbo].[District] ([DistrictID], [CityID], [DistrictName], [CreateDate]) VALUES (18, 9, N'Hải Phòng', CAST(N'2016-06-29 00:00:00.000' AS DateTime))
INSERT [dbo].[District] ([DistrictID], [CityID], [DistrictName], [CreateDate]) VALUES (19, 11, N'Bắc Giang', CAST(N'2016-06-29 00:00:00.000' AS DateTime))
INSERT [dbo].[District] ([DistrictID], [CityID], [DistrictName], [CreateDate]) VALUES (20, 12, N'Sơn La', CAST(N'2016-06-29 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[District] OFF
SET IDENTITY_INSERT [dbo].[ImageAlbums] ON 

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
SET IDENTITY_INSERT [dbo].[Logs] ON 

INSERT [dbo].[Logs] ([Id], [EventDateTime], [EventLevel], [UserName], [MachineName], [EventMessage], [ErrorSource], [ErrorClass], [ErrorMethod], [ErrorMessage], [InnerErrorMessage]) VALUES (11, CAST(N'2016-06-28 15:01:59.000' AS DateTime), N'Error', N'', N'LANNH6403-PC', N'admin đã truy cập khu vực không hợp lệ:act = change_emailtemplate,ctrl = adminEmail,type_act= add,type= ', N'', N'', N'', N'', N'')
INSERT [dbo].[Logs] ([Id], [EventDateTime], [EventLevel], [UserName], [MachineName], [EventMessage], [ErrorSource], [ErrorClass], [ErrorMethod], [ErrorMessage], [InnerErrorMessage]) VALUES (12, CAST(N'2016-06-28 15:02:08.000' AS DateTime), N'Error', N'', N'LANNH6403-PC', N'admin đã truy cập khu vực không hợp lệ:act = change_emailtemplate,ctrl = adminEmail,type_act= add,type= ', N'', N'', N'', N'', N'')
INSERT [dbo].[Logs] ([Id], [EventDateTime], [EventLevel], [UserName], [MachineName], [EventMessage], [ErrorSource], [ErrorClass], [ErrorMethod], [ErrorMessage], [InnerErrorMessage]) VALUES (13, CAST(N'2016-06-28 15:15:52.000' AS DateTime), N'Error', N'', N'LANNH6403-PC', N'admin đã truy cập khu vực không hợp lệ:act = change_emailtemplate,ctrl = adminEmail,type_act= add,type= ', N'', N'', N'', N'', N'')
INSERT [dbo].[Logs] ([Id], [EventDateTime], [EventLevel], [UserName], [MachineName], [EventMessage], [ErrorSource], [ErrorClass], [ErrorMethod], [ErrorMessage], [InnerErrorMessage]) VALUES (14, CAST(N'2016-06-28 15:16:58.000' AS DateTime), N'Error', N'', N'LANNH6403-PC', N'admin đã truy cập khu vực không hợp lệ:act = change_emailtemplate,ctrl = adminEmail,type_act= edit,type= ', N'', N'', N'', N'', N'')
INSERT [dbo].[Logs] ([Id], [EventDateTime], [EventLevel], [UserName], [MachineName], [EventMessage], [ErrorSource], [ErrorClass], [ErrorMethod], [ErrorMessage], [InnerErrorMessage]) VALUES (15, CAST(N'2016-06-28 15:17:09.000' AS DateTime), N'Error', N'', N'LANNH6403-PC', N'admin đã truy cập khu vực không hợp lệ:act = change_emailtemplate,ctrl = adminEmail,type_act= edit,type= ', N'', N'', N'', N'', N'')
INSERT [dbo].[Logs] ([Id], [EventDateTime], [EventLevel], [UserName], [MachineName], [EventMessage], [ErrorSource], [ErrorClass], [ErrorMethod], [ErrorMessage], [InnerErrorMessage]) VALUES (16, CAST(N'2016-06-28 15:18:02.000' AS DateTime), N'Error', N'', N'LANNH6403-PC', N'admin đã truy cập khu vực không hợp lệ:act = change_emailtemplate,ctrl = adminEmail,type_act= edit,type= ', N'', N'', N'', N'', N'')
INSERT [dbo].[Logs] ([Id], [EventDateTime], [EventLevel], [UserName], [MachineName], [EventMessage], [ErrorSource], [ErrorClass], [ErrorMethod], [ErrorMessage], [InnerErrorMessage]) VALUES (17, CAST(N'2016-06-28 15:19:26.000' AS DateTime), N'Error', N'', N'LANNH6403-PC', N'admin đã truy cập khu vực không hợp lệ:act = change_emailtemplate,ctrl = adminEmail,type_act= edit,type= ', N'', N'', N'', N'', N'')
INSERT [dbo].[Logs] ([Id], [EventDateTime], [EventLevel], [UserName], [MachineName], [EventMessage], [ErrorSource], [ErrorClass], [ErrorMethod], [ErrorMessage], [InnerErrorMessage]) VALUES (18, CAST(N'2016-06-28 15:33:00.000' AS DateTime), N'Error', N'', N'LANNH6403-PC', N'admin đã truy cập khu vực không hợp lệ:act = list_emailtemplate,ctrl = adminEmail,type_act= view,type= TT', N'', N'', N'', N'', N'')
INSERT [dbo].[Logs] ([Id], [EventDateTime], [EventLevel], [UserName], [MachineName], [EventMessage], [ErrorSource], [ErrorClass], [ErrorMethod], [ErrorMessage], [InnerErrorMessage]) VALUES (19, CAST(N'2016-06-28 15:33:06.000' AS DateTime), N'Error', N'', N'LANNH6403-PC', N'admin đã truy cập khu vực không hợp lệ:act = list_emailtemplate,ctrl = adminEmail,type_act= view,type= TT', N'', N'', N'', N'', N'')
INSERT [dbo].[Logs] ([Id], [EventDateTime], [EventLevel], [UserName], [MachineName], [EventMessage], [ErrorSource], [ErrorClass], [ErrorMethod], [ErrorMessage], [InnerErrorMessage]) VALUES (20, CAST(N'2016-06-28 15:33:38.000' AS DateTime), N'Error', N'', N'LANNH6403-PC', N'admin đã truy cập khu vực không hợp lệ:act = list_emailtemplate,ctrl = adminEmail,type_act= view,type= TT', N'', N'', N'', N'', N'')
INSERT [dbo].[Logs] ([Id], [EventDateTime], [EventLevel], [UserName], [MachineName], [EventMessage], [ErrorSource], [ErrorClass], [ErrorMethod], [ErrorMessage], [InnerErrorMessage]) VALUES (21, CAST(N'2016-06-29 10:11:25.000' AS DateTime), N'Info', N'', N'PC1408-0052', N'abc1234@gmail.com Tạo đơn hàng thành công order_code: GJ4Q5UMY', N'', N'', N'', N'', N'')
INSERT [dbo].[Logs] ([Id], [EventDateTime], [EventLevel], [UserName], [MachineName], [EventMessage], [ErrorSource], [ErrorClass], [ErrorMethod], [ErrorMessage], [InnerErrorMessage]) VALUES (22, CAST(N'2016-06-29 10:13:59.000' AS DateTime), N'Info', N'', N'PC1408-0052', N'abc1234@gmail.com sử dụng Bảo Kim payment.Date:29/06/2016 10:13:59 SA;order:GJ4Q5UMY', N'', N'', N'', N'', N'')
INSERT [dbo].[Logs] ([Id], [EventDateTime], [EventLevel], [UserName], [MachineName], [EventMessage], [ErrorSource], [ErrorClass], [ErrorMethod], [ErrorMessage], [InnerErrorMessage]) VALUES (23, CAST(N'2016-06-29 10:13:59.000' AS DateTime), N'Info', N'', N'PC1408-0052', N'abc1234@gmail.com đã tạo Invoice và gọi payment gate Bảo Kim.Date:29/06/2016 10:13:59 SA;order:GJ4Q5UMY', N'', N'', N'', N'', N'')
INSERT [dbo].[Logs] ([Id], [EventDateTime], [EventLevel], [UserName], [MachineName], [EventMessage], [ErrorSource], [ErrorClass], [ErrorMethod], [ErrorMessage], [InnerErrorMessage]) VALUES (24, CAST(N'2016-06-29 10:14:14.000' AS DateTime), N'Info', N'', N'PC1408-0052', N'abc1234@gmail.com sử dụng Ngân Lượng payment.Date:29/06/2016 10:14:14 SA;order:GJ4Q5UMY', N'', N'', N'', N'', N'')
INSERT [dbo].[Logs] ([Id], [EventDateTime], [EventLevel], [UserName], [MachineName], [EventMessage], [ErrorSource], [ErrorClass], [ErrorMethod], [ErrorMessage], [InnerErrorMessage]) VALUES (25, CAST(N'2016-06-29 10:14:14.000' AS DateTime), N'Info', N'', N'PC1408-0052', N'abc1234@gmail.com đã tạo Invoice và gọi payment gate Ngân Lượng.Date:29/06/2016 10:14:14 SA;order:GJ4Q5UMY', N'', N'', N'', N'', N'')
INSERT [dbo].[Logs] ([Id], [EventDateTime], [EventLevel], [UserName], [MachineName], [EventMessage], [ErrorSource], [ErrorClass], [ErrorMethod], [ErrorMessage], [InnerErrorMessage]) VALUES (26, CAST(N'2016-07-07 12:09:13.000' AS DateTime), N'Info', N'', N'PC1408-0052', N'abc1234@gmail.com Tạo đơn hàng thành công order_code: JHXW6NBY', N'', N'', N'', N'', N'')
INSERT [dbo].[Logs] ([Id], [EventDateTime], [EventLevel], [UserName], [MachineName], [EventMessage], [ErrorSource], [ErrorClass], [ErrorMethod], [ErrorMessage], [InnerErrorMessage]) VALUES (27, CAST(N'2016-07-07 12:13:01.000' AS DateTime), N'Info', N'', N'PC1408-0052', N'abc1234@gmail.com Đã tạo order và chưa thanh toán .Date:07/07/2016 12:13:01 CH;order:JHXW6NBY', N'', N'', N'', N'', N'')
INSERT [dbo].[Logs] ([Id], [EventDateTime], [EventLevel], [UserName], [MachineName], [EventMessage], [ErrorSource], [ErrorClass], [ErrorMethod], [ErrorMessage], [InnerErrorMessage]) VALUES (28, CAST(N'2016-07-13 11:20:25.000' AS DateTime), N'Info', N'', N'WIN-WEB02', N'duynvtest@gmail.com Tạo đơn hàng thành công order_code: NRLE5UM0', N'', N'', N'', N'', N'')
INSERT [dbo].[Logs] ([Id], [EventDateTime], [EventLevel], [UserName], [MachineName], [EventMessage], [ErrorSource], [ErrorClass], [ErrorMethod], [ErrorMessage], [InnerErrorMessage]) VALUES (29, CAST(N'2016-07-13 11:20:49.000' AS DateTime), N'Info', N'', N'WIN-WEB02', N'duynvtest@gmail.com Đã tạo order và chưa thanh toán .Date:13/07/2016 11:20:49 SA;order:NRLE5UM0', N'', N'', N'', N'', N'')
INSERT [dbo].[Logs] ([Id], [EventDateTime], [EventLevel], [UserName], [MachineName], [EventMessage], [ErrorSource], [ErrorClass], [ErrorMethod], [ErrorMessage], [InnerErrorMessage]) VALUES (30, CAST(N'2016-07-13 11:34:30.000' AS DateTime), N'Info', N'', N'WIN-WEB02', N'Admin chuyển trạng thái đơn hàng  .Date:13/07/2016 11:34:30 SA;order:NRLE5UM0', N'', N'', N'', N'', N'')
INSERT [dbo].[Logs] ([Id], [EventDateTime], [EventLevel], [UserName], [MachineName], [EventMessage], [ErrorSource], [ErrorClass], [ErrorMethod], [ErrorMessage], [InnerErrorMessage]) VALUES (31, CAST(N'2016-07-13 11:34:30.000' AS DateTime), N'Info', N'', N'WIN-WEB02', N'Đơn hàng đã được thanh toán thành công do Admin approve .Date:13/07/2016 11:34:30 SA;TRANSACTION_STATUS:1', N'', N'', N'', N'', N'')
INSERT [dbo].[Logs] ([Id], [EventDateTime], [EventLevel], [UserName], [MachineName], [EventMessage], [ErrorSource], [ErrorClass], [ErrorMethod], [ErrorMessage], [InnerErrorMessage]) VALUES (32, CAST(N'2016-07-22 13:44:22.000' AS DateTime), N'Error', N'', N'PC1408-0052', N'soncoi đã truy cập khu vực không hợp lệ:act = change_catalog,ctrl = adminCatalog,type_act= edit,type= SP', N'', N'', N'', N'', N'')
INSERT [dbo].[Logs] ([Id], [EventDateTime], [EventLevel], [UserName], [MachineName], [EventMessage], [ErrorSource], [ErrorClass], [ErrorMethod], [ErrorMessage], [InnerErrorMessage]) VALUES (33, CAST(N'2016-07-22 13:46:50.000' AS DateTime), N'Error', N'', N'PC1408-0052', N'soncoi đã truy cập khu vực không hợp lệ:act = list_catalog,ctrl = adminCatalog,type_act= 3123123,type= SP', N'', N'', N'', N'', N'')
INSERT [dbo].[Logs] ([Id], [EventDateTime], [EventLevel], [UserName], [MachineName], [EventMessage], [ErrorSource], [ErrorClass], [ErrorMethod], [ErrorMessage], [InnerErrorMessage]) VALUES (34, CAST(N'2016-07-22 13:47:03.000' AS DateTime), N'Error', N'', N'PC1408-0052', N'soncoi đã truy cập khu vực không hợp lệ:act = list_catalog,ctrl = adminCatalog,type_act= 3123123,type= SP', N'', N'', N'', N'', N'')
INSERT [dbo].[Logs] ([Id], [EventDateTime], [EventLevel], [UserName], [MachineName], [EventMessage], [ErrorSource], [ErrorClass], [ErrorMethod], [ErrorMessage], [InnerErrorMessage]) VALUES (35, CAST(N'2016-07-22 13:48:36.000' AS DateTime), N'Error', N'', N'PC1408-0052', N'soncoi đã truy cập khu vực không hợp lệ:act = list_catalog,ctrl = adminCatalog,type_act= view,type= tt4', N'', N'', N'', N'', N'')
SET IDENTITY_INSERT [dbo].[Logs] OFF
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([id], [Total], [Name], [LName], [Gender], [Phone], [Fax], [Email], [City], [Address], [Recive], [Payment], [Shipping], [Note], [CreateDate], [Status], [Process], [ShipDate], [UserCreate], [Code]) VALUES (1, N'691900', N'soncoi', NULL, N'Nam', N'0967962562', NULL, N'abc1234@gmail.com', N'', N'Hà Nội', N'', N'0', N'', NULL, CAST(N'2016-05-29 22:30:00' AS SmallDateTime), 1, 0, NULL, N'abc1234@gmail.com', N'MFTYBQN5')
INSERT [dbo].[orders] ([id], [Total], [Name], [LName], [Gender], [Phone], [Fax], [Email], [City], [Address], [Recive], [Payment], [Shipping], [Note], [CreateDate], [Status], [Process], [ShipDate], [UserCreate], [Code]) VALUES (2, N'3003000', N'soncoi', NULL, N'Nam', N'0967962562', NULL, N'abc1234@gmail.com', N'', N'Hà Nội', N'', N'0', N'', NULL, CAST(N'2016-05-30 09:18:00' AS SmallDateTime), 1, 0, NULL, N'abc1234@gmail.com', N'B1VAHD67')
INSERT [dbo].[orders] ([id], [Total], [Name], [LName], [Gender], [Phone], [Fax], [Email], [City], [Address], [Recive], [Payment], [Shipping], [Note], [CreateDate], [Status], [Process], [ShipDate], [UserCreate], [Code]) VALUES (3, N'3031600', N'soncoi', NULL, N'Nam', N'0967677677', NULL, N'abc1234@gmail.com', N'', N'Hà nội', N'', N'0', N'', NULL, CAST(N'2016-06-29 10:11:00' AS SmallDateTime), 1, 0, NULL, N'abc1234@gmail.com', N'GJ4Q5UMY')
INSERT [dbo].[orders] ([id], [Total], [Name], [LName], [Gender], [Phone], [Fax], [Email], [City], [Address], [Recive], [Payment], [Shipping], [Note], [CreateDate], [Status], [Process], [ShipDate], [UserCreate], [Code]) VALUES (4, N'899800', N'soncoi', NULL, N'Nam', N'0922222222222', NULL, N'abc1234@gmail.com', N'', N'aaa', N'', N'0', N'', NULL, CAST(N'2016-07-07 12:09:00' AS SmallDateTime), 1, 0, NULL, N'abc1234@gmail.com', N'JHXW6NBY')
INSERT [dbo].[orders] ([id], [Total], [Name], [LName], [Gender], [Phone], [Fax], [Email], [City], [Address], [Recive], [Payment], [Shipping], [Note], [CreateDate], [Status], [Process], [ShipDate], [UserCreate], [Code]) VALUES (5, N'83600', N'Kenvil', N'Admin approve', N'Nam', N'0988693490', NULL, N'duynvtest@gmail.com', N'', N'Hà Nọi', N'', N'1', N'', N'Mua hàng', CAST(N'2016-07-13 11:20:00' AS SmallDateTime), 1, 2, NULL, N'duynvtest@gmail.com', N'NRLE5UM0')
SET IDENTITY_INSERT [dbo].[orders] OFF
SET IDENTITY_INSERT [dbo].[Showroom] ON 

INSERT [dbo].[Showroom] ([ShowroomID], [DistrictID], [Latitude], [Longitude], [Name], [Phone], [Address], [Image], [CreateDate]) VALUES (1, 1, N'21.039742', N'105.791078', N'Showroom 2', N'04.62811675', N'205 Trần Đăng Ninh, Cầu Giấy - Tel: 04.62811675', N'/images/newspost/2016/6/sc_small_2086_1486819_184763865054787_193480789_n.jpg', CAST(N'2016-06-29 00:00:00.000' AS DateTime))
INSERT [dbo].[Showroom] ([ShowroomID], [DistrictID], [Latitude], [Longitude], [Name], [Phone], [Address], [Image], [CreateDate]) VALUES (6, 1, N'21.031740', N'105.799533', N'Showroom 4', N'04.32535054', N'123 Cầu Giấy, Q. Cầu Giấy, Hà Nội - Tel: 04.32535054', N'/images/newspost/2016/6/sc_small_2115_1486819_184763865054787_193480789_n.jpg', CAST(N'2016-06-30 13:50:57.353' AS DateTime))
INSERT [dbo].[Showroom] ([ShowroomID], [DistrictID], [Latitude], [Longitude], [Name], [Phone], [Address], [Image], [CreateDate]) VALUES (13, 8, N'21.030292', N'105.813489', N'Showroom 1', N'04.37265438', N'216 Kim Mã, Ba Đình - Tel: 04.37265438', N'/images/newspost/2016/6/sc_small_2086_1486819_184763865054787_193480789_n.jpg', CAST(N'2016-06-29 00:00:00.000' AS DateTime))
INSERT [dbo].[Showroom] ([ShowroomID], [DistrictID], [Latitude], [Longitude], [Name], [Phone], [Address], [Image], [CreateDate]) VALUES (14, 3, N'21.009643', N'105.835245', N'Showroom 3', N'04.35773220', N'110 B6 Phạm Ngọc Thạch, Q. Đống Đa, Hà Nội - Tel: 04.35773220', N'/images/newspost/2016/6/sc_small_2086_1486819_184763865054787_193480789_n.jpg', CAST(N'2016-06-29 00:00:00.000' AS DateTime))
INSERT [dbo].[Showroom] ([ShowroomID], [DistrictID], [Latitude], [Longitude], [Name], [Phone], [Address], [Image], [CreateDate]) VALUES (15, 2, N'21.008155', N'105.851480', N'Showroom 5', N'04.66536940', N'39 Bạch Mai, Q. Hai Bà Trưng, Hà Nội – Tel: 04.66536940', N'/images/newspost/2016/6/sc_small_2086_1486819_184763865054787_193480789_n.jpg', CAST(N'2016-06-29 00:00:00.000' AS DateTime))
INSERT [dbo].[Showroom] ([ShowroomID], [DistrictID], [Latitude], [Longitude], [Name], [Phone], [Address], [Image], [CreateDate]) VALUES (16, 8, N'21.032170', N'105.812855', N'Showroom 6', N'04.32676001', N'F02-B19, TTTM Lotte Center Hanoi, 54 Liễu Giai, Q. Ba Đình, Hà Nội - Tel: 04.32676001', N'/images/newspost/2016/6/sc_small_2086_1486819_184763865054787_193480789_n.jpg', CAST(N'2016-06-29 00:00:00.000' AS DateTime))
INSERT [dbo].[Showroom] ([ShowroomID], [DistrictID], [Latitude], [Longitude], [Name], [Phone], [Address], [Image], [CreateDate]) VALUES (17, 3, N'21.028165', N'105.825522', N'Showroom 7', N'043.7368907', N'165 Giảng Võ - Q. Đống Đa - Hà Nội - Tel: 043.7368907', N'/images/newspost/2016/6/sc_small_2086_1486819_184763865054787_193480789_n.jpg', CAST(N'2016-06-29 00:00:00.000' AS DateTime))
INSERT [dbo].[Showroom] ([ShowroomID], [DistrictID], [Latitude], [Longitude], [Name], [Phone], [Address], [Image], [CreateDate]) VALUES (18, 7, N'20.992813', N'105.798179', N'Showroom 8', N'043.5526721', N'110B6 Nguyễn Quý Đức - Thanh Xuân Bắc - Hà Nội - Tel: 043.5526721', N'/images/newspost/2016/6/sc_small_2086_1486819_184763865054787_193480789_n.jpg', CAST(N'2016-06-29 00:00:00.000' AS DateTime))
INSERT [dbo].[Showroom] ([ShowroomID], [DistrictID], [Latitude], [Longitude], [Name], [Phone], [Address], [Image], [CreateDate]) VALUES (19, 5, N'21.015256', N'105.777308', N'Showroom 9', N'0432 123 265', N'Tầng 1, TTTM The Garden, Đường Mễ Trì, Phường Mỹ Đình 1, Quận Nam Từ Liêm - Hà Nội - Tel: 0432 123 265', N'/images/newspost/2016/6/sc_small_2086_1486819_184763865054787_193480789_n.jpg', CAST(N'2016-06-29 00:00:00.000' AS DateTime))
INSERT [dbo].[Showroom] ([ShowroomID], [DistrictID], [Latitude], [Longitude], [Name], [Phone], [Address], [Image], [CreateDate]) VALUES (20, 4, N'21.046493', N'105.870581', N'Showroom 10', N'04.3212.7852', N'217 Ngọc Lâm, Phường Ngọc Lâm, Quận Long Biên, Hà Nội - Tel: 04.3212.7852 ', N'/images/newspost/2016/6/sc_small_2086_1486819_184763865054787_193480789_n.jpg', CAST(N'2016-06-29 00:00:00.000' AS DateTime))
INSERT [dbo].[Showroom] ([ShowroomID], [DistrictID], [Latitude], [Longitude], [Name], [Phone], [Address], [Image], [CreateDate]) VALUES (21, 6, N'21.029745', N'105.846187', N'Showroom 11', N'04. 37171888', N'111 Hàng Bông, Quận Hoàn Kiếm, Hà Nội - Tel: 04. 37171888', N'/images/newspost/2016/6/sc_small_2086_1486819_184763865054787_193480789_n.jpg', CAST(N'2016-06-29 00:00:00.000' AS DateTime))
INSERT [dbo].[Showroom] ([ShowroomID], [DistrictID], [Latitude], [Longitude], [Name], [Phone], [Address], [Image], [CreateDate]) VALUES (22, 11, N'10.757369', N'106.678004', N'Showroom 1', N'08.39232833', N'156A Nguyễn Trãi, Phường 3, Quận 5 – Tel: 08.39232833', N'/images/newspost/2016/6/sc_small_2086_1486819_184763865054787_193480789_n.jpg', CAST(N'2016-06-29 00:00:00.000' AS DateTime))
INSERT [dbo].[Showroom] ([ShowroomID], [DistrictID], [Latitude], [Longitude], [Name], [Phone], [Address], [Image], [CreateDate]) VALUES (23, 12, N'10.740984', N'106.702079', N'Showroom 2', N'08.37752079', N'Tầng 1, TTTM Lotte Mart, Số 469 Nguyễn Hữu Thọ, P. Tân Hưng, Quận 7, TP. Hồ Chí Minh - Tel : 08.37752079', N'/images/newspost/2016/6/sc_small_2086_1486819_184763865054787_193480789_n.jpg', CAST(N'2016-06-29 00:00:00.000' AS DateTime))
INSERT [dbo].[Showroom] ([ShowroomID], [DistrictID], [Latitude], [Longitude], [Name], [Phone], [Address], [Image], [CreateDate]) VALUES (24, 13, N'10.774737', N'106.678994', N'Showroom 3', N'08.39258183', N'Số 67, Đường 3 tháng 2, Phường 11, Quận 10, TP. Hồ Chí Minh - Tel : 08.39258183', N'/images/newspost/2016/6/sc_small_2086_1486819_184763865054787_193480789_n.jpg', CAST(N'2016-06-29 00:00:00.000' AS DateTime))
INSERT [dbo].[Showroom] ([ShowroomID], [DistrictID], [Latitude], [Longitude], [Name], [Phone], [Address], [Image], [CreateDate]) VALUES (25, 14, N'10.824285', N'106.692137', N'Showroom 4', N'08.39871116', N'Tầng 1, TTTM Emart, 168 Phan Văn Trị, Phường 5, Quận Gò Vấp, TP. Hồ Chí Minh - Tel : 08.39871116', N'/images/newspost/2016/6/sc_small_2086_1486819_184763865054787_193480789_n.jpg', CAST(N'2016-06-29 00:00:00.000' AS DateTime))
INSERT [dbo].[Showroom] ([ShowroomID], [DistrictID], [Latitude], [Longitude], [Name], [Phone], [Address], [Image], [CreateDate]) VALUES (26, 15, N'16.034418', N'108.229079', N'Showroom', N'0511.362.4133', N'Tầng 2 -Lotte Mart, Hải Châu, Đà Nẵng – Tel: 0511.362.4133', N'/images/newspost/2016/6/sc_small_2086_1486819_184763865054787_193480789_n.jpg', CAST(N'2016-06-29 00:00:00.000' AS DateTime))
INSERT [dbo].[Showroom] ([ShowroomID], [DistrictID], [Latitude], [Longitude], [Name], [Phone], [Address], [Image], [CreateDate]) VALUES (27, 16, N'10.042247', N'105.766675', N'Showroom', N'0710.3696.889', N'Tầng 1 -Lotte Mart, 84 đường Mậu Thân, P. An Hòa, Q. Ninh Kiều, TP. Cần Thơ – Tel: 0710.3696.889', N'/images/newspost/2016/6/sc_small_2086_1486819_184763865054787_193480789_n.jpg', CAST(N'2016-06-29 00:00:00.000' AS DateTime))
INSERT [dbo].[Showroom] ([ShowroomID], [DistrictID], [Latitude], [Longitude], [Name], [Phone], [Address], [Image], [CreateDate]) VALUES (28, 17, N'20.432721', N'106.177865', N'Showroom', N'0912997989', N'30 Mạc Thị Bưởi, Nam Định – Tel: 0912997989', N'/images/newspost/2016/6/sc_small_2086_1486819_184763865054787_193480789_n.jpg', CAST(N'2016-06-29 00:00:00.000' AS DateTime))
INSERT [dbo].[Showroom] ([ShowroomID], [DistrictID], [Latitude], [Longitude], [Name], [Phone], [Address], [Image], [CreateDate]) VALUES (29, 18, N'20.852546', N'106.685236', N'Showroom', N'031.3843659', N'198 Cầu Đất, Hải Phòng – Tel: 031.3843659', N'/images/newspost/2016/6/sc_small_2086_1486819_184763865054787_193480789_n.jpg', CAST(N'2016-06-29 00:00:00.000' AS DateTime))
INSERT [dbo].[Showroom] ([ShowroomID], [DistrictID], [Latitude], [Longitude], [Name], [Phone], [Address], [Image], [CreateDate]) VALUES (30, 19, N'21.277088', N'106.194610', N'Showroom', N'024.06252288/ 0983.854.189', N'68 Ngô Gia Tự, TP Bắc Giang – Tel: 024.06252288/ 0983.854.189', N'/images/newspost/2016/6/sc_small_2086_1486819_184763865054787_193480789_n.jpg', CAST(N'2016-06-29 00:00:00.000' AS DateTime))
INSERT [dbo].[Showroom] ([ShowroomID], [DistrictID], [Latitude], [Longitude], [Name], [Phone], [Address], [Image], [CreateDate]) VALUES (31, 20, N'21.341418', N'103.908408', N'Showroom', N'022.3855468', N'346 Đường Tô Hiệu (Bản Lầu), TP Sơn La - Tel: 022.3855468 ', N'/images/newspost/2016/6/sc_small_2086_1486819_184763865054787_193480789_n.jpg', CAST(N'2016-06-29 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Showroom] OFF
ALTER TABLE [dbo].[_Contact] ADD  CONSTRAINT [DF__Contact_createdate]  DEFAULT (getdate()) FOR [createdate]
GO
USE [master]
GO
ALTER DATABASE [themanor] SET  READ_WRITE 
GO
