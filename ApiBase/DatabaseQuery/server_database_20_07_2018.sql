USE [master]
GO
/****** Object:  Database [soncoi_HXcF1350_apibase]    Script Date: 7/20/2018 9:06:02 PM ******/
CREATE DATABASE [soncoi_HXcF1350_apibase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'soncoi_HXcF1350_apibase', FILENAME = N'C:\Program Files (x86)\Plesk\Databases\MSSQL\MSSQL12.MSSQLSERVER2014\MSSQL\DATA\soncoi_HXcF1350_apibase.mdf' , SIZE = 4288KB , MAXSIZE = 2048000KB , FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'soncoi_HXcF1350_apibase_log', FILENAME = N'C:\Program Files (x86)\Plesk\Databases\MSSQL\MSSQL12.MSSQLSERVER2014\MSSQL\DATA\soncoi_HXcF1350_apibase_log.ldf' , SIZE = 1280KB , MAXSIZE = 2048000KB , FILEGROWTH = 10%)
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [soncoi_HXcF1350_apibase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [soncoi_HXcF1350_apibase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [soncoi_HXcF1350_apibase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [soncoi_HXcF1350_apibase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [soncoi_HXcF1350_apibase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [soncoi_HXcF1350_apibase] SET ARITHABORT OFF 
GO
ALTER DATABASE [soncoi_HXcF1350_apibase] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [soncoi_HXcF1350_apibase] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [soncoi_HXcF1350_apibase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [soncoi_HXcF1350_apibase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [soncoi_HXcF1350_apibase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [soncoi_HXcF1350_apibase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [soncoi_HXcF1350_apibase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [soncoi_HXcF1350_apibase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [soncoi_HXcF1350_apibase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [soncoi_HXcF1350_apibase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [soncoi_HXcF1350_apibase] SET  ENABLE_BROKER 
GO
ALTER DATABASE [soncoi_HXcF1350_apibase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [soncoi_HXcF1350_apibase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [soncoi_HXcF1350_apibase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [soncoi_HXcF1350_apibase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [soncoi_HXcF1350_apibase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [soncoi_HXcF1350_apibase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [soncoi_HXcF1350_apibase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [soncoi_HXcF1350_apibase] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [soncoi_HXcF1350_apibase] SET  MULTI_USER 
GO
ALTER DATABASE [soncoi_HXcF1350_apibase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [soncoi_HXcF1350_apibase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [soncoi_HXcF1350_apibase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [soncoi_HXcF1350_apibase] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [soncoi_HXcF1350_apibase]
GO
/****** Object:  User [apibase_sa]    Script Date: 7/20/2018 9:06:03 PM ******/
CREATE USER [apibase_sa] FOR LOGIN [apibase_sa] WITH DEFAULT_SCHEMA=[apibase_sa]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [apibase_sa]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [apibase_sa]
GO
ALTER ROLE [db_datareader] ADD MEMBER [apibase_sa]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [apibase_sa]
GO
/****** Object:  Schema [apibase_sa]    Script Date: 7/20/2018 9:06:03 PM ******/
CREATE SCHEMA [apibase_sa]
GO
/****** Object:  StoredProcedure [dbo].[_Catalog_GetByProductHot]    Script Date: 7/20/2018 9:06:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[_Catalog_GetParent]    Script Date: 7/20/2018 9:06:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[_General_Update]    Script Date: 7/20/2018 9:06:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[_Product_GetByCatalogType]    Script Date: 7/20/2018 9:06:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[_Statistic_All]    Script Date: 7/20/2018 9:06:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[_ThongKe_Edit]    Script Date: 7/20/2018 9:06:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[_UserInfor_Statistic]    Script Date: 7/20/2018 9:06:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[_WebInfo_Update]    Script Date: 7/20/2018 9:06:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[create_order_code]    Script Date: 7/20/2018 9:06:03 PM ******/
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
/****** Object:  UserDefinedFunction [dbo].[ConvertDelimitedListIntoTable]    Script Date: 7/20/2018 9:06:03 PM ******/
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
/****** Object:  Table [dbo].[_Catalog]    Script Date: 7/20/2018 9:06:03 PM ******/
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
/****** Object:  Table [dbo].[_Contact]    Script Date: 7/20/2018 9:06:03 PM ******/
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
/****** Object:  Table [dbo].[_Email]    Script Date: 7/20/2018 9:06:03 PM ******/
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
/****** Object:  Table [dbo].[_EmailTemplate]    Script Date: 7/20/2018 9:06:03 PM ******/
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
/****** Object:  Table [dbo].[_General]    Script Date: 7/20/2018 9:06:03 PM ******/
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
/****** Object:  Table [dbo].[_Invoices]    Script Date: 7/20/2018 9:06:03 PM ******/
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
/****** Object:  Table [dbo].[_Languages]    Script Date: 7/20/2018 9:06:03 PM ******/
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
/****** Object:  Table [dbo].[_Link]    Script Date: 7/20/2018 9:06:03 PM ******/
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
/****** Object:  Table [dbo].[_Pages]    Script Date: 7/20/2018 9:06:03 PM ******/
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
/****** Object:  Table [dbo].[_Payment]    Script Date: 7/20/2018 9:06:03 PM ******/
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
/****** Object:  Table [dbo].[_Post]    Script Date: 7/20/2018 9:06:03 PM ******/
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
/****** Object:  Table [dbo].[_PostTag]    Script Date: 7/20/2018 9:06:03 PM ******/
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
/****** Object:  Table [dbo].[_Product]    Script Date: 7/20/2018 9:06:03 PM ******/
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
/****** Object:  Table [dbo].[_ProductProperty]    Script Date: 7/20/2018 9:06:03 PM ******/
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
/****** Object:  Table [dbo].[_ProductTag]    Script Date: 7/20/2018 9:06:03 PM ******/
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
/****** Object:  Table [dbo].[_Rating]    Script Date: 7/20/2018 9:06:03 PM ******/
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
/****** Object:  Table [dbo].[_Role]    Script Date: 7/20/2018 9:06:03 PM ******/
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
/****** Object:  Table [dbo].[_Statistic]    Script Date: 7/20/2018 9:06:03 PM ******/
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
/****** Object:  Table [dbo].[_User]    Script Date: 7/20/2018 9:06:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[_User](
	[Username] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](500) NOT NULL,
	[Role] [int] NOT NULL,
	[Online] [bit] NULL,
	[LastLogin] [datetime] NULL,
	[IP] [nvarchar](100) NULL,
	[token] [varchar](1000) NULL,
	[expire] [datetime] NULL,
 CONSTRAINT [PK_tblUser] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[_UserInfo]    Script Date: 7/20/2018 9:06:03 PM ******/
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
	[Avatar] [varchar](250) NULL,
	[FullName] [nvarchar](250) NULL,
 CONSTRAINT [PK__UserInfo] PRIMARY KEY CLUSTERED 
(
	[InforId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[_UserPage]    Script Date: 7/20/2018 9:06:03 PM ******/
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
	[path] [varchar](250) NULL,
	[breadcrumb] [nvarchar](500) NULL,
	[TypeActionId] [int] NULL,
	[ModifyDate] [datetime] NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK__UserPage] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[_UserPageAction]    Script Date: 7/20/2018 9:06:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[_UserPageAction](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ActionName] [nvarchar](100) NULL,
	[ActionDescription] [nvarchar](500) NULL,
	[ActionStatus] [int] NULL,
	[CreateDate] [datetime] NULL,
	[ModifyDate] [datetime] NULL,
	[ActionPage] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[_UserPermission]    Script Date: 7/20/2018 9:06:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[_UserPermission](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[page_id] [int] NULL,
	[user] [nvarchar](100) NULL,
	[TypeActionId] [varchar](500) NULL,
 CONSTRAINT [PK__UserPermission] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[_WebInfo]    Script Date: 7/20/2018 9:06:03 PM ******/
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
/****** Object:  Table [dbo].[City]    Script Date: 7/20/2018 9:06:03 PM ******/
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
/****** Object:  Table [dbo].[DetailOrder]    Script Date: 7/20/2018 9:06:03 PM ******/
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
/****** Object:  Table [dbo].[District]    Script Date: 7/20/2018 9:06:03 PM ******/
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
/****** Object:  Table [dbo].[ImageAlbums]    Script Date: 7/20/2018 9:06:03 PM ******/
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
/****** Object:  Table [dbo].[ImageProducts]    Script Date: 7/20/2018 9:06:03 PM ******/
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
/****** Object:  Table [dbo].[Logs]    Script Date: 7/20/2018 9:06:03 PM ******/
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
/****** Object:  Table [dbo].[orders]    Script Date: 7/20/2018 9:06:03 PM ******/
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
/****** Object:  Table [dbo].[Showroom]    Script Date: 7/20/2018 9:06:03 PM ******/
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

INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (39, 0, N'Nhà phố thương mại', N'Nha-pho-thuong-mai', N'/images/catalog/2018/6/sc_small_2114_nha-pho.jpg', N'Nhà phố thương mại', N'<p>&nbsp;</p>
', N'vi', 1, N'Dưỡng da', N'Dưỡng da', N'Dưỡng da', N'SP', 1)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (40, 0, N'Nhà liền kề', N'Nha-lien-ke', N'/images/catalog/2018/6/sc_small_2058_nhalienke1_master.jpg', N'Nhà liền kề', N'<p>&nbsp;</p>
', N'vi', 1, N'Làm sạch', N'Làm sạch', N'Làm sạch', N'SP', 2)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (41, 0, N'Biệt thự song lập', N'Biet-thu-song-lap', N'/images/catalog/2018/6/sc_small_2116_bietthusonglap1_master.jpg', N'Biệt thự song lập', N'<p>&nbsp;</p>
', N'vi', 1, N'Toàn thân', N'Toàn thân', N'Toàn thân', N'SP', 3)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (46, 0, N'Mặt bằng biệt thự song lập khu A1', N'Mat-bang-biet-thu-song-lap-khu-A1', N'/images/catalog/2018/6/sc_full_2084_quy-hoach-tong-the-the-manor-central-park-bitexco-nguyen-xien.jpg', N'Mặt bằng biệt thự song lập khu A1', N'<!-- Image Map Generated by http://www.image-map.net/ -->
<img src="Quy-hoach-tong-the-the-manor-central-park-bitexco-nguyen-xien.jpg" usemap="#image-map">

<map name="image-map">
    <area target="" alt="Căn A1" title="Căn A1" href="56" coords="279,471,255,425" shape="rect">
    <area target="" alt="Căn A2" title="Căn A2" href="184" coords="499,437,524,437,524,469,528,489,508,496,499,475,500,472" shape="poly">
    <area target="" alt="Căn A3" title="Căn A3" href="183" coords="89,505,112,565" shape="rect">
    <area target="" alt="Căn A4" title="Căn A4" href="174" coords="500,272,524,273,523,306,528,325,506,330,499,305,500,306" shape="poly">
</map>', N'vi', 1, N'Sinh nhật 3s Belle salon', N'Sinh nhật 3s Belle salon', N'Sinh nhật 3s Belle salon', N'LB', 1)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (47, 0, N'Mặt bằng khu liền kề S1', N'Mat-bang-khu-lien-ke-S1', N'/images/catalog/2018/6/sc_full_2085_rs4.jpg', N'Mặt bằng khu liền kề S1', N'<p>&nbsp;</p>
', N'vi', 1, N'Sinh nhật', N'Sinh nhật Belle', N'Sinh nhật', N'LB', 2)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (48, 0, N'Nyala', N'Nyala', N'/images/catalog/4620151057tumblr_nml4t3mQTM1qbd81ro1_1280.jpg', N'<p>Nyala</p>
', N'', N'vi  ', 1, N'Nyala', N'Nyala', N'Nyala', N'GL', 1)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (49, 0, N'Ly Nguyen', N'Ly-Nguyen', N'/images/catalog/4620151057tumblr_nlno9nzVjk1qbd81ro1_1280.jpg', N'<p>Ly Nguyen</p>
', N'', N'vi  ', 1, N'Ly Nguyen', N'Ly Nguyen', N'Ly Nguyen', N'GL', 2)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (50, 0, N'Mặt bằng biệt thự đơn lập D2', N'Mat-bang-biet-thu-don-lap-D2', N'/images/catalog/2018/6/sc_full_2085_rs5.jpg', N'Mặt bằng biệt thự đơn lập D2', N'<p>&nbsp;</p>
', N'vi', 1, N'lookbook', N'lookbook', N'lookbook', N'LB', 3)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (51, 0, N'Mặt bằng tầng 10 tòa A1', N'Mat-bang-tang-10-toa-A1', N'/images/catalog/2018/6/sc_full_2085_rs2.jpg', N'Mặt bằng tầng 10 tòa A1', N'<p>&nbsp;</p>
', N'vi', 1, N'lookbook Đà Nẵng', N'lookbook Đà Nẵng', N'lookbook Đà Nẵng', N'LB', 4)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (52, 0, N'Mặt bằng tòa A2', N'Mat-bang-toa-A2', N'/images/catalog/2018/6/sc_full_2085_rs5.jpg', N'Mặt bằng tòa A2', N'<p>&nbsp;</p>
', N'vi', 1, N'lookbook Sài Gòn', N'lookbook Sài Gòn', N'lookbook Sài Gòn', N'LB', 5)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (53, 0, N'Mặt bằng tòa B1', N'Mat-bang-toa-B1', N'/images/catalog/2018/6/sc_full_2085_rs5.jpg', N'Mặt bằng tòa B1', N'<p>&nbsp;</p>
', N'vi', 1, N'lookbook free style', N'lookbook free style', N'lookbook free style', N'LB', 6)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (54, 0, N'Trần Thu Lê', N'Tran-Thu-Le', N'/images/catalog/462015111tumblr_nlno94mQTl1qbd81ro1_1280.jpg', N'', N'', N'vi  ', 1, N'Trần Thu Lê', N'Trần Thu Lê', N'Trần Thu Lê', N'GL', 3)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (55, 0, N'Nataly', N'Nataly', N'/images/catalog/462015112tumblr_nmrx1feU5c1qbd81ro1_1280.jpg', N'', N'', N'vi  ', 1, N'Nataly', N'Nataly', N'Nataly', N'GL', 4)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (56, 0, N'Lan Anh', N'Lan-Anh', N'/images/catalog/462015112tumblr_nn3zpqYPc11qbd81ro1_1280.jpg', N'', N'', N'vi  ', 1, N'Lan Anh', N'Lan Anh', N'Lan Anh', N'GL', 4)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (57, 0, N'Như Mai', N'Nhu-Mai', N'/images/catalog/462015113tumblr_nlkky2w4tX1qbd81ro1_1280.jpg', N'', N'', N'vi  ', 1, N'Như Mai', N'Như Mai', N'Như Mai', N'GL', 5)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (58, 0, N'Hoàng Anh', N'Hoang-Anh', N'/images/catalog/462015115tumblr_nlhshjUTOt1qbd81ro1_1280.jpg', N'', N'', N'vi  ', 1, N'Hoàng Anh', N'Hoàng Anh', N'Hoàng Anh', N'GL', 6)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (59, 0, N'Áo dài', N'Ao-dai', N'/images/catalog/4620151343demo999 (45).jpg', N'', N'', N'vi  ', 1, N'Áo dài', N'Áo dài', N'Áo dài', N'GL', 3)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (65, 0, N'Tin The Manor', N'Tin-The-Manor', N'/images/catalog/2018/6/sc_small_2093_themanor1.jpg', N'Tin về khu đô thị mới trong lòng Hà Nội', N'<p>&nbsp;</p>
', N'vi', 1, N'Khuyến mại', N'Khuyến mại', N'Khuyến mại', N'TT', 1)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (66, 0, N'blog', N'blog', N'0', N'', N'', N'en', 1, N'', N'', N'blog', N'TT', 1)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (76, 0, N'Sự kiện The manor', N'Su-kien-The-manor', N'/images/catalog/2018/6/sc_small_2098_img2.jpg', N'Sự kiện nóng hổi và mới nhất về The manor', N'<p>&nbsp;</p>
', N'vi', 1, N'Sự kiện', N'Sự kiện', N'Sự kiện', N'TT', 2)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (77, 0, N'Khối văn phòng', N'Khoi-van-phong', N'0', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Tuyển dụng', N'Tuyển dụng', N'Tuyển dụng', N'TT', 1)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (78, 0, N'Education', N'education', N'0', N'', N'', N'en', 1, N'Recruitment', N'Recruitment', N'Recruitment', N'TT', 1)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (79, 0, N'Báo chí nói gì về The manor central park', N'Bao-chi-noi-gi-ve-The-manor-central-park', N'0', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Tin nội bộ', N'Tin nội bộ', N'Tin nội bộ', N'TT', 4)
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

INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (1, N'pagename', N'THE MANOR CENTRAL PARK', CAST(N'2018-07-02 11:27:00' AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (3, N'contact', N'', CAST(N'2015-05-22 14:57:00' AS SmallDateTime), 1, N'vi  ')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (5, N'description', N'THE MANOR CENTRAL PARK', CAST(N'2018-07-02 11:27:00' AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (6, N'support', NULL, CAST(N'2018-07-02 11:27:00' AS SmallDateTime), 1, N'vi')
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
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (41, N'keywords', N'THE MANOR CENTRAL PARK', CAST(N'2018-07-02 11:27:00' AS SmallDateTime), 1, N'vi')
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
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (166, N'keywords', N'THE MANOR CENTRAL PARK', CAST(N'2018-07-02 11:27:00' AS SmallDateTime), 1, N'vi')
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
HOÀNG MAI, HÀ NỘI', CAST(N'2018-07-02 11:27:00' AS SmallDateTime), 1, N'vi')
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
Trong lòng Hà Nội', CAST(N'2018-07-02 11:27:00' AS SmallDateTime), 1, N'vi')
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

INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (68, N'CÔNG VIÊN CHU VĂN AN', N'', N'Là một dự án của TP rộng gần 110 ha đang dần được hình thành ngay bên cạnh quần thể The Manor Central Park, nơi tưởng niệm cụ Chu Văn An, một danh nhân kiệt xuất của dân tộc. Nơi đây cũng đóng vai trò là một “lá phổi Xanh” đang thối sức sống trong lành vào khu đô thị. Quý cư dân có thể thả mình vào thiên nhiên tươi mát với những thảm cỏ trải dài mênh mông, các hồ nước lớn, các công viên nhỏ hay những con đường rợp ngát bóng cây. Tất cả tạo nên một tổng hòa hoàn hảo giữa thiên nhiên và tâm linh, một vị trí đắc địa linh kiệt của The Manor Central Park.', N'', N'0', N'TE', 1, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (69, N'TUYẾN PHỐ THƯƠNG MẠI', N'', N'Không chỉ tôn vinh những giá trị truyền thống, khu đô thị The Manor Central Park còn ghi dấu những giá trị của một Hà Nội đương đại với “36 phố phường”. Những tuyến phố thương mại chính giữa khu biệt thư là nơi mà ngày nghỉ cuối tuần quý cư dân có thể thỏa sức tản bộ thư giãn hay hòa mình vào với không gian sôi động, đầy màu sắc. Trải nghiệm khám phá vô cùng mới lạ từ những sự kiện được thay đổi mỗi tuần như hội chợ thủ công mỹ nghệ, ẩm thực từ các quốc gia khác nhau…', N'', N'0', N'TE', 2, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (70, N'CÔNG VIÊN TRUNG TÂM', N'', N'Với diện tích tương đương hồ Hoàn Kiếm, công viên Trung Tâm đóng vai trò là TRÁI TIM của khu đô thị, tạo nên một “dòng máu Xanh” kết nối không gian trong một thể thống nhất dọc theo trục Bắc Nam, bắt đầu từ đại lộ Nguyễn Xiển. Công viên tiếp tục lan tỏa theo trục Đông Tây, kết nối với hơn 100 ha không gian xanh và mặt nước của công viên Chu Văn An, nơi đây hứa hẹn sẽ trở thành một không gian lý tưởng cho những hoạt động cộng đồng sôi nổi và tràn đầy sức sống.', N'', N'0', N'TE', 3, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (104, N'Liên kết 1', N'', N'<p>&nbsp;</p>
', N'http://soncoi.net', N'0', N'LK', 1, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (1105, N'TIỆN ÍCH VƯỢT TRỘI', N'', N'The Manor Central Park quy tụ mọi yếu tố của một khu đô thị phức hợp hiện đại. Với các trường mầm non xuyên suốt khu đô thị và trường học quốc tế sẽ mang đến một môi trường giáo dục đẳng cấp. Cùng chuỗi tổ hợp khu văn phòng & trung tâm thương mại, khu vực sinh hoạt cộng đồng, phố đi bộ, khu thể thao phức hợp, bể bơi ngoài trời và nhiều tiện ích đa dạng được bố trí trong bán kính phục vụ hợp lí, kết nối thuận tiện an toàn tới khu dân cư. Dịch vụ bảo vệ chuyên nghiệp tới từng gia đình đáp ứng trọn vẹn mọi nhu cầu về không gian sống lý tưởng.', N'', N'0', N'TE', 4, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (1106, N'video 2', N'', N'', N'', N'/images/link/2018/6/sc_original_2062_0110j-zenyl.mp4.mp4', N'SL', 1, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (1107, N'test 2', N'', N'', N'http://soncoi.net/', N'0', N'LK', 2, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (1108, N'test 3', N'', N'', N'http://soncoi.net/', N'0', N'LK', 3, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (1109, N'test 4', N'', N'', N'http://soncoi.net/', N'0', N'LK', 4, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (1110, N'test 5', N'', N'', N'http://soncoi.net/', N'0', N'LK', 5, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (1111, N'test 6', N'', N'', N'http://soncoi.net/', N'0', N'LK', 6, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (1112, N'test 7', N'', N'', N'http://soncoi.net/', N'0', N'LK', 7, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (1113, N'test 8', N'', N'', N'http://soncoi.net/', N'0', N'LK', 8, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (1114, N'test 9', N'', N'', N'http://soncoi.net/', N'0', N'LK', 9, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (1115, N'test 10', N'', N'', N'http://soncoi.net/', N'0', N'LK', 10, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (1118, N'Banner 2', N'', N'', N'', N'/images/link/2018/6/sc_original_2061_mat-bang-tong-the-the-manor-central-park.jpg', N'SL', 2, N'vi')
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

INSERT [dbo].[_Post] ([PostID], [CatelogID], [PostName], [ImagePath], [Link], [Summary], [PostContent], [DateModified], [IsHot], [Lang], [Keyword], [Description], [Title], [OrderDisplay], [Approve], [CreateDate]) VALUES (24, 65, N'HẾT QUỸ ĐẤT, CÁC KHU ĐÔ THỊ MỚI LAN RA NGOẠI THÀNH TÌM KHOẢNG XANH', N'/images/newspost/2018/6/sc_small_2089_bietthusonglap1_master.jpg', N'HET-QUY-DAT-CAC-KHU-DO-THI-MOI-LAN-RA-NGOAI-THANH-TIM-KHOANG-XANH', N'Chung cư cao tầng ken cứng nội đô Hà Nội khiến các chủ đầu tư dự án khu đô thị lớn phải tìm những quỹ đất ở xa trung tâm. Bù lại, tại đó họ có thể xây dựng công viên, hồ nước làm điểm nhấn thu hút khách hàng.', N'<p>Tại H&agrave; Nội, chung cư cao tầng đang mọc l&ecirc;n như &quot;nấm sau mưa&quot;. Tuy nhi&ecirc;n, do quỹ đất hạn chế n&ecirc;n c&aacute;c dự &aacute;n chủ yếu mang t&iacute;nh để ở chứ &iacute;t c&oacute; kh&ocirc;ng gian đủ rộng để người d&acirc;n c&oacute; thể vui chơi, giải tr&iacute;, thư gi&atilde;n. Những khu đ&ocirc; thị lớn lại c&agrave;ng kh&ocirc;ng.&nbsp;</p>

<p>Nhiều dự &aacute;n chen nhau mọc tr&ecirc;n những con phố nhỏ hẹp c&agrave;ng khiến giao th&ocirc;ng, m&ocirc;i trường trở n&ecirc;n qu&aacute; tải. Nhiều dự &aacute;n kh&aacute;c lại mọc l&ecirc;n tr&ecirc;n ch&iacute;nh những l&ocirc; đất m&agrave; nh&agrave; m&aacute;y, x&iacute; nghiệp phải di dời để giảm tải cho nội đ&ocirc;.</p>

<p>&Ocirc;ng Dương Đức Hiển, Gi&aacute;m đốc Bộ phận Kinh doanh nh&agrave; ở, Savills H&agrave; Nội cho biết: Nội đ&ocirc; H&agrave; Nội từ đường v&agrave;nh đai 3 trở v&agrave;o hiện nay hầu như kh&ocirc;ng c&ograve;n đất cho c&aacute;c khu đ&ocirc; thị lớn. Do đ&oacute;, c&aacute;c chủ đầu tư phải t&igrave;m đến những khu đất rộng r&atilde;i hơn từ v&agrave;nh đai 3 đến v&agrave;nh đai 5.</p>

<p>&quot;Xu hướng hiện nay l&agrave; giới nh&agrave; gi&agrave;u thường mua nh&agrave; ở xa trung t&acirc;m để ở thay v&igrave; chen ch&uacute;c trong nội đ&ocirc;. Ở đ&oacute; họ được hưởng thụ kh&ocirc;ng gian xanh m&aacute;t mẻ, trong l&agrave;nh để t&aacute;i tạo năng lượng sau thời gian l&agrave;m việc căng thẳng. Th&agrave;nh c&ocirc;ng của dự &aacute;n Ecopark l&agrave; một v&iacute; dụ&quot;, &ocirc;ng Hiển n&oacute;i.</p>

<p>Theo một số khảo s&aacute;t mới đ&acirc;y về kh&aacute;ch mua nh&agrave; tại H&agrave; Nội, c&aacute;c yếu tố được ưu ti&ecirc;n lựa chọn l&agrave; thiết kế dự &aacute;n c&oacute; nhiều kh&ocirc;ng gian xanh, tiện &iacute;ch hiện đại phục vụ sinh hoạt h&agrave;ng ng&agrave;y v&agrave; thư gi&atilde;n nghỉ ngơi.&nbsp;</p>

<p>Chị Minh Ngọc đang t&iacute;nh mua nh&agrave; tại dự &aacute;n The Manor Central Park (quận Ho&agrave;ng Mai) - dự &aacute;n ở kh&aacute; xa trung t&acirc;m H&agrave; Nội. Chị chia sẻ: &ldquo;T&ocirc;i sẽ cho thu&ecirc; căn nh&agrave; tr&ecirc;n phố Mai Hắc Đế. Cả nh&agrave; dọn về đ&acirc;y ở v&igrave; căn shophouse vừa c&oacute; thể kinh doanh thuận tiện, đặc biệt l&agrave; kh&ocirc;ng gian xanh m&aacute;t gi&uacute;p cuộc sống thư gi&atilde;n hơn&quot;.</p>

<p>Khảo s&aacute;t tr&ecirc;n thị trường bất động sản H&agrave; Nội, c&aacute;c chủ đầu tư đang ph&aacute;t triển nhiều dự &aacute;n khu đ&ocirc; thị xanh nằm xa trung t&acirc;m, kh&ocirc;ng chỉ để thu h&uacute;t người d&acirc;n ra khỏi khu vực nội đ&ocirc; đang rất qu&aacute; tải, &ocirc; nhiễm, m&agrave; c&ograve;n nhằm tạo những kh&ocirc;ng gian vui chơi thoải m&aacute;i cho người d&acirc;n th&agrave;nh phố.</p>

<p style="text-align: center;"><img alt="" src="/images/images/banner%20(2).jpg" style="width: 800px; height: 407px;" /></p>

<p>Với diện t&iacute;ch 89 ha tại quận Ho&agrave;ng Mai v&agrave; huyện Thanh Tr&igrave;, nằm liền kề c&ocirc;ng vi&ecirc;n tưởng niệm Chu Văn An rộng 110 ha, khu đ&ocirc; thị phức hợp The Manor Central Park l&agrave; quần thể đ&ocirc; thị sinh th&aacute;i c&oacute; quy m&ocirc; lớn đang được x&acirc;y dựng tại H&agrave; Nội. Đ&acirc;y l&agrave; một khu vực đang ph&aacute;t triển rất năng động nhưng lại chưa c&oacute; nhiều khoảng xanh cho người d&acirc;n.<br />
Theo quan s&aacute;t của ph&oacute;ng vi&ecirc;n, bao quanh dự &aacute;n khu đ&ocirc; thị mới n&agrave;y l&agrave; h&agrave;ng loạt c&aacute;c khu chung cư lớn như Kim Văn - Kim Lũ, HH Linh Đ&agrave;m. C&aacute;c khu chung cư n&agrave;y đang qu&aacute; tải do rất thiếu kh&ocirc;ng gian xanh cho người d&acirc;n. Do đ&oacute;, dự đo&aacute;n khi The Manor Central Park ho&agrave;n thiện sẽ thu h&uacute;t cư d&acirc;n c&aacute;c khu vực l&acirc;n cận đến vui chơi.</p>

<p>Cũng nằm tr&ecirc;n đường v&agrave;nh đai 3 nhưng ở ph&iacute;a Nam H&agrave; Nội, dự &aacute;n Gamuda City thu h&uacute;t kh&aacute;ch h&agrave;ng bởi kh&ocirc;ng gian c&ocirc;ng vi&ecirc;n v&agrave; hồ điều h&ograve;a tự nhi&ecirc;n. Dự &aacute;n bao quanh c&ocirc;ng vi&ecirc;n Y&ecirc;n Sở với diện t&iacute;ch c&acirc;y xanh v&agrave; mặt hồ rộng lớn, được mệnh danh l&agrave; &ldquo;l&aacute; phổi xanh&rdquo; ph&iacute;a Nam Thủ đ&ocirc;. Khu vực Y&ecirc;n Sở từ một khu hồ nước hoang sơ k&eacute;m ph&aacute;t triển đ&atilde; được chủ đầu tư biến th&agrave;nh một c&ocirc;ng vi&ecirc;n đ&ocirc; thị nổi tiếng của th&agrave;nh phố.</p>

<p style="text-align: center;"><img alt="" src="/images/images/banner%20(9).jpg" style="width: 800px; height: 338px;" /></p>

<p>Xu hướng h&igrave;nh th&agrave;nh những khu đ&ocirc; thị xanh rộng lớn ngo&agrave;i trung t&acirc;m H&agrave; Nội đang được kh&aacute;ch h&agrave;ng đ&oacute;n nhận khi ng&agrave;y c&agrave;ng c&oacute; nhiều người chuyển đến ở. Lợi thế đất đai rộng lớn cho ph&eacute;p c&aacute;c chủ đầu tư c&oacute; thể x&acirc;y dựng đường đi rộng r&atilde;i, l&agrave;m th&ecirc;m nhiều b&atilde;i đỗ xe, trồng nhiều c&acirc;y xanh, đ&agrave;o th&ecirc;m hồ nước - điều m&agrave; c&aacute;c chung cư trong nội đ&ocirc; kh&ocirc;ng thể l&agrave;m được.</p>

<p>Tuy nhi&ecirc;n, c&aacute;c chuy&ecirc;n gia lưu &yacute; khu vực ngoại th&agrave;nh trước đ&acirc;y chủ yếu l&agrave; đồng ruộng, chưa được đầu tư b&agrave;i bản hệ thống tho&aacute;t nước m&agrave; chủ yếu ti&ecirc;u tho&aacute;t tự nhi&ecirc;n. Do đ&oacute;, để ph&aacute;t triển đ&ocirc; thị v&ugrave;ng ven cần lưu &yacute; ph&aacute;t triển đồng bộ cơ sở hạ tầng,&nbsp; tr&aacute;nh đi v&agrave;o vết xe đổ của c&aacute;c dự &aacute;n trước đ&acirc;y trong nội đ&ocirc;.&nbsp;</p>

<p><strong>Ho&agrave;ng Dương/B&aacute;o Tin tức</strong></p>
', CAST(N'2018-06-25 13:29:46.433' AS DateTime), 1, N'vi', N'HẾT QUỸ ĐẤT, CÁC KHU ĐÔ THỊ MỚI LAN RA NGOẠI THÀNH TÌM KHOẢNG XANH', N'HẾT QUỸ ĐẤT, CÁC KHU ĐÔ THỊ MỚI LAN RA NGOẠI THÀNH TÌM KHOẢNG XANH', N'HẾT QUỸ ĐẤT, CÁC KHU ĐÔ THỊ MỚI LAN RA NGOẠI THÀNH TÌM KHOẢNG XANH', 1, 1, NULL)
INSERT [dbo].[_Post] ([PostID], [CatelogID], [PostName], [ImagePath], [Link], [Summary], [PostContent], [DateModified], [IsHot], [Lang], [Keyword], [Description], [Title], [OrderDisplay], [Approve], [CreateDate]) VALUES (26, 76, N'THƯỞNG THỨC TỐI MÙA HÈ CÙNG WINE&JAZZ TẠI THE MANOR CENRAL PARK', N'/images/newspost/2018/6/sc_small_2101_img2.jpg', N'THUONG-THUC-TOI-MUA-HE-CUNG-WINEJAZZ-TAI-THE-MANOR-CENRAL-PARK', N'Duy nhất trong tháng 7 này, THƯỞNG THỨC TỐI MÙA HÈ CÙNG #WINE_&_JAZZ
Cùng chiêm ngưỡng những căn nhà mẫu đẳng cấp tại The Manor Central Park và tận hưởng những ly rượu vang, lắng nghe những giai điệu sâu lắng từ ban nhạc jazz trong buổi tối mùa hè tháng 7 này và đừng quên TRẢI NGHIỆM NHÀ MẪU ĐẲNG CẤP #Shophouse và #Liềnkề tại #TheManorCentralPark. ', N'<p>Cũng tại sự kiện, Savills tr&acirc;n trọng mang đến một trong những dự &aacute;n t&acirc;m điểm ph&iacute;a T&acirc;y Nam H&agrave; Nội - #TheManorCentralPark:&nbsp;<br />
✅ Sở hữu kh&ocirc;ng gian sống xanh hiếm c&oacute; trong cả quần thể đ&ocirc; thị v&agrave; c&ocirc;ng vi&ecirc;n Chu Văn An rộng 200 ha<br />
✅ Nh&agrave; mẫu ho&agrave;n thiện bao gồm #Shophouse -&nbsp;<a data-mce-href="https://www.facebook.com/hashtag/nh%C3%A0_ph%E1%BB%91" href="https://www.facebook.com/hashtag/nh%C3%A0_ph%E1%BB%91" rel="noopener noreferrer" target="_blank">#Nh&agrave;_phố</a>&nbsp;2 trong 1 với thiết kế T&Aacute;CH BIỆT giữa kh&ocirc;ng gian sinh hoạt v&agrave; khu vực kinh doanh hay&nbsp;<a data-mce-href="https://www.facebook.com/hashtag/townhouse" href="https://www.facebook.com/hashtag/townhouse" rel="noopener noreferrer" target="_blank">#Townhouse</a>&nbsp;-&nbsp;<a data-mce-href="https://www.facebook.com/hashtag/li%E1%BB%81n_k%E1%BB%81" href="https://www.facebook.com/hashtag/li%E1%BB%81n_k%E1%BB%81" rel="noopener noreferrer" target="_blank">#Liền_Kề</a>&nbsp;với với vị tr&iacute; l&yacute; tưởng v&agrave; khoảng s&acirc;n chung rộng r&atilde;i<br />
✅ Tuyến phố thương mại &ldquo;Market Street&rdquo; đang h&igrave;nh th&agrave;nh với các hoạt đ&ocirc;̣ng được thay đ&ocirc;̉i m&ocirc;̃i cu&ocirc;́i tu&acirc;̀n như h&ocirc;̣i chợ, tri&ecirc;̉n lãm, &acirc;̉m thực&hellip;<br />
✅ Nhiều tiện &iacute;ch hiện đại: trung t&acirc;m thương mại, nh&agrave; trẻ, trường học quốc tế, trung t&acirc;m c&ocirc;ng nghệ cao, khu văn ph&ograve;ng, khu thể thao phức hợp, bể bơi ngo&agrave;i trời<br />
✅ Sản phẩm thiết kế tối ưu, phong c&aacute;ch Ch&acirc;u &Acirc;u, độc đ&aacute;o v&agrave; b&agrave;n giao đẳng cấp<br />
✅ Chủ đầu tư uy t&iacute;n Bitexco với nhiều dự &aacute;n th&agrave;nh c&ocirc;ng<br />
✅ V&agrave; tiềm năng đầu tư lớn khi quỹ đất của c&aacute;c khu trung t&acirc;m v&agrave; ph&iacute;a T&acirc;y th&agrave;nh phố đ&atilde; rất hạn chế.<br />
<br />
<a data-mce-href="https://www.facebook.com/hashtag/s%E1%BB%B1_ki%E1%BB%87n_ch%E1%BB%89_d%C3%A0nh_cho_kh%C3%A1ch_c%C3%B3_th%C6%B0_m%E1%BB%9Di" href="https://www.facebook.com/hashtag/s%E1%BB%B1_ki%E1%BB%87n_ch%E1%BB%89_d%C3%A0nh_cho_kh%C3%A1ch_c%C3%B3_th%C6%B0_m%E1%BB%9Di" rel="noopener noreferrer" target="_blank">#Sự_kiện_chỉ_d&agrave;nh_cho_kh&aacute;ch_c&oacute;_thư_mời</a>&nbsp;<br />
BUỔI TỐI M&Ugrave;A H&Egrave; C&Ugrave;NG WINE &amp; JAZZ&nbsp;<br />
KHU Đ&Ocirc; THỊ THE MANOR CENTRAL PARK &amp; C&Ocirc;NG VI&Ecirc;N CHU VĂN AN &ndash; 200 HA<br />
🎁 Qu&agrave; tặng gi&aacute; trị cho tất cả kh&aacute;ch h&agrave;ng tới tham dự&nbsp;<br />
🕓 Từ 16h &ndash; 20h | 📅 Chủ Nhật, ng&agrave;y 01/07/2018&nbsp;<br />
📍 Khu Nh&agrave; Mẫu, Khu đ&ocirc; thị The Manor Central Park, Đường Nguyễn Xiển, Đại Kim, Ho&agrave;ng Mai, H&agrave; Nội. (Cổng v&agrave;o đối diện trường Đại học Thăng Long)&nbsp;<br />
<br />
<a data-mce-href="https://www.facebook.com/hashtag/%C4%91%C4%83ng_k%C3%BD_tham_d%E1%BB%B1_s%E1%BB%B1_ki%E1%BB%87n" href="https://www.facebook.com/hashtag/%C4%91%C4%83ng_k%C3%BD_tham_d%E1%BB%B1_s%E1%BB%B1_ki%E1%BB%87n" rel="noopener noreferrer" target="_blank">#Đăng_k&yacute;_tham_dự_sự_kiện</a>:<br />
ĐƠN VỊ PH&Acirc;N PHỐI CH&Iacute;NH&nbsp;<a data-mce-href="https://www.facebook.com/SavillsVietnam/" href="https://www.facebook.com/SavillsVietnam/" rel="noopener noreferrer" target="_blank">Savills Vietnam</a>:<br />
📞 0943 09 5995 | 📧 hanoisales@savills.com.vn<br />
🌏&nbsp;<a data-mce-href="https://l.facebook.com/l.php?u=https%3A%2F%2Fmanorcentralpark.com.vn%2F&amp;h=AT1uHh01XA5WzkTMTu2S7Kx8w_Gwd-ipWVP75ejRofv3rj86mMIodk-7uppxczyYnzPv08R3WhYkPUje8zf-m0uoMd_mbQi2HUhjvDiI8ge5Ep7ktjjN_eIwXETP8kBHOQ&amp;s=1" href="https://l.facebook.com/l.php?u=https%3A%2F%2Fmanorcentralpark.com.vn%2F&amp;h=AT1uHh01XA5WzkTMTu2S7Kx8w_Gwd-ipWVP75ejRofv3rj86mMIodk-7uppxczyYnzPv08R3WhYkPUje8zf-m0uoMd_mbQi2HUhjvDiI8ge5Ep7ktjjN_eIwXETP8kBHOQ&amp;s=1" rel="noopener noreferrer" target="_blank">https://manorcentralpark.com.vn/</a></p>
', CAST(N'2018-06-25 13:39:53.577' AS DateTime), 1, N'vi', N'THƯỞNG THỨC TỐI MÙA HÈ CÙNG #WINE_&_JAZZ', N'THƯỞNG THỨC TỐI MÙA HÈ CÙNG #WINE_&_JAZZ', N'THƯỞNG THỨC TỐI MÙA HÈ CÙNG #WINE_&_JAZZ', 1, 1, CAST(N'2016-05-13 17:49:49.420' AS DateTime))
INSERT [dbo].[_Post] ([PostID], [CatelogID], [PostName], [ImagePath], [Link], [Summary], [PostContent], [DateModified], [IsHot], [Lang], [Keyword], [Description], [Title], [OrderDisplay], [Approve], [CreateDate]) VALUES (27, 65, N'SỰ KIỆN "TRẢI NGHIỆM KHÔNG GIAN SỐNG MỚI" TẠI THE MANOR CENTRAL PARK', N'/images/newspost/2018/6/sc_small_2103_img1.jpg', N'SU-KIEN-TRAI-NGHIEM-KHONG-GIAN-SONG-MOI-TAI-THE-MANOR-CENTRAL-PARK', N'Mùa hè rực rỡ với sự kiện “Trải nghiệm không gian sống mới” tại The Manor Central Park', N'<p>Ng&agrave;y 3/6/2018, Savills &ndash; đơn vị ph&acirc;n phối ch&iacute;nh thức đ&atilde; phối hợp c&ugrave;ng chủ đầu tư Bitexco đ&atilde; tổ chức sự kiện &ldquo;Trải nghiệm kh&ocirc;ng gian sống mới&rdquo; tại khu nh&agrave; mẫu Shophouse &amp; Liền kề nằm trong quần thể dự &aacute;n The Manor Central Park v&agrave; c&ocirc;ng vi&ecirc;n Chu Văn An rộng hơn 200 ha.</p>

<p>Sự kiện đ&atilde; diễn th&agrave;nh c&ocirc;ng tốt đẹp c&ugrave;ng với rất nhiều sự quan t&acirc;m v&agrave; đ&oacute;n nhận của qu&yacute; kh&aacute;ch h&agrave;ng d&agrave;nh cho một sản phẩm với gi&aacute; trị đẳng cấp v&agrave; sang trọng của The Manor Central Park. Đến với sự kiện của Savills, kh&aacute;ch h&agrave;ng được tư vấn th&ocirc;ng tin tr&ecirc;n sa b&agrave;n của dự &aacute;n v&agrave; tận mắt chi&ecirc;m ngưỡng nh&agrave; mẫu đ&atilde; ho&agrave;n thiện, gạt bỏ đi nỗi lo ngại về sản phẩm cuối c&ugrave;ng khi b&agrave;n giao.</p>

<p><img data-mce-src="//file.hstatic.net/1000213846/file/-45_grande.jpg" src="https://file.hstatic.net/1000213846/file/-45_grande.jpg" /></p>

<p>Đặc biệt, kh&aacute;ch h&agrave;ng đ&atilde; bất ngờ với thiết kế độc đ&aacute;o như lối đi biệt lập tại nh&agrave; mẫu&nbsp;<strong>nh&agrave; phố</strong>&nbsp;của The Manor Central Park đem lại nhiều tiện &iacute;ch, kh&ocirc;ng chỉ l&agrave; nơi sinh hoạt của gia đ&igrave;nh m&agrave; c&ograve;n l&agrave; điểm đến thu h&uacute;t đầu tư hay khoảng s&acirc;n rộng r&atilde;i của&nbsp;<strong>nh&agrave; liền kề</strong>, ph&ugrave; hợp với mọi hoạt động chung của qu&yacute; kh&aacute;ch h&agrave;ng.</p>

<p><img data-mce-src="//file.hstatic.net/1000213846/file/-40_grande.jpg" src="https://file.hstatic.net/1000213846/file/-40_grande.jpg" /></p>

<p>C&oacute; 5 điểm kh&aacute;ch h&agrave;ng Savills quan t&acirc;m nhất về #The_Manor_Central_Park:</p>

<ul>
	<li>Sản phẩm thấp tầng đa dạng từ nh&agrave; phố, liền kề đến biệt thự</li>
	<li>Sẵn s&agrave;n b&agrave;n giao từ qu&yacute; 1 năm 2019</li>
	<li>Chủ đầu tư Bitexco uy t&iacute;n với nhiều dự &aacute;n th&agrave;nh c&ocirc;ng</li>
	<li>Nằm trong khu đ&ocirc; thị với c&ocirc;ng vi&ecirc;n trung t&acirc;m v&agrave; c&ocirc;ng vi&ecirc;n Chu Văn An rộng 200 ha tạo n&ecirc;n quần thể sinh th&aacute;i hiếm hoi trong th&agrave;nh phố</li>
	<li>&ldquo;Tuyến phố thương mại&rdquo; với nhiều dịch vụ tiện &iacute;ch như nh&agrave; trẻ, trường quốc tế, trung t&acirc;m thương mại&hellip;hứa hẹn The Manor Central Park trở th&agrave;nh điểm s&aacute;ng về giải tr&iacute; v&agrave; vui chơi tại ph&iacute;a Nam th&agrave;nh phố.</li>
</ul>

<p>Cảm ơn c&aacute;c qu&yacute; kh&aacute;ch đ&atilde; đến tham dự v&agrave; ch&uacute;c mừng những chủ nh&acirc;n đang v&agrave; sẽ sở hữu ng&ocirc;i nh&agrave; mới tại The Manor Central Park.</p>

<p>---</p>

<p>Qu&yacute; kh&aacute;ch quan t&acirc;m tới dự &aacute;n vui l&ograve;ng li&ecirc;n hệ:</p>

<p>ĐƠN VỊ PH&Acirc;N PHỐI CH&Iacute;NH @SavillsVietnam:</p>

<p>📞 0943 09 5995 | 📧&nbsp;<a data-mce-href="mailto:hanoisales@savills.com.vn" href="mailto:hanoisales@savills.com.vn">hanoisales@savills.com.vn</a></p>

<p>🌏&nbsp;<a data-mce-href="https://manorcentralpark.com.vn/" href="https://manorcentralpark.com.vn/">https://manorcentralpark.com.vn/</a></p>
', CAST(N'2018-06-25 13:41:25.027' AS DateTime), 1, N'vi', N'SỰ KIỆN "TRẢI NGHIỆM KHÔNG GIAN SỐNG MỚI" TẠI THE MANOR CENTRAL PARK', N'SỰ KIỆN "TRẢI NGHIỆM KHÔNG GIAN SỐNG MỚI" TẠI THE MANOR CENTRAL PARK', N'SỰ KIỆN "TRẢI NGHIỆM KHÔNG GIAN SỐNG MỚI" TẠI THE MANOR CENTRAL PARK', 1, 1, CAST(N'2016-05-17 10:32:36.947' AS DateTime))
SET IDENTITY_INSERT [dbo].[_Post] OFF
SET IDENTITY_INSERT [dbo].[_Product] ON 

INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (56, N'Biệt thự căn góc A12', N'KT_CC_002', N'41', N'<p>Dự &aacute;n trong giai đoạn 1 mang đến cho kh&aacute;ch h&agrave;ng nhiều sự lựa chọn với 3 loại h&igrave;nh nh&agrave; ở đ&oacute; l&agrave; nh&agrave; phố thương mại, nh&agrave; liền kề v&agrave; biệt thự song lập. Tất cả đều dựa tr&ecirc;n những thiết kế h&agrave;i h&ograve;a, được b&agrave;i tr&iacute; v&agrave; t&iacute;nh to&aacute;n kĩ lưỡng để ph&ugrave; hợp với nếp sống của văn h&oacute;a phương Đ&ocirc;ng m&agrave; vẫn mang phong c&aacute;ch sống đương đại.</p>
', N'<ul>
	<li>
		<p><i class="fa fa-bed" aria-hidden="true"></i> Phòng ngủ: <span>2 PN</span></p>
	</li>
	<li>
		<p><i class="fa fa-binoculars" aria-hidden="true"></i> View: <span>View công viên</span></p>
	</li>
	<li>
		<p><i class="fa fa-square" aria-hidden="true"></i> Diện tích tổng: <span>150 m2</span></p>
	</li>
	<li>
		<p><i class="fa fa-car" aria-hidden="true"></i> Đỗ xe: <span>Có</span></p>
	</li>
	<li>
		<p><i class="fa fa-compass" aria-hidden="true"></i> Hướng: <span>Nam</span></p>
	</li>
</ul>', N'/images/photoproduct/2018/6/sc_small_2070_img-1.jpg', N'/images/photoproduct/2018/6/sc_full_2070_img-1.jpg', CAST(N'2018-06-25 11:17:42.350' AS DateTime), 1, N'60ml', N'', N'', 0.0000, 880000.0000, 0, 6, N'vi', 1, 1, 1, N'Biet-thu-can-goc-A12', 0, CAST(N'2014-11-20 00:00:00.000' AS DateTime), CAST(N'2014-11-25 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (59, N'Timeless Ferment Snail Toner', N'KT_BT_002', N'40', N'', N'<h3>&nbsp;</h3>
', N'/images/photoproduct/2018/6/sc_small_2077_img-2.jpg', N'/images/photoproduct/2018/6/sc_full_2077_img-2.jpg', CAST(N'2018-06-25 09:00:55.073' AS DateTime), 1, N'150ml', N'', N'', 0.0000, 1630000.0000, 0, 22, N'vi', 1, 1, 0, N'Timeless-Ferment-Snail-Toner', NULL, CAST(N'2014-12-09 00:00:00.000' AS DateTime), CAST(N'2014-12-11 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (67, N'Naturalth Goat Milk Whitening Emulsion', N'KT_NLK_005', N'39', N'', N'<h2>&nbsp;</h2>
', N'/images/photoproduct/2018/6/sc_small_2077_img.jpg', N'/images/photoproduct/2018/6/sc_full_2077_img.jpg', CAST(N'2018-06-25 09:00:43.347' AS DateTime), 1, N'150ml', N'', N'', 0.0000, 985000.0000, 0, 27, N'vi', 1, 1, 0, N'Naturalth-Goat-Milk-Whitening-Emulsion', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (101, N'The Chok Chok Green Tea Watery Lotion', N'4YXZCb', N'41', N'', N'<p>&nbsp;</p>
', N'/images/photoproduct/2018/6/sc_small_2076_img-3.jpg', N'/images/photoproduct/2018/6/sc_full_2076_img-3.jpg', CAST(N'2018-06-25 09:01:06.410' AS DateTime), 1, N'160ml', N'', N'', 0.0000, 547000.0000, 0, 13, N'vi', 1, 1, 0, N'The-Chok-Chok-Green-Tea-Watery-Lotion', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (125, N'Luxury Gem Gold 24K Mask', N'SxG98u', N'39', N'', N'<p>&nbsp;</p>
', N'/images/photoproduct/2018/6/sc_small_2076_img-1.jpg', N'/images/photoproduct/2018/6/sc_full_2076_img-1.jpg', CAST(N'2018-06-25 09:01:16.417' AS DateTime), 1, N'100ml', N'', N'', 0.0000, 715000.0000, 0, 8, N'vi', 1, 1, 0, N'Luxury-Gem-Gold-24K-Mask', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (130, N'Floria Nurtra Energy Foam Cleanser', N'jygQlP', N'39', N'', N'<p>&nbsp;</p>
', N'/images/photoproduct/2018/6/sc_small_2066_img.jpg', N'/images/photoproduct/2018/6/sc_full_2066_img.jpg', CAST(N'2018-06-25 09:02:19.947' AS DateTime), 1, N'150ml', N'', N'', 0.0000, 267000.0000, 0, 1, N'vi', 1, 1, 0, N'Floria-Nurtra-Energy-Foam-Cleanser', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (149, N'Aquaporine Water Bomb Sleeping Pack', N'FPHarq', N'40', N'', N'<p>&nbsp;</p>
', N'/images/photoproduct/2018/6/sc_small_2076_img-4.jpg', N'/images/photoproduct/2018/6/sc_full_2076_img-4.jpg', CAST(N'2018-06-25 09:02:30.673' AS DateTime), 1, N'100ml', N'', N'', 0.0000, 395000.0000, 0, 3, N'vi', 1, 0, 0, N'Aquaporine-Water-Bomb-Sleeping-Pack', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (174, N'Timeless Ferment Snail BB Cream', N'6QLZWQ', N'41', N'', N'<p>&nbsp;</p>
', N'/images/photoproduct/2018/6/sc_small_2070_img-4.jpg', N'/images/photoproduct/2018/6/sc_full_2070_img-4.jpg', CAST(N'2018-06-25 09:02:59.547' AS DateTime), 1, N'50ml', N'', N'', 0.0000, 828000.0000, 0, 2, N'vi', 1, 0, 0, N'Timeless-Ferment-Snail-BB-Cream', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (182, N'BC Dation Water Pact', N'qPSosS', N'40', N'', N'<p>&nbsp;</p>
', N'/images/photoproduct/2018/6/sc_small_2067_img-3.jpg', N'/images/photoproduct/2018/6/sc_full_2067_img-3.jpg', CAST(N'2018-06-25 09:01:29.587' AS DateTime), 1, N'15 g', N'', N'', 0.0000, 820000.0000, 0, 2, N'vi', 1, 1, 0, N'BC-Dation-Water-Pact', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (183, N'Aqua Aura UV Moist Cushion', N'ZMJc8H', N'39', N'', N'<p>&nbsp;</p>
', N'/images/photoproduct/2018/6/sc_small_2068_img-4.jpg', N'/images/photoproduct/2018/6/sc_full_2068_img-4.jpg', CAST(N'2018-06-25 09:03:54.533' AS DateTime), 1, N'12 g', N'', N'', 0.0000, 702000.0000, 0, 3, N'vi', 1, 0, 0, N'Aqua-Aura-UV-Moist-Cushion', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (184, N'Aqua Aura Jelly Cushion SPF 36 PA ++', N'byFLCZ', N'39', N'<p>&nbsp;</p>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2018/6/sc_small_2069_img-1.jpg', N'/images/photoproduct/2018/6/sc_full_2069_img-1.jpg', CAST(N'2018-06-27 16:50:16.410' AS DateTime), 1, N'13 g', N'', N'', 14.0000, 16.0000, 0, 4, N'vi', 1, 0, 0, N'Aqua-Aura-Jelly-Cushion-SPF-36-PA', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (187, N'Face Mix Oil Paper Powder', N'qfMa0U', N'40', N'', N'<p>&nbsp;</p>
', N'/images/photoproduct/2018/6/sc_small_2068_img.jpg', N'/images/photoproduct/2018/6/sc_full_2068_img.jpg', CAST(N'2018-06-25 09:02:00.013' AS DateTime), 1, N'', N'', N'', 0.0000, 387000.0000, 0, 7, N'vi', 1, 0, 0, N'Face-Mix-Oil-Paper-Powder', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (188, N'Timeless Carat Dual Concenaler', N'jSfoxI', N'41', N'', N'<p>&nbsp;</p>
', N'/images/photoproduct/2018/6/sc_small_2067_img-2.jpg', N'/images/photoproduct/2018/6/sc_full_2067_img-2.jpg', CAST(N'2018-06-25 09:01:48.330' AS DateTime), 1, N'4.2g + 4.5 ml', N'', N'', 0.0000, 295000.0000, 0, 1, N'vi', 1, 0, 0, N'Timeless-Carat-Dual-Concenaler', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (189, N'Face Mix Primer Lip Concealer', N'SXjpuf', N'40', N'', N'<p>&nbsp;</p>
', N'/images/photoproduct/2018/6/sc_small_2067_img-1.jpg', N'/images/photoproduct/2018/6/sc_full_2067_img-1.jpg', CAST(N'2018-06-25 09:02:11.620' AS DateTime), 1, N'9g', N'', N'', 0.0000, 147000.0000, 0, 2, N'vi', 1, 1, 0, N'Face-Mix-Primer-Lip-Concealer', NULL, NULL, NULL, 0)
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
INSERT [dbo].[_Role] ([ID], [RoleName], [Des], [Role]) VALUES (2, N'User', N'Người dùng', N'User')
SET IDENTITY_INSERT [dbo].[_Role] OFF
SET IDENTITY_INSERT [dbo].[_Statistic] ON 

INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (155, CAST(N'2018-06-20 18:36:36.093' AS DateTime), 32, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (156, CAST(N'2018-06-21 18:11:16.207' AS DateTime), 48, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (157, CAST(N'2018-06-22 19:02:02.093' AS DateTime), 46, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (158, CAST(N'2018-06-25 16:04:08.837' AS DateTime), 40, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (159, CAST(N'2018-06-26 08:55:26.370' AS DateTime), 1, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (160, CAST(N'2018-06-26 17:44:01.927' AS DateTime), 19, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (161, CAST(N'2018-06-27 18:04:15.180' AS DateTime), 48, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (162, CAST(N'2018-06-28 14:41:30.753' AS DateTime), 11, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (163, CAST(N'2018-06-29 15:49:55.277' AS DateTime), 13, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (164, CAST(N'2018-07-02 13:29:41.250' AS DateTime), 8, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (165, CAST(N'2018-07-03 11:37:21.763' AS DateTime), 1, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[_Statistic] OFF
INSERT [dbo].[_User] ([Username], [Password], [Role], [Online], [LastLogin], [IP], [token], [expire]) VALUES (N'Admin', N'E10ADC3949BA59ABBE56E057F20F883E', 1, 1, CAST(N'2018-07-03 11:38:20.510' AS DateTime), N'127.0.0.1', NULL, NULL)
INSERT [dbo].[_User] ([Username], [Password], [Role], [Online], [LastLogin], [IP], [token], [expire]) VALUES (N'chient@gmail.com', N'E10ADC3949BA59ABBE56E057F20F883E', 1, 0, NULL, N'', NULL, NULL)
INSERT [dbo].[_User] ([Username], [Password], [Role], [Online], [LastLogin], [IP], [token], [expire]) VALUES (N'chientest1@gmail.com', N'E10ADC3949BA59ABBE56E057F20F883E', 1, 1, NULL, N'', NULL, NULL)
INSERT [dbo].[_User] ([Username], [Password], [Role], [Online], [LastLogin], [IP], [token], [expire]) VALUES (N'nguyenson1303@gmail.com', N'FCEA920F7412B5DA7BE0CF42B8C93759', 1, 1, CAST(N'2016-07-10 16:11:25.473' AS DateTime), N'1.52.126.129', N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJzb24gbmd1eWVuIiwibmFtZWlkIjoiNiIsInJvbGVzIjoiQWRtaW4iLCJlbWFpbCI6Im5ndXllbnNvbjEzMDNAZ21haWwuY29tIiwiYmlydGhkYXRlIjoiIiwianRpIjoiZTllYzZkMGYtM2JkZS00M2UxLWFiOGItYjU1MzA0YTJhNTc2IiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9leHBpcmVkIjoiNy8yMC8yMDE4IDk6MDY6NTUgUE0iLCJleHAiOjE1MzIwOTU2MTUsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6NTY2MjUiLCJhdWQiOiJodHRwOi8vbG9jYWxob3N0OjU2NjI1In0.coX-QxupggLrssK058H_5nU-6j2tVE4mBoWVcVthO1E', CAST(N'2018-07-20 21:06:55.927' AS DateTime))
INSERT [dbo].[_User] ([Username], [Password], [Role], [Online], [LastLogin], [IP], [token], [expire]) VALUES (N'nguyenxuanchien2610@gmail.com', N'E10ADC3949BA59ABBE56E057F20F883E', 1, 1, NULL, N'', NULL, NULL)
INSERT [dbo].[_User] ([Username], [Password], [Role], [Online], [LastLogin], [IP], [token], [expire]) VALUES (N'soncoi', N'E10ADC3949BA59ABBE56E057F20F883E', 2, 1, CAST(N'2016-07-22 13:43:41.267' AS DateTime), N'127.0.0.1', NULL, NULL)
INSERT [dbo].[_User] ([Username], [Password], [Role], [Online], [LastLogin], [IP], [token], [expire]) VALUES (N'sonnguyenvan1986@gmail.com', N'E10ADC3949BA59ABBE56E057F20F883E', 2, 1, CAST(N'2016-05-21 12:30:57.807' AS DateTime), N'', NULL, NULL)
INSERT [dbo].[_User] ([Username], [Password], [Role], [Online], [LastLogin], [IP], [token], [expire]) VALUES (N'string', N'B45CFFE084DD3D20D928BEE85E7B0F21', 2, 1, NULL, N'127.0.0.1', NULL, NULL)
INSERT [dbo].[_User] ([Username], [Password], [Role], [Online], [LastLogin], [IP], [token], [expire]) VALUES (N'Test', N'E10ADC3949BA59ABBE56E057F20F883E', 1, 0, CAST(N'2016-01-13 12:22:03.437' AS DateTime), N'::1', NULL, NULL)
INSERT [dbo].[_User] ([Username], [Password], [Role], [Online], [LastLogin], [IP], [token], [expire]) VALUES (N'test122354634@gmail.com', N'E10ADC3949BA59ABBE56E057F20F883E', 1, 1, NULL, N'', NULL, NULL)
INSERT [dbo].[_User] ([Username], [Password], [Role], [Online], [LastLogin], [IP], [token], [expire]) VALUES (N'test2@gmail.com', N'E10ADC3949BA59ABBE56E057F20F883E', 0, 1, NULL, N'127.0.0.1', NULL, NULL)
INSERT [dbo].[_User] ([Username], [Password], [Role], [Online], [LastLogin], [IP], [token], [expire]) VALUES (N'user12@gmail.com', N'E10ADC3949BA59ABBE56E057F20F883E', 1, 1, NULL, N'', NULL, NULL)
INSERT [dbo].[_User] ([Username], [Password], [Role], [Online], [LastLogin], [IP], [token], [expire]) VALUES (N'user123@gmail.com', N'E10ADC3949BA59ABBE56E057F20F883E', 1, 1, NULL, N'127.0.0.1', NULL, NULL)
INSERT [dbo].[_User] ([Username], [Password], [Role], [Online], [LastLogin], [IP], [token], [expire]) VALUES (N'user1234@gmail.com', N'E10ADC3949BA59ABBE56E057F20F883E', 1, 1, NULL, N'127.0.0.1', NULL, NULL)
INSERT [dbo].[_User] ([Username], [Password], [Role], [Online], [LastLogin], [IP], [token], [expire]) VALUES (N'user1234567@gmail.com', N'E10ADC3949BA59ABBE56E057F20F883E', 1, 1, NULL, N'127.0.0.1', NULL, NULL)
INSERT [dbo].[_User] ([Username], [Password], [Role], [Online], [LastLogin], [IP], [token], [expire]) VALUES (N'user1235@gmail.com', N'E10ADC3949BA59ABBE56E057F20F883E', 1, 1, NULL, N'', NULL, NULL)
SET IDENTITY_INSERT [dbo].[_UserInfo] ON 

INSERT [dbo].[_UserInfo] ([InforId], [FName], [LName], [Phone], [Address], [Email], [EventId], [Birthday], [Location], [Note], [DateJoin], [DateRegister], [Avatar], [FullName]) VALUES (1, N'a', N'a', N'04214213', N'adasd', N'aaaa@gmail.com', 41, CAST(N'2014-11-11 00:00:00.000' AS DateTime), N'Hà Nội', N'', NULL, CAST(N'2014-12-18 11:34:37.190' AS DateTime), NULL, NULL)
INSERT [dbo].[_UserInfo] ([InforId], [FName], [LName], [Phone], [Address], [Email], [EventId], [Birthday], [Location], [Note], [DateJoin], [DateRegister], [Avatar], [FullName]) VALUES (5, N'soncoi', NULL, N'0967962562', N'Son La', N'abc1234@gmail.com', NULL, CAST(N'1986-03-13 00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[_UserInfo] ([InforId], [FName], [LName], [Phone], [Address], [Email], [EventId], [Birthday], [Location], [Note], [DateJoin], [DateRegister], [Avatar], [FullName]) VALUES (6, N'son', N'nguyen', N'', N'', N'nguyenson1303@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, N'', N'nguyen son')
INSERT [dbo].[_UserInfo] ([InforId], [FName], [LName], [Phone], [Address], [Email], [EventId], [Birthday], [Location], [Note], [DateJoin], [DateRegister], [Avatar], [FullName]) VALUES (7, N'Bình', NULL, NULL, NULL, N'sonnguyenvan1986@gmail.com', 0, NULL, NULL, N'Facebook login', NULL, CAST(N'2016-05-21 12:09:59.337' AS DateTime), NULL, NULL)
INSERT [dbo].[_UserInfo] ([InforId], [FName], [LName], [Phone], [Address], [Email], [EventId], [Birthday], [Location], [Note], [DateJoin], [DateRegister], [Avatar], [FullName]) VALUES (9, NULL, NULL, NULL, NULL, N'test2@gmail.com', NULL, NULL, NULL, NULL, NULL, CAST(N'2018-07-06 14:47:24.100' AS DateTime), NULL, NULL)
INSERT [dbo].[_UserInfo] ([InforId], [FName], [LName], [Phone], [Address], [Email], [EventId], [Birthday], [Location], [Note], [DateJoin], [DateRegister], [Avatar], [FullName]) VALUES (13, NULL, NULL, NULL, NULL, N'user1234@gmail.com', NULL, NULL, NULL, NULL, NULL, CAST(N'2018-07-17 14:57:32.707' AS DateTime), NULL, NULL)
INSERT [dbo].[_UserInfo] ([InforId], [FName], [LName], [Phone], [Address], [Email], [EventId], [Birthday], [Location], [Note], [DateJoin], [DateRegister], [Avatar], [FullName]) VALUES (14, NULL, NULL, NULL, NULL, N'user123@gmail.com', NULL, NULL, NULL, NULL, NULL, CAST(N'2018-07-17 14:57:40.633' AS DateTime), NULL, NULL)
INSERT [dbo].[_UserInfo] ([InforId], [FName], [LName], [Phone], [Address], [Email], [EventId], [Birthday], [Location], [Note], [DateJoin], [DateRegister], [Avatar], [FullName]) VALUES (15, NULL, NULL, NULL, NULL, N'user1235@gmail.com', NULL, NULL, NULL, NULL, NULL, CAST(N'2018-07-17 14:57:46.063' AS DateTime), NULL, N'null null')
INSERT [dbo].[_UserInfo] ([InforId], [FName], [LName], [Phone], [Address], [Email], [EventId], [Birthday], [Location], [Note], [DateJoin], [DateRegister], [Avatar], [FullName]) VALUES (17, NULL, NULL, NULL, NULL, N'user12@gmail.com', NULL, NULL, NULL, NULL, NULL, CAST(N'2018-07-17 14:58:01.600' AS DateTime), NULL, N'null null')
INSERT [dbo].[_UserInfo] ([InforId], [FName], [LName], [Phone], [Address], [Email], [EventId], [Birthday], [Location], [Note], [DateJoin], [DateRegister], [Avatar], [FullName]) VALUES (19, NULL, NULL, NULL, NULL, N'user1234567@gmail.com', NULL, NULL, NULL, NULL, NULL, CAST(N'2018-07-17 14:58:29.133' AS DateTime), NULL, NULL)
INSERT [dbo].[_UserInfo] ([InforId], [FName], [LName], [Phone], [Address], [Email], [EventId], [Birthday], [Location], [Note], [DateJoin], [DateRegister], [Avatar], [FullName]) VALUES (20, NULL, NULL, NULL, NULL, N'nguyenxuanchien2610@gmail.com', NULL, NULL, NULL, NULL, NULL, CAST(N'2018-07-17 17:10:34.120' AS DateTime), NULL, NULL)
INSERT [dbo].[_UserInfo] ([InforId], [FName], [LName], [Phone], [Address], [Email], [EventId], [Birthday], [Location], [Note], [DateJoin], [DateRegister], [Avatar], [FullName]) VALUES (21, N'a', N'c', NULL, NULL, N'chientest1@gmail.com', NULL, NULL, NULL, NULL, NULL, CAST(N'2018-07-17 17:23:00.180' AS DateTime), NULL, N'a c')
INSERT [dbo].[_UserInfo] ([InforId], [FName], [LName], [Phone], [Address], [Email], [EventId], [Birthday], [Location], [Note], [DateJoin], [DateRegister], [Avatar], [FullName]) VALUES (22, N'a1', N'b', NULL, NULL, N'chient@gmail.com', NULL, NULL, NULL, NULL, NULL, CAST(N'2018-07-17 17:28:48.803' AS DateTime), N'', N'a1 b')
INSERT [dbo].[_UserInfo] ([InforId], [FName], [LName], [Phone], [Address], [Email], [EventId], [Birthday], [Location], [Note], [DateJoin], [DateRegister], [Avatar], [FullName]) VALUES (23, NULL, NULL, NULL, NULL, N'test122354634@gmail.com', NULL, NULL, NULL, NULL, NULL, CAST(N'2018-07-20 14:19:47.447' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[_UserInfo] OFF
SET IDENTITY_INSERT [dbo].[_UserPage] ON 

INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (1, N'list_catalog', N'adminCatalog', N'Danh mục sản phẩm', 1, N'SP', 69, 3, N'', N'', NULL, 1, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (2, N'list_catalog', N'adminCatalog', N'Danh mục bài viết', 1, N'TT', 72, 3, N'', N'', NULL, 1, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (3, N'list_catalog', N'adminCatalog', N'Danh sách mặt bằng', 1, N'LB', 70, 2, N'', N'', NULL, 1, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (4, N'list_catalog', N'adminCatalog', N'Danh mục Gallery', 0, N'GL', 70, 5, N'', N'', NULL, 1, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (5, N'change_catalog', N'adminCatalog', N'Thêm danh mục sản phẩm', 1, N'SP', 69, 4, N'', N'', NULL, 2, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (6, N'change_catalog', N'adminCatalog', N'Thêm danh mục bài viết', 1, N'TT', 72, 4, N'', N'', NULL, 2, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (7, N'change_catalog', N'adminCatalog', N'Thêm mặt bằng', 1, N'LB', 70, 3, N'', N'', NULL, 2, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (8, N'change_catalog', N'adminCatalog', N'Thêm Album Gallery', 0, N'GL', 70, 6, N'', N'', NULL, 2, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (9, N'change_product', N'adminProduct', N'Thêm sản phẩm', 1, N'SP', 69, 1, N'', N'', NULL, 2, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (10, N'image_product', N'adminProduct', N'Ảnh sản phẩm', 0, N'SP', 69, 7, N'', N'', NULL, 1, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (11, N'property_product', N'adminProduct', N'Thuộc tính sản phẩm', 0, N'SP', 69, 9, N'', N'', NULL, 1, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (12, N'list_product', N'adminProduct', N'Sản phẩm', 1, N'SP', 69, 2, N'', N'', NULL, 1, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (13, N'list_post', N'adminPost', N'Danh sách bài viết', 1, N'TT', 72, 2, N'', N'', NULL, 1, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (14, N'change_post', N'adminPost', N'Thêm bài viết', 1, N'TT', 72, 1, N'', N'', NULL, 2, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (15, N'list_link', N'adminLink', N'Slide trang chủ', 1, N'SL', 76, 1, N'', N'', NULL, 1, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (16, N'list_link', N'adminLink', N'Button danh mục sản phẩm ', 0, N'BG', 76, 2, N'', N'', NULL, 1, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (17, N'list_link', N'adminLink', N'Nơi sản xuất', 0, N'DT', 69, 10, N'', N'', NULL, 1, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (18, N'list_link', N'adminLink', N'Danh sách dự án', 0, N'PR', 76, 8, N'', N'', NULL, 1, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (19, N'list_link', N'adminLink', N'Danh sách Testimonials', 0, N'TE', 76, 6, N'', N'', NULL, 1, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (20, N'list_link', N'adminLink', N'Danh sách Video', 0, N'VD', 76, 7, N'', N'', NULL, 1, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (21, N'list_link', N'adminLink', N'Danh sách thành viên', 0, N'MB', 76, 4, N'', N'', NULL, 1, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (22, N'list_link', N'adminLink', N'Danh sách dịch vụ', 0, N'SR', 76, 5, N'', N'', NULL, 1, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (23, N'list_link', N'adminLink', N'Slide trang sản phẩm', 0, N'AF', 76, 9, N'', N'', NULL, 1, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (24, N'list_link', N'adminLink', N'Danh sách liên kết', 1, N'LK', 76, 10, N'', N'', NULL, 1, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (25, N'change_link', N'adminLink', N'Thêm Slide', 0, N'SL', 76, 17, N'', N'', NULL, 2, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (26, N'change_link', N'adminLink', N'Thêm Background Slide', 0, N'BG', 76, 16, N'', N'', NULL, 2, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (27, N'change_link', N'adminLink', N'Thêm Brand', 0, N'DT', 69, 11, N'', N'', NULL, 2, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (28, N'change_link', N'adminLink', N'Thêm project', 0, N'PR', 76, 19, N'', N'', NULL, 2, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (29, N'change_link', N'adminLink', N'Thêm Testimonials', 0, N'TE', 76, 20, N'', N'', NULL, 2, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (30, N'change_link', N'adminLink', N'Thêm Video', 0, N'VD', 76, 21, N'', N'', NULL, 2, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (31, N'change_link', N'adminLink', N'Thêm thành viên', 0, N'MB', 76, 22, N'', N'', NULL, 2, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (32, N'change_link', N'adminLink', N'Thêm service', 0, N'SR', 76, 23, N'', N'', NULL, 2, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (33, N'change_link', N'adminLink', N'Thêm Silde sản phẩm ', 0, N'AF', 76, 24, N'', N'', NULL, 2, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (34, N'change_link', N'adminLink', N'Thêm liên kết', 0, N'LK', 76, 25, N'', N'', NULL, 2, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (35, N'list_album_images', N'adminLink', N'Ảnh mặt bằng', 0, N'LB', 70, 1, N'', N'', NULL, 1, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (36, N'list_album_images', N'adminLink', N'Ảnh Gallery', 0, N'GL', 70, 4, N'', N'', NULL, 1, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (37, N'system_config', N'adminGeneral', N'Cấu hình chung', 1, N'', 75, 6, N'', N'', NULL, 4, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (38, N'system_email', N'adminGeneral', N'Cấu hình email', 1, N'', 75, 7, N'', N'', NULL, 4, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (39, N'change_general', N'adminGeneral', N'Cập nhật quảng cáo trái', 0, N'advsleft', 76, 11, N'', N'', NULL, 4, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (40, N'change_general', N'adminGeneral', N'Cập nhật quảng cáo phải', 0, N'advsright', 76, 12, N'', N'', NULL, 4, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (41, N'change_general', N'adminGeneral', N'Cập nhật quảng cáo trên', 0, N'advstop', 76, 14, N'', N'', NULL, 4, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (42, N'change_general', N'adminGeneral', N'Cập nhật quảng cáo giữa', 0, N'advsmiddle', 76, 13, N'', N'', NULL, 4, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (43, N'change_general', N'adminGeneral', N'Cập nhật quảng cáo dưới phải', 0, N'advsbottom', 76, 15, N'', N'', NULL, 4, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (44, N'change_general', N'adminGeneral', N'Nội dung Shipping', 1, N'content_shipping', 77, 1, N'', N'', NULL, 4, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (45, N'change_general', N'adminGeneral', N'Email xác nhận đơn hàng', 1, N'email_order_confirm', 79, 2, N'', N'', NULL, 4, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (46, N'change_general', N'adminGeneral', N'Email xác nhận quên mật khẩu', 1, N'email_confirm_forgot_password', 79, 1, N'', N'', NULL, 4, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (47, N'change_general', N'adminGeneral', N'Email thay đổi trạng thái thanh toán', 1, N'email_order_payment_change_status', 79, 3, N'', N'', NULL, 4, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (48, N'list_page_static', N'adminStatic', N'Danh sách trang tĩnh', 1, N'', 73, 1, N'', N'', NULL, 1, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (49, N'change_static', N'adminStatic', N'Thêm trang tĩnh', 1, N'', 73, 2, N'', N'', NULL, 2, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (50, N'list_user', N'adminUser', N'Danh sách Admin', 1, N'Admin', 74, 1, N'', N'/pages/account/list', NULL, 1, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (51, N'change_user', N'adminUser', N'Thêm Admin', 1, N'Admin', 74, 2, N'', N'/api/account', NULL, 2, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (52, N'list_user_permission', N'adminUser', N'Phân quyền Admin', 0, N'Admin', 74, 3, N'', N'/api/account/listUserPermission', NULL, 4, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (53, N'list_order', N'adminOrder', N'Danh sách đơn hàng', 1, N'', 71, 1, N'', N'', NULL, 1, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (54, N'change_order', N'adminOrder', N'Xử lý đơn hàng', 0, N'', 71, 2, N'', N'', NULL, 4, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (55, N'change_catalog', N'adminCatalog', N'Thêm danh mục Collection', 0, N'CL', 69, 6, N'', N'', NULL, 2, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (56, N'change_general', N'adminGeneral', N'Giới thiệu ngắn', 1, N'aboutshort', 75, 2, N'', N'', NULL, 4, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (57, N'change_general', N'adminGeneral', N'Giới thiệu', 1, N'aboutcontent', 75, 1, N'', N'', NULL, 4, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (58, N'change_general', N'adminGeneral', N'Liên hệ', 1, N'contactdetail', 75, 3, N'', N'', NULL, 4, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (59, N'change_general', N'adminGeneral', N'Liên hệ ngắn', 1, N'contact', 75, 4, N'', N'', NULL, 4, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (60, N'footer', N'adminGeneral', N'Footer', 1, N'', 75, 8, N'', N'', NULL, 4, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (61, N'list_catalog', N'adminCatalog', N'Danh mục Collection', 0, N'CL', 69, 5, N'', N'', NULL, 1, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (62, N'list_contact', N'adminGeneral', N'Ý kiến khách hàng', 1, N'', 78, 1, N'', N'', NULL, 1, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (63, N'list_Rating', N'adminProduct', N'Bình luận và đánh giá', 0, N'', 69, 8, N'', N'', NULL, 1, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (69, N'', N'', N'Quản lý Sản phẩm ', 1, N'', 0, 1, N'ion-cube', N'', NULL, NULL, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (70, N'', N'', N'Mặt bằng ', 1, N'', 0, 2, N'ion-images', N'', NULL, NULL, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (71, N'', N'', N'Quản lý Đơn hàng ', 1, N'', 0, 3, N'ion-filing', N'', NULL, NULL, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (72, N'', N'', N' Tin tức & Bài viết1', 0, N'', 0, 4, N'ion-clipboard', N'1', NULL, NULL, CAST(N'2018-07-20 15:13:22.053' AS DateTime), NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (73, N'', N'', N'Trang nội dung khác', 1, N'', 0, 5, N'ion-easel', N'', NULL, NULL, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (74, N'', N'', N'Quản lý Thành viên ', 1, N'', 0, 6, N'ion-android-people', N'', NULL, NULL, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (75, N'', N'', N'Cấu hình Website ', 1, N'', 0, 7, N'ion-gear-a', N'', NULL, NULL, CAST(N'2018-07-20 09:07:31.197' AS DateTime), NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (76, N'', N'', N'Quảng cáo ', 1, N'', 0, 8, N'ion-link', N'', NULL, NULL, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (77, N'', N'', N'Shipping ', 1, N'', 0, 9, N'ion-android-car', N'', NULL, NULL, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (78, N'', N'', N'Ý kiến khách hàng ', 1, N'', 0, 10, N'ion-android-chat', N'', NULL, NULL, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (79, N'', N'', N'Email Template', 1, N'', 0, 11, N'ion-ios-email-outline', N'', NULL, NULL, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (80, N'list_log', N'adminUser', N'Log system', 1, N'', 74, 4, N'', N'', NULL, 1, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (81, N'comment_facebook', N'adminProduct', N'Bình luận Facebook', 0, N'', 69, 9, N'', N'', NULL, 1, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (82, N'list_user', N'adminUser', N'Danh sách Khách hàng', 1, N'User', 74, 4, N'', N'/pages/account/list', NULL, 1, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (83, N'change_user', N'adminUser', N'Thông tin khách hàng', 0, N'User', 74, 5, N'', N'', NULL, 4, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (84, N'change_general', N'adminGeneral', N'Cập nhật quảng cáo dưới trái', 0, N'advsbottomleft', 76, 16, N'', N'', NULL, 4, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (85, N'list_email', N'adminEmail', N'Email marketing', 1, N'Admin', 75, 8, N'', N'', NULL, 4, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (86, N'list_emailtemplate', N'adminEmail', N'Danh sách email template', 1, N'Admin', 79, 3, N'', N'', NULL, 4, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (87, N'change_emailtemplate', N'adminEmail', N'Thêm email template', 1, N'Admin', 79, 3, N'', N'', NULL, 4, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (88, N'change_general', N'adminGeneral', N'Hướng dẫn thanh toán', 1, N'payment_guide', 77, 2, N'', N'', NULL, 4, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (89, N'', N'', N'Quản lý Showroom', 1, N'', 0, 12, N'ion-android-pin', N'', NULL, NULL, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (90, N'change_showroom', N'adminShowroom', N'Thêm Showroom', 1, N'Admin', 89, 1, N'', N'', NULL, 2, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (91, N'list_showroom', N'adminShowroom', N'Danh sách Showroom', 1, N'Admin', 89, 1, N'', N'', NULL, 4, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (92, N'list_catalog', N'adminCatalog', N'Danh mục dịch vụ', 1, N'DV', 98, 1, N'', N'', NULL, 1, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (93, N'change_catalog', N'adminCatalog', N'Thêm danh mục dịch vụ', 1, N'DV', 98, 2, N'', N'', NULL, 2, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (94, N'list_post', N'adminPost', N'Dịch vụ', 1, N'DV', 98, 3, N'', N'', NULL, 1, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (95, N'change_post', N'adminPost', N'Thêm dịch vụ', 1, N'DV', 98, 4, N'', N'', NULL, 2, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (96, N'list_post', N'adminPost', N'Khuyến mãi', 1, N'KM', 99, 1, N'', N'', NULL, 1, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (97, N'change_post', N'adminPost', N'Thêm khuyến mãi', 1, N'KM', 99, 2, N'', N'', NULL, 2, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (98, N'', N'', N'Dịch vụ', 1, N'', 0, 13, N'ion-ios-pricetags', N'', NULL, NULL, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (99, N'', N'', N'Khuyến mãi', 1, N'', 0, 14, N'ion-ios-flower-outline', N'', NULL, NULL, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (100, N'list_link', N'adminLink', N'Tiện ích', 1, N'TE', 76, 11, N'', N'', NULL, 1, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (101, NULL, NULL, N'Xóa tài khoản', 0, N'Admin', 74, 6, N'', N'/api/account', N'', 3, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (102, NULL, NULL, N'Danh sách ActionOnPage', 0, N'Admin', 74, 7, N'', N'/api/AdminPageAction/listUserPageAction', N'', 1, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (103, NULL, NULL, N'Cập nhật Admin', 1, N'Admin', 74, 8, N'', N'/pages/account/edit', N'', 4, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (104, NULL, NULL, N'Chi tiết Admin', 0, N'Admin', 74, 9, N'', N'/pages/account/detail', N'', 1, CAST(N'2018-07-10 14:23:39.443' AS DateTime), NULL)
GO
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (105, NULL, NULL, N'Chi tiết ActionOnPage', 0, N'Admin', 74, 10, N'', N'/api/AdminPageAction', N'', 1, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (106, NULL, NULL, N'Tạo ActionOnPage', 1, N'Admin', 74, 11, N'', N'/api/AdminPageAction', N'', 2, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (107, NULL, NULL, N'Cập nhật ActionOnPage', 0, N'Admin', 74, 12, N'', N'/api/AdminPageAction', N'', 4, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (108, NULL, NULL, N'Xóa ActionOnPage', 0, N'Admin', 74, 13, N'', N'/pages/adminpage/list', N'', 3, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (109, NULL, NULL, N'Chi tiết Admin page', 0, N'Admin', 74, 14, N'', N'/api/AdminPage', N'', 1, CAST(N'2018-07-10 14:25:26.460' AS DateTime), NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (110, NULL, NULL, N'Tạo Admin page', 0, N'Admin', 74, 15, N'', N'/pages/adminpage/add', N'', 2, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (111, NULL, NULL, N'Cập nhật Admin page', 0, N'Admin', 74, 16, N'', N'/pages/adminpage/edit', N'', 4, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (112, NULL, NULL, N'Xóa Admin page', 0, N'Admin', 74, 17, N'', N'/api/AdminPage', N'', 3, NULL, NULL)
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (113, NULL, NULL, N'Danh sách Admin page', 1, N'Admin', 74, 18, N'', N'/pages/adminpage/list', N'', 1, CAST(N'2018-07-06 09:59:00.093' AS DateTime), CAST(N'2018-07-06 09:59:00.093' AS DateTime))
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [path], [breadcrumb], [TypeActionId], [ModifyDate], [CreateDate]) VALUES (115, NULL, NULL, N'Tạo Account', 0, N'Admin', 74, 19, N'', N'/pages/account/add', N'', 2, CAST(N'2018-07-06 09:59:00.093' AS DateTime), CAST(N'2018-07-06 09:59:00.093' AS DateTime))
SET IDENTITY_INSERT [dbo].[_UserPage] OFF
SET IDENTITY_INSERT [dbo].[_UserPageAction] ON 

INSERT [dbo].[_UserPageAction] ([id], [ActionName], [ActionDescription], [ActionStatus], [CreateDate], [ModifyDate], [ActionPage]) VALUES (1, N'view', N'Action view page', 1, CAST(N'2018-07-06 09:59:00.093' AS DateTime), CAST(N'2018-07-06 09:59:00.093' AS DateTime), N'0')
INSERT [dbo].[_UserPageAction] ([id], [ActionName], [ActionDescription], [ActionStatus], [CreateDate], [ModifyDate], [ActionPage]) VALUES (2, N'add', N'Action add new record', 1, CAST(N'2018-07-06 09:59:00.093' AS DateTime), CAST(N'2018-07-06 09:59:00.093' AS DateTime), N'0')
INSERT [dbo].[_UserPageAction] ([id], [ActionName], [ActionDescription], [ActionStatus], [CreateDate], [ModifyDate], [ActionPage]) VALUES (3, N'del', N'Action delete record', 1, CAST(N'2018-07-06 09:59:00.093' AS DateTime), CAST(N'2018-07-06 09:59:00.093' AS DateTime), N'0')
INSERT [dbo].[_UserPageAction] ([id], [ActionName], [ActionDescription], [ActionStatus], [CreateDate], [ModifyDate], [ActionPage]) VALUES (4, N'edit', N'Action update record', 1, CAST(N'2018-07-06 09:59:00.093' AS DateTime), CAST(N'2018-07-06 09:59:00.093' AS DateTime), N'0')
SET IDENTITY_INSERT [dbo].[_UserPageAction] OFF
SET IDENTITY_INSERT [dbo].[_UserPermission] ON 

INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (55, 1, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (56, 2, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (57, 3, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (58, 4, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (59, 5, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (60, 6, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (61, 7, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (62, 8, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (63, 9, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (64, 10, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (65, 11, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (66, 12, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (67, 13, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (68, 14, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (69, 15, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (70, 16, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (71, 17, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (72, 18, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (73, 19, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (74, 20, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (75, 21, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (76, 22, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (77, 23, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (78, 24, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (79, 25, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (80, 26, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (81, 27, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (82, 28, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (83, 29, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (84, 30, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (85, 31, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (86, 32, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (87, 33, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (88, 34, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (89, 35, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (90, 36, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (91, 37, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (92, 38, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (93, 39, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (94, 40, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (95, 41, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (96, 42, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (97, 43, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (98, 44, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (99, 45, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (100, 46, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (101, 47, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (102, 48, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (103, 49, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (104, 50, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (105, 51, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (106, 52, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (107, 53, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (108, 54, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (109, 55, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (111, 56, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (113, 57, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (115, 58, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (117, 59, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (119, 60, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (121, 61, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (123, 62, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (125, 63, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (127, 64, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (128, 65, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (129, 66, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (131, 68, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (137, 80, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (138, 81, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (139, 82, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (140, 83, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (141, 84, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (142, 85, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (143, 86, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (144, 87, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (145, 88, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (146, 89, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (147, 90, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (148, 91, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (160, 92, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (161, 93, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (162, 94, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (163, 95, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (164, 96, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (165, 97, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (166, 101, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (167, 102, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (168, 103, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (169, 104, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (170, 105, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (171, 106, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (172, 107, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (173, 108, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (174, 109, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (175, 110, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (176, 111, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (177, 112, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (178, 113, N'nguyenson1303@gmail.com', N'1,2,3,4')
INSERT [dbo].[_UserPermission] ([id], [page_id], [user], [TypeActionId]) VALUES (179, 115, N'nguyenson1303@gmail.com', N'1,2,3,4')
GO
SET IDENTITY_INSERT [dbo].[_UserPermission] OFF
SET IDENTITY_INSERT [dbo].[_WebInfo] ON 

INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (1, N'smtphost', N'smtp.gmail.com', CAST(N'2018-06-22 16:28:00' AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (2, N'smtpport', N'587', CAST(N'2018-06-22 16:28:00' AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (3, N'smtpuser', N'tempaids005@gmail.com', CAST(N'2018-06-22 16:28:00' AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (4, N'smtppass', N'Abc@123456', CAST(N'2018-06-22 16:28:00' AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (5, N'email', N'nguyenson1303@gmail.com', CAST(N'2018-06-22 16:28:00' AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (6, N'hotline', N'0967 962 562', CAST(N'2018-07-02 11:27:00' AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (9, N'banner', N'<img width="760" height="221" src="/UserFiles/Image/slide.jpg" alt="" />', CAST(N'2010-12-04 23:19:00' AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (10, N'newstop', N'TRANSMECO <a href="#">đạt giải thưởng &quot;SAO V&Agrave;NG ĐẤT VIỆT 2009&quot; </a>[11.11.2009]', CAST(N'2010-12-04 23:19:00' AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (11, N'video', N'qG58VXLH9aA', CAST(N'2010-12-04 23:19:00' AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (18, N'facebook', N'https://www.facebook.com/superoil.vn/', CAST(N'2018-07-02 11:27:00' AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (20, N'price_min', N'0', CAST(N'2015-05-22 14:54:00' AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (21, N'price_max', N'100', CAST(N'2015-05-22 14:54:00' AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (22, N'latitude', N'21.015906', CAST(N'2018-07-02 11:27:00' AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (23, N'longitude', N'105.812098', CAST(N'2018-07-02 11:27:00' AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (24, N'google_analysis', NULL, CAST(N'2018-07-02 11:27:00' AS SmallDateTime))
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
</div>', CAST(N'2018-07-02 11:27:00' AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (26, N'app_extend_two', NULL, CAST(N'2018-07-02 11:27:00' AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (27, N'tax', N'0.1', CAST(N'2018-07-02 11:27:00' AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (28, N'fees', N'0', CAST(N'2018-07-02 11:27:00' AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (29, N'min_fees', N'0', CAST(N'2018-07-02 11:27:00' AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (30, N'Skyper', NULL, CAST(N'2018-07-02 11:27:00' AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (31, N'imgmap', N'/images/icon/sc_original_2065_in-small-business-people.png', CAST(N'2018-07-02 11:27:00' AS SmallDateTime))
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
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (110, 46, N'/images/photogallery/2018/6/sc_small_636655349561670682_s14.jpg', N'/images/photogallery/2018/6/sc_full_636655349561670682_s14.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (112, 47, N'/images/photogallery/2018/6/sc_small_636655350546023161_s15.jpg', N'/images/photogallery/2018/6/sc_full_636655350546023161_s15.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (113, 50, N'/images/photogallery/2018/6/sc_small_636655353805190318_s14.jpg', N'/images/photogallery/2018/6/sc_full_636655353805190318_s14.jpg', NULL, NULL)
SET IDENTITY_INSERT [dbo].[ImageAlbums] OFF
SET IDENTITY_INSERT [dbo].[ImageProducts] ON 

INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (397, 56, N'/images/photoproduct/2018/6/sc_small_636656133176298428_s14.jpg', N'/images/photoproduct/2018/6/sc_full_636656133176298428_s14.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (398, 56, N'/images/photoproduct/2018/6/sc_small_636656133179290424_s15.jpg', N'/images/photoproduct/2018/6/sc_full_636656133179290424_s15.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (399, 184, N'/images/photoproduct/2018/6/sc_small_636656317073357592_banner-1.png', N'/images/photoproduct/2018/6/sc_full_636656317073357592_banner-1.png')
SET IDENTITY_INSERT [dbo].[ImageProducts] OFF
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
ALTER DATABASE [soncoi_HXcF1350_apibase] SET  READ_WRITE 
GO
