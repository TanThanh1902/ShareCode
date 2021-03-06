USE [master]
GO
/****** Object:  Database [DBShareCode]    Script Date: 17-Dec-20 5:56:56 PM ******/
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
/****** Object:  Table [dbo].[tblBlog]    Script Date: 17-Dec-20 5:56:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBlog](
	[BLog_ID] [int] IDENTITY(1,1) NOT NULL,
	[Blog_Title] [nvarchar](255) NULL,
	[Blog_Contents] [nvarchar](max) NULL,
	[BLog_Tag] [nvarchar](max) NULL,
	[Blog_View] [int] NULL,
	[BLog_DatePost] [datetime] NULL,
	[Blog_Image] [nvarchar](max) NULL,
	[Blog_Trash] [bit] NULL,
 CONSTRAINT [PK_tblBlog] PRIMARY KEY CLUSTERED 
(
	[BLog_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 17-Dec-20 5:56:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[Cat_ID] [int] IDENTITY(1,1) NOT NULL,
	[Cat_Name] [nvarchar](70) NULL,
	[Cat_Image] [nvarchar](max) NULL,
	[Cat_Trash] [bit] NULL,
 CONSTRAINT [PK_tblCategory] PRIMARY KEY CLUSTERED 
(
	[Cat_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblComment]    Script Date: 17-Dec-20 5:56:56 PM ******/
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
	[Comment_Trash] [bit] NULL,
 CONSTRAINT [PK_tblComment] PRIMARY KEY CLUSTERED 
(
	[Comment_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblCustom]    Script Date: 17-Dec-20 5:56:56 PM ******/
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
/****** Object:  Table [dbo].[tblDownLoad]    Script Date: 17-Dec-20 5:56:56 PM ******/
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
/****** Object:  Table [dbo].[tblFavorite]    Script Date: 17-Dec-20 5:56:56 PM ******/
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
/****** Object:  Table [dbo].[tblGenres]    Script Date: 17-Dec-20 5:56:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblGenres](
	[Genres_ID] [int] IDENTITY(1,1) NOT NULL,
	[Genres_Name] [nvarchar](255) NULL,
	[Genres_Trash] [bit] NULL,
 CONSTRAINT [PK_tblGenres] PRIMARY KEY CLUSTERED 
(
	[Genres_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblGroupCode]    Script Date: 17-Dec-20 5:56:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblGroupCode](
	[Group_ID] [int] IDENTITY(1,1) NOT NULL,
	[Group_Name] [nvarchar](255) NULL,
	[Group_Descriptions] [nvarchar](1024) NULL,
	[Group_Trash] [bit] NULL,
 CONSTRAINT [PK_GroupCode] PRIMARY KEY CLUSTERED 
(
	[Group_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblLanguage]    Script Date: 17-Dec-20 5:56:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLanguage](
	[Lang_ID] [int] IDENTITY(1,1) NOT NULL,
	[Lang_Name] [nvarchar](70) NULL,
	[Lang_Logo] [nvarchar](max) NULL,
	[Lang_Trash] [bit] NULL,
 CONSTRAINT [PK_tblLang] PRIMARY KEY CLUSTERED 
(
	[Lang_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblOrder]    Script Date: 17-Dec-20 5:56:56 PM ******/
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
/****** Object:  Table [dbo].[tblPost]    Script Date: 17-Dec-20 5:56:56 PM ******/
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
/****** Object:  Table [dbo].[tblPostLang]    Script Date: 17-Dec-20 5:56:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPostLang](
	[Post_ID] [int] NOT NULL,
	[Lang_ID] [int] NOT NULL,
	[PostLang_DateAdd] [datetime] NULL,
 CONSTRAINT [PK_tblPostLang] PRIMARY KEY CLUSTERED 
(
	[Post_ID] ASC,
	[Lang_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblRate]    Script Date: 17-Dec-20 5:56:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRate](
	[Rate_ID] [int] IDENTITY(1,1) NOT NULL,
	[Rate_Star] [int] NULL,
	[Rate_User] [int] NULL,
	[Rate_Post] [int] NULL,
	[Rate_DateVote] [datetime] NULL,
 CONSTRAINT [PK_tblRate] PRIMARY KEY CLUSTERED 
(
	[Rate_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblReport]    Script Date: 17-Dec-20 5:56:56 PM ******/
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
/****** Object:  Table [dbo].[tblRepply]    Script Date: 17-Dec-20 5:56:56 PM ******/
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
	[Rep_Trash] [bit] NULL,
 CONSTRAINT [PK_tblRepply] PRIMARY KEY CLUSTERED 
(
	[Rep_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblRole]    Script Date: 17-Dec-20 5:56:56 PM ******/
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
/****** Object:  Table [dbo].[tblTag]    Script Date: 17-Dec-20 5:56:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTag](
	[Tag_ID] [int] IDENTITY(1,1) NOT NULL,
	[Tag_Title] [nvarchar](max) NULL,
	[Tag_CountSearch] [int] NULL,
	[Tag_DateAdd] [datetime] NULL,
 CONSTRAINT [PK_tblTag] PRIMARY KEY CLUSTERED 
(
	[Tag_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 17-Dec-20 5:56:56 PM ******/
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
SET IDENTITY_INSERT [dbo].[tblBlog] ON 

INSERT [dbo].[tblBlog] ([BLog_ID], [Blog_Title], [Blog_Contents], [BLog_Tag], [Blog_View], [BLog_DatePost], [Blog_Image], [Blog_Trash]) VALUES (1, N'Sự kiện thiên văn gần 400 năm trước sắp tái diễn vào 21/12', N' lần giao nhau giữa hai hành tinh này khá hiếm, xảy ra 20 năm một lần. Lần trùng tụ này đặc biệt hiếm gặp vì khoảng cách giữa chúng rất gần nhau”, Patrick Hartigan, Giáo sư vật lý và thiên văn học Đại học Rice, Mỹ giải thích.

Sau gan 400 nam,  su kien thien van nay sap xay ra anh 1
Người dân Việt Nam có thể quan sát hiện tượng thiên văn đại trùng tụ hiếm có trong khoảng thời gian 17h30-19h30. Ảnh: Earthsky.
Vào đêm 21/12, với góc lệch chỉ 0,1 độ, khoảng cách hai hành tinh bằng 1/5 đường kính Mặt Trăng, khá giống hành tinh kép. Hành tinh kép là hệ hai hành tinh gắn bó do tác động lực hấp dẫn xoay quanh trọng tâm chung. Trong dải Ngân Hà, giới nghiên cứu chỉ mới tìm thấy một hành tinh kép lùn là Diêm Vương tinh và Mặt Trăng Charon.

Khi nhìn từ Trái Đất, Mộc tinh thường là vì sao sáng nhất trên bầu trời đêm. Thổ tinh có độ sáng kém Mộc tinh 12 lần và hai hành tinh này rất hiếm khi “gặp nhau”. Lần gần đây nhất xảy ra đại trùng tụ là vào năm 1623, gần 400 năm trước. Phải 60 năm sau, đại trùng tụ mới xuất hiện lần nữa. Xa hơn là vào năm 2400.

Theo In The Sky, ngày 21/12, tại Việt Nam, người dân có thể quan sát hiện tượng thiên văn hiếm có này trong khoảng thời gian 17h30-19h30. Để quan sát rõ nhất, bạn nên dõi mắt về hướng tây bầu trời, với điều kiện thời tiết quang đãng.

Vì góc biểu kiến khá gần Mặt Trời, thời gian quan sát hiện tượng này tương đối ngắn. Nếu nhìn bằng mắt thường, người quan sát chỉ thấy một chấm sáng duy nhất trên bầu trời vì khoảng cách khá gần của hai hành tinh. Trên thực tế, Mộc tinh và Thổ tinh vẫn cách nhau hàng trăm triệu km.

Nếu quan sát bằng kính thiên văn với độ phóng đại lớn, có thể thấy được vành đai Thổ tinh, thậm chí cả mặt trăng của hai thiên thể này. Đây là lần quan sát hiếm có của những người yêu thiên văn, vì khoảng cách Mộc tinh và Thổ tinh trong lần đại trùng tụ này khá nhỏ, không bị ảnh hưởng bởi ánh sáng Mặt Trời.', N'thien thach;', 1231, CAST(0x0000AC8D00000000 AS DateTime), N'jupiter_saturn_and_the_milky_way_3d_illustration_PBB6HM3_1.jpg.optimal.jpg', 0)
INSERT [dbo].[tblBlog] ([BLog_ID], [Blog_Title], [Blog_Contents], [BLog_Tag], [Blog_View], [BLog_DatePost], [Blog_Image], [Blog_Trash]) VALUES (2, N'Sự kiện thiên văn gần 400 năm trước sắp tái diễn vào 21/12', N' lần giao nhau giữa hai hành tinh này khá hiếm, xảy ra 20 năm một lần. Lần trùng tụ này đặc biệt hiếm gặp vì khoảng cách giữa chúng rất gần nhau”, Patrick Hartigan, Giáo sư vật lý và thiên văn học Đại học Rice, Mỹ giải thích.

Sau gan 400 nam,  su kien thien van nay sap xay ra anh 1
Người dân Việt Nam có thể quan sát hiện tượng thiên văn đại trùng tụ hiếm có trong khoảng thời gian 17h30-19h30. Ảnh: Earthsky.
Vào đêm 21/12, với góc lệch chỉ 0,1 độ, khoảng cách hai hành tinh bằng 1/5 đường kính Mặt Trăng, khá giống hành tinh kép. Hành tinh kép là hệ hai hành tinh gắn bó do tác động lực hấp dẫn xoay quanh trọng tâm chung. Trong dải Ngân Hà, giới nghiên cứu chỉ mới tìm thấy một hành tinh kép lùn là Diêm Vương tinh và Mặt Trăng Charon.

Khi nhìn từ Trái Đất, Mộc tinh thường là vì sao sáng nhất trên bầu trời đêm. Thổ tinh có độ sáng kém Mộc tinh 12 lần và hai hành tinh này rất hiếm khi “gặp nhau”. Lần gần đây nhất xảy ra đại trùng tụ là vào năm 1623, gần 400 năm trước. Phải 60 năm sau, đại trùng tụ mới xuất hiện lần nữa. Xa hơn là vào năm 2400.

Theo In The Sky, ngày 21/12, tại Việt Nam, người dân có thể quan sát hiện tượng thiên văn hiếm có này trong khoảng thời gian 17h30-19h30. Để quan sát rõ nhất, bạn nên dõi mắt về hướng tây bầu trời, với điều kiện thời tiết quang đãng.

Vì góc biểu kiến khá gần Mặt Trời, thời gian quan sát hiện tượng này tương đối ngắn. Nếu nhìn bằng mắt thường, người quan sát chỉ thấy một chấm sáng duy nhất trên bầu trời vì khoảng cách khá gần của hai hành tinh. Trên thực tế, Mộc tinh và Thổ tinh vẫn cách nhau hàng trăm triệu km.

Nếu quan sát bằng kính thiên văn với độ phóng đại lớn, có thể thấy được vành đai Thổ tinh, thậm chí cả mặt trăng của hai thiên thể này. Đây là lần quan sát hiếm có của những người yêu thiên văn, vì khoảng cách Mộc tinh và Thổ tinh trong lần đại trùng tụ này khá nhỏ, không bị ảnh hưởng bởi ánh sáng Mặt Trời.', N'dia boc thien tinh;', 33, CAST(0x0000AC8D00000000 AS DateTime), N'jupiter_saturn_and_the_milky_way_3d_illustration_PBB6HM3_1.jpg.optimal.jpg', 0)
INSERT [dbo].[tblBlog] ([BLog_ID], [Blog_Title], [Blog_Contents], [BLog_Tag], [Blog_View], [BLog_DatePost], [Blog_Image], [Blog_Trash]) VALUES (3, N'Sự kiện thiên văn gần 400 năm trước sắp tái diễn vào 21/12', N' lần giao nhau giữa hai hành tinh này khá hiếm, xảy ra 20 năm một lần. Lần trùng tụ này đặc biệt hiếm gặp vì khoảng cách giữa chúng rất gần nhau”, Patrick Hartigan, Giáo sư vật lý và thiên văn học Đại học Rice, Mỹ giải thích.

Sau gan 400 nam,  su kien thien van nay sap xay ra anh 1
Người dân Việt Nam có thể quan sát hiện tượng thiên văn đại trùng tụ hiếm có trong khoảng thời gian 17h30-19h30. Ảnh: Earthsky.
Vào đêm 21/12, với góc lệch chỉ 0,1 độ, khoảng cách hai hành tinh bằng 1/5 đường kính Mặt Trăng, khá giống hành tinh kép. Hành tinh kép là hệ hai hành tinh gắn bó do tác động lực hấp dẫn xoay quanh trọng tâm chung. Trong dải Ngân Hà, giới nghiên cứu chỉ mới tìm thấy một hành tinh kép lùn là Diêm Vương tinh và Mặt Trăng Charon.

Khi nhìn từ Trái Đất, Mộc tinh thường là vì sao sáng nhất trên bầu trời đêm. Thổ tinh có độ sáng kém Mộc tinh 12 lần và hai hành tinh này rất hiếm khi “gặp nhau”. Lần gần đây nhất xảy ra đại trùng tụ là vào năm 1623, gần 400 năm trước. Phải 60 năm sau, đại trùng tụ mới xuất hiện lần nữa. Xa hơn là vào năm 2400.

Theo In The Sky, ngày 21/12, tại Việt Nam, người dân có thể quan sát hiện tượng thiên văn hiếm có này trong khoảng thời gian 17h30-19h30. Để quan sát rõ nhất, bạn nên dõi mắt về hướng tây bầu trời, với điều kiện thời tiết quang đãng.

Vì góc biểu kiến khá gần Mặt Trời, thời gian quan sát hiện tượng này tương đối ngắn. Nếu nhìn bằng mắt thường, người quan sát chỉ thấy một chấm sáng duy nhất trên bầu trời vì khoảng cách khá gần của hai hành tinh. Trên thực tế, Mộc tinh và Thổ tinh vẫn cách nhau hàng trăm triệu km.

Nếu quan sát bằng kính thiên văn với độ phóng đại lớn, có thể thấy được vành đai Thổ tinh, thậm chí cả mặt trăng của hai thiên thể này. Đây là lần quan sát hiếm có của những người yêu thiên văn, vì khoảng cách Mộc tinh và Thổ tinh trong lần đại trùng tụ này khá nhỏ, không bị ảnh hưởng bởi ánh sáng Mặt Trời.', N'tan the', 111, CAST(0x0000AC8D00000000 AS DateTime), N'jupiter_saturn_and_the_milky_way_3d_illustration_PBB6HM3_1.jpg.optimal.jpg', 0)
INSERT [dbo].[tblBlog] ([BLog_ID], [Blog_Title], [Blog_Contents], [BLog_Tag], [Blog_View], [BLog_DatePost], [Blog_Image], [Blog_Trash]) VALUES (4, N'Sự kiện thiên văn gần 400 năm trước sắp tái diễn vào 21/12', N' lần giao nhau giữa hai hành tinh này khá hiếm, xảy ra 20 năm một lần. Lần trùng tụ này đặc biệt hiếm gặp vì khoảng cách giữa chúng rất gần nhau”, Patrick Hartigan, Giáo sư vật lý và thiên văn học Đại học Rice, Mỹ giải thích.

Sau gan 400 nam,  su kien thien van nay sap xay ra anh 1
Người dân Việt Nam có thể quan sát hiện tượng thiên văn đại trùng tụ hiếm có trong khoảng thời gian 17h30-19h30. Ảnh: Earthsky.
Vào đêm 21/12, với góc lệch chỉ 0,1 độ, khoảng cách hai hành tinh bằng 1/5 đường kính Mặt Trăng, khá giống hành tinh kép. Hành tinh kép là hệ hai hành tinh gắn bó do tác động lực hấp dẫn xoay quanh trọng tâm chung. Trong dải Ngân Hà, giới nghiên cứu chỉ mới tìm thấy một hành tinh kép lùn là Diêm Vương tinh và Mặt Trăng Charon.

Khi nhìn từ Trái Đất, Mộc tinh thường là vì sao sáng nhất trên bầu trời đêm. Thổ tinh có độ sáng kém Mộc tinh 12 lần và hai hành tinh này rất hiếm khi “gặp nhau”. Lần gần đây nhất xảy ra đại trùng tụ là vào năm 1623, gần 400 năm trước. Phải 60 năm sau, đại trùng tụ mới xuất hiện lần nữa. Xa hơn là vào năm 2400.

Theo In The Sky, ngày 21/12, tại Việt Nam, người dân có thể quan sát hiện tượng thiên văn hiếm có này trong khoảng thời gian 17h30-19h30. Để quan sát rõ nhất, bạn nên dõi mắt về hướng tây bầu trời, với điều kiện thời tiết quang đãng.

Vì góc biểu kiến khá gần Mặt Trời, thời gian quan sát hiện tượng này tương đối ngắn. Nếu nhìn bằng mắt thường, người quan sát chỉ thấy một chấm sáng duy nhất trên bầu trời vì khoảng cách khá gần của hai hành tinh. Trên thực tế, Mộc tinh và Thổ tinh vẫn cách nhau hàng trăm triệu km.

Nếu quan sát bằng kính thiên văn với độ phóng đại lớn, có thể thấy được vành đai Thổ tinh, thậm chí cả mặt trăng của hai thiên thể này. Đây là lần quan sát hiếm có của những người yêu thiên văn, vì khoảng cách Mộc tinh và Thổ tinh trong lần đại trùng tụ này khá nhỏ, không bị ảnh hưởng bởi ánh sáng Mặt Trời.', N'narutooooo;sasukeeee', 500, CAST(0x0000AC8D00000000 AS DateTime), N'jupiter_saturn_and_the_milky_way_3d_illustration_PBB6HM3_1.jpg.optimal.jpg', 0)
INSERT [dbo].[tblBlog] ([BLog_ID], [Blog_Title], [Blog_Contents], [BLog_Tag], [Blog_View], [BLog_DatePost], [Blog_Image], [Blog_Trash]) VALUES (5, N'Sự kiện thiên văn gần 400 năm trước sắp tái diễn vào 21/12', N' lần giao nhau giữa hai hành tinh này khá hiếm, xảy ra 20 năm một lần. Lần trùng tụ này đặc biệt hiếm gặp vì khoảng cách giữa chúng rất gần nhau”, Patrick Hartigan, Giáo sư vật lý và thiên văn học Đại học Rice, Mỹ giải thích.

Sau gan 400 nam,  su kien thien van nay sap xay ra anh 1
Người dân Việt Nam có thể quan sát hiện tượng thiên văn đại trùng tụ hiếm có trong khoảng thời gian 17h30-19h30. Ảnh: Earthsky.
Vào đêm 21/12, với góc lệch chỉ 0,1 độ, khoảng cách hai hành tinh bằng 1/5 đường kính Mặt Trăng, khá giống hành tinh kép. Hành tinh kép là hệ hai hành tinh gắn bó do tác động lực hấp dẫn xoay quanh trọng tâm chung. Trong dải Ngân Hà, giới nghiên cứu chỉ mới tìm thấy một hành tinh kép lùn là Diêm Vương tinh và Mặt Trăng Charon.

Khi nhìn từ Trái Đất, Mộc tinh thường là vì sao sáng nhất trên bầu trời đêm. Thổ tinh có độ sáng kém Mộc tinh 12 lần và hai hành tinh này rất hiếm khi “gặp nhau”. Lần gần đây nhất xảy ra đại trùng tụ là vào năm 1623, gần 400 năm trước. Phải 60 năm sau, đại trùng tụ mới xuất hiện lần nữa. Xa hơn là vào năm 2400.

Theo In The Sky, ngày 21/12, tại Việt Nam, người dân có thể quan sát hiện tượng thiên văn hiếm có này trong khoảng thời gian 17h30-19h30. Để quan sát rõ nhất, bạn nên dõi mắt về hướng tây bầu trời, với điều kiện thời tiết quang đãng.

Vì góc biểu kiến khá gần Mặt Trời, thời gian quan sát hiện tượng này tương đối ngắn. Nếu nhìn bằng mắt thường, người quan sát chỉ thấy một chấm sáng duy nhất trên bầu trời vì khoảng cách khá gần của hai hành tinh. Trên thực tế, Mộc tinh và Thổ tinh vẫn cách nhau hàng trăm triệu km.

Nếu quan sát bằng kính thiên văn với độ phóng đại lớn, có thể thấy được vành đai Thổ tinh, thậm chí cả mặt trăng của hai thiên thể này. Đây là lần quan sát hiếm có của những người yêu thiên văn, vì khoảng cách Mộc tinh và Thổ tinh trong lần đại trùng tụ này khá nhỏ, không bị ảnh hưởng bởi ánh sáng Mặt Trời.', N'dia boc thien tinh;', 57, CAST(0x0000AC8D00000000 AS DateTime), N'jupiter_saturn_and_the_milky_way_3d_illustration_PBB6HM3_1.jpg.optimal.jpg', 0)
INSERT [dbo].[tblBlog] ([BLog_ID], [Blog_Title], [Blog_Contents], [BLog_Tag], [Blog_View], [BLog_DatePost], [Blog_Image], [Blog_Trash]) VALUES (6, N'Sự kiện thiên văn gần 400 năm trước sắp tái diễn vào 21/12', N' lần giao nhau giữa hai hành tinh này khá hiếm, xảy ra 20 năm một lần. Lần trùng tụ này đặc biệt hiếm gặp vì khoảng cách giữa chúng rất gần nhau”, Patrick Hartigan, Giáo sư vật lý và thiên văn học Đại học Rice, Mỹ giải thích.

Sau gan 400 nam,  su kien thien van nay sap xay ra anh 1
Người dân Việt Nam có thể quan sát hiện tượng thiên văn đại trùng tụ hiếm có trong khoảng thời gian 17h30-19h30. Ảnh: Earthsky.
Vào đêm 21/12, với góc lệch chỉ 0,1 độ, khoảng cách hai hành tinh bằng 1/5 đường kính Mặt Trăng, khá giống hành tinh kép. Hành tinh kép là hệ hai hành tinh gắn bó do tác động lực hấp dẫn xoay quanh trọng tâm chung. Trong dải Ngân Hà, giới nghiên cứu chỉ mới tìm thấy một hành tinh kép lùn là Diêm Vương tinh và Mặt Trăng Charon.

Khi nhìn từ Trái Đất, Mộc tinh thường là vì sao sáng nhất trên bầu trời đêm. Thổ tinh có độ sáng kém Mộc tinh 12 lần và hai hành tinh này rất hiếm khi “gặp nhau”. Lần gần đây nhất xảy ra đại trùng tụ là vào năm 1623, gần 400 năm trước. Phải 60 năm sau, đại trùng tụ mới xuất hiện lần nữa. Xa hơn là vào năm 2400.

Theo In The Sky, ngày 21/12, tại Việt Nam, người dân có thể quan sát hiện tượng thiên văn hiếm có này trong khoảng thời gian 17h30-19h30. Để quan sát rõ nhất, bạn nên dõi mắt về hướng tây bầu trời, với điều kiện thời tiết quang đãng.

Vì góc biểu kiến khá gần Mặt Trời, thời gian quan sát hiện tượng này tương đối ngắn. Nếu nhìn bằng mắt thường, người quan sát chỉ thấy một chấm sáng duy nhất trên bầu trời vì khoảng cách khá gần của hai hành tinh. Trên thực tế, Mộc tinh và Thổ tinh vẫn cách nhau hàng trăm triệu km.

Nếu quan sát bằng kính thiên văn với độ phóng đại lớn, có thể thấy được vành đai Thổ tinh, thậm chí cả mặt trăng của hai thiên thể này. Đây là lần quan sát hiếm có của những người yêu thiên văn, vì khoảng cách Mộc tinh và Thổ tinh trong lần đại trùng tụ này khá nhỏ, không bị ảnh hưởng bởi ánh sáng Mặt Trời.', N'dia boc thien tinh;', 785, CAST(0x0000AC8D00000000 AS DateTime), N'jupiter_saturn_and_the_milky_way_3d_illustration_PBB6HM3_1.jpg.optimal.jpg', 0)
INSERT [dbo].[tblBlog] ([BLog_ID], [Blog_Title], [Blog_Contents], [BLog_Tag], [Blog_View], [BLog_DatePost], [Blog_Image], [Blog_Trash]) VALUES (7, N'Sự kiện thiên văn gần 400 năm trước sắp tái diễn vào 21/12', N' lần giao nhau giữa hai hành tinh này khá hiếm, xảy ra 20 năm một lần. Lần trùng tụ này đặc biệt hiếm gặp vì khoảng cách giữa chúng rất gần nhau”, Patrick Hartigan, Giáo sư vật lý và thiên văn học Đại học Rice, Mỹ giải thích.

Sau gan 400 nam,  su kien thien van nay sap xay ra anh 1
Người dân Việt Nam có thể quan sát hiện tượng thiên văn đại trùng tụ hiếm có trong khoảng thời gian 17h30-19h30. Ảnh: Earthsky.
Vào đêm 21/12, với góc lệch chỉ 0,1 độ, khoảng cách hai hành tinh bằng 1/5 đường kính Mặt Trăng, khá giống hành tinh kép. Hành tinh kép là hệ hai hành tinh gắn bó do tác động lực hấp dẫn xoay quanh trọng tâm chung. Trong dải Ngân Hà, giới nghiên cứu chỉ mới tìm thấy một hành tinh kép lùn là Diêm Vương tinh và Mặt Trăng Charon.

Khi nhìn từ Trái Đất, Mộc tinh thường là vì sao sáng nhất trên bầu trời đêm. Thổ tinh có độ sáng kém Mộc tinh 12 lần và hai hành tinh này rất hiếm khi “gặp nhau”. Lần gần đây nhất xảy ra đại trùng tụ là vào năm 1623, gần 400 năm trước. Phải 60 năm sau, đại trùng tụ mới xuất hiện lần nữa. Xa hơn là vào năm 2400.

Theo In The Sky, ngày 21/12, tại Việt Nam, người dân có thể quan sát hiện tượng thiên văn hiếm có này trong khoảng thời gian 17h30-19h30. Để quan sát rõ nhất, bạn nên dõi mắt về hướng tây bầu trời, với điều kiện thời tiết quang đãng.

Vì góc biểu kiến khá gần Mặt Trời, thời gian quan sát hiện tượng này tương đối ngắn. Nếu nhìn bằng mắt thường, người quan sát chỉ thấy một chấm sáng duy nhất trên bầu trời vì khoảng cách khá gần của hai hành tinh. Trên thực tế, Mộc tinh và Thổ tinh vẫn cách nhau hàng trăm triệu km.

Nếu quan sát bằng kính thiên văn với độ phóng đại lớn, có thể thấy được vành đai Thổ tinh, thậm chí cả mặt trăng của hai thiên thể này. Đây là lần quan sát hiếm có của những người yêu thiên văn, vì khoảng cách Mộc tinh và Thổ tinh trong lần đại trùng tụ này khá nhỏ, không bị ảnh hưởng bởi ánh sáng Mặt Trời.', N'dia boc thien tinh;', 77, CAST(0x0000AC8D00000000 AS DateTime), N'jupiter_saturn_and_the_milky_way_3d_illustration_PBB6HM3_1.jpg.optimal.jpg', 0)
INSERT [dbo].[tblBlog] ([BLog_ID], [Blog_Title], [Blog_Contents], [BLog_Tag], [Blog_View], [BLog_DatePost], [Blog_Image], [Blog_Trash]) VALUES (8, N'Sự kiện thiên văn gần 400 năm trước sắp tái diễn vào 21/12', N' lần giao nhau giữa hai hành tinh này khá hiếm, xảy ra 20 năm một lần. Lần trùng tụ này đặc biệt hiếm gặp vì khoảng cách giữa chúng rất gần nhau”, Patrick Hartigan, Giáo sư vật lý và thiên văn học Đại học Rice, Mỹ giải thích.

Sau gan 400 nam,  su kien thien van nay sap xay ra anh 1
Người dân Việt Nam có thể quan sát hiện tượng thiên văn đại trùng tụ hiếm có trong khoảng thời gian 17h30-19h30. Ảnh: Earthsky.
Vào đêm 21/12, với góc lệch chỉ 0,1 độ, khoảng cách hai hành tinh bằng 1/5 đường kính Mặt Trăng, khá giống hành tinh kép. Hành tinh kép là hệ hai hành tinh gắn bó do tác động lực hấp dẫn xoay quanh trọng tâm chung. Trong dải Ngân Hà, giới nghiên cứu chỉ mới tìm thấy một hành tinh kép lùn là Diêm Vương tinh và Mặt Trăng Charon.

Khi nhìn từ Trái Đất, Mộc tinh thường là vì sao sáng nhất trên bầu trời đêm. Thổ tinh có độ sáng kém Mộc tinh 12 lần và hai hành tinh này rất hiếm khi “gặp nhau”. Lần gần đây nhất xảy ra đại trùng tụ là vào năm 1623, gần 400 năm trước. Phải 60 năm sau, đại trùng tụ mới xuất hiện lần nữa. Xa hơn là vào năm 2400.

Theo In The Sky, ngày 21/12, tại Việt Nam, người dân có thể quan sát hiện tượng thiên văn hiếm có này trong khoảng thời gian 17h30-19h30. Để quan sát rõ nhất, bạn nên dõi mắt về hướng tây bầu trời, với điều kiện thời tiết quang đãng.

Vì góc biểu kiến khá gần Mặt Trời, thời gian quan sát hiện tượng này tương đối ngắn. Nếu nhìn bằng mắt thường, người quan sát chỉ thấy một chấm sáng duy nhất trên bầu trời vì khoảng cách khá gần của hai hành tinh. Trên thực tế, Mộc tinh và Thổ tinh vẫn cách nhau hàng trăm triệu km.

Nếu quan sát bằng kính thiên văn với độ phóng đại lớn, có thể thấy được vành đai Thổ tinh, thậm chí cả mặt trăng của hai thiên thể này. Đây là lần quan sát hiếm có của những người yêu thiên văn, vì khoảng cách Mộc tinh và Thổ tinh trong lần đại trùng tụ này khá nhỏ, không bị ảnh hưởng bởi ánh sáng Mặt Trời.', N'dia boc thien tinh;', 55, CAST(0x0000AC8D00000000 AS DateTime), N'jupiter_saturn_and_the_milky_way_3d_illustration_PBB6HM3_1.jpg.optimal.jpg', 0)
INSERT [dbo].[tblBlog] ([BLog_ID], [Blog_Title], [Blog_Contents], [BLog_Tag], [Blog_View], [BLog_DatePost], [Blog_Image], [Blog_Trash]) VALUES (9, N'Sự kiện thiên văn gần 400 năm trước sắp tái diễn vào 21/12', N' lần giao nhau giữa hai hành tinh này khá hiếm, xảy ra 20 năm một lần. Lần trùng tụ này đặc biệt hiếm gặp vì khoảng cách giữa chúng rất gần nhau”, Patrick Hartigan, Giáo sư vật lý và thiên văn học Đại học Rice, Mỹ giải thích.

Sau gan 400 nam,  su kien thien van nay sap xay ra anh 1
Người dân Việt Nam có thể quan sát hiện tượng thiên văn đại trùng tụ hiếm có trong khoảng thời gian 17h30-19h30. Ảnh: Earthsky.
Vào đêm 21/12, với góc lệch chỉ 0,1 độ, khoảng cách hai hành tinh bằng 1/5 đường kính Mặt Trăng, khá giống hành tinh kép. Hành tinh kép là hệ hai hành tinh gắn bó do tác động lực hấp dẫn xoay quanh trọng tâm chung. Trong dải Ngân Hà, giới nghiên cứu chỉ mới tìm thấy một hành tinh kép lùn là Diêm Vương tinh và Mặt Trăng Charon.

Khi nhìn từ Trái Đất, Mộc tinh thường là vì sao sáng nhất trên bầu trời đêm. Thổ tinh có độ sáng kém Mộc tinh 12 lần và hai hành tinh này rất hiếm khi “gặp nhau”. Lần gần đây nhất xảy ra đại trùng tụ là vào năm 1623, gần 400 năm trước. Phải 60 năm sau, đại trùng tụ mới xuất hiện lần nữa. Xa hơn là vào năm 2400.

Theo In The Sky, ngày 21/12, tại Việt Nam, người dân có thể quan sát hiện tượng thiên văn hiếm có này trong khoảng thời gian 17h30-19h30. Để quan sát rõ nhất, bạn nên dõi mắt về hướng tây bầu trời, với điều kiện thời tiết quang đãng.

Vì góc biểu kiến khá gần Mặt Trời, thời gian quan sát hiện tượng này tương đối ngắn. Nếu nhìn bằng mắt thường, người quan sát chỉ thấy một chấm sáng duy nhất trên bầu trời vì khoảng cách khá gần của hai hành tinh. Trên thực tế, Mộc tinh và Thổ tinh vẫn cách nhau hàng trăm triệu km.

Nếu quan sát bằng kính thiên văn với độ phóng đại lớn, có thể thấy được vành đai Thổ tinh, thậm chí cả mặt trăng của hai thiên thể này. Đây là lần quan sát hiếm có của những người yêu thiên văn, vì khoảng cách Mộc tinh và Thổ tinh trong lần đại trùng tụ này khá nhỏ, không bị ảnh hưởng bởi ánh sáng Mặt Trời.', N'dia boc thien tinh;', 5, CAST(0x0000AC8D00000000 AS DateTime), N'jupiter_saturn_and_the_milky_way_3d_illustration_PBB6HM3_1.jpg.optimal.jpg', 0)
INSERT [dbo].[tblBlog] ([BLog_ID], [Blog_Title], [Blog_Contents], [BLog_Tag], [Blog_View], [BLog_DatePost], [Blog_Image], [Blog_Trash]) VALUES (10, N'Sự kiện thiên văn gần 400 năm trước sắp tái diễn vào 21/12', N' lần giao nhau giữa hai hành tinh này khá hiếm, xảy ra 20 năm một lần. Lần trùng tụ này đặc biệt hiếm gặp vì khoảng cách giữa chúng rất gần nhau”, Patrick Hartigan, Giáo sư vật lý và thiên văn học Đại học Rice, Mỹ giải thích.

Sau gan 400 nam,  su kien thien van nay sap xay ra anh 1
Người dân Việt Nam có thể quan sát hiện tượng thiên văn đại trùng tụ hiếm có trong khoảng thời gian 17h30-19h30. Ảnh: Earthsky.
Vào đêm 21/12, với góc lệch chỉ 0,1 độ, khoảng cách hai hành tinh bằng 1/5 đường kính Mặt Trăng, khá giống hành tinh kép. Hành tinh kép là hệ hai hành tinh gắn bó do tác động lực hấp dẫn xoay quanh trọng tâm chung. Trong dải Ngân Hà, giới nghiên cứu chỉ mới tìm thấy một hành tinh kép lùn là Diêm Vương tinh và Mặt Trăng Charon.

Khi nhìn từ Trái Đất, Mộc tinh thường là vì sao sáng nhất trên bầu trời đêm. Thổ tinh có độ sáng kém Mộc tinh 12 lần và hai hành tinh này rất hiếm khi “gặp nhau”. Lần gần đây nhất xảy ra đại trùng tụ là vào năm 1623, gần 400 năm trước. Phải 60 năm sau, đại trùng tụ mới xuất hiện lần nữa. Xa hơn là vào năm 2400.

Theo In The Sky, ngày 21/12, tại Việt Nam, người dân có thể quan sát hiện tượng thiên văn hiếm có này trong khoảng thời gian 17h30-19h30. Để quan sát rõ nhất, bạn nên dõi mắt về hướng tây bầu trời, với điều kiện thời tiết quang đãng.

Vì góc biểu kiến khá gần Mặt Trời, thời gian quan sát hiện tượng này tương đối ngắn. Nếu nhìn bằng mắt thường, người quan sát chỉ thấy một chấm sáng duy nhất trên bầu trời vì khoảng cách khá gần của hai hành tinh. Trên thực tế, Mộc tinh và Thổ tinh vẫn cách nhau hàng trăm triệu km.

Nếu quan sát bằng kính thiên văn với độ phóng đại lớn, có thể thấy được vành đai Thổ tinh, thậm chí cả mặt trăng của hai thiên thể này. Đây là lần quan sát hiếm có của những người yêu thiên văn, vì khoảng cách Mộc tinh và Thổ tinh trong lần đại trùng tụ này khá nhỏ, không bị ảnh hưởng bởi ánh sáng Mặt Trời.', N'dia boc thien tinh;', 5, CAST(0x0000AC8D00000000 AS DateTime), N'jupiter_saturn_and_the_milky_way_3d_illustration_PBB6HM3_1.jpg.optimal.jpg', 0)
INSERT [dbo].[tblBlog] ([BLog_ID], [Blog_Title], [Blog_Contents], [BLog_Tag], [Blog_View], [BLog_DatePost], [Blog_Image], [Blog_Trash]) VALUES (11, N'Sự kiện thiên văn gần 400 năm trước sắp tái diễn vào 21/12', N' lần giao nhau giữa hai hành tinh này khá hiếm, xảy ra 20 năm một lần. Lần trùng tụ này đặc biệt hiếm gặp vì khoảng cách giữa chúng rất gần nhau”, Patrick Hartigan, Giáo sư vật lý và thiên văn học Đại học Rice, Mỹ giải thích.

Sau gan 400 nam,  su kien thien van nay sap xay ra anh 1
Người dân Việt Nam có thể quan sát hiện tượng thiên văn đại trùng tụ hiếm có trong khoảng thời gian 17h30-19h30. Ảnh: Earthsky.
Vào đêm 21/12, với góc lệch chỉ 0,1 độ, khoảng cách hai hành tinh bằng 1/5 đường kính Mặt Trăng, khá giống hành tinh kép. Hành tinh kép là hệ hai hành tinh gắn bó do tác động lực hấp dẫn xoay quanh trọng tâm chung. Trong dải Ngân Hà, giới nghiên cứu chỉ mới tìm thấy một hành tinh kép lùn là Diêm Vương tinh và Mặt Trăng Charon.

Khi nhìn từ Trái Đất, Mộc tinh thường là vì sao sáng nhất trên bầu trời đêm. Thổ tinh có độ sáng kém Mộc tinh 12 lần và hai hành tinh này rất hiếm khi “gặp nhau”. Lần gần đây nhất xảy ra đại trùng tụ là vào năm 1623, gần 400 năm trước. Phải 60 năm sau, đại trùng tụ mới xuất hiện lần nữa. Xa hơn là vào năm 2400.

Theo In The Sky, ngày 21/12, tại Việt Nam, người dân có thể quan sát hiện tượng thiên văn hiếm có này trong khoảng thời gian 17h30-19h30. Để quan sát rõ nhất, bạn nên dõi mắt về hướng tây bầu trời, với điều kiện thời tiết quang đãng.

Vì góc biểu kiến khá gần Mặt Trời, thời gian quan sát hiện tượng này tương đối ngắn. Nếu nhìn bằng mắt thường, người quan sát chỉ thấy một chấm sáng duy nhất trên bầu trời vì khoảng cách khá gần của hai hành tinh. Trên thực tế, Mộc tinh và Thổ tinh vẫn cách nhau hàng trăm triệu km.

Nếu quan sát bằng kính thiên văn với độ phóng đại lớn, có thể thấy được vành đai Thổ tinh, thậm chí cả mặt trăng của hai thiên thể này. Đây là lần quan sát hiếm có của những người yêu thiên văn, vì khoảng cách Mộc tinh và Thổ tinh trong lần đại trùng tụ này khá nhỏ, không bị ảnh hưởng bởi ánh sáng Mặt Trời.', N'dia boc thien tinh;', 4536, CAST(0x0000AC8D00000000 AS DateTime), N'jupiter_saturn_and_the_milky_way_3d_illustration_PBB6HM3_1.jpg.optimal.jpg', 0)
INSERT [dbo].[tblBlog] ([BLog_ID], [Blog_Title], [Blog_Contents], [BLog_Tag], [Blog_View], [BLog_DatePost], [Blog_Image], [Blog_Trash]) VALUES (12, N'Sự kiện thiên văn gần 400 năm trước sắp tái diễn vào 21/12', N' lần giao nhau giữa hai hành tinh này khá hiếm, xảy ra 20 năm một lần. Lần trùng tụ này đặc biệt hiếm gặp vì khoảng cách giữa chúng rất gần nhau”, Patrick Hartigan, Giáo sư vật lý và thiên văn học Đại học Rice, Mỹ giải thích.

Sau gan 400 nam,  su kien thien van nay sap xay ra anh 1
Người dân Việt Nam có thể quan sát hiện tượng thiên văn đại trùng tụ hiếm có trong khoảng thời gian 17h30-19h30. Ảnh: Earthsky.
Vào đêm 21/12, với góc lệch chỉ 0,1 độ, khoảng cách hai hành tinh bằng 1/5 đường kính Mặt Trăng, khá giống hành tinh kép. Hành tinh kép là hệ hai hành tinh gắn bó do tác động lực hấp dẫn xoay quanh trọng tâm chung. Trong dải Ngân Hà, giới nghiên cứu chỉ mới tìm thấy một hành tinh kép lùn là Diêm Vương tinh và Mặt Trăng Charon.

Khi nhìn từ Trái Đất, Mộc tinh thường là vì sao sáng nhất trên bầu trời đêm. Thổ tinh có độ sáng kém Mộc tinh 12 lần và hai hành tinh này rất hiếm khi “gặp nhau”. Lần gần đây nhất xảy ra đại trùng tụ là vào năm 1623, gần 400 năm trước. Phải 60 năm sau, đại trùng tụ mới xuất hiện lần nữa. Xa hơn là vào năm 2400.

Theo In The Sky, ngày 21/12, tại Việt Nam, người dân có thể quan sát hiện tượng thiên văn hiếm có này trong khoảng thời gian 17h30-19h30. Để quan sát rõ nhất, bạn nên dõi mắt về hướng tây bầu trời, với điều kiện thời tiết quang đãng.

Vì góc biểu kiến khá gần Mặt Trời, thời gian quan sát hiện tượng này tương đối ngắn. Nếu nhìn bằng mắt thường, người quan sát chỉ thấy một chấm sáng duy nhất trên bầu trời vì khoảng cách khá gần của hai hành tinh. Trên thực tế, Mộc tinh và Thổ tinh vẫn cách nhau hàng trăm triệu km.

Nếu quan sát bằng kính thiên văn với độ phóng đại lớn, có thể thấy được vành đai Thổ tinh, thậm chí cả mặt trăng của hai thiên thể này. Đây là lần quan sát hiếm có của những người yêu thiên văn, vì khoảng cách Mộc tinh và Thổ tinh trong lần đại trùng tụ này khá nhỏ, không bị ảnh hưởng bởi ánh sáng Mặt Trời.', N'dia boc thien tinh;', 568, CAST(0x0000AC8D00000000 AS DateTime), N'jupiter_saturn_and_the_milky_way_3d_illustration_PBB6HM3_1.jpg.optimal.jpg', 0)
SET IDENTITY_INSERT [dbo].[tblBlog] OFF
SET IDENTITY_INSERT [dbo].[tblCategory] ON 

INSERT [dbo].[tblCategory] ([Cat_ID], [Cat_Name], [Cat_Image], [Cat_Trash]) VALUES (1, N'MVC', N'topic1.png', 0)
INSERT [dbo].[tblCategory] ([Cat_ID], [Cat_Name], [Cat_Image], [Cat_Trash]) VALUES (2, N'Wordpress', N'topic2.png', 0)
INSERT [dbo].[tblCategory] ([Cat_ID], [Cat_Name], [Cat_Image], [Cat_Trash]) VALUES (3, N'Jumbla', N'topic3.png', 0)
INSERT [dbo].[tblCategory] ([Cat_ID], [Cat_Name], [Cat_Image], [Cat_Trash]) VALUES (4, N'Unity', N'topic4.png', 0)
INSERT [dbo].[tblCategory] ([Cat_ID], [Cat_Name], [Cat_Image], [Cat_Trash]) VALUES (5, N'IOS', N'topic5.png', 0)
INSERT [dbo].[tblCategory] ([Cat_ID], [Cat_Name], [Cat_Image], [Cat_Trash]) VALUES (6, N'Android', N'topic6.png', 0)
INSERT [dbo].[tblCategory] ([Cat_ID], [Cat_Name], [Cat_Image], [Cat_Trash]) VALUES (7, N'Laravel', N'topic7.png', 0)
INSERT [dbo].[tblCategory] ([Cat_ID], [Cat_Name], [Cat_Image], [Cat_Trash]) VALUES (8, N'WinForm', N'topic8.png', 0)
INSERT [dbo].[tblCategory] ([Cat_ID], [Cat_Name], [Cat_Image], [Cat_Trash]) VALUES (10, N'Angular', NULL, 0)
SET IDENTITY_INSERT [dbo].[tblCategory] OFF
SET IDENTITY_INSERT [dbo].[tblComment] ON 

INSERT [dbo].[tblComment] ([Comment_ID], [Comment_Contents], [Comment_User], [Comment_DatePost], [Comment_Blog], [Comment_Post], [Comment_Trash]) VALUES (1, N'binh luan hahaha', 3, CAST(0x0000AC7C00000000 AS DateTime), NULL, 1, 0)
INSERT [dbo].[tblComment] ([Comment_ID], [Comment_Contents], [Comment_User], [Comment_DatePost], [Comment_Blog], [Comment_Post], [Comment_Trash]) VALUES (2, N'binh luan ', 4, CAST(0x0000AC7C00000000 AS DateTime), NULL, 2, 0)
INSERT [dbo].[tblComment] ([Comment_ID], [Comment_Contents], [Comment_User], [Comment_DatePost], [Comment_Blog], [Comment_Post], [Comment_Trash]) VALUES (3, N'binh luan ', 3, CAST(0x0000AC7C00000000 AS DateTime), NULL, 1, 0)
INSERT [dbo].[tblComment] ([Comment_ID], [Comment_Contents], [Comment_User], [Comment_DatePost], [Comment_Blog], [Comment_Post], [Comment_Trash]) VALUES (4, N'binh luan ', 4, CAST(0x0000AC7C00000000 AS DateTime), NULL, 2, 0)
INSERT [dbo].[tblComment] ([Comment_ID], [Comment_Contents], [Comment_User], [Comment_DatePost], [Comment_Blog], [Comment_Post], [Comment_Trash]) VALUES (5, N'binh luan ', 3, CAST(0x0000AC7C00000000 AS DateTime), NULL, 3, 0)
INSERT [dbo].[tblComment] ([Comment_ID], [Comment_Contents], [Comment_User], [Comment_DatePost], [Comment_Blog], [Comment_Post], [Comment_Trash]) VALUES (6, N'binh luan ', 4, CAST(0x0000AC7C00000000 AS DateTime), NULL, 4, 0)
INSERT [dbo].[tblComment] ([Comment_ID], [Comment_Contents], [Comment_User], [Comment_DatePost], [Comment_Blog], [Comment_Post], [Comment_Trash]) VALUES (7, N'binh luan ', 3, CAST(0x0000AC7C00000000 AS DateTime), NULL, 1, 0)
INSERT [dbo].[tblComment] ([Comment_ID], [Comment_Contents], [Comment_User], [Comment_DatePost], [Comment_Blog], [Comment_Post], [Comment_Trash]) VALUES (8, N'binh luan ', 4, CAST(0x0000AC7C00000000 AS DateTime), NULL, 1, 0)
INSERT [dbo].[tblComment] ([Comment_ID], [Comment_Contents], [Comment_User], [Comment_DatePost], [Comment_Blog], [Comment_Post], [Comment_Trash]) VALUES (9, N'binh luan ', 4, CAST(0x0000AC7C00000000 AS DateTime), NULL, 1, 0)
INSERT [dbo].[tblComment] ([Comment_ID], [Comment_Contents], [Comment_User], [Comment_DatePost], [Comment_Blog], [Comment_Post], [Comment_Trash]) VALUES (29, N'cc', 4, CAST(0x0000AC7C0127CD83 AS DateTime), NULL, 2, 0)
INSERT [dbo].[tblComment] ([Comment_ID], [Comment_Contents], [Comment_User], [Comment_DatePost], [Comment_Blog], [Comment_Post], [Comment_Trash]) VALUES (30, N'cc', 4, CAST(0x0000AC7C01281E7E AS DateTime), NULL, 1, 0)
INSERT [dbo].[tblComment] ([Comment_ID], [Comment_Contents], [Comment_User], [Comment_DatePost], [Comment_Blog], [Comment_Post], [Comment_Trash]) VALUES (31, N'cc', 4, CAST(0x0000AC7C01299F4A AS DateTime), NULL, 1, 0)
INSERT [dbo].[tblComment] ([Comment_ID], [Comment_Contents], [Comment_User], [Comment_DatePost], [Comment_Blog], [Comment_Post], [Comment_Trash]) VALUES (32, N'bl1', 4, CAST(0x0000AC7C01299F4A AS DateTime), NULL, 1, 0)
INSERT [dbo].[tblComment] ([Comment_ID], [Comment_Contents], [Comment_User], [Comment_DatePost], [Comment_Blog], [Comment_Post], [Comment_Trash]) VALUES (33, N'test', 4, CAST(0x0000AC8600BFDE71 AS DateTime), NULL, 1, 0)
INSERT [dbo].[tblComment] ([Comment_ID], [Comment_Contents], [Comment_User], [Comment_DatePost], [Comment_Blog], [Comment_Post], [Comment_Trash]) VALUES (34, N'cc
', 4, CAST(0x0000AC8600C0570E AS DateTime), NULL, 1, 0)
INSERT [dbo].[tblComment] ([Comment_ID], [Comment_Contents], [Comment_User], [Comment_DatePost], [Comment_Blog], [Comment_Post], [Comment_Trash]) VALUES (35, N'ha', 4, CAST(0x0000AC8600C49684 AS DateTime), NULL, 1, 0)
INSERT [dbo].[tblComment] ([Comment_ID], [Comment_Contents], [Comment_User], [Comment_DatePost], [Comment_Blog], [Comment_Post], [Comment_Trash]) VALUES (36, NULL, 4, CAST(0x0000AC8600C49690 AS DateTime), NULL, 2, 0)
INSERT [dbo].[tblComment] ([Comment_ID], [Comment_Contents], [Comment_User], [Comment_DatePost], [Comment_Blog], [Comment_Post], [Comment_Trash]) VALUES (37, N'cc', 4, CAST(0x0000AC8600C501DD AS DateTime), NULL, 1, 0)
INSERT [dbo].[tblComment] ([Comment_ID], [Comment_Contents], [Comment_User], [Comment_DatePost], [Comment_Blog], [Comment_Post], [Comment_Trash]) VALUES (38, NULL, 4, CAST(0x0000AC8600C7793A AS DateTime), NULL, 1, 0)
INSERT [dbo].[tblComment] ([Comment_ID], [Comment_Contents], [Comment_User], [Comment_DatePost], [Comment_Blog], [Comment_Post], [Comment_Trash]) VALUES (39, N'hhh', 4, CAST(0x0000AC8600C7F65B AS DateTime), NULL, 2, 0)
INSERT [dbo].[tblComment] ([Comment_ID], [Comment_Contents], [Comment_User], [Comment_DatePost], [Comment_Blog], [Comment_Post], [Comment_Trash]) VALUES (41, N'cc
', 4, CAST(0x0000AC880007D6D6 AS DateTime), NULL, 7, 0)
INSERT [dbo].[tblComment] ([Comment_ID], [Comment_Contents], [Comment_User], [Comment_DatePost], [Comment_Blog], [Comment_Post], [Comment_Trash]) VALUES (42, N'hhhh', 4, CAST(0x0000AC88009614D3 AS DateTime), NULL, 6, 0)
INSERT [dbo].[tblComment] ([Comment_ID], [Comment_Contents], [Comment_User], [Comment_DatePost], [Comment_Blog], [Comment_Post], [Comment_Trash]) VALUES (43, N'cc', 4, CAST(0x0000AC88009EA4AF AS DateTime), NULL, 7, 0)
INSERT [dbo].[tblComment] ([Comment_ID], [Comment_Contents], [Comment_User], [Comment_DatePost], [Comment_Blog], [Comment_Post], [Comment_Trash]) VALUES (44, N'tes', 4, CAST(0x0000AC88009EBD8B AS DateTime), NULL, 7, 0)
INSERT [dbo].[tblComment] ([Comment_ID], [Comment_Contents], [Comment_User], [Comment_DatePost], [Comment_Blog], [Comment_Post], [Comment_Trash]) VALUES (45, N'hhh', 4, CAST(0x0000AC88009F5888 AS DateTime), NULL, 7, 0)
INSERT [dbo].[tblComment] ([Comment_ID], [Comment_Contents], [Comment_User], [Comment_DatePost], [Comment_Blog], [Comment_Post], [Comment_Trash]) VALUES (46, N'vc
', 4, CAST(0x0000AC88009F7EF6 AS DateTime), NULL, 7, 0)
INSERT [dbo].[tblComment] ([Comment_ID], [Comment_Contents], [Comment_User], [Comment_DatePost], [Comment_Blog], [Comment_Post], [Comment_Trash]) VALUES (47, N'binh luan', 4, CAST(0x0000AC8800A046E5 AS DateTime), NULL, 7, 0)
INSERT [dbo].[tblComment] ([Comment_ID], [Comment_Contents], [Comment_User], [Comment_DatePost], [Comment_Blog], [Comment_Post], [Comment_Trash]) VALUES (48, N'bl', 4, CAST(0x0000AC8800A0ECCB AS DateTime), NULL, 7, 0)
INSERT [dbo].[tblComment] ([Comment_ID], [Comment_Contents], [Comment_User], [Comment_DatePost], [Comment_Blog], [Comment_Post], [Comment_Trash]) VALUES (49, N'1', 4, CAST(0x0000AC8800A0FCF6 AS DateTime), NULL, 7, 0)
INSERT [dbo].[tblComment] ([Comment_ID], [Comment_Contents], [Comment_User], [Comment_DatePost], [Comment_Blog], [Comment_Post], [Comment_Trash]) VALUES (50, N'cc', 4, CAST(0x0000AC8800A12E91 AS DateTime), NULL, 7, 0)
INSERT [dbo].[tblComment] ([Comment_ID], [Comment_Contents], [Comment_User], [Comment_DatePost], [Comment_Blog], [Comment_Post], [Comment_Trash]) VALUES (51, N'vv', 4, CAST(0x0000AC89016F19D2 AS DateTime), NULL, 3, 0)
INSERT [dbo].[tblComment] ([Comment_ID], [Comment_Contents], [Comment_User], [Comment_DatePost], [Comment_Blog], [Comment_Post], [Comment_Trash]) VALUES (54, N'ccc', 4, CAST(0x0000AC8D01529683 AS DateTime), NULL, 7, 0)
SET IDENTITY_INSERT [dbo].[tblComment] OFF
SET IDENTITY_INSERT [dbo].[tblCustom] ON 

INSERT [dbo].[tblCustom] ([Custom_ID], [ct_01], [ct_02], [ct_03], [ct_04], [ct_05], [ct_06], [ct_07], [ct_08], [ct_09], [ct_10], [ct_11], [ct_12], [ct_13], [ct_14], [ct_15], [ct_16], [ct_17], [ct_18], [ct_19], [ct_20], [ct_21], [ct_22], [ct_23], [ct_24], [ct_25], [ct_26]) VALUES (1, N'Online learning', N' platform ', N'Build skills with courses, certificates, and degrees online from world-class universities and companies 1', N'hahaa', N'hahaa', N'hahaa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tblCustom] OFF
SET IDENTITY_INSERT [dbo].[tblDownLoad] ON 

INSERT [dbo].[tblDownLoad] ([DownLoad_ID], [DownLoad_User], [DownLoad_Post], [DownLoad_DateDown]) VALUES (1, 3, 7, CAST(0x0000AC92013DF6ED AS DateTime))
SET IDENTITY_INSERT [dbo].[tblDownLoad] OFF
SET IDENTITY_INSERT [dbo].[tblFavorite] ON 

INSERT [dbo].[tblFavorite] ([Favorite_ID], [Favorite_User], [Favorite_Post], [Favorite_DateAdd]) VALUES (6, 4, 3, CAST(0x0000AC7900F37BC8 AS DateTime))
INSERT [dbo].[tblFavorite] ([Favorite_ID], [Favorite_User], [Favorite_Post], [Favorite_DateAdd]) VALUES (8, 4, 5, CAST(0x0000AC7900F68704 AS DateTime))
SET IDENTITY_INSERT [dbo].[tblFavorite] OFF
SET IDENTITY_INSERT [dbo].[tblGenres] ON 

INSERT [dbo].[tblGenres] ([Genres_ID], [Genres_Name], [Genres_Trash]) VALUES (1, N'Website', 0)
INSERT [dbo].[tblGenres] ([Genres_ID], [Genres_Name], [Genres_Trash]) VALUES (2, N'Phần mềm - ứng dụng', 0)
INSERT [dbo].[tblGenres] ([Genres_ID], [Genres_Name], [Genres_Trash]) VALUES (3, N'IOT', 0)
INSERT [dbo].[tblGenres] ([Genres_ID], [Genres_Name], [Genres_Trash]) VALUES (4, N'Game', 0)
SET IDENTITY_INSERT [dbo].[tblGenres] OFF
SET IDENTITY_INSERT [dbo].[tblGroupCode] ON 

INSERT [dbo].[tblGroupCode] ([Group_ID], [Group_Name], [Group_Descriptions], [Group_Trash]) VALUES (1, N'Code miễn phí', N'Code đăng bán giá 0 xu', 0)
INSERT [dbo].[tblGroupCode] ([Group_ID], [Group_Name], [Group_Descriptions], [Group_Trash]) VALUES (2, N'Code Tham khảo', N'Code đăng bán gí từ 1 - 99 xu, có thể phát triễn thêm', 0)
INSERT [dbo].[tblGroupCode] ([Group_ID], [Group_Name], [Group_Descriptions], [Group_Trash]) VALUES (3, N'Code chất lượng', N'Code trên 100 xu, là code có thể sử dụng ngay và luôn', 0)
SET IDENTITY_INSERT [dbo].[tblGroupCode] OFF
SET IDENTITY_INSERT [dbo].[tblLanguage] ON 

INSERT [dbo].[tblLanguage] ([Lang_ID], [Lang_Name], [Lang_Logo], [Lang_Trash]) VALUES (1, N'C#', NULL, 0)
INSERT [dbo].[tblLanguage] ([Lang_ID], [Lang_Name], [Lang_Logo], [Lang_Trash]) VALUES (2, N'JS', NULL, 0)
INSERT [dbo].[tblLanguage] ([Lang_ID], [Lang_Name], [Lang_Logo], [Lang_Trash]) VALUES (3, N'Java', NULL, 0)
INSERT [dbo].[tblLanguage] ([Lang_ID], [Lang_Name], [Lang_Logo], [Lang_Trash]) VALUES (4, N'Php', NULL, 0)
INSERT [dbo].[tblLanguage] ([Lang_ID], [Lang_Name], [Lang_Logo], [Lang_Trash]) VALUES (5, N'C++', NULL, 0)
INSERT [dbo].[tblLanguage] ([Lang_ID], [Lang_Name], [Lang_Logo], [Lang_Trash]) VALUES (6, N'C', NULL, 0)
INSERT [dbo].[tblLanguage] ([Lang_ID], [Lang_Name], [Lang_Logo], [Lang_Trash]) VALUES (7, N'Ruby', NULL, 0)
INSERT [dbo].[tblLanguage] ([Lang_ID], [Lang_Name], [Lang_Logo], [Lang_Trash]) VALUES (8, N'Python', NULL, 0)
INSERT [dbo].[tblLanguage] ([Lang_ID], [Lang_Name], [Lang_Logo], [Lang_Trash]) VALUES (9, N'Golang', NULL, 0)
INSERT [dbo].[tblLanguage] ([Lang_ID], [Lang_Name], [Lang_Logo], [Lang_Trash]) VALUES (10, N'CSS', NULL, 0)
INSERT [dbo].[tblLanguage] ([Lang_ID], [Lang_Name], [Lang_Logo], [Lang_Trash]) VALUES (11, N'Kotlin', NULL, 0)
SET IDENTITY_INSERT [dbo].[tblLanguage] OFF
SET IDENTITY_INSERT [dbo].[tblOrder] ON 

INSERT [dbo].[tblOrder] ([Order_ID], [Order_User], [Order_TotalPrice], [Order_Post], [Order_DateAdd]) VALUES (1, 4, 20, 2, CAST(0x0000AC7C00000000 AS DateTime))
INSERT [dbo].[tblOrder] ([Order_ID], [Order_User], [Order_TotalPrice], [Order_Post], [Order_DateAdd]) VALUES (11, 3, 200, 7, CAST(0x0000AC9101054385 AS DateTime))
SET IDENTITY_INSERT [dbo].[tblOrder] OFF
SET IDENTITY_INSERT [dbo].[tblPost] ON 

INSERT [dbo].[tblPost] ([Post_ID], [Post_Title], [Post_Avata], [Post_ViewMoreImage], [Post_Description], [Post_View], [Post_CountDownLoad], [Post_LinkDown], [Post_DateCreate], [Post_Cat], [Post_User], [Post_Favorite], [Post_TutorialSetup], [Post_Price], [Post_Genres], [Post_Group], [Post_Active], [Post_Trash], [Post_Code]) VALUES (1, N'Mã nguồn trò chơi Hero C', NULL, NULL, N'<p>website được viết bằng asp.net MVC đầy đủ chức năng có thích hợp thanh toán online, thuận tiên cho người bán. có thể dùng để làm website thự tế hoặc làm đồ án tốt nghiệp Các chức năng chính: - Tích hợpThanh toán MOMO - Tích hợpThanh toán ngân lượng - Tích hợp thanh toán ngân hàng ATM online - Quản lý sản phẩm admin, thêm sửa xóa - Tìm kiến sản phẩm - Sản phẩm theo lại - Theo dõi đơn hàng.. Còn rất nhiều chức năng khác. Chi tiết xem ở link demo... XEM THÊM ==&gt; Hướng dẫn cài đặt chi tiết HÌNH ẢNH DEMO thích hợp thanh toán,website bán hàng thời trang,website bán quần áo,thanh toán ngân lượng,thanh toán MOMO thích hợp thanh toán,website bán hàng thời trang,website bán quần áo,thanh toán ngân lượng,thanh toán MOMO thích hợp thanh toán,website bán hàng thời trang,website bán quần áo,thanh toán ngân lượng,thanh toán MOMO thích hợp thanh toán,website bán hàng thời trang,website bán quần áo,thanh toán ngân lượng,thanh toán MOMO thích hợp thanh toán,website bán hàng thời trang,website bán quần áo,thanh toán ngân lượng,thanh toán MOMO thích hợp thanh toán,website bán hàng thời trang,website bán quần áo,thanh toán ngân lượng,thanh toán MOMO thích hợp thanh toán,website bán hàng thời trang,website bán quần áo,thanh toán ngân lượng,thanh toán MOMO thích hợp thanh toán,website bán hàng thời trang,website bán quần áo,thanh toán ngân lượng,thanh toán MOMO thích hợp thanh toán,website bán hàng thời trang,website bán quần áo,thanh toán ngân lượng,thanh toán MOMO Nguồn: Sharecode.vn</p>', 0, 0, N'https://sharecode.vn/source-code/website-thoi-tran-day-du-chuc-nang-tich-hop-thanh-toan-online-momo-atm-ngan-luong-27083.htm', CAST(0x0000AC7800000000 AS DateTime), 3, 4, 122, N'<p>- Tải code về giải nén bỏ vào visual sutido. - Sửa lại thông tin kết nối DB trong file web.config - Chạy script Datatabase hặc file backup.</p>', 200.0000, 1, 1, 1, 0, N'Code-001  ')
INSERT [dbo].[tblPost] ([Post_ID], [Post_Title], [Post_Avata], [Post_ViewMoreImage], [Post_Description], [Post_View], [Post_CountDownLoad], [Post_LinkDown], [Post_DateCreate], [Post_Cat], [Post_User], [Post_Favorite], [Post_TutorialSetup], [Post_Price], [Post_Genres], [Post_Group], [Post_Active], [Post_Trash], [Post_Code]) VALUES (2, N'Website thời trang đầy đủ chức năng tích hợp thanh toán Online MOMO, ATM, NGÂN LƯỢNG', N'website-thoi-trang-day-du-chuc-nang-tich-hop-thanh-toan-online-momo-atm-ngan-luong-105739.jpg', NULL, N'website được viết bằng asp.net MVC đầy đủ chức năng có thích hợp thanh toán online, thuận tiên cho người bán. có thể dùng để làm website thự tế hoặc làm đồ án tốt nghiệp

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

Nguồn: Sharecode.vn', 165, 0, N'https://sharecode.vn/source-code/website-thoi-tran-day-du-chuc-nang-tich-hop-thanh-toan-online-momo-atm-ngan-luong-27083.htm', CAST(0x0000AC7800000000 AS DateTime), 3, 3, 122, N'- Tải code về giải nén bỏ vào visual sutido.

- Sửa lại thông tin kết nối DB trong file web.config

- Chạy script Datatabase hặc file backup.', 200.0000, 2, 1, 1, 0, N'Code-002  ')
INSERT [dbo].[tblPost] ([Post_ID], [Post_Title], [Post_Avata], [Post_ViewMoreImage], [Post_Description], [Post_View], [Post_CountDownLoad], [Post_LinkDown], [Post_DateCreate], [Post_Cat], [Post_User], [Post_Favorite], [Post_TutorialSetup], [Post_Price], [Post_Genres], [Post_Group], [Post_Active], [Post_Trash], [Post_Code]) VALUES (3, N'Code bán acc game tự động, nạp rút qua CARD ĐIỆN THOẠI, zalopay, momo, ngân hàng, Shop Liên Minh Tốc Chiến', N'code-ban-acc-game-tu-dong-nap-rut-qua-card-dien-thoai-zalopay-momo-ngan-hang-shop-lien-minh-toc-chien-105922.jpg', N'website-thoi-trang-day-du-chuc-nang-tich-hop-thanh-toan-online-momo-atm-ngan-luong-105739.jpg;website-thoi-trang-day-du-chuc-nang-tich-hop-thanh-toan-online-momo-atm-ngan-luong-105739.jpg;website-thoi-trang-day-du-chuc-nang-tich-hop-thanh-toan-online-momo-atm-ngan-luong-105739.jpg;website-thoi-trang-day-du-chuc-nang-tich-hop-thanh-toan-online-momo-atm-ngan-luong-105739.jpg;website-thoi-trang-day-du-chuc-nang-tich-hop-thanh-toan-online-momo-atm-ngan-luong-105739.jpg', N'website được viết bằng asp.net MVC đầy đủ chức năng có thích hợp thanh toán online, thuận tiên cho người bán. có thể dùng để làm website thự tế hoặc làm đồ án tốt nghiệp

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

Nguồn: Sharecode.vn', 22, 456, N'https://sharecode.vn/source-code/website-thoi-tran-day-du-chuc-nang-tich-hop-thanh-toan-online-momo-atm-ngan-luong-27083.htm', CAST(0x0000AC7800000000 AS DateTime), 3, 3, 260, N'- Tải code về giải nén bỏ vào visual sutido.

- Sửa lại thông tin kết nối DB trong file web.config

- Chạy script Datatabase hặc file backup.', 125.0000, 1, 1, 1, 0, N'Code-003  ')
INSERT [dbo].[tblPost] ([Post_ID], [Post_Title], [Post_Avata], [Post_ViewMoreImage], [Post_Description], [Post_View], [Post_CountDownLoad], [Post_LinkDown], [Post_DateCreate], [Post_Cat], [Post_User], [Post_Favorite], [Post_TutorialSetup], [Post_Price], [Post_Genres], [Post_Group], [Post_Active], [Post_Trash], [Post_Code]) VALUES (4, N'Full code Website rao vặt Chợ Tốt, clone gần hết hết các chức năng bán hàng, rao vặt, load dữ liệu 63 tỉnh thành', N'full-code-website-rao-vat-cho-tot-clone-gan-het-het-cac-chuc-nang-ban-hang-rao-vat-load-du-lieu-63-tinh-thanh-20921.jpg', N'website-thoi-trang-day-du-chuc-nang-tich-hop-thanh-toan-online-momo-atm-ngan-luong-105739.jpg;website-thoi-trang-day-du-chuc-nang-tich-hop-thanh-toan-online-momo-atm-ngan-luong-105739.jpg;website-thoi-trang-day-du-chuc-nang-tich-hop-thanh-toan-online-momo-atm-ngan-luong-105739.jpg;website-thoi-trang-day-du-chuc-nang-tich-hop-thanh-toan-online-momo-atm-ngan-luong-105739.jpg;website-thoi-trang-day-du-chuc-nang-tich-hop-thanh-toan-online-momo-atm-ngan-luong-105739.jpg', N'website được viết bằng asp.net MVC đầy đủ chức năng có thích hợp thanh toán online, thuận tiên cho người bán. có thể dùng để làm website thự tế hoặc làm đồ án tốt nghiệp

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

Nguồn: Sharecode.vn', 75, 789, N'https://sharecode.vn/source-code/website-thoi-tran-day-du-chuc-nang-tich-hop-thanh-toan-online-momo-atm-ngan-luong-27083.htm', CAST(0x0000AC7800000000 AS DateTime), 3, 3, 369, N'- Tải code về giải nén bỏ vào visual sutido.

- Sửa lại thông tin kết nối DB trong file web.config

- Chạy script Datatabase hặc file backup.', 167.0000, 2, 2, 1, 0, N'Code-004  ')
INSERT [dbo].[tblPost] ([Post_ID], [Post_Title], [Post_Avata], [Post_ViewMoreImage], [Post_Description], [Post_View], [Post_CountDownLoad], [Post_LinkDown], [Post_DateCreate], [Post_Cat], [Post_User], [Post_Favorite], [Post_TutorialSetup], [Post_Price], [Post_Genres], [Post_Group], [Post_Active], [Post_Trash], [Post_Code]) VALUES (5, N'Full code website bán sách đầy đủ chức năng - ASP.NET MVC 5', N'full-code-website-ban-sach-day-du-chuc-nang---asp.net-mvc-5-9629.jpg', N'website-thoi-trang-day-du-chuc-nang-tich-hop-thanh-toan-online-momo-atm-ngan-luong-105739.jpg;website-thoi-trang-day-du-chuc-nang-tich-hop-thanh-toan-online-momo-atm-ngan-luong-105739.jpg;website-thoi-trang-day-du-chuc-nang-tich-hop-thanh-toan-online-momo-atm-ngan-luong-105739.jpg;website-thoi-trang-day-du-chuc-nang-tich-hop-thanh-toan-online-momo-atm-ngan-luong-105739.jpg;website-thoi-trang-day-du-chuc-nang-tich-hop-thanh-toan-online-momo-atm-ngan-luong-105739.jpg', N'website được viết bằng asp.net MVC đầy đủ chức năng có thích hợp thanh toán online, thuận tiên cho người bán. có thể dùng để làm website thự tế hoặc làm đồ án tốt nghiệp

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

Nguồn: Sharecode.vn', 536, 147, N'https://sharecode.vn/source-code/website-thoi-tran-day-du-chuc-nang-tich-hop-thanh-toan-online-momo-atm-ngan-luong-27083.htm', CAST(0x0000AC7800000000 AS DateTime), 5, 3, 160, N'- Tải code về giải nén bỏ vào visual sutido.

- Sửa lại thông tin kết nối DB trong file web.config

- Chạy script Datatabase hặc file backup.', 349.0000, 3, 3, 1, 0, N'Code-005  ')
INSERT [dbo].[tblPost] ([Post_ID], [Post_Title], [Post_Avata], [Post_ViewMoreImage], [Post_Description], [Post_View], [Post_CountDownLoad], [Post_LinkDown], [Post_DateCreate], [Post_Cat], [Post_User], [Post_Favorite], [Post_TutorialSetup], [Post_Price], [Post_Genres], [Post_Group], [Post_Active], [Post_Trash], [Post_Code]) VALUES (6, N'Code Website bán bánh Pizza ASP.NET - Tích hợp thanh toán MOMO, NGÂN LƯỢNG, ATM ONLINE', N'code-website-ban-banh-pizza-asp.net---tich-hop-thanh-toan-momo-ngan-luong-atm-online-16419.jpg', NULL, N'website được viết bằng asp.net MVC đầy đủ chức năng có thích hợp thanh toán online, thuận tiên cho người bán. có thể dùng để làm website thự tế hoặc làm đồ án tốt nghiệp

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

Nguồn: Sharecode.vn', 480, 258, N'https://sharecode.vn/source-code/website-thoi-tran-day-du-chuc-nang-tich-hop-thanh-toan-online-momo-atm-ngan-luong-27083.htm', CAST(0x0000AC7800000000 AS DateTime), 6, 3, 357, N'- Tải code về giải nén bỏ vào visual sutido.

- Sửa lại thông tin kết nối DB trong file web.config

- Chạy script Datatabase hặc file backup.', 258.0000, 3, 1, 1, 0, N'Code-006  ')
INSERT [dbo].[tblPost] ([Post_ID], [Post_Title], [Post_Avata], [Post_ViewMoreImage], [Post_Description], [Post_View], [Post_CountDownLoad], [Post_LinkDown], [Post_DateCreate], [Post_Cat], [Post_User], [Post_Favorite], [Post_TutorialSetup], [Post_Price], [Post_Genres], [Post_Group], [Post_Active], [Post_Trash], [Post_Code]) VALUES (7, N'Mã nguồn trò chơi Stickman Strike - Shadow Warriors', N'ma-nguon-tro-choi-stickman-strike---shadow-warriors-191248.jpg', N';57ce3ab3-a86a-44ff-bdf7-1eb7d451baf8.jpg;5aba6fd2-e647-41bb-9cbd-8de4aef86b81.jpg;84835e48-499d-4fbc-83a0-19f66d815ac5.jpg', N'<p>sdadadadasd</p>
', 102, 1, N'https://sharecode.vn/source-code/website-thoi-tran-day-du-chuc-nang-tich-hop-thanh-toan-online-momo-atm-ngan-luong-27083.htm', CAST(0x0000AC7A010D705C AS DateTime), 4, 4, 0, N'aaaaaaaaaaa', 200.0000, 4, 1, 1, 0, N'Code-010  ')
INSERT [dbo].[tblPost] ([Post_ID], [Post_Title], [Post_Avata], [Post_ViewMoreImage], [Post_Description], [Post_View], [Post_CountDownLoad], [Post_LinkDown], [Post_DateCreate], [Post_Cat], [Post_User], [Post_Favorite], [Post_TutorialSetup], [Post_Price], [Post_Genres], [Post_Group], [Post_Active], [Post_Trash], [Post_Code]) VALUES (9, N'hahahahah', N'4e002bc6-5a78-4d4e-a6d2-f558dd6ed287.jpg', NULL, N'code hay', 1, 0, N'https://drive.google.com/file/d/1y21-kbz7SUq8PeuYUTDGgi1lTLbSE9YW/view?usp=sharing', CAST(0x0000AC9400C1647F AS DateTime), 1, 3, 0, N'code hay', 200.0000, 1, 1, 0, 1, NULL)
SET IDENTITY_INSERT [dbo].[tblPost] OFF
INSERT [dbo].[tblPostLang] ([Post_ID], [Lang_ID], [PostLang_DateAdd]) VALUES (2, 1, CAST(0x0000AC94012756CA AS DateTime))
INSERT [dbo].[tblPostLang] ([Post_ID], [Lang_ID], [PostLang_DateAdd]) VALUES (2, 5, CAST(0x0000AC94012756CC AS DateTime))
INSERT [dbo].[tblPostLang] ([Post_ID], [Lang_ID], [PostLang_DateAdd]) VALUES (2, 7, CAST(0x0000AC94012756CE AS DateTime))
INSERT [dbo].[tblPostLang] ([Post_ID], [Lang_ID], [PostLang_DateAdd]) VALUES (5, 1, CAST(0x0000AC9400C164AC AS DateTime))
INSERT [dbo].[tblPostLang] ([Post_ID], [Lang_ID], [PostLang_DateAdd]) VALUES (5, 2, CAST(0x0000AC9400C164AC AS DateTime))
INSERT [dbo].[tblPostLang] ([Post_ID], [Lang_ID], [PostLang_DateAdd]) VALUES (6, 1, CAST(0x0000AC9401273BB6 AS DateTime))
INSERT [dbo].[tblPostLang] ([Post_ID], [Lang_ID], [PostLang_DateAdd]) VALUES (9, 2, CAST(0x0000AC9400C164AC AS DateTime))
INSERT [dbo].[tblPostLang] ([Post_ID], [Lang_ID], [PostLang_DateAdd]) VALUES (9, 8, CAST(0x0000AC9400C164B3 AS DateTime))
SET IDENTITY_INSERT [dbo].[tblRate] ON 

INSERT [dbo].[tblRate] ([Rate_ID], [Rate_Star], [Rate_User], [Rate_Post], [Rate_DateVote]) VALUES (3, 4, 3, 1, CAST(0x0000AC9100000000 AS DateTime))
INSERT [dbo].[tblRate] ([Rate_ID], [Rate_Star], [Rate_User], [Rate_Post], [Rate_DateVote]) VALUES (6, 5, 3, 7, CAST(0x0000AC910108ACA7 AS DateTime))
SET IDENTITY_INSERT [dbo].[tblRate] OFF
SET IDENTITY_INSERT [dbo].[tblReport] ON 

INSERT [dbo].[tblReport] ([Report_ID], [Report_Contents], [Report_DateSend], [Report_User], [Report_Blog], [Report_Post]) VALUES (1, N'code nhu cc
', CAST(0x0000AC910110EF4F AS DateTime), 3, NULL, 7)
SET IDENTITY_INSERT [dbo].[tblReport] OFF
SET IDENTITY_INSERT [dbo].[tblRepply] ON 

INSERT [dbo].[tblRepply] ([Rep_ID], [Rep_Contents], [Rep_User], [Rep_Comment], [Rep_DatePost], [Rep_Trash]) VALUES (4, N'hahahah', 3, 1, CAST(0x0000AC8600000000 AS DateTime), NULL)
INSERT [dbo].[tblRepply] ([Rep_ID], [Rep_Contents], [Rep_User], [Rep_Comment], [Rep_DatePost], [Rep_Trash]) VALUES (5, N'hahahah', 3, 1, CAST(0x0000AC8600000000 AS DateTime), NULL)
INSERT [dbo].[tblRepply] ([Rep_ID], [Rep_Contents], [Rep_User], [Rep_Comment], [Rep_DatePost], [Rep_Trash]) VALUES (6, N'hahahah', 3, 1, CAST(0x0000AC8600000000 AS DateTime), NULL)
INSERT [dbo].[tblRepply] ([Rep_ID], [Rep_Contents], [Rep_User], [Rep_Comment], [Rep_DatePost], [Rep_Trash]) VALUES (7, N'hahahah', 3, 1, CAST(0x0000AC8600000000 AS DateTime), NULL)
INSERT [dbo].[tblRepply] ([Rep_ID], [Rep_Contents], [Rep_User], [Rep_Comment], [Rep_DatePost], [Rep_Trash]) VALUES (8, N'hahahah', 3, 1, CAST(0x0000AC8600000000 AS DateTime), NULL)
INSERT [dbo].[tblRepply] ([Rep_ID], [Rep_Contents], [Rep_User], [Rep_Comment], [Rep_DatePost], [Rep_Trash]) VALUES (9, N'hahahah', 3, 1, CAST(0x0000AC8600000000 AS DateTime), NULL)
INSERT [dbo].[tblRepply] ([Rep_ID], [Rep_Contents], [Rep_User], [Rep_Comment], [Rep_DatePost], [Rep_Trash]) VALUES (10, N'hahahah', 3, 1, CAST(0x0000AC8600000000 AS DateTime), NULL)
INSERT [dbo].[tblRepply] ([Rep_ID], [Rep_Contents], [Rep_User], [Rep_Comment], [Rep_DatePost], [Rep_Trash]) VALUES (11, N'cc', 4, 54, CAST(0x0000AC8D01563F0B AS DateTime), 0)
INSERT [dbo].[tblRepply] ([Rep_ID], [Rep_Contents], [Rep_User], [Rep_Comment], [Rep_DatePost], [Rep_Trash]) VALUES (12, N'ffff', 4, 54, CAST(0x0000AC8D01564E26 AS DateTime), 0)
INSERT [dbo].[tblRepply] ([Rep_ID], [Rep_Contents], [Rep_User], [Rep_Comment], [Rep_DatePost], [Rep_Trash]) VALUES (13, N'gagag', 4, 54, CAST(0x0000AC8D0156C7E4 AS DateTime), 0)
INSERT [dbo].[tblRepply] ([Rep_ID], [Rep_Contents], [Rep_User], [Rep_Comment], [Rep_DatePost], [Rep_Trash]) VALUES (14, N'cc', 4, 54, CAST(0x0000AC8D0156CA76 AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[tblRepply] OFF
SET IDENTITY_INSERT [dbo].[tblRole] ON 

INSERT [dbo].[tblRole] ([Role_ID], [Role_Name]) VALUES (1, N'Admin')
INSERT [dbo].[tblRole] ([Role_ID], [Role_Name]) VALUES (2, N'Member')
SET IDENTITY_INSERT [dbo].[tblRole] OFF
SET IDENTITY_INSERT [dbo].[tblTag] ON 

INSERT [dbo].[tblTag] ([Tag_ID], [Tag_Title], [Tag_CountSearch], [Tag_DateAdd]) VALUES (1, N'Code chất lượng', 3, CAST(0x0000AC8600A58BD7 AS DateTime))
INSERT [dbo].[tblTag] ([Tag_ID], [Tag_Title], [Tag_CountSearch], [Tag_DateAdd]) VALUES (2, N'Code tham khảo', 3, CAST(0x0000AC8600A59F70 AS DateTime))
INSERT [dbo].[tblTag] ([Tag_ID], [Tag_Title], [Tag_CountSearch], [Tag_DateAdd]) VALUES (3, N'Jumbla', 9, CAST(0x0000AC8600A5B48D AS DateTime))
INSERT [dbo].[tblTag] ([Tag_ID], [Tag_Title], [Tag_CountSearch], [Tag_DateAdd]) VALUES (4, N'Unity', 7, CAST(0x0000AC8600A5F845 AS DateTime))
INSERT [dbo].[tblTag] ([Tag_ID], [Tag_Title], [Tag_CountSearch], [Tag_DateAdd]) VALUES (5, N'Wordpress', 3, CAST(0x0000AC8600A60280 AS DateTime))
INSERT [dbo].[tblTag] ([Tag_ID], [Tag_Title], [Tag_CountSearch], [Tag_DateAdd]) VALUES (6, N'Code miễn phí', 1, CAST(0x0000AC8600A67DA9 AS DateTime))
INSERT [dbo].[tblTag] ([Tag_ID], [Tag_Title], [Tag_CountSearch], [Tag_DateAdd]) VALUES (7, N'MVC', 7, CAST(0x0000AC870136259A AS DateTime))
INSERT [dbo].[tblTag] ([Tag_ID], [Tag_Title], [Tag_CountSearch], [Tag_DateAdd]) VALUES (8, N'Phần mềm - ứng dụng', 1, CAST(0x0000AC8C0096C66D AS DateTime))
INSERT [dbo].[tblTag] ([Tag_ID], [Tag_Title], [Tag_CountSearch], [Tag_DateAdd]) VALUES (9, N'IOT', 1, CAST(0x0000AC9301771022 AS DateTime))
INSERT [dbo].[tblTag] ([Tag_ID], [Tag_Title], [Tag_CountSearch], [Tag_DateAdd]) VALUES (10, N'Unity', 1, CAST(0x0000AC940000FB4A AS DateTime))
INSERT [dbo].[tblTag] ([Tag_ID], [Tag_Title], [Tag_CountSearch], [Tag_DateAdd]) VALUES (11, N'Wordpress', 1, CAST(0x0000AC9400015988 AS DateTime))
INSERT [dbo].[tblTag] ([Tag_ID], [Tag_Title], [Tag_CountSearch], [Tag_DateAdd]) VALUES (12, N'Wordpress', 1, CAST(0x0000AC9400027DCE AS DateTime))
INSERT [dbo].[tblTag] ([Tag_ID], [Tag_Title], [Tag_CountSearch], [Tag_DateAdd]) VALUES (13, N'Android', 4, CAST(0x0000AC940002C461 AS DateTime))
INSERT [dbo].[tblTag] ([Tag_ID], [Tag_Title], [Tag_CountSearch], [Tag_DateAdd]) VALUES (14, N'IOS', 6, CAST(0x0000AC940003E968 AS DateTime))
INSERT [dbo].[tblTag] ([Tag_ID], [Tag_Title], [Tag_CountSearch], [Tag_DateAdd]) VALUES (15, N'Laravel', 1, CAST(0x0000AC94009CD0CA AS DateTime))
INSERT [dbo].[tblTag] ([Tag_ID], [Tag_Title], [Tag_CountSearch], [Tag_DateAdd]) VALUES (16, N'C#', 1, CAST(0x0000AC9400AD4A1E AS DateTime))
SET IDENTITY_INSERT [dbo].[tblTag] OFF
SET IDENTITY_INSERT [dbo].[tblUser] ON 

INSERT [dbo].[tblUser] ([User_ID], [User_DisplayName], [User_Password], [User_DateLogin], [User_Active], [User_Trash], [User_Token], [User_Role], [User_Email], [User_Avata], [User_VIP], [User_Phone], [User_Point], [User_Coin]) VALUES (3, N'Thanh', N'Thanh1412@', CAST(0x0000AC77013FF1DC AS DateTime), 1, 0, N'10096b4e-0df5-454a-9acf-96b14a174dac', 2, N'tanthanh141214@gmail.com', N'man-300x300.png', 0, N'0949287875', 0, 988)
INSERT [dbo].[tblUser] ([User_ID], [User_DisplayName], [User_Password], [User_DateLogin], [User_Active], [User_Trash], [User_Token], [User_Role], [User_Email], [User_Avata], [User_VIP], [User_Phone], [User_Point], [User_Coin]) VALUES (4, N'Thanh1902@1', N'Thanh190299@', CAST(0x0000AC7900EAEA48 AS DateTime), 1, 0, N'066c7ab7-6424-4ca4-880b-9fa7366a93b8', 2, N'hatanthanh190299@gmail.com', N'man-300x300.png', 0, N'0949287875', 0, 0)
INSERT [dbo].[tblUser] ([User_ID], [User_DisplayName], [User_Password], [User_DateLogin], [User_Active], [User_Trash], [User_Token], [User_Role], [User_Email], [User_Avata], [User_VIP], [User_Phone], [User_Point], [User_Coin]) VALUES (5, N'Admin', N'admin', CAST(0x0000AC7900EAEA48 AS DateTime), 1, 0, NULL, 1, N'admin@gmail.com', N'man-300x300.png', 0, N'0949287875', 0, 1000)
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
ALTER TABLE [dbo].[tblRate]  WITH CHECK ADD  CONSTRAINT [FK_tblRate_tblPost] FOREIGN KEY([Rate_Post])
REFERENCES [dbo].[tblPost] ([Post_ID])
GO
ALTER TABLE [dbo].[tblRate] CHECK CONSTRAINT [FK_tblRate_tblPost]
GO
ALTER TABLE [dbo].[tblRate]  WITH CHECK ADD  CONSTRAINT [FK_tblRate_tblUser] FOREIGN KEY([Rate_User])
REFERENCES [dbo].[tblUser] ([User_ID])
GO
ALTER TABLE [dbo].[tblRate] CHECK CONSTRAINT [FK_tblRate_tblUser]
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
