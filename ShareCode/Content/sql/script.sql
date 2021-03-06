USE [master]
GO
/****** Object:  Database [DBShareCode]    Script Date: 18-Nov-20 10:01:11 PM ******/
CREATE DATABASE [DBShareCode]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBShareCode', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\DBShareCode.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DBShareCode_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\DBShareCode_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DBShareCode] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBShareCode].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBShareCode] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBShareCode] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBShareCode] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBShareCode] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBShareCode] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBShareCode] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBShareCode] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [DBShareCode] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBShareCode] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBShareCode] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBShareCode] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBShareCode] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBShareCode] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBShareCode] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBShareCode] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBShareCode] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DBShareCode] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBShareCode] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBShareCode] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBShareCode] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBShareCode] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBShareCode] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBShareCode] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBShareCode] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DBShareCode] SET  MULTI_USER 
GO
ALTER DATABASE [DBShareCode] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBShareCode] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBShareCode] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBShareCode] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [DBShareCode]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 18-Nov-20 10:01:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[Cat_ID] [int] IDENTITY(1,1) NOT NULL,
	[Cat_Name] [nvarchar](70) NULL,
 CONSTRAINT [PK_tblCategory] PRIMARY KEY CLUSTERED 
(
	[Cat_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblComment]    Script Date: 18-Nov-20 10:01:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblComment](
	[Comment_ID] [int] IDENTITY(1,1) NOT NULL,
	[Comment_Contents] [nvarchar](max) NULL,
	[Comment_User] [int] NULL,
	[Comment_Post] [int] NULL,
	[Comment_DatePost] [datetime] NULL,
 CONSTRAINT [PK_tblComment] PRIMARY KEY CLUSTERED 
(
	[Comment_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblCustom]    Script Date: 18-Nov-20 10:01:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCustom](
	[Custom_ID] [int] IDENTITY(1,1) NOT NULL,
	[ct_01] [nvarchar](255) NULL,
	[ct_02] [nvarchar](255) NULL,
	[ct_03] [nvarchar](255) NULL,
	[ct_04] [nvarchar](255) NULL,
	[ct_05] [nvarchar](255) NULL,
	[ct_06] [nvarchar](255) NULL,
	[ct_07] [nvarchar](255) NULL,
	[ct_08] [nvarchar](255) NULL,
	[ct_09] [nvarchar](255) NULL,
	[ct_10] [nvarchar](255) NULL,
	[ct_11] [nvarchar](255) NULL,
	[ct_12] [nvarchar](255) NULL,
	[ct_13] [nvarchar](255) NULL,
	[ct_14] [nvarchar](255) NULL,
	[ct_15] [nvarchar](255) NULL,
	[ct_16] [nvarchar](255) NULL,
	[ct_17] [nvarchar](255) NULL,
	[ct_18] [nvarchar](255) NULL,
	[ct_19] [nvarchar](255) NULL,
	[ct_20] [nvarchar](255) NULL,
	[ct_21] [nvarchar](255) NULL,
	[ct_22] [nvarchar](255) NULL,
	[ct_23] [nvarchar](255) NULL,
	[ct_24] [nvarchar](255) NULL,
	[ct_25] [nvarchar](255) NULL,
	[ct_26] [nvarchar](255) NULL,
 CONSTRAINT [PK_tblCustom] PRIMARY KEY CLUSTERED 
(
	[Custom_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblLanguage]    Script Date: 18-Nov-20 10:01:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLanguage](
	[Lang_ID] [int] IDENTITY(1,1) NOT NULL,
	[Lang_Name] [nvarchar](70) NULL,
	[Lang_Logo] [nvarchar](max) NULL,
 CONSTRAINT [PK_tblLang] PRIMARY KEY CLUSTERED 
(
	[Lang_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblPost]    Script Date: 18-Nov-20 10:01:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPost](
	[Post_ID] [int] IDENTITY(1,1) NOT NULL,
	[Post_Title] [nvarchar](255) NULL,
	[Post_Avata] [nvarchar](max) NULL,
	[Post_ViewMoreImage] [nvarchar](max) NULL,
	[Post_Description] [nvarchar](max) NULL,
	[Post_View] [int] NULL,
	[Post_Vote] [int] NULL,
	[Post_Rate] [float] NULL,
	[Post_CountDownLoad] [int] NULL,
	[Post_LinkDown] [nvarchar](max) NULL,
	[Post_DateCreate] [datetime] NULL,
	[Post_Cat] [int] NULL,
	[Post_User] [int] NULL,
 CONSTRAINT [PK_tblPost] PRIMARY KEY CLUSTERED 
(
	[Post_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblPostLang]    Script Date: 18-Nov-20 10:01:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPostLang](
	[Post_ID] [int] NOT NULL,
	[Lang_ID] [int] NOT NULL,
 CONSTRAINT [PK_tblPostLang] PRIMARY KEY CLUSTERED 
(
	[Post_ID] ASC,
	[Lang_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblRepply]    Script Date: 18-Nov-20 10:01:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRepply](
	[Rep_ID] [int] IDENTITY(1,1) NOT NULL,
	[Rep_Contents] [nvarchar](max) NULL,
	[Rep_User] [int] NULL,
	[Rep_Comment] [int] NULL,
	[Rep_DatePost] [datetime] NULL,
 CONSTRAINT [PK_tblRepply] PRIMARY KEY CLUSTERED 
(
	[Rep_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblRole]    Script Date: 18-Nov-20 10:01:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRole](
	[Role_ID] [int] IDENTITY(1,1) NOT NULL,
	[Role_Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblRole] PRIMARY KEY CLUSTERED 
(
	[Role_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 18-Nov-20 10:01:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[User_ID] [int] IDENTITY(1,1) NOT NULL,
	[User_DisplayName] [nvarchar](50) NULL,
	[User_Password] [nvarchar](50) NULL,
	[User_DateLogin] [datetime] NULL,
	[User_Active] [bit] NULL,
	[User_Trash] [bit] NULL,
	[User_Token] [nvarchar](max) NULL,
	[User_Role] [int] NULL,
	[User_Email] [nvarchar](150) NULL,
 CONSTRAINT [PK_tblUser] PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [dbo].[tblComment]  WITH CHECK ADD  CONSTRAINT [FK_tblComment_tblPost] FOREIGN KEY([Comment_Post])
REFERENCES [dbo].[tblPost] ([Post_ID])
GO
ALTER TABLE [dbo].[tblComment] CHECK CONSTRAINT [FK_tblComment_tblPost]
GO
ALTER TABLE [dbo].[tblComment]  WITH CHECK ADD  CONSTRAINT [FK_tblComment_tblUser] FOREIGN KEY([Comment_User])
REFERENCES [dbo].[tblUser] ([User_ID])
GO
ALTER TABLE [dbo].[tblComment] CHECK CONSTRAINT [FK_tblComment_tblUser]
GO
ALTER TABLE [dbo].[tblPost]  WITH CHECK ADD  CONSTRAINT [FK_tblPost_tblCategory] FOREIGN KEY([Post_Cat])
REFERENCES [dbo].[tblCategory] ([Cat_ID])
GO
ALTER TABLE [dbo].[tblPost] CHECK CONSTRAINT [FK_tblPost_tblCategory]
GO
ALTER TABLE [dbo].[tblPost]  WITH CHECK ADD  CONSTRAINT [FK_tblPost_tblUser] FOREIGN KEY([Post_User])
REFERENCES [dbo].[tblUser] ([User_ID])
GO
ALTER TABLE [dbo].[tblPost] CHECK CONSTRAINT [FK_tblPost_tblUser]
GO
ALTER TABLE [dbo].[tblPostLang]  WITH CHECK ADD  CONSTRAINT [FK_tblPostLang_tblLanguage] FOREIGN KEY([Lang_ID])
REFERENCES [dbo].[tblLanguage] ([Lang_ID])
GO
ALTER TABLE [dbo].[tblPostLang] CHECK CONSTRAINT [FK_tblPostLang_tblLanguage]
GO
ALTER TABLE [dbo].[tblPostLang]  WITH CHECK ADD  CONSTRAINT [FK_tblPostLang_tblPost] FOREIGN KEY([Post_ID])
REFERENCES [dbo].[tblPost] ([Post_ID])
GO
ALTER TABLE [dbo].[tblPostLang] CHECK CONSTRAINT [FK_tblPostLang_tblPost]
GO
ALTER TABLE [dbo].[tblRepply]  WITH CHECK ADD  CONSTRAINT [FK_tblRepply_tblComment] FOREIGN KEY([Rep_Comment])
REFERENCES [dbo].[tblComment] ([Comment_ID])
GO
ALTER TABLE [dbo].[tblRepply] CHECK CONSTRAINT [FK_tblRepply_tblComment]
GO
ALTER TABLE [dbo].[tblRepply]  WITH CHECK ADD  CONSTRAINT [FK_tblRepply_tblUser] FOREIGN KEY([Rep_User])
REFERENCES [dbo].[tblUser] ([User_ID])
GO
ALTER TABLE [dbo].[tblRepply] CHECK CONSTRAINT [FK_tblRepply_tblUser]
GO
ALTER TABLE [dbo].[tblUser]  WITH CHECK ADD  CONSTRAINT [FK_tblUser_tblRole] FOREIGN KEY([User_Role])
REFERENCES [dbo].[tblRole] ([Role_ID])
GO
ALTER TABLE [dbo].[tblUser] CHECK CONSTRAINT [FK_tblUser_tblRole]
GO
USE [master]
GO
ALTER DATABASE [DBShareCode] SET  READ_WRITE 
GO
