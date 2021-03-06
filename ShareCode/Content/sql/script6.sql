USE [master]
GO
/****** Object:  Database [DBShareCode]    Script Date: 02-Dec-20 1:09:06 PM ******/
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
/****** Object:  Table [dbo].[tblBlog]    Script Date: 02-Dec-20 1:09:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBlog](
	[BLog_ID] [int] IDENTITY(1,1) NOT NULL,
	[Blog_Title] [nvarchar](255) NULL,
	[Blog_Contents] [nvarchar](max) NULL,
	[BLog_Tag] [nvarchar](max) NULL,
	[BLog_User] [int] NULL,
	[Blog_View] [int] NULL,
	[BLog_DatePost] [datetime] NULL,
 CONSTRAINT [PK_tblBlog] PRIMARY KEY CLUSTERED 
(
	[BLog_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 02-Dec-20 1:09:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[Cat_ID] [int] IDENTITY(1,1) NOT NULL,
	[Cat_Name] [nvarchar](70) NULL,
	[Cat_Image] [nvarchar](max) NULL,
 CONSTRAINT [PK_tblCategory] PRIMARY KEY CLUSTERED 
(
	[Cat_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblComment]    Script Date: 02-Dec-20 1:09:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblComment](
	[Comment_ID] [int] IDENTITY(1,1) NOT NULL,
	[Comment_Contents] [nvarchar](max) NULL,
	[Comment_User] [int] NULL,
	[Comment_DatePost] [datetime] NULL,
	[Comment_Blog] [int] NULL,
	[Comment_Post] [int] NULL,
 CONSTRAINT [PK_tblComment] PRIMARY KEY CLUSTERED 
(
	[Comment_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblCustom]    Script Date: 02-Dec-20 1:09:06 PM ******/
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
/****** Object:  Table [dbo].[tblDownLoad]    Script Date: 02-Dec-20 1:09:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDownLoad](
	[DownLoad_ID] [int] IDENTITY(1,1) NOT NULL,
	[DownLoad_User] [int] NULL,
	[DownLoad_Post] [int] NULL,
	[DownLoad_DateDown] [datetime] NULL,
 CONSTRAINT [PK_tblDownLoad] PRIMARY KEY CLUSTERED 
(
	[DownLoad_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblFavorite]    Script Date: 02-Dec-20 1:09:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFavorite](
	[Favorite_ID] [int] IDENTITY(1,1) NOT NULL,
	[Favorite_User] [int] NULL,
	[Favorite_Post] [int] NULL,
	[Favorite_DateAdd] [datetime] NULL,
 CONSTRAINT [PK_tblFavorite] PRIMARY KEY CLUSTERED 
(
	[Favorite_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblGenres]    Script Date: 02-Dec-20 1:09:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblGenres](
	[Genres_ID] [int] IDENTITY(1,1) NOT NULL,
	[Genres_Name] [nvarchar](255) NULL,
 CONSTRAINT [PK_tblGenres] PRIMARY KEY CLUSTERED 
(
	[Genres_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblGroupCode]    Script Date: 02-Dec-20 1:09:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblGroupCode](
	[Group_ID] [int] IDENTITY(1,1) NOT NULL,
	[Group_Name] [nvarchar](255) NULL,
	[Group_Descriptions] [nvarchar](1024) NULL,
 CONSTRAINT [PK_GroupCode] PRIMARY KEY CLUSTERED 
(
	[Group_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblLanguage]    Script Date: 02-Dec-20 1:09:06 PM ******/
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
/****** Object:  Table [dbo].[tblOrder]    Script Date: 02-Dec-20 1:09:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrder](
	[Order_ID] [int] IDENTITY(1,1) NOT NULL,
	[Order_User] [int] NULL,
	[Order_TotalPrice] [int] NULL,
	[Order_Post] [int] NULL,
	[Order_DateAdd] [datetime] NULL,
 CONSTRAINT [PK_tblOrder] PRIMARY KEY CLUSTERED 
(
	[Order_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblPost]    Script Date: 02-Dec-20 1:09:06 PM ******/
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
	[Post_Favorite] [int] NULL,
	[Post_TutorialSetup] [nvarchar](max) NULL,
	[Post_Price] [money] NULL,
	[Post_Genres] [int] NULL,
	[Post_Group] [int] NULL,
	[Post_Active] [bit] NULL,
	[Post_Trash] [bit] NULL,
	[Post_Code] [nchar](10) NULL,
 CONSTRAINT [PK_tblPost] PRIMARY KEY CLUSTERED 
(
	[Post_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblPostLang]    Script Date: 02-Dec-20 1:09:06 PM ******/
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
/****** Object:  Table [dbo].[tblReport]    Script Date: 02-Dec-20 1:09:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblReport](
	[Report_ID] [int] IDENTITY(1,1) NOT NULL,
	[Report_Contents] [nvarchar](max) NULL,
	[Report_DateSend] [datetime] NULL,
	[Report_User] [int] NULL,
	[Report_Blog] [int] NULL,
	[Report_Post] [int] NULL,
 CONSTRAINT [PK_tblReport] PRIMARY KEY CLUSTERED 
(
	[Report_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblRepply]    Script Date: 02-Dec-20 1:09:06 PM ******/
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
/****** Object:  Table [dbo].[tblRole]    Script Date: 02-Dec-20 1:09:06 PM ******/
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
/****** Object:  Table [dbo].[tblUser]    Script Date: 02-Dec-20 1:09:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
	[User_Avata] [nvarchar](max) NULL,
	[User_VIP] [int] NULL,
	[User_Phone] [varchar](14) NULL,
	[User_Point] [int] NULL,
	[User_Coin] [int] NULL,
 CONSTRAINT [PK_tblUser] PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tblCategory] ON 

INSERT [dbo].[tblCategory] ([Cat_ID], [Cat_Name], [Cat_Image]) VALUES (1, N'MVC', N'topic1.png')
INSERT [dbo].[tblCategory] ([Cat_ID], [Cat_Name], [Cat_Image]) VALUES (2, N'Wordpress', N'topic2.png')
INSERT [dbo].[tblCategory] ([Cat_ID], [Cat_Name], [Cat_Image]) VALUES (3, N'Jumbla', N'topic3.png')
INSERT [dbo].[tblCategory] ([Cat_ID], [Cat_Name], [Cat_Image]) VALUES (4, N'Unity', N'topic4.png')
INSERT [dbo].[tblCategory] ([Cat_ID], [Cat_Name], [Cat_Image]) VALUES (5, N'IOS', N'topic5.png')
INSERT [dbo].[tblCategory] ([Cat_ID], [Cat_Name], [Cat_Image]) VALUES (6, N'Android', N'topic6.png')
INSERT [dbo].[tblCategory] ([Cat_ID], [Cat_Name], [Cat_Image]) VALUES (7, N'Laravel', N'topic7.png')
INSERT [dbo].[tblCategory] ([Cat_ID], [Cat_Name], [Cat_Image]) VALUES (8, N'WinForm', N'topic8.png')
SET IDENTITY_INSERT [dbo].[tblCategory] OFF
SET IDENTITY_INSERT [dbo].[tblComment] ON 

INSERT [dbo].[tblComment] ([Comment_ID], [Comment_Contents], [Comment_User], [Comment_DatePost], [Comment_Blog], [Comment_Post]) VALUES (1, N'binh luan ', 3, CAST(0x0000AC7C00000000 AS DateTime), NULL, 1)
INSERT [dbo].[tblComment] ([Comment_ID], [Comment_Contents], [Comment_User], [Comment_DatePost], [Comment_Blog], [Comment_Post]) VALUES (2, N'binh luan ', 4, CAST(0x0000AC7C00000000 AS DateTime), NULL, 2)
INSERT [dbo].[tblComment] ([Comment_ID], [Comment_Contents], [Comment_User], [Comment_DatePost], [Comment_Blog], [Comment_Post]) VALUES (3, N'binh luan ', 3, CAST(0x0000AC7C00000000 AS DateTime), NULL, 1)
INSERT [dbo].[tblComment] ([Comment_ID], [Comment_Contents], [Comment_User], [Comment_DatePost], [Comment_Blog], [Comment_Post]) VALUES (4, N'binh luan ', 4, CAST(0x0000AC7C00000000 AS DateTime), NULL, 2)
INSERT [dbo].[tblComment] ([Comment_ID], [Comment_Contents], [Comment_User], [Comment_DatePost], [Comment_Blog], [Comment_Post]) VALUES (5, N'binh luan ', 3, CAST(0x0000AC7C00000000 AS DateTime), NULL, 3)
INSERT [dbo].[tblComment] ([Comment_ID], [Comment_Contents], [Comment_User], [Comment_DatePost], [Comment_Blog], [Comment_Post]) VALUES (6, N'binh luan ', 4, CAST(0x0000AC7C00000000 AS DateTime), NULL, 4)
INSERT [dbo].[tblComment] ([Comment_ID], [Comment_Contents], [Comment_User], [Comment_DatePost], [Comment_Blog], [Comment_Post]) VALUES (7, N'binh luan ', 3, CAST(0x0000AC7C00000000 AS DateTime), NULL, 1)
INSERT [dbo].[tblComment] ([Comment_ID], [Comment_Contents], [Comment_User], [Comment_DatePost], [Comment_Blog], [Comment_Post]) VALUES (8, N'binh luan ', 4, CAST(0x0000AC7C00000000 AS DateTime), NULL, 1)
INSERT [dbo].[tblComment] ([Comment_ID], [Comment_Contents], [Comment_User], [Comment_DatePost], [Comment_Blog], [Comment_Post]) VALUES (9, N'binh luan ', 4, CAST(0x0000AC7C00000000 AS DateTime), NULL, 1)
INSERT [dbo].[tblComment] ([Comment_ID], [Comment_Contents], [Comment_User], [Comment_DatePost], [Comment_Blog], [Comment_Post]) VALUES (29, N'cc', 4, CAST(0x0000AC7C0127CD83 AS DateTime), NULL, 2)
INSERT [dbo].[tblComment] ([Comment_ID], [Comment_Contents], [Comment_User], [Comment_DatePost], [Comment_Blog], [Comment_Post]) VALUES (30, N'cc', 4, CAST(0x0000AC7C01281E7E AS DateTime), NULL, 1)
INSERT [dbo].[tblComment] ([Comment_ID], [Comment_Contents], [Comment_User], [Comment_DatePost], [Comment_Blog], [Comment_Post]) VALUES (31, N'cc', 4, CAST(0x0000AC7C01299F4A AS DateTime), NULL, 1)
INSERT [dbo].[tblComment] ([Comment_ID], [Comment_Contents], [Comment_User], [Comment_DatePost], [Comment_Blog], [Comment_Post]) VALUES (32, N'bl1', 4, CAST(0x0000AC7C01299F4A AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[tblComment] OFF
SET IDENTITY_INSERT [dbo].[tblCustom] ON 

INSERT [dbo].[tblCustom] ([Custom_ID], [ct_01], [ct_02], [ct_03], [ct_04], [ct_05], [ct_06], [ct_07], [ct_08], [ct_09], [ct_10], [ct_11], [ct_12], [ct_13], [ct_14], [ct_15], [ct_16], [ct_17], [ct_18], [ct_19], [ct_20], [ct_21], [ct_22], [ct_23], [ct_24], [ct_25], [ct_26]) VALUES (1, N'Online learning', N' platform ', N'Build skills with courses, certificates, and degrees online from world-class universities and companies 1', N'hahaa', N'hahaa', N'hahaa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tblCustom] OFF
SET IDENTITY_INSERT [dbo].[tblFavorite] ON 

INSERT [dbo].[tblFavorite] ([Favorite_ID], [Favorite_User], [Favorite_Post], [Favorite_DateAdd]) VALUES (6, 4, 3, CAST(0x0000AC7900F37BC8 AS DateTime))
INSERT [dbo].[tblFavorite] ([Favorite_ID], [Favorite_User], [Favorite_Post], [Favorite_DateAdd]) VALUES (8, 4, 5, CAST(0x0000AC7900F68704 AS DateTime))
INSERT [dbo].[tblFavorite] ([Favorite_ID], [Favorite_User], [Favorite_Post], [Favorite_DateAdd]) VALUES (27, 4, 1, CAST(0x0000AC7A00CA44A7 AS DateTime))
SET IDENTITY_INSERT [dbo].[tblFavorite] OFF
SET IDENTITY_INSERT [dbo].[tblGenres] ON 

INSERT [dbo].[tblGenres] ([Genres_ID], [Genres_Name]) VALUES (1, N'Website')
INSERT [dbo].[tblGenres] ([Genres_ID], [Genres_Name]) VALUES (2, N'Phần mềm - ứng dụng')
INSERT [dbo].[tblGenres] ([Genres_ID], [Genres_Name]) VALUES (3, N'IOT')
INSERT [dbo].[tblGenres] ([Genres_ID], [Genres_Name]) VALUES (4, N'Game')
SET IDENTITY_INSERT [dbo].[tblGenres] OFF
SET IDENTITY_INSERT [dbo].[tblGroupCode] ON 

INSERT [dbo].[tblGroupCode] ([Group_ID], [Group_Name], [Group_Descriptions]) VALUES (1, N'Code miễn phí', N'Code đăng bán giá 0 xu')
INSERT [dbo].[tblGroupCode] ([Group_ID], [Group_Name], [Group_Descriptions]) VALUES (2, N'Code Tham khảo', N'Code đăng bán gí từ 1 - 99 xu, có thể phát triễn thêm')
INSERT [dbo].[tblGroupCode] ([Group_ID], [Group_Name], [Group_Descriptions]) VALUES (3, N'Code chất lượng', N'Code trên 100 xu, là code có thể sử dụng ngay và luôn')
SET IDENTITY_INSERT [dbo].[tblGroupCode] OFF
SET IDENTITY_INSERT [dbo].[tblOrder] ON 

INSERT [dbo].[tblOrder] ([Order_ID], [Order_User], [Order_TotalPrice], [Order_Post], [Order_DateAdd]) VALUES (1, 4, 20, 2, CAST(0x0000AC7C00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[tblOrder] OFF
SET IDENTITY_INSERT [dbo].[tblPost] ON 

INSERT [dbo].[tblPost] ([Post_ID], [Post_Title], [Post_Avata], [Post_ViewMoreImage], [Post_Description], [Post_View], [Post_Vote], [Post_Rate], [Post_CountDownLoad], [Post_LinkDown], [Post_DateCreate], [Post_Cat], [Post_User], [Post_Favorite], [Post_TutorialSetup], [Post_Price], [Post_Genres], [Post_Group], [Post_Active], [Post_Trash], [Post_Code]) VALUES (1, N'Website thời trang đầy đủ chức năng tích hợp thanh toán Online MOMO, ATM, NGÂN LƯỢNG', N'website-thoi-trang-day-du-chuc-nang-tich-hop-thanh-toan-online-momo-atm-ngan-luong-105739.jpg', N'website-thoi-trang-day-du-chuc-nang-tich-hop-thanh-toan-online-momo-atm-ngan-luong-105739.jpg;website-thoi-trang-day-du-chuc-nang-tich-hop-thanh-toan-online-momo-atm-ngan-luong-105739.jpg;website-thoi-trang-day-du-chuc-nang-tich-hop-thanh-toan-online-momo-atm-ngan-luong-105739.jpg;website-thoi-trang-day-du-chuc-nang-tich-hop-thanh-toan-online-momo-atm-ngan-luong-105739.jpg;website-thoi-trang-day-du-chuc-nang-tich-hop-thanh-toan-online-momo-atm-ngan-luong-105739.jpg', N'website được viết bằng asp.net MVC đầy đủ chức năng có thích hợp thanh toán online, thuận tiên cho người bán. có thể dùng để làm website thự tế hoặc làm đồ án tốt nghiệp

Các chức năng chính:

- Tích hợpThanh toán MOMO

- Tích hợpThanh toán ngân lượng

- Tích hợp thanh toán ngân hàng ATM online

- Quản lý sản phẩm admin, thêm sửa xóa

- Tìm kiến sản phẩm

- Sản phẩm theo lại

- Theo dõi đơn hàng..

Còn rất nhiều chức năng khác.

Chi tiết xem ở link demo...


XEM THÊM ==> Hướng dẫn cài đặt chi tiết

 

HÌNH ẢNH DEMO

thích hợp thanh toán,website bán hàng thời trang,website bán quần áo,thanh toán ngân lượng,thanh toán MOMO

thích hợp thanh toán,website bán hàng thời trang,website bán quần áo,thanh toán ngân lượng,thanh toán MOMO

thích hợp thanh toán,website bán hàng thời trang,website bán quần áo,thanh toán ngân lượng,thanh toán MOMO

thích hợp thanh toán,website bán hàng thời trang,website bán quần áo,thanh toán ngân lượng,thanh toán MOMO

thích hợp thanh toán,website bán hàng thời trang,website bán quần áo,thanh toán ngân lượng,thanh toán MOMO

thích hợp thanh toán,website bán hàng thời trang,website bán quần áo,thanh toán ngân lượng,thanh toán MOMO

thích hợp thanh toán,website bán hàng thời trang,website bán quần áo,thanh toán ngân lượng,thanh toán MOMO

thích hợp thanh toán,website bán hàng thời trang,website bán quần áo,thanh toán ngân lượng,thanh toán MOMO

thích hợp thanh toán,website bán hàng thời trang,website bán quần áo,thanh toán ngân lượng,thanh toán MOMO

Nguồn: Sharecode.vn', 294, 200, 4.6, 125, N'https://sharecode.vn/source-code/website-thoi-tran-day-du-chuc-nang-tich-hop-thanh-toan-online-momo-atm-ngan-luong-27083.htm', CAST(0x0000AC7800000000 AS DateTime), 3, 3, 128, N'- Tải code về giải nén bỏ vào visual sutido.

- Sửa lại thông tin kết nối DB trong file web.config

- Chạy script Datatabase hặc file backup.', 200.0000, 1, 1, 1, 0, N'Code-001  ')
INSERT [dbo].[tblPost] ([Post_ID], [Post_Title], [Post_Avata], [Post_ViewMoreImage], [Post_Description], [Post_View], [Post_Vote], [Post_Rate], [Post_CountDownLoad], [Post_LinkDown], [Post_DateCreate], [Post_Cat], [Post_User], [Post_Favorite], [Post_TutorialSetup], [Post_Price], [Post_Genres], [Post_Group], [Post_Active], [Post_Trash], [Post_Code]) VALUES (2, N'Website thời trang đầy đủ chức năng tích hợp thanh toán Online MOMO, ATM, NGÂN LƯỢNG', N'website-thoi-trang-day-du-chuc-nang-tich-hop-thanh-toan-online-momo-atm-ngan-luong-105739.jpg', N'website-thoi-trang-day-du-chuc-nang-tich-hop-thanh-toan-online-momo-atm-ngan-luong-105739.jpg;website-thoi-trang-day-du-chuc-nang-tich-hop-thanh-toan-online-momo-atm-ngan-luong-105739.jpg;website-thoi-trang-day-du-chuc-nang-tich-hop-thanh-toan-online-momo-atm-ngan-luong-105739.jpg;website-thoi-trang-day-du-chuc-nang-tich-hop-thanh-toan-online-momo-atm-ngan-luong-105739.jpg;website-thoi-trang-day-du-chuc-nang-tich-hop-thanh-toan-online-momo-atm-ngan-luong-105739.jpg', N'website được viết bằng asp.net MVC đầy đủ chức năng có thích hợp thanh toán online, thuận tiên cho người bán. có thể dùng để làm website thự tế hoặc làm đồ án tốt nghiệp

Các chức năng chính:

- Tích hợpThanh toán MOMO

- Tích hợpThanh toán ngân lượng

- Tích hợp thanh toán ngân hàng ATM online

- Quản lý sản phẩm admin, thêm sửa xóa

- Tìm kiến sản phẩm

- Sản phẩm theo lại

- Theo dõi đơn hàng..

Còn rất nhiều chức năng khác.

Chi tiết xem ở link demo...


XEM THÊM ==> Hướng dẫn cài đặt chi tiết

 

HÌNH ẢNH DEMO

thích hợp thanh toán,website bán hàng thời trang,website bán quần áo,thanh toán ngân lượng,thanh toán MOMO

thích hợp thanh toán,website bán hàng thời trang,website bán quần áo,thanh toán ngân lượng,thanh toán MOMO

thích hợp thanh toán,website bán hàng thời trang,website bán quần áo,thanh toán ngân lượng,thanh toán MOMO

thích hợp thanh toán,website bán hàng thời trang,website bán quần áo,thanh toán ngân lượng,thanh toán MOMO

thích hợp thanh toán,website bán hàng thời trang,website bán quần áo,thanh toán ngân lượng,thanh toán MOMO

thích hợp thanh toán,website bán hàng thời trang,website bán quần áo,thanh toán ngân lượng,thanh toán MOMO

thích hợp thanh toán,website bán hàng thời trang,website bán quần áo,thanh toán ngân lượng,thanh toán MOMO

thích hợp thanh toán,website bán hàng thời trang,website bán quần áo,thanh toán ngân lượng,thanh toán MOMO

thích hợp thanh toán,website bán hàng thời trang,website bán quần áo,thanh toán ngân lượng,thanh toán MOMO

Nguồn: Sharecode.vn', 114, 112, 4.6, 123, N'https://sharecode.vn/source-code/website-thoi-tran-day-du-chuc-nang-tich-hop-thanh-toan-online-momo-atm-ngan-luong-27083.htm', CAST(0x0000AC7800000000 AS DateTime), 3, 3, 149, N'- Tải code về giải nén bỏ vào visual sutido.

- Sửa lại thông tin kết nối DB trong file web.config

- Chạy script Datatabase hặc file backup.', 200.0000, 2, 2, 1, 0, N'Code-002  ')
INSERT [dbo].[tblPost] ([Post_ID], [Post_Title], [Post_Avata], [Post_ViewMoreImage], [Post_Description], [Post_View], [Post_Vote], [Post_Rate], [Post_CountDownLoad], [Post_LinkDown], [Post_DateCreate], [Post_Cat], [Post_User], [Post_Favorite], [Post_TutorialSetup], [Post_Price], [Post_Genres], [Post_Group], [Post_Active], [Post_Trash], [Post_Code]) VALUES (3, N'Website thời trang đầy đủ chức năng tích hợp thanh toán Online MOMO, ATM, NGÂN LƯỢNG', N'website-thoi-trang-day-du-chuc-nang-tich-hop-thanh-toan-online-momo-atm-ngan-luong-105739.jpg', N'website-thoi-trang-day-du-chuc-nang-tich-hop-thanh-toan-online-momo-atm-ngan-luong-105739.jpg;website-thoi-trang-day-du-chuc-nang-tich-hop-thanh-toan-online-momo-atm-ngan-luong-105739.jpg;website-thoi-trang-day-du-chuc-nang-tich-hop-thanh-toan-online-momo-atm-ngan-luong-105739.jpg;website-thoi-trang-day-du-chuc-nang-tich-hop-thanh-toan-online-momo-atm-ngan-luong-105739.jpg;website-thoi-trang-day-du-chuc-nang-tich-hop-thanh-toan-online-momo-atm-ngan-luong-105739.jpg', N'website được viết bằng asp.net MVC đầy đủ chức năng có thích hợp thanh toán online, thuận tiên cho người bán. có thể dùng để làm website thự tế hoặc làm đồ án tốt nghiệp

Các chức năng chính:

- Tích hợpThanh toán MOMO

- Tích hợpThanh toán ngân lượng

- Tích hợp thanh toán ngân hàng ATM online

- Quản lý sản phẩm admin, thêm sửa xóa

- Tìm kiến sản phẩm

- Sản phẩm theo lại

- Theo dõi đơn hàng..

Còn rất nhiều chức năng khác.

Chi tiết xem ở link demo...


XEM THÊM ==> Hướng dẫn cài đặt chi tiết

 

HÌNH ẢNH DEMO

thích hợp thanh toán,website bán hàng thời trang,website bán quần áo,thanh toán ngân lượng,thanh toán MOMO

thích hợp thanh toán,website bán hàng thời trang,website bán quần áo,thanh toán ngân lượng,thanh toán MOMO

thích hợp thanh toán,website bán hàng thời trang,website bán quần áo,thanh toán ngân lượng,thanh toán MOMO

thích hợp thanh toán,website bán hàng thời trang,website bán quần áo,thanh toán ngân lượng,thanh toán MOMO

thích hợp thanh toán,website bán hàng thời trang,website bán quần áo,thanh toán ngân lượng,thanh toán MOMO

thích hợp thanh toán,website bán hàng thời trang,website bán quần áo,thanh toán ngân lượng,thanh toán MOMO

thích hợp thanh toán,website bán hàng thời trang,website bán quần áo,thanh toán ngân lượng,thanh toán MOMO

thích hợp thanh toán,website bán hàng thời trang,website bán quần áo,thanh toán ngân lượng,thanh toán MOMO

thích hợp thanh toán,website bán hàng thời trang,website bán quần áo,thanh toán ngân lượng,thanh toán MOMO

Nguồn: Sharecode.vn', 17, 11, 2.9, 456, N'https://sharecode.vn/source-code/website-thoi-tran-day-du-chuc-nang-tich-hop-thanh-toan-online-momo-atm-ngan-luong-27083.htm', CAST(0x0000AC7800000000 AS DateTime), 3, 3, 260, N'- Tải code về giải nén bỏ vào visual sutido.

- Sửa lại thông tin kết nối DB trong file web.config

- Chạy script Datatabase hặc file backup.', 125.0000, 1, 1, 1, 0, N'Code-003  ')
INSERT [dbo].[tblPost] ([Post_ID], [Post_Title], [Post_Avata], [Post_ViewMoreImage], [Post_Description], [Post_View], [Post_Vote], [Post_Rate], [Post_CountDownLoad], [Post_LinkDown], [Post_DateCreate], [Post_Cat], [Post_User], [Post_Favorite], [Post_TutorialSetup], [Post_Price], [Post_Genres], [Post_Group], [Post_Active], [Post_Trash], [Post_Code]) VALUES (4, N'Website thời trang đầy đủ chức năng tích hợp thanh toán Online MOMO, ATM, NGÂN LƯỢNG', N'website-thoi-trang-day-du-chuc-nang-tich-hop-thanh-toan-online-momo-atm-ngan-luong-105739.jpg', N'website-thoi-trang-day-du-chuc-nang-tich-hop-thanh-toan-online-momo-atm-ngan-luong-105739.jpg;website-thoi-trang-day-du-chuc-nang-tich-hop-thanh-toan-online-momo-atm-ngan-luong-105739.jpg;website-thoi-trang-day-du-chuc-nang-tich-hop-thanh-toan-online-momo-atm-ngan-luong-105739.jpg;website-thoi-trang-day-du-chuc-nang-tich-hop-thanh-toan-online-momo-atm-ngan-luong-105739.jpg;website-thoi-trang-day-du-chuc-nang-tich-hop-thanh-toan-online-momo-atm-ngan-luong-105739.jpg', N'website được viết bằng asp.net MVC đầy đủ chức năng có thích hợp thanh toán online, thuận tiên cho người bán. có thể dùng để làm website thự tế hoặc làm đồ án tốt nghiệp

Các chức năng chính:

- Tích hợpThanh toán MOMO

- Tích hợpThanh toán ngân lượng

- Tích hợp thanh toán ngân hàng ATM online

- Quản lý sản phẩm admin, thêm sửa xóa

- Tìm kiến sản phẩm

- Sản phẩm theo lại

- Theo dõi đơn hàng..

Còn rất nhiều chức năng khác.

Chi tiết xem ở link demo...


XEM THÊM ==> Hướng dẫn cài đặt chi tiết

 

HÌNH ẢNH DEMO

thích hợp thanh toán,website bán hàng thời trang,website bán quần áo,thanh toán ngân lượng,thanh toán MOMO

thích hợp thanh toán,website bán hàng thời trang,website bán quần áo,thanh toán ngân lượng,thanh toán MOMO

thích hợp thanh toán,website bán hàng thời trang,website bán quần áo,thanh toán ngân lượng,thanh toán MOMO

thích hợp thanh toán,website bán hàng thời trang,website bán quần áo,thanh toán ngân lượng,thanh toán MOMO

thích hợp thanh toán,website bán hàng thời trang,website bán quần áo,thanh toán ngân lượng,thanh toán MOMO

thích hợp thanh toán,website bán hàng thời trang,website bán quần áo,thanh toán ngân lượng,thanh toán MOMO

thích hợp thanh toán,website bán hàng thời trang,website bán quần áo,thanh toán ngân lượng,thanh toán MOMO

thích hợp thanh toán,website bán hàng thời trang,website bán quần áo,thanh toán ngân lượng,thanh toán MOMO

thích hợp thanh toán,website bán hàng thời trang,website bán quần áo,thanh toán ngân lượng,thanh toán MOMO

Nguồn: Sharecode.vn', 70, 455, 3.9, 789, N'https://sharecode.vn/source-code/website-thoi-tran-day-du-chuc-nang-tich-hop-thanh-toan-online-momo-atm-ngan-luong-27083.htm', CAST(0x0000AC7800000000 AS DateTime), 3, 3, 369, N'- Tải code về giải nén bỏ vào visual sutido.

- Sửa lại thông tin kết nối DB trong file web.config

- Chạy script Datatabase hặc file backup.', 167.0000, 2, 2, 1, 0, N'Code-004  ')
INSERT [dbo].[tblPost] ([Post_ID], [Post_Title], [Post_Avata], [Post_ViewMoreImage], [Post_Description], [Post_View], [Post_Vote], [Post_Rate], [Post_CountDownLoad], [Post_LinkDown], [Post_DateCreate], [Post_Cat], [Post_User], [Post_Favorite], [Post_TutorialSetup], [Post_Price], [Post_Genres], [Post_Group], [Post_Active], [Post_Trash], [Post_Code]) VALUES (5, N'Website thời trang đầy đủ chức năng tích hợp thanh toán Online MOMO, ATM, NGÂN LƯỢNG', N'website-thoi-trang-day-du-chuc-nang-tich-hop-thanh-toan-online-momo-atm-ngan-luong-105739.jpg', N'website-thoi-trang-day-du-chuc-nang-tich-hop-thanh-toan-online-momo-atm-ngan-luong-105739.jpg;website-thoi-trang-day-du-chuc-nang-tich-hop-thanh-toan-online-momo-atm-ngan-luong-105739.jpg;website-thoi-trang-day-du-chuc-nang-tich-hop-thanh-toan-online-momo-atm-ngan-luong-105739.jpg;website-thoi-trang-day-du-chuc-nang-tich-hop-thanh-toan-online-momo-atm-ngan-luong-105739.jpg;website-thoi-trang-day-du-chuc-nang-tich-hop-thanh-toan-online-momo-atm-ngan-luong-105739.jpg', N'website được viết bằng asp.net MVC đầy đủ chức năng có thích hợp thanh toán online, thuận tiên cho người bán. có thể dùng để làm website thự tế hoặc làm đồ án tốt nghiệp

Các chức năng chính:

- Tích hợpThanh toán MOMO

- Tích hợpThanh toán ngân lượng

- Tích hợp thanh toán ngân hàng ATM online

- Quản lý sản phẩm admin, thêm sửa xóa

- Tìm kiến sản phẩm

- Sản phẩm theo lại

- Theo dõi đơn hàng..

Còn rất nhiều chức năng khác.

Chi tiết xem ở link demo...


XEM THÊM ==> Hướng dẫn cài đặt chi tiết

 

HÌNH ẢNH DEMO

thích hợp thanh toán,website bán hàng thời trang,website bán quần áo,thanh toán ngân lượng,thanh toán MOMO

thích hợp thanh toán,website bán hàng thời trang,website bán quần áo,thanh toán ngân lượng,thanh toán MOMO

thích hợp thanh toán,website bán hàng thời trang,website bán quần áo,thanh toán ngân lượng,thanh toán MOMO

thích hợp thanh toán,website bán hàng thời trang,website bán quần áo,thanh toán ngân lượng,thanh toán MOMO

thích hợp thanh toán,website bán hàng thời trang,website bán quần áo,thanh toán ngân lượng,thanh toán MOMO

thích hợp thanh toán,website bán hàng thời trang,website bán quần áo,thanh toán ngân lượng,thanh toán MOMO

thích hợp thanh toán,website bán hàng thời trang,website bán quần áo,thanh toán ngân lượng,thanh toán MOMO

thích hợp thanh toán,website bán hàng thời trang,website bán quần áo,thanh toán ngân lượng,thanh toán MOMO

thích hợp thanh toán,website bán hàng thời trang,website bán quần áo,thanh toán ngân lượng,thanh toán MOMO

Nguồn: Sharecode.vn', 517, 1, 4.3, 147, N'https://sharecode.vn/source-code/website-thoi-tran-day-du-chuc-nang-tich-hop-thanh-toan-online-momo-atm-ngan-luong-27083.htm', CAST(0x0000AC7800000000 AS DateTime), 5, 3, 160, N'- Tải code về giải nén bỏ vào visual sutido.

- Sửa lại thông tin kết nối DB trong file web.config

- Chạy script Datatabase hặc file backup.', 349.0000, 3, 3, 1, 0, N'Code-005  ')
INSERT [dbo].[tblPost] ([Post_ID], [Post_Title], [Post_Avata], [Post_ViewMoreImage], [Post_Description], [Post_View], [Post_Vote], [Post_Rate], [Post_CountDownLoad], [Post_LinkDown], [Post_DateCreate], [Post_Cat], [Post_User], [Post_Favorite], [Post_TutorialSetup], [Post_Price], [Post_Genres], [Post_Group], [Post_Active], [Post_Trash], [Post_Code]) VALUES (6, N'Website thời trang đầy đủ chức năng tích hợp thanh toán Online MOMO, ATM, NGÂN LƯỢNG', N'website-thoi-trang-day-du-chuc-nang-tich-hop-thanh-toan-online-momo-atm-ngan-luong-105739.jpg', N'website-thoi-trang-day-du-chuc-nang-tich-hop-thanh-toan-online-momo-atm-ngan-luong-105739.jpg;website-thoi-trang-day-du-chuc-nang-tich-hop-thanh-toan-online-momo-atm-ngan-luong-105739.jpg;website-thoi-trang-day-du-chuc-nang-tich-hop-thanh-toan-online-momo-atm-ngan-luong-105739.jpg;website-thoi-trang-day-du-chuc-nang-tich-hop-thanh-toan-online-momo-atm-ngan-luong-105739.jpg;website-thoi-trang-day-du-chuc-nang-tich-hop-thanh-toan-online-momo-atm-ngan-luong-105739.jpg', N'website được viết bằng asp.net MVC đầy đủ chức năng có thích hợp thanh toán online, thuận tiên cho người bán. có thể dùng để làm website thự tế hoặc làm đồ án tốt nghiệp

Các chức năng chính:

- Tích hợpThanh toán MOMO

- Tích hợpThanh toán ngân lượng

- Tích hợp thanh toán ngân hàng ATM online

- Quản lý sản phẩm admin, thêm sửa xóa

- Tìm kiến sản phẩm

- Sản phẩm theo lại

- Theo dõi đơn hàng..

Còn rất nhiều chức năng khác.

Chi tiết xem ở link demo...


XEM THÊM ==> Hướng dẫn cài đặt chi tiết

 

HÌNH ẢNH DEMO

thích hợp thanh toán,website bán hàng thời trang,website bán quần áo,thanh toán ngân lượng,thanh toán MOMO

thích hợp thanh toán,website bán hàng thời trang,website bán quần áo,thanh toán ngân lượng,thanh toán MOMO

thích hợp thanh toán,website bán hàng thời trang,website bán quần áo,thanh toán ngân lượng,thanh toán MOMO

thích hợp thanh toán,website bán hàng thời trang,website bán quần áo,thanh toán ngân lượng,thanh toán MOMO

thích hợp thanh toán,website bán hàng thời trang,website bán quần áo,thanh toán ngân lượng,thanh toán MOMO

thích hợp thanh toán,website bán hàng thời trang,website bán quần áo,thanh toán ngân lượng,thanh toán MOMO

thích hợp thanh toán,website bán hàng thời trang,website bán quần áo,thanh toán ngân lượng,thanh toán MOMO

thích hợp thanh toán,website bán hàng thời trang,website bán quần áo,thanh toán ngân lượng,thanh toán MOMO

thích hợp thanh toán,website bán hàng thời trang,website bán quần áo,thanh toán ngân lượng,thanh toán MOMO

Nguồn: Sharecode.vn', 455, 44, 4, 258, N'https://sharecode.vn/source-code/website-thoi-tran-day-du-chuc-nang-tich-hop-thanh-toan-online-momo-atm-ngan-luong-27083.htm', CAST(0x0000AC7800000000 AS DateTime), 6, 3, 357, N'- Tải code về giải nén bỏ vào visual sutido.

- Sửa lại thông tin kết nối DB trong file web.config

- Chạy script Datatabase hặc file backup.', 258.0000, 3, 2, 0, 0, N'Code-006  ')
INSERT [dbo].[tblPost] ([Post_ID], [Post_Title], [Post_Avata], [Post_ViewMoreImage], [Post_Description], [Post_View], [Post_Vote], [Post_Rate], [Post_CountDownLoad], [Post_LinkDown], [Post_DateCreate], [Post_Cat], [Post_User], [Post_Favorite], [Post_TutorialSetup], [Post_Price], [Post_Genres], [Post_Group], [Post_Active], [Post_Trash], [Post_Code]) VALUES (7, N'hahahahah', N'874adbee-907a-41ec-99a8-2293bfe6e26b.jpg', N';57ce3ab3-a86a-44ff-bdf7-1eb7d451baf8.jpg;5aba6fd2-e647-41bb-9cbd-8de4aef86b81.jpg;84835e48-499d-4fbc-83a0-19f66d815ac5.jpg', N'<p>sdadadadasd</p>
', 0, 0, 0, 0, NULL, CAST(0x0000AC7A010D705C AS DateTime), 4, 4, 0, N'aaaaaaaaaaa', 200.0000, 4, 1, 0, 0, N'Code-010  ')
SET IDENTITY_INSERT [dbo].[tblPost] OFF
SET IDENTITY_INSERT [dbo].[tblRole] ON 

INSERT [dbo].[tblRole] ([Role_ID], [Role_Name]) VALUES (1, N'Admin')
INSERT [dbo].[tblRole] ([Role_ID], [Role_Name]) VALUES (2, N'Member')
SET IDENTITY_INSERT [dbo].[tblRole] OFF
SET IDENTITY_INSERT [dbo].[tblUser] ON 

INSERT [dbo].[tblUser] ([User_ID], [User_DisplayName], [User_Password], [User_DateLogin], [User_Active], [User_Trash], [User_Token], [User_Role], [User_Email], [User_Avata], [User_VIP], [User_Phone], [User_Point], [User_Coin]) VALUES (3, N'Thanh', N'Thanh1412@', CAST(0x0000AC77013FF298 AS DateTime), 1, 0, N'10096b4e-0df5-454a-9acf-96b14a174dac', 1, N'tanthanh141214@gmail.com', N'man-300x300.png', NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUser] ([User_ID], [User_DisplayName], [User_Password], [User_DateLogin], [User_Active], [User_Trash], [User_Token], [User_Role], [User_Email], [User_Avata], [User_VIP], [User_Phone], [User_Point], [User_Coin]) VALUES (4, N'Thanh1902@', N'Thanh190299@', CAST(0x0000AC7900EAEB17 AS DateTime), 1, 0, N'066c7ab7-6424-4ca4-880b-9fa7366a93b8', 1, N'hatanthanh190299@gmail.com', N'man-300x300.png', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tblUser] OFF
ALTER TABLE [dbo].[tblComment]  WITH CHECK ADD  CONSTRAINT [FK_tblComment_tblBlog] FOREIGN KEY([Comment_Blog])
REFERENCES [dbo].[tblBlog] ([BLog_ID])
GO
ALTER TABLE [dbo].[tblComment] CHECK CONSTRAINT [FK_tblComment_tblBlog]
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
ALTER TABLE [dbo].[tblDownLoad]  WITH CHECK ADD  CONSTRAINT [FK_tblDownLoad_tblPost] FOREIGN KEY([DownLoad_Post])
REFERENCES [dbo].[tblPost] ([Post_ID])
GO
ALTER TABLE [dbo].[tblDownLoad] CHECK CONSTRAINT [FK_tblDownLoad_tblPost]
GO
ALTER TABLE [dbo].[tblDownLoad]  WITH CHECK ADD  CONSTRAINT [FK_tblDownLoad_tblUser] FOREIGN KEY([DownLoad_User])
REFERENCES [dbo].[tblUser] ([User_ID])
GO
ALTER TABLE [dbo].[tblDownLoad] CHECK CONSTRAINT [FK_tblDownLoad_tblUser]
GO
ALTER TABLE [dbo].[tblFavorite]  WITH CHECK ADD  CONSTRAINT [FK_tblFavorite_tblPost] FOREIGN KEY([Favorite_Post])
REFERENCES [dbo].[tblPost] ([Post_ID])
GO
ALTER TABLE [dbo].[tblFavorite] CHECK CONSTRAINT [FK_tblFavorite_tblPost]
GO
ALTER TABLE [dbo].[tblFavorite]  WITH CHECK ADD  CONSTRAINT [FK_tblFavorite_tblUser] FOREIGN KEY([Favorite_User])
REFERENCES [dbo].[tblUser] ([User_ID])
GO
ALTER TABLE [dbo].[tblFavorite] CHECK CONSTRAINT [FK_tblFavorite_tblUser]
GO
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD  CONSTRAINT [FK_tblOrder_tblPost] FOREIGN KEY([Order_Post])
REFERENCES [dbo].[tblPost] ([Post_ID])
GO
ALTER TABLE [dbo].[tblOrder] CHECK CONSTRAINT [FK_tblOrder_tblPost]
GO
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD  CONSTRAINT [FK_tblOrder_tblUser] FOREIGN KEY([Order_User])
REFERENCES [dbo].[tblUser] ([User_ID])
GO
ALTER TABLE [dbo].[tblOrder] CHECK CONSTRAINT [FK_tblOrder_tblUser]
GO
ALTER TABLE [dbo].[tblPost]  WITH CHECK ADD  CONSTRAINT [FK_tblPost_GroupCode] FOREIGN KEY([Post_Group])
REFERENCES [dbo].[tblGroupCode] ([Group_ID])
GO
ALTER TABLE [dbo].[tblPost] CHECK CONSTRAINT [FK_tblPost_GroupCode]
GO
ALTER TABLE [dbo].[tblPost]  WITH CHECK ADD  CONSTRAINT [FK_tblPost_tblCategory] FOREIGN KEY([Post_Cat])
REFERENCES [dbo].[tblCategory] ([Cat_ID])
GO
ALTER TABLE [dbo].[tblPost] CHECK CONSTRAINT [FK_tblPost_tblCategory]
GO
ALTER TABLE [dbo].[tblPost]  WITH CHECK ADD  CONSTRAINT [FK_tblPost_tblGenres] FOREIGN KEY([Post_Genres])
REFERENCES [dbo].[tblGenres] ([Genres_ID])
GO
ALTER TABLE [dbo].[tblPost] CHECK CONSTRAINT [FK_tblPost_tblGenres]
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
ALTER TABLE [dbo].[tblReport]  WITH CHECK ADD  CONSTRAINT [FK_tblReport_tblBlog] FOREIGN KEY([Report_Blog])
REFERENCES [dbo].[tblBlog] ([BLog_ID])
GO
ALTER TABLE [dbo].[tblReport] CHECK CONSTRAINT [FK_tblReport_tblBlog]
GO
ALTER TABLE [dbo].[tblReport]  WITH CHECK ADD  CONSTRAINT [FK_tblReport_tblPost] FOREIGN KEY([Report_Post])
REFERENCES [dbo].[tblPost] ([Post_ID])
GO
ALTER TABLE [dbo].[tblReport] CHECK CONSTRAINT [FK_tblReport_tblPost]
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
