USE [master]
GO
/****** Object:  Database [NodeDatabase]    Script Date: 10/9/2018 3:35:40 PM ******/
CREATE DATABASE [NodeDatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NodeDatabase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\NodeDatabase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'NodeDatabase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\NodeDatabase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [NodeDatabase] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NodeDatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NodeDatabase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NodeDatabase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NodeDatabase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NodeDatabase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NodeDatabase] SET ARITHABORT OFF 
GO
ALTER DATABASE [NodeDatabase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NodeDatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NodeDatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NodeDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NodeDatabase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NodeDatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NodeDatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NodeDatabase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NodeDatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NodeDatabase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [NodeDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NodeDatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NodeDatabase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NodeDatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NodeDatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NodeDatabase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NodeDatabase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NodeDatabase] SET RECOVERY FULL 
GO
ALTER DATABASE [NodeDatabase] SET  MULTI_USER 
GO
ALTER DATABASE [NodeDatabase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NodeDatabase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NodeDatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NodeDatabase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [NodeDatabase] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'NodeDatabase', N'ON'
GO
ALTER DATABASE [NodeDatabase] SET QUERY_STORE = OFF
GO
USE [NodeDatabase]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [NodeDatabase]
GO
/****** Object:  User [NodeUser]    Script Date: 10/9/2018 3:35:41 PM ******/
CREATE USER [NodeUser] FOR LOGIN [NodeUser] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [NodeUser]
GO
/****** Object:  Table [dbo].[Aircraft]    Script Date: 10/9/2018 3:35:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aircraft](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Model] [varchar](50) NOT NULL,
	[SerialNumber] [varchar](10) NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Aircraft] ON 

INSERT [dbo].[Aircraft] ([ID], [Model], [SerialNumber]) VALUES (1, N'A', N'123')
INSERT [dbo].[Aircraft] ([ID], [Model], [SerialNumber]) VALUES (2, N'A', N'456')
INSERT [dbo].[Aircraft] ([ID], [Model], [SerialNumber]) VALUES (4, N'B', N'555')
INSERT [dbo].[Aircraft] ([ID], [Model], [SerialNumber]) VALUES (5, N'A', N'444')
INSERT [dbo].[Aircraft] ([ID], [Model], [SerialNumber]) VALUES (6, N'C', N'888')
INSERT [dbo].[Aircraft] ([ID], [Model], [SerialNumber]) VALUES (7, N'B', N'554')
SET IDENTITY_INSERT [dbo].[Aircraft] OFF
/****** Object:  StoredProcedure [dbo].[spReadAircraftByID]    Script Date: 10/9/2018 3:35:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spReadAircraftByID]
	@ID int
AS
BEGIN
	SELECT TOP 1 *
	FROM Aircraft
	WHERE ID = @ID;
END
GO
/****** Object:  StoredProcedure [dbo].[spReadAircrafts]    Script Date: 10/9/2018 3:35:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spReadAircrafts]
AS
BEGIN
	SELECT * 
	FROM Aircraft 
END
GO
USE [master]
GO
ALTER DATABASE [NodeDatabase] SET  READ_WRITE 
GO
