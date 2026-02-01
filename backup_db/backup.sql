IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'ShoeGalaxy')
BEGIN
    CREATE DATABASE [ShoeGalaxy];
END
GO

USE [ShoeGalaxy]
GO
/****** Object:  Database [ShoeGalaxy]    Script Date: 12/17/2026 10:37:48 AM ******/


IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShoeGalaxy].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShoeGalaxy] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShoeGalaxy] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShoeGalaxy] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShoeGalaxy] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShoeGalaxy] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShoeGalaxy] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ShoeGalaxy] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShoeGalaxy] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShoeGalaxy] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShoeGalaxy] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShoeGalaxy] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShoeGalaxy] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShoeGalaxy] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShoeGalaxy] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShoeGalaxy] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ShoeGalaxy] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShoeGalaxy] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShoeGalaxy] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShoeGalaxy] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShoeGalaxy] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShoeGalaxy] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShoeGalaxy] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShoeGalaxy] SET RECOVERY FULL 
GO
ALTER DATABASE [ShoeGalaxy] SET  MULTI_USER 
GO
ALTER DATABASE [ShoeGalaxy] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShoeGalaxy] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShoeGalaxy] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShoeGalaxy] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ShoeGalaxy] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ShoeGalaxy', N'ON'
GO
USE [ShoeGalaxy]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 12/17/2026 10:37:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[fullname] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[photo] [nvarchar](50) NULL,
	[available] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 12/17/2026 10:37:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addresses](
	[address_id] [int] IDENTITY(1,1) NOT NULL,
	[account_username] [nvarchar](50) NOT NULL,
	[address_detail] [nvarchar](255) NOT NULL,
	[city] [nvarchar](255) NULL,
	[district] [nvarchar](100) NULL,
	[ward] [nvarchar](100) NULL,
	[street] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[address_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Authorities]    Script Date: 12/17/2026 10:37:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Authorities](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[roleId] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 12/17/2026 10:37:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Categories](
	[id] [char](4) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[available] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[comments]    Script Date: 12/17/2026 10:37:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[create_date] [date] NOT NULL,
	[product_id] [int] NOT NULL,
	[username] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[contacts]    Script Date: 12/17/2026 10:37:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[contacts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fullname] [nvarchar](255) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[phone] [varchar](20) NOT NULL,
	[subject] [nvarchar](255) NULL,
	[message] [text] NOT NULL,
	[create_Date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[discount_codes]    Script Date: 12/17/2026 10:37:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[discount_codes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [varchar](255) NOT NULL,
	[discount_amount] [decimal](10, 2) NOT NULL,
	[quantity] [int] NOT NULL,
	[start_Date] [date] NOT NULL,
	[end_DATE] [date] NOT NULL,
	[activate] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[discount_product]    Script Date: 12/17/2026 10:37:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[discount_product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[start_Date] [date] NOT NULL,
	[end_Date] [date] NOT NULL,
	[percentage] [float] NOT NULL,
	[active] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Images]    Script Date: 12/17/2026 10:37:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[image] [nvarchar](100) NULL,
	[product_id] [int] NULL,
 CONSTRAINT [PK_Images] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 12/17/2026 10:37:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[order_id] [bigint] NULL,
	[product_id] [int] NULL,
	[price] [float] NOT NULL,
	[quantity] [int] NOT NULL,
	[size] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 12/17/2026 10:37:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NULL,
	[create_date] [datetime] NOT NULL,
	[address] [nvarchar](100) NOT NULL,
	[nguoinhan] [nvarchar](50) NOT NULL,
	[tongtien] [float] NOT NULL,
	[available] [bit] NULL,
	[discountID] [int] NULL,
	[city] [nvarchar](255) NULL,
	[status] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 12/17/2026 10:37:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[category_id] [char](4) NULL,
	[name] [nvarchar](50) NOT NULL,
	[price] [float] NOT NULL,
	[quantity] [int] NULL,
	[available] [bit] NOT NULL,
	[description] [nvarchar](500) NULL,
 CONSTRAINT [PK__Products__3213E83FE24BFA19] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[replys]    Script Date: 12/17/2026 10:37:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[replys](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[create_date] [date] NOT NULL,
	[product_id] [int] NOT NULL,
	[comment_id] [int] NOT NULL,
	[username] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Roles]    Script Date: 12/17/2026 10:37:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Roles](
	[id] [varchar](10) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ShoppingCarts]    Script Date: 12/17/2026 10:37:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingCarts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NULL,
	[product_id] [int] NULL,
	[image] [nvarchar](100) NULL,
	[name] [nvarchar](50) NULL,
	[size] [int] NULL,
	[price] [float] NULL,
	[qty] [int] NULL,
	[total] [float] NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_ShoppingCarts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sizes]    Script Date: 12/17/2026 10:37:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sizes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NULL,
	[size] [int] NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Accounts] ([username], [password], [fullname], [email], [photo], [available]) VALUES (N'Admin', N'123', N'Admin ShoeGalaxy11', N'ShoeGalaxy@gmail.com', N'3522aeb1.jpg', 1)
INSERT [dbo].[Accounts] ([username], [password], [fullname], [email], [photo], [available]) VALUES (N'asddd', N'516', N'Phạm Hiếu', N'hoanhuynh12344@gmail.com', N'nv01.jpg', 1)
INSERT [dbo].[Accounts] ([username], [password], [fullname], [email], [photo], [available]) VALUES (N'fff', N'ltpo', N'qwe', N'h@gmail.com', N'a15edeab.jpg', 1)
INSERT [dbo].[Accounts] ([username], [password], [fullname], [email], [photo], [available]) VALUES (N'hieuptps24504@fpt.edu.vn', N'18b6bcf6107', N'Pham Trung Hieu FPL HCM', N'hieuptps24504@fpt.edu.vn', NULL, 1)
INSERT [dbo].[Accounts] ([username], [password], [fullname], [email], [photo], [available]) VALUES (N'nguyenpham242003@gmail.com', N'242003dn', N'Phạm Đăng Nguyên', N'nguyenpham242003@gmail.com', NULL, 1)
INSERT [dbo].[Accounts] ([username], [password], [fullname], [email], [photo], [available]) VALUES (N'NV01', N'123', N'Phạm Trung Hiếu', N'hieupt@fpt.edu.vn', N'hieu.jpg', 1)
INSERT [dbo].[Accounts] ([username], [password], [fullname], [email], [photo], [available]) VALUES (N'NV02', N'123', N'Huỳnh Đức Hoàn', N'hoanhd@fpt.edu.vn', N'hoan.jpg', 1)
INSERT [dbo].[Accounts] ([username], [password], [fullname], [email], [photo], [available]) VALUES (N'NV03', N'$2a$10$kConEDunmfD9ulKRtu', N'Bùi Xuân Việt', N'vietbx@fpt.edu.vn', N'viet.jpg', 0)
INSERT [dbo].[Accounts] ([username], [password], [fullname], [email], [photo], [available]) VALUES (N'phamthieu961@gmail.com', N'18b6c3a02f8', N'Hiếu Phạm', N'phamthieu961@gmail.com', NULL, 1)
INSERT [dbo].[Accounts] ([username], [password], [fullname], [email], [photo], [available]) VALUES (N'vietbx23@gmail.com', N'$2a$10$xOeDVqzT2gxdjhNmza', N'Việt Bùi Xuân', N'vietbx23@gmail.com', NULL, 1)
INSERT [dbo].[Accounts] ([username], [password], [fullname], [email], [photo], [available]) VALUES (N'vietbxps22788@fpt.edu.vn', N'$2a$10$WSp6KeDWahsQSOMC4U', N'Bui Xuan Viet (FPL HCM_K17)', N'vietbxps22788@fpt.edu.vn', NULL, 0)
INSERT [dbo].[Accounts] ([username], [password], [fullname], [email], [photo], [available]) VALUES (N'XuanViet123', N'$2a$10$x7nTXEDP.sMkgMz3zk', N'Bùi Xuân Việt', N'vietbx23@gmail.com', N'nv01.jpg', 0)
SET IDENTITY_INSERT [dbo].[Addresses] ON 

INSERT [dbo].[Addresses] ([address_id], [account_username], [address_detail], [city], [district], [ward], [street]) VALUES (1, N'NV01', N'68 Phùng Văn Cung, Phường 07, Quận Phú Nhuận, Thành phố Hồ Chí Minh', N'Thành phố Hồ Chí Minh', N'Quận Phú Nhuận', N'Phường 07', N'68 Phùng Văn Cung')
INSERT [dbo].[Addresses] ([address_id], [account_username], [address_detail], [city], [district], [ward], [street]) VALUES (2, N'NV01', N'68 Phùng Văn Cung, Phường Châu Khê, Thành phố Từ Sơn, Tỉnh Bắc Ninh', N'Tỉnh Bắc Ninh', N'Thành phố Từ Sơn', N'Phường Châu Khê', N'68 Phùng Văn Cung')
INSERT [dbo].[Addresses] ([address_id], [account_username], [address_detail], [city], [district], [ward], [street]) VALUES (3, N'nv01', N'68 Phùng Văn Cung, Xã Phú Lương, Huyện Phú Vang, Tỉnh Thừa Thiên Huế', N'Tỉnh Thừa Thiên Huế', N'Huyện Phú Vang', N'Xã Phú Lương', N'68 Phùng Văn Cung')
INSERT [dbo].[Addresses] ([address_id], [account_username], [address_detail], [city], [district], [ward], [street]) VALUES (4, N'nv01', N'68 Phùng Văn Cung, Xã Hố Quáng Phìn, Huyện Đồng Văn, Tỉnh Hà Giang', N'Tỉnh Hà Giang', N'Huyện Đồng Văn', N'Xã Hố Quáng Phìn', N'68 Phùng Văn Cung')
INSERT [dbo].[Addresses] ([address_id], [account_username], [address_detail], [city], [district], [ward], [street]) VALUES (5, N'nv01', N'69 Quận 1, Phường Dĩnh Kế, Thành phố Bắc Giang, Tỉnh Bắc Giang', N'Tỉnh Bắc Giang', N'Thành phố Bắc Giang', N'Phường Dĩnh Kế', N'69 Quận 1')
INSERT [dbo].[Addresses] ([address_id], [account_username], [address_detail], [city], [district], [ward], [street]) VALUES (6, N'phamthieu961@gmail.com', N'68 Phùng Văn Cung, Phường Cổ Nhuế 1, Quận Bắc Từ Liêm, Thành phố Hà Nội', N'Thành phố Hà Nội', N'Quận Bắc Từ Liêm', N'Phường Cổ Nhuế 1', N'68 Phùng Văn Cung')
INSERT [dbo].[Addresses] ([address_id], [account_username], [address_detail], [city], [district], [ward], [street]) VALUES (7, N'phamthieu961@gmail.com', N'68 Phùng Văn Cung, Xã Sơn Phú, Huyện Na Hang, Tỉnh Tuyên Quang', N'Tỉnh Tuyên Quang', N'Huyện Na Hang', N'Xã Sơn Phú', N'68 Phùng Văn Cung')
INSERT [dbo].[Addresses] ([address_id], [account_username], [address_detail], [city], [district], [ward], [street]) VALUES (8, N'phamthieu961@gmail.com', N'68 Phùng Văn Cung, Xã Quang Phục, Huyện Tiên Lãng, Thành phố Hải Phòng', N'Thành phố Hải Phòng', N'Huyện Tiên Lãng', N'Xã Quang Phục', N'68 Phùng Văn Cung')
INSERT [dbo].[Addresses] ([address_id], [account_username], [address_detail], [city], [district], [ward], [street]) VALUES (11, N'hieuptps24504@fpt.edu.vn', N'68 Phùng Văn Cung, Xã Vạn Phúc, Huyện Thanh Trì, Thành phố Hà Nội', N'Thành phố Hà Nội', N'Huyện Thanh Trì', N'Xã Vạn Phúc', N'68 Phùng Văn Cung')
INSERT [dbo].[Addresses] ([address_id], [account_username], [address_detail], [city], [district], [ward], [street]) VALUES (12, N'admin', N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa, Xã Duyên Hà, Huyện Thanh Trì, Thành phố Hà Nội', N'Thành phố Hà Nội', N'Huyện Thanh Trì', N'Xã Duyên Hà', N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa')
INSERT [dbo].[Addresses] ([address_id], [account_username], [address_detail], [city], [district], [ward], [street]) VALUES (13, N'vietbxps22788@fpt.edu.vn', N'Thôn Phước Lộc, Xã Lộc Tiến, Huyện Phú Lộc, Tỉnh Thừa Thiên Huế', N'Tỉnh Thừa Thiên Huế', N'Huyện Phú Lộc', N'Xã Lộc Tiến', N'Thôn Phước Lộc')
INSERT [dbo].[Addresses] ([address_id], [account_username], [address_detail], [city], [district], [ward], [street]) VALUES (14, N'nv02', N'aâe, Xã Phủ Lý, Huyện Phú Lương, Tỉnh Thái Nguyên', N'Tỉnh Thái Nguyên', N'Huyện Phú Lương', N'Xã Phủ Lý', N'aâe')
INSERT [dbo].[Addresses] ([address_id], [account_username], [address_detail], [city], [district], [ward], [street]) VALUES (15, N'nguyenpham242003@gmail.com', N'HCm, Xã Phấn Mễ, Huyện Phú Lương, Tỉnh Thái Nguyên', N'Tỉnh Thái Nguyên', N'Huyện Phú Lương', N'Xã Phấn Mễ', N'HCm')
INSERT [dbo].[Addresses] ([address_id], [account_username], [address_detail], [city], [district], [ward], [street]) VALUES (18, N'vietbx23@gmail.com', N'12, Xã Nậm Khánh, Huyện Bắc Hà, Tỉnh Lào Cai', N'Tỉnh Lào Cai', N'Huyện Bắc Hà', N'Xã Nậm Khánh', N'12')
INSERT [dbo].[Addresses] ([address_id], [account_username], [address_detail], [city], [district], [ward], [street]) VALUES (19, N'XuanViet123', N'123, Xã Cao Dương, Huyện Lương Sơn, Tỉnh Hoà Bình', N'Tỉnh Hoà Bình', N'Huyện Lương Sơn', N'Xã Cao Dương', N'123')
INSERT [dbo].[Addresses] ([address_id], [account_username], [address_detail], [city], [district], [ward], [street]) VALUES (20, N'duchoan', N'123, Xã Sơn Lôi, Huyện Bình Xuyên, Tỉnh Vĩnh Phúc', N'Tỉnh Vĩnh Phúc', N'Huyện Bình Xuyên', N'Xã Sơn Lôi', N'123')
INSERT [dbo].[Addresses] ([address_id], [account_username], [address_detail], [city], [district], [ward], [street]) VALUES (21, N'asddd', N'68 ppp, Xã Hoàng Xá, Huyện Thanh Thuỷ, Tỉnh Phú Thọ', N'Tỉnh Phú Thọ', N'Huyện Thanh Thuỷ', N'Xã Hoàng Xá', N'68 ppp')
SET IDENTITY_INSERT [dbo].[Addresses] OFF
SET IDENTITY_INSERT [dbo].[Authorities] ON 

INSERT [dbo].[Authorities] ([id], [username], [roleId]) VALUES (1, N'NV01', N'DIRE')
INSERT [dbo].[Authorities] ([id], [username], [roleId]) VALUES (2, N'NV02', N'STAF')
INSERT [dbo].[Authorities] ([id], [username], [roleId]) VALUES (3, N'NV03', N'CUST')
INSERT [dbo].[Authorities] ([id], [username], [roleId]) VALUES (4, N'NV01', N'CUST')
INSERT [dbo].[Authorities] ([id], [username], [roleId]) VALUES (5, N'nv11', N'CUST')
INSERT [dbo].[Authorities] ([id], [username], [roleId]) VALUES (6, N'phamthieu961@gmail.com', N'CUST')
INSERT [dbo].[Authorities] ([id], [username], [roleId]) VALUES (7, N'phamthieu961@gmail.com', N'CUST')
INSERT [dbo].[Authorities] ([id], [username], [roleId]) VALUES (8, N'hh3935890@gmail.com', N'CUST')
INSERT [dbo].[Authorities] ([id], [username], [roleId]) VALUES (9, N'hh3935890@gmail.com', N'CUST')
INSERT [dbo].[Authorities] ([id], [username], [roleId]) VALUES (10, N'phamthieu961@gmail.com', N'CUST')
INSERT [dbo].[Authorities] ([id], [username], [roleId]) VALUES (11, N'hh3935890@gmail.com', N'CUST')
INSERT [dbo].[Authorities] ([id], [username], [roleId]) VALUES (12, N'phamthieu961@gmail.com', N'CUST')
INSERT [dbo].[Authorities] ([id], [username], [roleId]) VALUES (13, N'phamthieu961@gmail.com', N'CUST')
INSERT [dbo].[Authorities] ([id], [username], [roleId]) VALUES (14, N'hh3935890@gmail.com', N'CUST')
INSERT [dbo].[Authorities] ([id], [username], [roleId]) VALUES (15, N'phamthieu961@gmail.com', N'CUST')
INSERT [dbo].[Authorities] ([id], [username], [roleId]) VALUES (16, N'hieuptps24504@fpt.edu.vn', N'CUST')
INSERT [dbo].[Authorities] ([id], [username], [roleId]) VALUES (17, N'phamthieu961@gmail.com', N'CUST')
INSERT [dbo].[Authorities] ([id], [username], [roleId]) VALUES (18, N'phamthieu961@gmail.com', N'CUST')
INSERT [dbo].[Authorities] ([id], [username], [roleId]) VALUES (19, N'phamthieu961@gmail.com', N'CUST')
INSERT [dbo].[Authorities] ([id], [username], [roleId]) VALUES (20, N'phamthieu961@gmail.com', N'CUST')
INSERT [dbo].[Authorities] ([id], [username], [roleId]) VALUES (21, N'nv111', N'CUST')
INSERT [dbo].[Authorities] ([id], [username], [roleId]) VALUES (22, N'nv222', N'CUST')
INSERT [dbo].[Authorities] ([id], [username], [roleId]) VALUES (24, N'Admin', N'DIRE')
INSERT [dbo].[Authorities] ([id], [username], [roleId]) VALUES (25, N'vietbxps22788@fpt.edu.vn', N'CUST')
INSERT [dbo].[Authorities] ([id], [username], [roleId]) VALUES (26, N'nguyenpham242003@gmail.com', N'CUST')
INSERT [dbo].[Authorities] ([id], [username], [roleId]) VALUES (27, N'vietbx23@gmail.com', N'CUST')
INSERT [dbo].[Authorities] ([id], [username], [roleId]) VALUES (40, N'duchoan', N'CUST')
INSERT [dbo].[Authorities] ([id], [username], [roleId]) VALUES (42, N'duchoan', N'CUST')
INSERT [dbo].[Authorities] ([id], [username], [roleId]) VALUES (43, N'asddd', N'CUST')
SET IDENTITY_INSERT [dbo].[Authorities] OFF
INSERT [dbo].[Categories] ([id], [name], [available]) VALUES (N'AD  ', N'SDSDS', 0)
INSERT [dbo].[Categories] ([id], [name], [available]) VALUES (N'M   ', N'MLB', 1)
INSERT [dbo].[Categories] ([id], [name], [available]) VALUES (N'NK  ', N'Nike', 1)
INSERT [dbo].[Categories] ([id], [name], [available]) VALUES (N'puma', N'PUMA', 1)
SET IDENTITY_INSERT [dbo].[comments] ON 

INSERT [dbo].[comments] ([id], [description], [create_date], [product_id], [username]) VALUES (1037, N'123234', CAST(N'2026-11-29' AS Date), 1, N'vietbx23@gmail.com')
INSERT [dbo].[comments] ([id], [description], [create_date], [product_id], [username]) VALUES (1038, N'123', CAST(N'2026-11-29' AS Date), 1, N'vietbx23@gmail.com')
INSERT [dbo].[comments] ([id], [description], [create_date], [product_id], [username]) VALUES (1043, N'123', CAST(N'2026-11-30' AS Date), 2, N'XuanViet123')
SET IDENTITY_INSERT [dbo].[comments] OFF
SET IDENTITY_INSERT [dbo].[contacts] ON 

INSERT [dbo].[contacts] ([id], [fullname], [email], [phone], [subject], [message], [create_Date]) VALUES (1, N'HieuPt', N'phamthieu961@gmail.com', N'123333333333', N'Lô', N'aaaaaaaaaa', CAST(N'2026-11-18' AS Date))
INSERT [dbo].[contacts] ([id], [fullname], [email], [phone], [subject], [message], [create_Date]) VALUES (2, N'Bùi Xuân Việt', N'Viebx23@gmail.com', N'0932718625', N'Viebx23@gmail.com', N'call me', CAST(N'2026-11-26' AS Date))
SET IDENTITY_INSERT [dbo].[contacts] OFF
SET IDENTITY_INSERT [dbo].[discount_codes] ON 

INSERT [dbo].[discount_codes] ([id], [code], [discount_amount], [quantity], [start_Date], [end_DATE], [activate]) VALUES (1, N'KM01', CAST(30.00 AS Decimal(10, 2)), 9, CAST(N'2013-10-13' AS Date), CAST(N'2026-10-29' AS Date), 1)
INSERT [dbo].[discount_codes] ([id], [code], [discount_amount], [quantity], [start_Date], [end_DATE], [activate]) VALUES (2, N'1', CAST(1.00 AS Decimal(10, 2)), 0, CAST(N'2026-10-11' AS Date), CAST(N'2026-10-21' AS Date), 1)
INSERT [dbo].[discount_codes] ([id], [code], [discount_amount], [quantity], [start_Date], [end_DATE], [activate]) VALUES (3, N'BXV', CAST(10.00 AS Decimal(10, 2)), 983, CAST(N'2026-10-13' AS Date), CAST(N'2024-10-31' AS Date), 1)
SET IDENTITY_INSERT [dbo].[discount_codes] OFF
SET IDENTITY_INSERT [dbo].[discount_product] ON 

INSERT [dbo].[discount_product] ([id], [product_id], [name], [start_Date], [end_Date], [percentage], [active]) VALUES (18, 1, N'SALEOFFPART1', CAST(N'2026-09-30' AS Date), CAST(N'2026-12-31' AS Date), 20, 1)
INSERT [dbo].[discount_product] ([id], [product_id], [name], [start_Date], [end_Date], [percentage], [active]) VALUES (26, 2, N'SALEOFFQTPN', CAST(N'2026-10-09' AS Date), CAST(N'2026-12-01' AS Date), 30, 1)
INSERT [dbo].[discount_product] ([id], [product_id], [name], [start_Date], [end_Date], [percentage], [active]) VALUES (32, 25, N'10', CAST(N'2026-09-24' AS Date), CAST(N'2026-11-11' AS Date), 20, 1)
INSERT [dbo].[discount_product] ([id], [product_id], [name], [start_Date], [end_Date], [percentage], [active]) VALUES (38, 3, N'MAN', CAST(N'2026-11-09' AS Date), CAST(N'2026-11-19' AS Date), 20, 1)
INSERT [dbo].[discount_product] ([id], [product_id], [name], [start_Date], [end_Date], [percentage], [active]) VALUES (40, 20, N'ttt', CAST(N'2026-11-16' AS Date), CAST(N'2026-11-21' AS Date), 50, 1)
SET IDENTITY_INSERT [dbo].[discount_product] OFF
SET IDENTITY_INSERT [dbo].[Images] ON 

INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (1, N'm1_1.jpg', 1)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (2, N'm1_2.jpg', 1)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (3, N'm1_3.jpg', 1)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (4, N'm2_1.jpg', 2)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (5, N'm2_2.jpg', 2)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (6, N'm2_3.jpg', 2)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (7, N'm3_1.jpg', 3)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (8, N'm3_2.jpg', 3)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (9, N'm3_3.jpg', 3)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (10, N'm4_1.jpg', 4)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (11, N'm4_2.jpg', 4)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (12, N'm4_3.jpg', 4)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (13, N'm7_1.jpg', 5)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (14, N'm7_2.jpg', 5)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (15, N'm7_3.jpg', 5)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (16, N'm8_1.jpg', 6)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (17, N'm8_2.jpg', 6)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (18, N'm8_3.jpg', 6)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (19, N'm9_1.jpg', 7)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (20, N'm9_2.jpg', 7)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (21, N'm9_3.jpg', 7)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (22, N'a1_1.jpg', 8)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (23, N'a1_2.jpg', 8)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (24, N'a1_3.jpg', 8)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (25, N'a2_1.jpg', 9)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (26, N'a2_2.jpg', 9)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (27, N'a2_3.jpg', 9)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (28, N'a3_1.jpg', 10)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (29, N'a3_2.jpg', 10)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (30, N'a3_3.jpg', 10)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (31, N'a4_1.jpg', 11)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (32, N'a4_2.jpg', 11)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (33, N'a4_3.jpg', 11)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (34, N'a5_1.webp', 12)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (35, N'a5_2.webp', 12)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (36, N'a5_3.webp', 12)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (37, N'a6_1.webp', 13)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (38, N'a6_2.webp', 13)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (39, N'a6_3.webp', 13)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (40, N'a7_1.webp', 14)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (41, N'a7_2.webp', 14)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (42, N'a7_3.webp', 14)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (43, N'a8_1.webp', 15)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (44, N'a8_2.webp', 15)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (45, N'a8_3.webp', 15)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (46, N'n1_1.jpg', 16)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (47, N'n1_2.jpg', 16)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (48, N'n1_3.jpg', 16)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (49, N'n2_1.png', 17)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (50, N'n2_2.jpg', 17)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (51, N'n2_3.jpg', 17)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (52, N'n3_1.png', 18)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (53, N'n3_2.jpg', 18)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (54, N'n3_3.jpg', 18)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (55, N'n4_1.jpg', 19)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (56, N'n4_2.jpg', 19)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (57, N'n4_3.webp', 19)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (58, N'n5_1.webp', 20)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (59, N'n5_2.webp', 20)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (60, N'n5_3.webp', 20)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (61, N'n6_1.webp', 21)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (62, N'n6_2.webp', 21)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (63, N'n6_3.webp', 21)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (64, N'n7_1.webp', 22)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (65, N'n7_2.webp', 22)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (66, N'n7_3.webp', 22)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (67, N'n8_1.webp', 23)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (68, N'n8_2.webp', 23)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (69, N'n8_3.webp', 23)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (70, N'n9_1.webp', 24)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (71, N'n9_2.webp', 24)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (72, N'n9_3.webp', 24)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (73, N'n10_1.jpg', 25)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (74, N'n10_2.webp', 25)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (75, N'n10_3.webp', 25)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (76, N'a1.webp', 31)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (77, N'puma1_1.jpg', 35)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (78, N'puma1_2.jpg', 35)
INSERT [dbo].[Images] ([id], [image], [product_id]) VALUES (79, N'puma1_3.jpg', 35)
SET IDENTITY_INSERT [dbo].[Images] OFF
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (2, 2, 24, 50, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (4, 4, 16, 35, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (5, 5, 24, 50, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (7, 7, 24, 50, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (8, 8, 9, 100, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (10, 9, 1, 90, 2, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (11, 9, 1, 90, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (12, 9, 1, 90, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (13, 10, 9, 100, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (14, 10, 9, 100, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (15, 10, 10, 80, 2, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (16, 10, 10, 80, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (18, 11, 8, 90, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (19, 12, 8, 90, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (20, 13, 8, 90, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (21, 14, 8, 90, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (22, 15, 8, 90, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (23, 16, 8, 90, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (24, 17, 1, 90, 2, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (25, 17, 1, 90, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (26, 17, 1, 90, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (27, 18, 9, 100, 2, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (28, 18, 9, 100, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (29, 19, 8, 90, 2, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (30, 19, 8, 90, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (31, 19, 8, 90, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (32, 20, 1, 90, 2, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (33, 21, 1, 90, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (34, 22, 1, 90, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (35, 23, 2, 90, 2, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (36, 24, 8, 90, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (37, 25, 9, 100, 2, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (38, 25, 9, 100, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (39, 26, 1, 90, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (40, 27, 1, 90, 2, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (41, 27, 1, 90, 2, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (42, 28, 8, 90, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (43, 28, 10, 80, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (44, 29, 8, 90, 2, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (45, 29, 8, 90, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (46, 30, 1, 90, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (47, 31, 9, 100, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (48, 32, 9, 100, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (49, 33, 9, 100, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (50, 34, 2, 90, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (51, 34, 4, 60, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (52, 35, 8, 90, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (53, 36, 1, 90, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (54, 36, 1, 90, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (55, 37, 1, 90, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (56, 38, 1, 90, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (57, 39, 1, 90, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (58, 40, 1, 90, 2, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (59, 41, 1, 90, 4, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (60, 42, 1, 90, 2, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (61, 43, 1, 90, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (62, 44, 1, 90, 2, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (63, 45, 1, 90, 2, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (64, 46, 1, 90, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (65, 47, 1, 90, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (66, 48, 1, 90, 4, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (67, 49, 1, 90, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (68, 50, 1, 90, 29, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (69, 51, 2, 90, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (70, 52, 1, 90, 1, 41)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (71, 53, 1, 90, 1, 40)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (72, 54, 1, 90, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (73, 55, 1, 90, 2, 40)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (74, 56, 1, 90, 1, 40)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (75, 56, 3, 90, 1, 40)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (76, 56, 2, 90, 1, 41)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (77, 56, 7, 60, 1, 41)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (78, 57, 1, 90, 1, 40)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (79, 57, 3, 90, 1, 40)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (80, 57, 2, 90, 1, 41)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (81, 57, 7, 60, 1, 41)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (82, 58, 1, 90, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (83, 59, 1, 90, 1, 40)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (84, 59, 2, 90, 1, 40)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (85, 60, 2, 90, 1, 42)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (86, 61, 5, 50, 1, 38)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (87, 61, 6, 90, 1, 38)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (88, 62, 1, 90, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (89, 63, 2, 90, 2, 41)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (90, 64, 2, 90, 1, 42)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (91, 65, 1, 90, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (92, 66, 1, 90, 1, 40)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (93, 67, 1, 90, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (94, 68, 1, 90, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (95, 69, 1, 90, 2, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (96, 70, 1, 90, 2, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (97, 71, 1, 90, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (98, 72, 1, 90, 2, 40)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (99, 73, 2, 90, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (100, 74, 1, 90, 2, 41)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (101, 75, 1, 90, 1, 40)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (102, 76, 1, 90, 3, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (103, 76, 1, 90, 1, 40)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (104, 77, 1, 90, 1, 39)
GO
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (105, 78, 1, 90, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (106, 79, 1, 90, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (107, 80, 1, 90, 3, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (108, 81, 1, 90, 2, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (109, 82, 1, 90, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (116, 88, 1, 72, 1, 40)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (117, 89, 1, 72, 1, 41)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (118, 90, 8, 180, 2, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (119, 91, 8, 180, 2, 40)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (120, 92, 1, 72, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (121, 92, 1, 72, 1, 41)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (122, 93, 1, 72, 1, 43)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (123, 94, 1, 90, 1, 40)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (124, 94, 5, 50, 1, 43)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (125, 95, 1, 90, 1, 40)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (126, 95, 5, 50, 1, 43)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (127, 96, 1, 90, 1, 40)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (128, 96, 5, 50, 1, 43)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (129, 97, 2, 90, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (130, 98, 1, 90, 1, 40)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (131, 98, 2,  90, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (132, 99, 1, 72, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (133, 100, 2, 90, 1, 40)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (134, 101, 1, 72, 1, 40)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (135, 102, 1, 72, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (136, 103, 2, 90, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (137, 104, 1, 72, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (145, 111, 1, 72, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (148, 114, 1, 72, 1, 40)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (152, 118, 1, 72, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (154, 120, 1, 72, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (168, 134, 1, 72, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (169, 135, 1, 72, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (170, 136, 1, 144, 2, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (174, 140, 1, 90, 2, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (175, 141, 1, 72, 1, 40)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (176, 141, 1, 432, 6, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (177, 141, 8, 90, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (178, 142, 1, 180, 2, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (179, 143, 1, 90, 1, 40)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (180, 143, 1, 180, 2, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (181, 144, 1, 90, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (182, 145, 1, 90, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (183, 146, 1, 90, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (184, 147, 1, 90, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (185, 148, 1, 72, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (186, 148, 2, 90, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (187, 149, 3, 90, 1, 40)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (188, 149, 1, 216, 3, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (189, 150, 1, 288, 4, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (190, 151, 1, 72, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (191, 152, 1, 72, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (192, 152, 1, 90, 1, 42)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (193, 153, 1, 72, 1, 43)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (194, 153, 2, 63, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (195, 154, 10, 80, 1, 38)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (196, 154, 10, 80, 1, 41)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (10193, 10153, 2, 63, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (10194, 10159, 1, 72, 1, 40)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (10195, 10159, 2, 63, 1, 42)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (10196, 10160, 18, 90, 1, 40)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (10197, 10160, 17, 90, 1, 41)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (10198, 10160, 16, 35, 1, 41)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (10199, 10161, 2, 63, 1, 43)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (10200, 10161, 5, 50, 1, 43)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (10201, 10162, 4, 120, 2, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (10202, 10162, 19, 60, 1, 44)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (10203, 10162, 17, 180, 2, 40)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (20194, 20159, 2, 90, 1, 43)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (20195, 20159, 5, 50, 1, 43)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (20196, 20160, 1, 72, 1, 40)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (20197, 20160, 1, 144, 2, 43)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (20198, 20161, 8, 90, 1, 38)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (20199, 20162, 2, 63, 1, 43)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (20200, 20163, 3, 72, 1, 44)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (20201, 20163, 3, 72, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (20202, 20164, 20, 20, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (20203, 20165, 20, 20, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (20204, 20166, 1, 90, 2, 43)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (20205, 20166, 2, 90, 4, 42)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (20206, 20167, 1, 90, 1, 42)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (20207, 20168, 1, 90, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (20210, 20180, 1, 90, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (20211, 20181, 2, 63, 1, 44)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (20212, 20182, 2, 90, 1, 44)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (20220, 20186, 1, 72, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (20221, 20187, 3, 90, 1, 41)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (20222, 20188, 1, 72, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (20223, 20189, 1, 144, 2, 40)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (20224, 20190, 1, 72, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (20225, 20191, 1, 72, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (20226, 20192, 1, 360, 5, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (20227, 20193, 1, 90, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (20228, 20194, 1, 90, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (20229, 20195, 1, 288, 4, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (20260, 20196, 1, 72, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (20261, 20197, 1, 72, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (20262, 20197, 2, 90, 1, 39)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (20263, 20198, 1, 4320, 60, 40)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (20264, 20199, 1, 4320, 60, 40)
GO
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [price], [quantity], [size]) VALUES (20265, 20200, 2, 1440, 16, 39)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (2, N'NV01', CAST(N'2026-02-01 00:00:00.000' AS DateTime), N'68 Phú Nhuận', N'Hiếu', 50, 1, 1, NULL, N'Đang Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (4, N'NV01', CAST(N'2026-04-01 00:00:00.000' AS DateTime), N'68 Phú Nhuận', N'Hiếu', 35, 1, 2, NULL, N'Đã Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (5, N'NV01', CAST(N'2026-05-01 00:00:00.000' AS DateTime), N'68 Phú Nhuận', N'Hiếu', 50, 1, 3, NULL, N'Đang Xác Nhận')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (7, N'NV01', CAST(N'2021-12-01 00:00:00.000' AS DateTime), N'68 Phú Nhuận', N'Hiếu', 50, 1, 2, NULL, N'Đã Hủy')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (8, N'nv01', CAST(N'2026-08-09 15:47:29.523' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa, Quận Bình Tân, Thành Phố Hồ Chí Minh', N'Hoàng Đình Được', 260, 1, 3, NULL, N'Đang Xác Nhận')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (9, N'nv01', CAST(N'2026-08-09 15:58:48.833' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa, Quận Bình Tân, Thành Phố Hồ Chí Minh', N'Hoàng Đình Được', 360, 1, 1, NULL, N'Đang Xác Nhận')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (10, N'nv01', CAST(N'2026-08-09 22:43:41.627' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa, Quận Bình Tân, Thành Phố Hồ Chí Minh', N'Hoàng Đình Được', 440, 1, 3, NULL, N'Đang Xác Nhận')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (11, N'nv01', CAST(N'2026-08-09 22:46:21.603' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa, Quận Bình Tân, Thành Phố Hồ Chí Minh', N'Hoàng Đình Được', 180, 1, 2, NULL, N'Đang Xác Nhận')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (12, N'nv01', CAST(N'2026-08-09 22:46:51.013' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa, Quận Bình Tân, Thành Phố Hồ Chí Minh', N'Hoàng Đình Được', 90, 1, 1, NULL, N'Đang Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (13, N'nv01', CAST(N'2026-08-09 22:49:43.683' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa, Quận Bình Tân, Thành Phố Hồ Chí Minh', N'Hoàng Đình Được', 90, 1, 2, NULL, N'Đã Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (14, N'nv01', CAST(N'2026-08-09 22:55:40.667' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa, Quận Bình Tân, Thành Phố Hồ Chí Minh', N'Hoàng Đình Được', 90, 1, 3, NULL, N'Đang Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (15, N'nv01', CAST(N'2026-08-09 22:58:18.820' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa, Quận Bình Tân, Thành Phố Hồ Chí Minh', N'Hoàng Đình Được', 90, 1, 1, NULL, N'Đang Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (16, N'nv01', CAST(N'2026-08-09 22:58:38.257' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa, Quận Bình Tân, Thành Phố Hồ Chí Minh', N'Hoàng Đình Được', 90, 1, 2, NULL, N'Đang Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (17, N'nv01', CAST(N'2026-08-10 19:00:56.697' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa, Quận Bình Tân, Thành Phố Hồ Chí Minh', N'Hoàng Đình Được', 360, 1, 3, N'Thành Phố Hồ Chí Minh', N'Đang Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (18, N'NV01', CAST(N'2026-08-10 19:03:30.010' AS DateTime), N'305 Lý Thái Tộ Thôn Hiệp Tiến, xã Tân Tiến', N'Bùi Xuân Việt', 300, 1, 1, NULL, N'Đang Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (19, N'NV01', CAST(N'2026-09-07 15:28:13.090' AS DateTime), N'Quận BÌnh Tân, Thành Phố Hồ Chí Minh', N'Bùi Xuân Việt', 360, 1, 2, NULL, N'Đang Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (20, N'NV01', CAST(N'2026-09-07 15:49:40.587' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa, Quận Bình Tân, Thành Phố Hồ Chí Minh', N'Hoàng Đình Được', 180, 1, 3, NULL, N'Đang Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (21, N'NV01', CAST(N'2026-09-07 16:23:21.150' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa, Quận Bình Tân, Thành Phố Hồ Chí Minh', N'Hoàng Đình Được', 90, 1, 1, NULL, N'Đang Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (22, N'NV01', CAST(N'2026-09-12 08:03:44.553' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa', N'Bùi Xuân Việt', 90, 1, 2, NULL, N'Đang Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (23, N'NV01', CAST(N'2026-09-12 08:04:11.500' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa', N'Bùi Xuân Việt', 179.82, 1, 3, NULL, N'Đang Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (24, N'NV01', CAST(N'2026-09-12 09:43:39.000' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa', N'Bùi Xuân Việt', 63, 1, 1, NULL, N'Đang Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (25, N'NV01', CAST(N'2026-09-13 13:18:28.010' AS DateTime), N'Quận BÌnh Tân, Thành Phố Hồ Chí Minh', N'Bùi Xuân Việt', 269.7, 1, 2, NULL, N'Đang Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (26, N'NV01', CAST(N'2026-09-13 14:37:38.710' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa', N'Bùi Xuân Việt', 80.91, 1, 1, NULL, N'Đang Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (27, N'nv01', CAST(N'2026-09-13 15:37:55.510' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa', N'Bùi Xuân Việt', 323.64, 1, 2, NULL, N'Đang Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (28, N'nv01', CAST(N'2026-09-13 15:49:06.637' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa', N'Bùi Xuân Việt', 170, 1, 3, NULL, N'Đang Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (29, N'NV03', CAST(N'2026-09-14 16:28:59.500' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa', N'Bùi Xuân Việt', 242.73, 1, 1, NULL, N'Đang Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (30, N'NV01', CAST(N'2026-09-26 08:11:04.497' AS DateTime), N'Quận BÌnh Tân, Thành Phố Hồ Chí Minh', N'Bùi Xuân Việt', 63, 1, 3, NULL, N'Đang Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (31, N'NV01', CAST(N'2026-09-27 11:19:34.427' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa', N'Bùi Xuân Việt', 100, 1, 1, NULL, N'Đang Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (32, N'NV01', CAST(N'2026-09-27 11:21:08.283' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa', N'Bùi Xuân Việt', 100, 1, 3, NULL, N'Đang Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (33, N'NV01', CAST(N'2026-09-27 11:22:02.593' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa', N'Bùi Xuân Việt', 100, 1, 3, NULL, N'Đang Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (34, N'NV01', CAST(N'2026-09-27 11:22:39.387' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa', N'Bùi Xuân Việt', 117, 1, 1, NULL, N'Đang Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (35, N'NV01', CAST(N'2026-09-27 12:08:33.787' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa', N'Bùi Xuân Việt', 90, 1, 2, NULL, N'Đang Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (36, N'NV01', CAST(N'2026-09-28 08:14:19.790' AS DateTime), N'Quận BÌnh Tân, Thành Phố Hồ Chí Minh', N'Bùi Xuân Việt', 126, 1, 3, NULL, N'Đang Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (37, N'NV01', CAST(N'2026-09-30 13:02:40.860' AS DateTime), N'Quận BÌnh Tân, Thành Phố Hồ Chí Minh', N'NGUYEN THANH HAU', 63, 1, 2, NULL, N'Đang Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (38, N'NV01', CAST(N'2026-09-30 14:25:00.993' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa', N'Bùi Xuân Việt', 63, 1, 2, NULL, N'Đang Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (39, N'NV01', CAST(N'2026-09-30 14:37:16.997' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa', N'Bùi Xuân Việt', 63, 1, 2, NULL, N'Đang Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (40, N'NV01', CAST(N'2026-09-30 14:37:39.327' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa', N'Bùi Xuân Việt', 126, 1, 1, NULL, N'Đang Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (41, N'NV01', CAST(N'2026-09-30 14:38:05.883' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa', N'Bùi Xuân Việt', 252, 1, 1, NULL, N'Đang Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (42, N'NV01', CAST(N'2026-09-30 14:39:59.650' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa', N'Bùi Xuân Việt', 126, 1, 2, NULL, N'Đang Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (43, N'NV01', CAST(N'2026-09-30 14:40:30.560' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa', N'Bùi Xuân Việt', 63, 1, 3, NULL, N'Đang Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (44, N'NV01', CAST(N'2026-09-30 14:41:23.127' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa', N'Bùi Xuân Việt', 126, 1, 1, NULL, N'Đang Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (45, N'NV01', CAST(N'2026-09-30 14:42:09.093' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa', N'Bùi Xuân Việt', 126, 1, 2, NULL, N'Đang Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (46, N'NV01', CAST(N'2026-09-30 14:42:30.317' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa', N'Bùi Xuân Việt', 63, 1, 3, NULL, N'Đang Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (47, N'NV01', CAST(N'2026-09-30 14:44:04.937' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa', N'Bùi Xuân Việt', 63, 1, 1, NULL, N'Đang Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (48, N'NV01', CAST(N'2026-09-30 14:45:54.870' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa', N'Bùi Xuân Việt', 252, 1, 2, NULL, N'Đang Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (49, N'NV01', CAST(N'2026-09-30 15:32:18.223' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa', N'Bùi Xuân Việt', 63, 1, 1, NULL, N'Đang Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (50, N'NV01', CAST(N'2026-09-30 15:33:38.087' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa', N'Bùi Xuân Việt', 1827, 1, 2, NULL, N'Đang Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (51, N'NV01', CAST(N'2026-10-06 20:37:50.297' AS DateTime), N'Quận BÌnh Tân, Thành Phố Hồ Chí Minh', N'Bùi Xuân Việt', 56.7, 1, 3, NULL, N'Đang Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (52, N'NV01', CAST(N'2026-10-06 20:39:40.997' AS DateTime), N'Quận BÌnh Tân, Thành Phố Hồ Chí Minh', N'Bùi Xuân Việt', 56.7, 1, 1, NULL, N'Đang Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (53, N'NV01', CAST(N'2026-10-06 20:41:56.893' AS DateTime), N'Quận BÌnh Tân, Thành Phố Hồ Chí Minh', N'Bùi Xuân Việt', 56.7, 1, 1, NULL, N'Đang Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (54, N'NV01', CAST(N'2026-10-10 19:45:43.537' AS DateTime), N'Quận BÌnh Tân, Thành Phố Hồ Chí Minh', N'Bùi Xuân Việt', 63, 1, 3, NULL, N'Đang Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (55, N'NV01', CAST(N'2026-10-10 20:11:20.107' AS DateTime), N'Quận BÌnh Tân, Thành Phố Hồ Chí Minh', N'NGUYEN THANH HAU', 144, 1, 2, NULL, N'Đang Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (56, N'NV01', CAST(N'2026-10-13 19:35:21.867' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa', N'Bùi Xuân Việt', 142.5, 1, 1, NULL, N'Đang Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (57, N'NV01', CAST(N'2026-10-13 19:35:22.007' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa', N'Bùi Xuân Việt', 142.5, 1, 1, NULL, N'Đang Xác Nhận')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (58, N'NV01', CAST(N'2026-10-13 19:41:03.257' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa', N'Bùi Xuân Việt', 72, 1, 3, NULL, N'Đang Xác Nhận')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (59, N'NV01', CAST(N'2026-10-14 07:55:08.137' AS DateTime), N'Quận BÌnh Tân, Thành Phố Hồ Chí Minh', N'Bùi Xuân Việt', 67.5, 1, 3, NULL, N'Đang Xác Nhận')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (60, N'NV01', CAST(N'2026-10-14 08:02:52.310' AS DateTime), N'Quận BÌnh Tân, Thành Phố Hồ Chí Minh', N'Bùi Xuân Việt', 31.5, 1, 3, NULL, N'Đang Xác Nhận')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (61, N'NV01', CAST(N'2026-10-14 08:32:21.313' AS DateTime), N'Quận BÌnh Tân, Thành Phố Hồ Chí Minh', N'NGUYEN THANH HAU', 70, 1, 3, NULL, N'Đang Xác Nhận')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (62, N'NV01', CAST(N'2026-10-14 08:50:00.210' AS DateTime), N'Quận BÌnh Tân, Thành Phố Hồ Chí Minh', N'NGUYEN THANH HAU', 72, 1, NULL, NULL, N'Đang Xác Nhận')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (63, N'NV01', CAST(N'2026-10-14 08:50:13.957' AS DateTime), N'Quận BÌnh Tân, Thành Phố Hồ Chí Minh', N'Bùi Xuân Việt', 126, 1, NULL, NULL, N'Đang Xác Nhận')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (64, N'NV01', CAST(N'2026-10-14 09:06:39.537' AS DateTime), N'Quận BÌnh Tân, Thành Phố Hồ Chí Minh', N'Bùi Xuân Việt', 63, 1, NULL, NULL, N'Đang Xác Nhận')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (65, N'NV01', CAST(N'2026-10-14 09:09:05.623' AS DateTime), N'Quận BÌnh Tân, Thành Phố Hồ Chí Minh', N'Bùi Xuân Việt', 72, 1, NULL, NULL, N'Đang Xác Nhận')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (66, N'NV01', CAST(N'2026-10-14 09:16:35.887' AS DateTime), N'Quận BÌnh Tân, Thành Phố Hồ Chí Minh', N'Bùi Xuân Việt', 36, 1, 3, NULL, N'Đang Xác Nhận')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (67, N'NV01', CAST(N'2026-10-14 09:25:58.963' AS DateTime), N'Quận BÌnh Tân, Thành Phố Hồ Chí Minh', N'Bùi Xuân Việt', 72, 1, NULL, NULL, N'Đang Xác Nhận')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (68, N'NV01', CAST(N'2026-10-14 09:48:43.847' AS DateTime), N'Quận BÌnh Tân, Thành Phố Hồ Chí Minh', N'Bùi Xuân Việt', 36, 1, 3, NULL, N'Đang Xác Nhận')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (69, N'NV01', CAST(N'2026-10-14 09:53:14.810' AS DateTime), N'Quận BÌnh Tân, Thành Phố Hồ Chí Minh', N'Bùi Xuân Việt', 72, 1, 3, NULL, N'Đang Xác Nhận')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (70, N'NV01', CAST(N'2026-10-14 09:55:16.693' AS DateTime), N'Quận BÌnh Tân, Thành Phố Hồ Chí Minh', N'Bùi Xuân Việt', 72, 1, 3, NULL, N'Đang Xác Nhận')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (71, N'NV01', CAST(N'2026-10-14 09:56:40.613' AS DateTime), N'Quận BÌnh Tân, Thành Phố Hồ Chí Minh', N'Bùi Xuân Việt', 36, 1, 3, NULL, N'Đang Xác Nhận')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (72, N'NV01', CAST(N'2026-10-14 09:59:08.160' AS DateTime), N'Quận BÌnh Tân, Thành Phố Hồ Chí Minh', N'Bùi Xuân Việt', 72, 1, 3, NULL, N'Đang Xác Nhận')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (73, N'NV01', CAST(N'2026-10-14 10:00:02.690' AS DateTime), N'Quận BÌnh Tân, Thành Phố Hồ Chí Minh', N'Bùi Xuân Việt', 31.5, 1, 3, NULL, N'Đã Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (74, N'nv01', CAST(N'2026-10-14 10:47:59.607' AS DateTime), N'68 Phùng Văn Cung', N'HieuPt', 72, 1, 3, NULL, N'Đã Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (75, N'nv01', CAST(N'2026-10-14 03:48:44.000' AS DateTime), N'68 Phùng Văn Cung', N'HieuPt', 72, 1, NULL, NULL, N'Đã Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (76, N'nv01', CAST(N'2026-10-14 11:24:38.850' AS DateTime), N'68 Phùng Văn Cung', N'HieuPt', 288, 1, NULL, N'1231123', N'Đã Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (77, N'nv01', CAST(N'2026-10-14 12:28:33.213' AS DateTime), N'68 Phùng Văn Cung', N'HieuPt', 72, 1, NULL, NULL, N'Đã Hủy')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (78, N'nv01', CAST(N'2026-10-14 12:32:39.000' AS DateTime), N'68 Phùng Văn Cung', N'HieuPt', 72, 1, NULL, NULL, N'Đã Hủy')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (79, N'nv01', CAST(N'2026-10-14 12:36:57.547' AS DateTime), N'69 phung van cung, Phường 07, Quận Phú Nhuận, Thành phố Hồ Chí Minh', N'HieuPt', 72, 1, NULL, NULL, N'Đã Hủy')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (80, N'nv01', CAST(N'2026-10-14 05:55:30.000' AS DateTime), N'69 phung van cung, Xã Thèn Sin, Huyện Tam Đường', N'HieuPt', 216, 1, NULL, NULL, N'Đã Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (81, N'nv01', CAST(N'2026-10-14 06:02:23.000' AS DateTime), N'68 Phùng Văn Cung, Phường 07, Quận Phú Nhuận', N'HieuPt', 144, 1, NULL, NULL, N'Đã Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (82, N'nv01', CAST(N'2026-10-14 07:25:01.000' AS DateTime), N'68 Phùng Văn Cung, Phường 07, Quận Phú Nhuận', N'HieuPt', 72, 1, NULL, NULL, N'Đã Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (88, N'nv01', CAST(N'2026-10-17 20:32:21.107' AS DateTime), N'68 Phùng Văn Cung, Xã Đồng Ruộng, Huyện Đà Bắc, Tỉnh Hoà Bình', N'HieuPt', 72, 1, NULL, N'Tỉnh Hoà Bình', N'Đã Hủy')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (89, N'nv01', CAST(N'2026-10-18 09:48:25.580' AS DateTime), N'69 Quận 1, Xã Chu Điện, Huyện Lục Nam, Tỉnh Bắc Giang', N'HieuPt', 72, 1, NULL, N'Tỉnh Bắc Giang', N'Đã Hủy')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (90, N'nv01', CAST(N'2026-10-19 20:29:01.177' AS DateTime), N'68 Phùng Văn Cung, Phường Châu Khê, Thành phố Từ Sơn, Tỉnh Bắc Ninh', N'HieuPt', 180, 1, NULL, N'Tỉnh Bắc Ninh', N'Đã Hủy')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (91, N'nv01', CAST(N'2026-10-19 20:30:14.743' AS DateTime), N'68 Phùng Văn Cung, Phường Trần Phú, Thành phố Hà Giang, Tỉnh Hà Giang', N'HieuPt', 180, 1, NULL, NULL, N'Đã Hủy')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (92, N'nv01', CAST(N'2026-10-20 11:16:53.320' AS DateTime), N'69 phung van cung, Xã Tổng Cọt, Huyện Hà Quảng, Tỉnh Cao Bằng', N'HieuPt', 144, 1, NULL, N'Tỉnh Cao Bằng', N'Đã Hủy')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (93, N'nv01', CAST(N'2026-10-20 11:20:10.430' AS DateTime), N'69 Quận 1, Phường Phú Lương, Quận Hà Đông, Thành phố Hà Nội', N'HieuPt', 72, 1, NULL, N'Thành phố Hà Nội', N'Đã Hủy')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (94, N'nv01', CAST(N'2026-10-20 04:24:09.000' AS DateTime), N'68 Phùng Văn Cung, Xã Sơn Đông, Thị xã Sơn Tây', N'HieuPt', 122, 1, NULL, N'Thành phố Hà Nội', N'Đã Hủy')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (95, N'nv01', CAST(N'2026-10-20 04:24:09.000' AS DateTime), N'68 Phùng Văn Cung, Xã Sơn Đông, Thị xã Sơn Tây', N'HieuPt', 122, 1, NULL, N'Thành phố Hà Nội', N'Đã Hủy')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (96, N'nv01', CAST(N'2026-10-20 04:24:09.000' AS DateTime), N'68 Phùng Văn Cung, Xã Sơn Đông, Thị xã Sơn Tây', N'HieuPt', 122, 1, NULL, N'Thành phố Hà Nội', N'Đã Hủy')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (97, N'nv01', CAST(N'2026-10-20 04:27:56.000' AS DateTime), N'68 Phùng Văn Cung, Phường Trần Hưng Đạo, Quận Hoàn Kiếm', N'HieuPt', 90, 1, NULL, N'Thành phố Hà Nội', N'Đã Hủy')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (98, N'nv01', CAST(N'2026-10-21 05:42:29.000' AS DateTime), N'68 Phùng Văn Cung, Phường 07, Quận Phú Nhuận, Thành phố Hồ Chí Minh', N'HieuPt', 162, 1, NULL, N'Thành phố Hồ Chí Minh', N'Đã Hủy')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (99, N'nv01', CAST(N'2026-10-21 13:42:20.557' AS DateTime), N'68 Phùng Văn Cung, Phường 07, Quận Phú Nhuận, Thành phố Hồ Chí Minh', N'HieuPt', 72, 1, NULL, NULL, N'Đã Hủy')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (100, N'nv01', CAST(N'2026-10-21 14:12:16.663' AS DateTime), N'68 Phùng Văn Cung, Phường Châu Khê, Thành phố Từ Sơn, Tỉnh Bắc Ninh', N'HieuPt', 90, 1, NULL, NULL, N'Đã Hủy')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (101, N'nv01', CAST(N'2026-10-21 18:53:30.890' AS DateTime), N'68 Phùng Văn Cung, Phường 07, Quận Phú Nhuận, Thành phố Hồ Chí Minh', N'Phạm Trung Hiếu', 72, 1, NULL, NULL, N'Đã Hủy')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (102, N'nv01', CAST(N'2026-10-21 18:55:33.380' AS DateTime), N'68 Phùng Văn Cung, Phường 07, Quận  Phú Nhuận, Thành phố Hồ Chí Minh', N'Phạm Trung Hiếu', 72, 1, NULL, NULL, N'Đã Hủy')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (103, N'nv01', CAST(N'2026-10-21 18:57:05.553' AS DateTime), N'68 Phùng Văn Cung, Phường 07, Quận Phú Nhuận, Thành phố Hồ Chí Minh', N'Phạm Trung Hiếu', 90, 1, NULL, NULL, N'Đã Hủy')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (104, N'nv01', CAST(N'2026-10-21 18:58:41.000' AS DateTime), N'68 Phùng Văn Cung, Phường 07, Quận  Phú Nhuận, Thành phố Hồ Chí Minh', N'Phạm Trung Hiếu', 72, 1, NULL, NULL, N'Đã Hủy')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (111, N'nv01', CAST(N'2026-10-21 20:12:46.910' AS DateTime), N'68 Phùng Văn Cung, Phường 07, Quận  Phú Nhuận, Thành phố Hồ Chí Minh', N'Phạm Trung Hiếu', 72, 1, NULL, N'Thành phố Hồ Chí Minh', N'Đã Hủy')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (114, N'nv01', CAST(N'2026-10-21 20:16:36.480' AS DateTime), N'68 Phùng Văn Cung, Phường 07, Quận  Phú Nhuận, Thành phố Hồ Chí Minh', N'Phạm Trung Hiếu', 72, 1, NULL, N'Thành phố Hồ Chí Minh', N'Đã Hủy')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (118, N'nv01', CAST(N'2026-10-21 20:25:15.427' AS DateTime), N'68 Phùng Văn Cung, Phường 07, Quận  Phú Nhuận, Thành phố Hồ Chí Minh', N'Phạm Trung Hiếu', 72, 1, NULL, N'Thành phố Hồ Chí Minh', N'Đang Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (120, N'nv01', CAST(N'2026-10-21 20:26:47.713' AS DateTime), N'68 Phùng Văn Cung, Phường 07, Quận  Phú Nhuận, Thành phố Hồ Chí Minh', N'Phạm Trung Hiếu', 72, 1, NULL, N'Thành phố Hồ Chí Minh', N'Đang Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (134, N'nv01', CAST(N'2026-10-21 21:38:34.267' AS DateTime), N'68 Phùng Văn Cung, Phường Châu Khê, Thành phố Từ Sơn, Tỉnh Bắc Ninh', N'Phạm Trung Hiếu', 72, 1, NULL, NULL, N'Đang Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (135, N'nv01', CAST(N'2026-10-22 06:39:51.340' AS DateTime), N'68 Phùng Văn Cung, Phường Châu Khê, Thành phố Từ Sơn, Tỉnh Bắc Ninh', N'Phạm Trung Hiếu', 72, 1, NULL, N'Tỉnh Bắc Ninh', N'Đang Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (136, N'nv01', CAST(N'2026-10-22 07:00:04.697' AS DateTime), N'68 Phùng Văn Cung, Xã Phú Lương, Huyện Phú Vang, Tỉnh Thừa Thiên Huế', N'Phạm Trung Hiếu', 144, 1, NULL, N'Tỉnh Thừa Thiên Huế', N'Đang Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (140, N'nv01', CAST(N'2026-10-22 02:17:29.000' AS DateTime), N'68 Phùng Văn Cung, Xã Phú Lương, Huyện Phú Vang, Tỉnh Thừa Thiên Huế', N'Phạm Trung Hiếu', 144, 1, NULL, N'Tỉnh Thừa Thiên Huế', N'Đang Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (141, N'nv01', CAST(N'2026-10-23 21:52:24.763' AS DateTime), N'68 Phùng Văn Cung, Phường 07, Quận Phú Nhuận, Thành phố Hồ Chí Minh', N'Phạm Trung Hiếu', 594, 1, NULL, N'Thành phố Hồ Chí Minh', N'Đang Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (142, N'phamthieu961@gmail.com', CAST(N'2026-10-24 20:36:10.407' AS DateTime), N'68 Phùng Văn Cung, Phường Cổ Nhuế 1, Quận Bắc Từ Liêm, Thành phố Hà Nội', N'Hiếu Phạm', 180, 1, NULL, N'Thành phố Hà Nội', N'Đang Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (143, N'phamthieu961@gmail.com', CAST(N'2026-10-25 15:04:54.350' AS DateTime), N'68 Phùng Văn Cung, Xã Quang Phục, Huyện Tiên Lãng, Thành phố Hải Phòng', N'Hiếu Phạm', 270, 1, NULL, N'Thành phố Hải Phòng', N'Đang Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (144, N'phamthieu961@gmail.com', CAST(N'2026-10-25 08:29:49.000' AS DateTime), N'68 Phùng Văn Cung, Xã Quang Phục, Huyện Tiên Lãng, Thành phố Hải Phòng', N'Hiếu Phạm', 90, 1, NULL, N'Thành phố Hải Phòng', N'Đang Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (145, N'nv01', CAST(N'2026-10-25 08:38:25.000' AS DateTime), N'68 Phùng Văn Cung, Phường 07, Quận Phú Nhuận, Thành phố Hồ Chí Minh', N'Phạm Trung Hiếu', 72, 1, NULL, N'Thành phố Hồ Chí Minh', N'Đã Hủy')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (146, N'nv01', CAST(N'2026-10-25 20:01:31.847' AS DateTime), N'68 Phùng Văn Cung, Phường Mỹ Đình 1, Quận Nam Từ Liêm, Thành phố Hà Nội', N'Phạm Trung Hiếu', 90, 0, NULL, N'Thành phố Hà Nội', N'Đang Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (147, N'phamthieu961@gmail.com', CAST(N'2026-10-26 18:43:44.230' AS DateTime), N'68 Phùng Văn Cung, Phường Cổ Nhuế 1, Quận Bắc Từ Liêm, Thành phố Hà Nội', N'Hiếu Phạm', 90, 0, NULL, N'Thành phố Hà Nội', N'Đang Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (148, N'phamthieu961@gmail.com', CAST(N'2026-10-26 18:46:24.433' AS DateTime), N'68 Phùng Văn Cung, Phường Cổ Nhuế 1, Quận Bắc Từ Liêm, Thành phố Hà Nội', N'Hiếu Phạm', 162, 0, NULL, N'Thành phố Hà Nội', N'Đã Hủy')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (149, N'hieuptps24504@fpt.edu.vn', CAST(N'2026-10-26 19:00:18.060' AS DateTime), N'68 Phùng Văn Cung, Xã Yên Hòa, Huyện Đà Bắc, Tỉnh Hoà Bình', N'Pham Trung Hieu FPL HCM', 306, 1, NULL, N'Tỉnh Hoà Bình', N'Đã Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (150, N'phamthieu961@gmail.com', CAST(N'2026-10-26 20:36:56.857' AS DateTime), N'68 Phùng Văn Cung, Phường Cổ Nhuế 1, Quận Bắc Từ Liêm, Thành phố Hà Nội', N'Hiếu Phạm', 288, 0, NULL, N'Thành phố Hà Nội', N'Đang Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (151, N'NV01', CAST(N'2026-10-31 09:54:03.357' AS DateTime), N'68 Phùng Văn Cung, Phường 07, Quận Phú Nhuận, Thành phố Hồ Chí Minh', N'Phạm Trung Hiếu', 72, 0, NULL, N'Thành phố Hồ Chí Minh', N'Đã Hủy')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (152, N'admin', CAST(N'2026-10-31 18:51:08.147' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa, Xã Duyên Hà, Huyện Thanh Trì, Thành phố Hà Nội', N'Admin ShoeGalaxy', 162, 1, NULL, N'Thành phố Hà Nội', N'Đã Hủy')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (153, N'NV01', CAST(N'2026-11-03 08:37:43.230' AS DateTime), N'68 Phùng Văn Cung, Phường 07, Quận Phú Nhuận, Thành phố Hồ Chí Minh', N'Phạm Trung Hiếu', 135, 0, NULL, N'Thành phố Hồ Chí Minh', N'Đã Hủy')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (154, N'NV01', CAST(N'2026-11-03 08:42:09.707' AS DateTime), N'69 Quận 1, Phường Dĩnh Kế, Thành phố Bắc Giang', N'Phạm Trung Hiếu', 160, 0, NULL, N'Tỉnh Bắc Giang', N'Đang Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (10153, N'NV01', CAST(N'2026-11-05 12:25:09.510' AS DateTime), N'68 Phùng Văn Cung, Phường 07, Quận Phú Nhuận, Thành phố Hồ Chí Minh', N'Phạm Trung Hiếu', 63, 0, NULL, N'Thành phố Hồ Chí Minh', N'Đã Hủy')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (10159, N'ADMIN', CAST(N'2026-11-06 11:08:41.440' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa, Xã Duyên Hà, Huyện Thanh Trì, Thành phố Hà Nội', N'Admin ShoeGalaxy', 135, 0, NULL, N'Thành phố Hà Nội', N'Đã Hủy')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (10160, N'ADMIN', CAST(N'2026-11-07 07:50:30.457' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa, Xã Duyên Hà, Huyện Thanh Trì, Thành phố Hà Nội', N'Admin ShoeGalaxy', 215, 1, NULL, N'Thành phố Hà Nội', N'Đang Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (10161, N'ADMIN', CAST(N'2026-11-07 08:31:37.250' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa, Xã Duyên Hà, Huyện Thanh Trì, Thành phố Hà Nội', N'Admin ShoeGalaxy', 113, 0, NULL, N'Thành phố Hà Nội', N'Đã Hủy')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (10162, N'ADMIN', CAST(N'2026-11-07 13:53:00.657' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa, Xã Duyên Hà, Huyện Thanh Trì, Thành phố Hà Nội', N'Admin ShoeGalaxy', 360, 0, NULL, N'Thành phố Hà Nội', N'Đã Hủy')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (20159, N'ADMIN', CAST(N'2026-11-08 17:57:15.393' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa, Xã Duyên Hà, Huyện Thanh Trì, Thành phố Hà Nội', N'Admin ShoeGalaxy', 140, 0, NULL, N'Thành phố Hà Nội', N'Đã Hủy')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (20160, N'vietbxps22788@fpt.edu.vn', CAST(N'2026-11-08 21:25:10.657' AS DateTime), N'Thôn Phước Lộc, Xã Lộc Tiến, Huyện Phú Lộc, Tỉnh Thừa Thiên Huế', N'Bui Xuan Viet (FPL HCM_K17)', 216, 1, NULL, N'Tỉnh Thừa Thiên Huế', N'Đã Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (20161, N'nv01', CAST(N'2026-11-11 12:44:27.780' AS DateTime), N'68 Phùng Văn Cung, Phường Châu Khê, Thành phố Từ Sơn, Tỉnh Bắc Ninh', N'Phạm Trung Hiếu', 90, 0, NULL, N'Tỉnh Bắc Ninh', N'Đang Xác Nhận')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (20162, N'nv01', CAST(N'2026-11-12 14:17:58.180' AS DateTime), N'68 Phùng Văn Cung, Phường Châu Khê, Thành phố Từ Sơn, Tỉnh Bắc Ninh', N'Phạm Trung Hiếu', 63, 0, NULL, N'Tỉnh Bắc Ninh', N'Đang Xác Nhận')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (20163, N'nv02', CAST(N'2026-11-17 19:00:38.317' AS DateTime), N'aâe, Xã Phủ Lý, Huyện Phú Lương, Tỉnh Thái Nguyên', N'Huỳnh Đức Hoàn', 144, 1, NULL, N'Tỉnh Thái Nguyên', N'Đang Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (20164, N'nv02', CAST(N'2026-11-17 19:33:00.787' AS DateTime), N'aâe, Xã Phủ Lý, Huyện Phú Lương, Tỉnh Thái Nguyên', N'Huỳnh Đức Hoàn', 20, 0, NULL, N'Tỉnh Thái Nguyên', N'Đang Hủy')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (20165, N'nguyenpham242003@gmail.com', CAST(N'2026-11-17 19:35:43.503' AS DateTime), N'HCm, Xã Phấn Mễ, Huyện Phú Lương, Tỉnh Thái Nguyên', N'Phạm Đăng Nguyên', 20, 0, NULL, N'Tỉnh Thái Nguyên', N'Đang Hủy')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (20166, N'nv01', CAST(N'2026-11-18 16:48:18.137' AS DateTime), N'68 Phùng Văn Cung, Phường 07, Quận Phú Nhuận, Thành phố Hồ Chí Minh', N'Phạm Trung Hiếu', 396, 0, NULL, N'Thành phố Hồ Chí Minh', N'Đang Xác Nhận')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (20167, N'nv01', CAST(N'2026-11-30 14:29:00.040' AS DateTime), N'68 Phùng Văn Cung, Phường 07, Quận Phú Nhuận, Thành phố Hồ Chí Minh', N'Phạm Trung Hiếu', 90, 0, NULL, N'Thành phố Hồ Chí Minh', N'Đang Xác Nhận')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (20168, N'vietbxps22788@fpt.edu.vn', CAST(N'2026-11-30 15:04:55.540' AS DateTime), N'Thôn Phước Lộc, Xã Lộc Tiến, Huyện Phú Lộc, Tỉnh Thừa Thiên Huế', N'Bui Xuan Viet (FPL HCM_K17)', 81, 0, NULL, N'Tỉnh Thừa Thiên Huế', N'Đang Xác Nhận')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (20180, N'vietbx23@gmail.com', CAST(N'2026-11-30 16:00:39.493' AS DateTime), N'12, Xã Nậm Khánh, Huyện Bắc Hà, Tỉnh Lào Cai', N'Việt Bùi Xuân', 90, 0, NULL, N'Tỉnh Lào Cai', N'Đang Xác Nhận')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (20181, N'vietbx23@gmail.com', CAST(N'2026-11-30 16:01:32.893' AS DateTime), N'12, Xã Nậm Khánh, Huyện Bắc Hà, Tỉnh Lào Cai', N'Việt Bùi Xuân', 63, 0, NULL, N'Tỉnh Lào Cai', N'Đang Xác Nhận')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (20182, N'vietbx23@gmail.com', CAST(N'2026-11-30 16:03:06.470' AS DateTime), N'12, Xã Nậm Khánh, Huyện Bắc Hà, Tỉnh Lào Cai', N'Việt Bùi Xuân', 81, 0, NULL, N'Tỉnh Lào Cai', N'Đang Xác Nhận')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (20186, N'XuanViet123', CAST(N'2026-11-30 16:18:45.400' AS DateTime), N'123, Xã Cao Dương, Huyện Lương Sơn, Tỉnh Hoà Bình', N'Bùi Xuân Việt', 72, 0, NULL, N'Tỉnh Hoà Bình', N'Đang Xác Nhận')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (20187, N'ADMIN', CAST(N'2026-11-30 17:22:35.757' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa, Xã Duyên Hà, Huyện Thanh Trì, Thành phố Hà Nội', N'Admin ShoeGalaxy', 90, 0, NULL, N'Thành phố Hà Nội', N'Đã Hủy')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (20188, N'vietbx23@gmail.com', CAST(N'2026-11-30 17:45:15.813' AS DateTime), N'12, Xã Nậm Khánh, Huyện Bắc Hà, Tỉnh Lào Cai', N'Việt Bùi Xuân', 72, 0, NULL, N'Tỉnh Lào Cai', N'Đang Xác Nhận')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (20189, N'vietbx23@gmail.com', CAST(N'2026-11-30 17:52:18.990' AS DateTime), N'12, Xã Nậm Khánh, Huyện Bắc Hà, Tỉnh Lào Cai', N'Việt Bùi Xuân', 129.6, 0, NULL, N'Tỉnh Lào Cai', N'Đang Xác Nhận')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (20190, N'XuanViet123', CAST(N'2026-11-30 20:28:16.493' AS DateTime), N'123, Xã Cao Dương, Huyện Lương Sơn, Tỉnh Hoà Bình', N'Bùi Xuân Việt', 64.8, 0, NULL, N'Tỉnh Hoà Bình', N'Đang Xác Nhận')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (20191, N'asddd', CAST(N'2026-12-07 12:59:24.543' AS DateTime), N'68 ppp, Xã Hoàng Xá, Huyện Thanh Thuỷ, Tỉnh Phú Thọ', N'Phạm Hiếu', 72, 0, NULL, N'Tỉnh Phú Thọ', N'Đang Xác Nhận')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (20192, N'nv01', CAST(N'2026-12-10 19:34:32.153' AS DateTime), N'68 Phùng Văn Cung, Phường Châu Khê, Thành phố Từ Sơn, Tỉnh Bắc Ninh', N'Phạm Trung Hiếu', 360, 0, NULL, N'Tỉnh Bắc Ninh', N'Đang Xác Nhận')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (20193, N'nv01', CAST(N'2026-12-11 03:49:44.000' AS DateTime), N'68 Phùng Văn Cung, Phường 07, Quận Phú Nhuận, Thành phố Hồ Chí Minh', N'Phạm Trung Hiếu', 90, 1, NULL, N'Thành phố Hồ Chí Minh', N'Đang Xác Nhận')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (20194, N'nv01', CAST(N'2026-12-11 21:26:48.580' AS DateTime), N'68 Phùng Văn Cung, Phường 07, Quận Phú Nhuận, Thành phố Hồ Chí Minh', N'Phạm Trung Hiếu', 90, 0, NULL, N'Thành phố Hồ Chí Minh', N'Đang Xác Nhận')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (20195, N'ADMIN', CAST(N'2026-12-17 10:16:02.997' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa, Xã Duyên Hà, Huyện Thanh Trì, Thành phố Hà Nội', N'Admin ShoeGalaxy11', 288, 0, NULL, N'Thành phố Hà Nội', N'Đang Xác Nhận')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (20196, N'ADMIN', CAST(N'2026-12-17 10:17:06.390' AS DateTime), N'205/20 Phạm Đăng Giảng, Phường Bình Hưng Hòa, Xã Duyên Hà, Huyện Thanh Trì, Thành phố Hà Nội', N'Admin ShoeGalaxy11', 72, 0, NULL, N'Thành phố Hà Nội', N'Đang Xác Nhận')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (20197, N'vietbx23@gmail.com', CAST(N'2026-12-17 10:19:15.567' AS DateTime), N'12, Xã Nậm Khánh, Huyện Bắc Hà, Tỉnh Lào Cai', N'Việt Bùi Xuân', 162, 0, NULL, N'Tỉnh Lào Cai', N'Đã Hủy')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (20198, N'vietbx23@gmail.com', CAST(N'2026-12-17 10:21:12.003' AS DateTime), N'12, Xã Nậm Khánh, Huyện Bắc Hà, Tỉnh Lào Cai', N'Việt Bùi Xuân', 4320, 0, NULL, N'Tỉnh Lào Cai', N'Đã Hủy')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (20199, N'vietbx23@gmail.com', CAST(N'2026-12-17 10:27:14.453' AS DateTime), N'12, Xã Nậm Khánh, Huyện Bắc Hà, Tỉnh Lào Cai', N'Việt Bùi Xuân', 4320, 0, NULL, N'Tỉnh Lào Cai', N'Đã Giao')
INSERT [dbo].[Orders] ([id], [username], [create_date], [address], [nguoinhan], [tongtien], [available], [discountID], [city], [status]) VALUES (20200, N'vietbx23@gmail.com', CAST(N'2026-12-17 10:33:06.783' AS DateTime), N'12, Xã Nậm Khánh, Huyện Bắc Hà, Tỉnh Lào Cai', N'Việt Bùi Xuân', 1440, 0, NULL, N'Tỉnh Lào Cai', N'Đã Giao')
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([id], [category_id], [name], [price], [quantity], [available], [description]) VALUES (1, N'M   ', N'MLB Chunky Liner Mid Denim Boston Red', 90, 10, 1, N'MLB Chunky Liner Mid Denim Boston Red là đôi giày thể thao nổi bật với chất liệu denim cao cấp và thiết kế độc đáo. Với đế giày dày mang lại sự thoải mái và ổn định, đây là lựa chọn hoàn hảo cho người yêu thể thao và phong cách cá tính. Màu sắc Boston Red tạo điểm nhấn nổi bật, biểu tượng cho sự đam mê và phong cách.')
INSERT [dbo].[Products] ([id], [category_id], [name], [price], [quantity], [available], [description]) VALUES (2, N'M   ', N'MLB BigBall Chunky A-Line', 90, 10, 1, N'Điển hình cho sự đổi mới sâu sắc cho dòng sản phẩm vốn đã rất nổi tiếng trong giới trẻ, sự pha trộn giữa nét vẽ đột phá của dòng liner cùng cái chất thể thao từ bộ sưu tập BigBall Chunky đã tạo ra một vẻ ngoài hoàn mới, được gọi với cái tên vô cùng cá tinh - BigBall Chunky A-Line.')
INSERT [dbo].[Products] ([id], [category_id], [name], [price], [quantity], [available], [description]) VALUES (3, N'M   ', N'MLB Bigball Chunky A New York Yankees', 90, 10, 1, N'MLB Chunky Liner Mid Denim Boston Red là đôi giày thể thao nổi bật với chất liệu denim cao cấp và thiết kế độc đáo. Với đế giày dày mang lại sự thoải mái và ổn định, đây là lựa chọn hoàn hảo cho người yêu thể thao và phong cách cá tính. Màu sắc Boston Red tạo điểm nhấn nổi bật, biểu tượng cho sự đam mê và phong cách.')
INSERT [dbo].[Products] ([id], [category_id], [name], [price], [quantity], [available], [description]) VALUES (4, N'M   ', N'MLB BigBall Chunky A LA Dodgers Off-White', 60, 10, 1, N'MLB Chunky Liner Mid Denim Boston Red là đôi giày thể thao nổi bật với chất liệu denim cao cấp và thiết kế độc đáo. Với đế giày dày mang lại sự thoải mái và ổn định, đây là lựa chọn hoàn hảo cho người yêu thể thao và phong cách cá tính. Màu sắc Boston Red tạo điểm nhấn nổi bật, biểu tượng cho sự đam mê và phong cách.')
INSERT [dbo].[Products] ([id], [category_id], [name], [price], [quantity], [available], [description]) VALUES (5, N'M   ', N'MLB BigBall Chunky Cube Monogram New', 50, 10, 1, N'MLB Chunky Liner Mid Denim Boston Red là đôi giày thể thao nổi bật với chất liệu denim cao cấp và thiết kế độc đáo. Với đế giày dày mang lại sự thoải mái và ổn định, đây là lựa chọn hoàn hảo cho người yêu thể thao và phong cách cá tính. Màu sắc Boston Red tạo điểm nhấn nổi bật, biểu tượng cho sự đam mê và phong cách.')
INSERT [dbo].[Products] ([id], [category_id], [name], [price], [quantity], [available], [description]) VALUES (6, N'M   ', N'MLB Chunky-Liner High Boston Red Sox Wine', 90, 10, 1, N'MLB Chunky Liner Mid Denim Boston Red là đôi giày thể thao nổi bật với chất liệu denim cao cấp và thiết kế độc đáo. Với đế giày dày mang lại sự thoải mái và ổn định, đây là lựa chọn hoàn hảo cho người yêu thể thao và phong cách cá tính. Màu sắc Boston Red tạo điểm nhấn nổi bật, biểu tượng cho sự đam mê và phong cách.')
INSERT [dbo].[Products] ([id], [category_id], [name], [price], [quantity], [available], [description]) VALUES (7, N'M   ', N'MLB Mule Playball Origin New York Yankees', 60, 10, 1, N'MLB Chunky Liner Mid Denim Boston Red là đôi giày thể thao nổi bật với chất liệu denim cao cấp và thiết kế độc đáo. Với đế giày dày mang lại sự thoải mái và ổn định, đây là lựa chọn hoàn hảo cho người yêu thể thao và phong cách cá tính. Màu sắc Boston Red tạo điểm nhấn nổi bật, biểu tượng cho sự đam mê và phong cách.')
INSERT [dbo].[Products] ([id], [category_id], [name], [price], [quantity], [available], [description]) VALUES (8, N'AD  ', N'Adidas Stan Smith', 90, 10, 1, N'Adidas Stan Smith là một đôi giày thể thao kinh điển của thương hiệu Adidas, mang đến sự đơn giản, thoải mái và phong cách. Thiết kế đặc trưng với đầu giày trắng và ba vạch xanh navy ở hai bên, Stan Smith đã trở thành biểu tượng thời trang và được yêu thích trên toàn thế giới.')
INSERT [dbo].[Products] ([id], [category_id], [name], [price], [quantity], [available], [description]) VALUES (9, N'AD  ', N'Adidas Superstar', 100, 10, 1, N'Adidas Stan Smith là một đôi giày thể thao kinh điển của thương hiệu Adidas, mang đến sự đơn giản, thoải mái và phong cách. Thiết kế đặc trưng với đầu giày trắng và ba vạch xanh navy ở hai bên, Stan Smith đã trở thành biểu tượng thời trang và được yêu thích trên toàn thế giới.')
INSERT [dbo].[Products] ([id], [category_id], [name], [price], [quantity], [available], [description]) VALUES (10, N'AD  ', N'Adidas Ultraboost', 80, 10, 1, N'Adidas Stan Smith là một đôi giày thể thao kinh điển của thương hiệu Adidas, mang đến sự đơn giản, thoải mái và phong cách. Thiết kế đặc trưng với đầu giày trắng và ba vạch xanh navy ở hai bên, Stan Smith đã trở thành biểu tượng thời trang và được yêu thích trên toàn thế giới.')
INSERT [dbo].[Products] ([id], [category_id], [name], [price], [quantity], [available], [description]) VALUES (11, N'AD  ', N'Adidas NMD', 90, 10, 1, N'Adidas Stan Smith là một đôi giày thể thao kinh điển của thương hiệu Adidas, mang đến sự đơn giản, thoải mái và phong cách. Thiết kế đặc trưng với đầu giày trắng và ba vạch xanh navy ở hai bên, Stan Smith đã trở thành biểu tượng thời trang và được yêu thích trên toàn thế giới.')
INSERT [dbo].[Products] ([id], [category_id], [name], [price], [quantity], [available], [description]) VALUES (12, N'AD  ', N'Adidas Gazelle', 100, 10, 1, N'Adidas Stan Smith là một đôi giày thể thao kinh điển của thương hiệu Adidas, mang đến sự đơn giản, thoải mái và phong cách. Thiết kế đặc trưng với đầu giày trắng và ba vạch xanh navy ở hai bên, Stan Smith đã trở thành biểu tượng thời trang và được yêu thích trên toàn thế giới.')
INSERT [dbo].[Products] ([id], [category_id], [name], [price], [quantity], [available], [description]) VALUES (13, N'AD  ', N'Adidas Yeezy', 80, 10, 1, N'Adidas Stan Smith là một đôi giày thể thao kinh điển của thương hiệu Adidas, mang đến sự đơn giản, thoải mái và phong cách. Thiết kế đặc trưng với đầu giày trắng và ba vạch xanh navy ở hai bên, Stan Smith đã trở thành biểu tượng thời trang và được yêu thích trên toàn thế giới.')
INSERT [dbo].[Products] ([id], [category_id], [name], [price], [quantity], [available], [description]) VALUES (14, N'AD  ', N'Adidas Continental 80', 30, 10, 1, N'Adidas Stan Smith là một đôi giày thể thao kinh điển của thương hiệu Adidas, mang đến sự đơn giản, thoải mái và phong cách. Thiết kế đặc trưng với đầu giày trắng và ba vạch xanh navy ở hai bên, Stan Smith đã trở thành biểu tượng thời trang và được yêu thích trên toàn thế giới.')
INSERT [dbo].[Products] ([id], [category_id], [name], [price], [quantity], [available], [description]) VALUES (15, N'AD  ', N'Adidas Campus', 55, 10, 1, N'Adidas Stan Smith là một đôi giày thể thao kinh điển của thương hiệu Adidas, mang đến sự đơn giản, thoải mái và phong cách. Thiết kế đặc trưng với đầu giày trắng và ba vạch xanh navy ở hai bên, Stan Smith đã trở thành biểu tượng thời trang và được yêu thích trên toàn thế giới.')
INSERT [dbo].[Products] ([id], [category_id], [name], [price], [quantity], [available], [description]) VALUES (16, N'NK  ', N'Nike Air Force 1', 35, 10, 1, N'Nike Air Force 1, một biểu tượng không thể phủ nhận trong thế giới giày thể thao, đại diện cho sự độc đáo và phong cách đương đại của thương hiệu Nike. Ra mắt lần đầu tiên vào năm 1982 và vẫn tiếp tục làm mưa làm gió trong thị trường giày thể thao.')
INSERT [dbo].[Products] ([id], [category_id], [name], [price], [quantity], [available], [description]) VALUES (17, N'NK  ', N'Nike Air Max 90', 90, 10, 1, N'Nike Air Force 1, một biểu tượng không thể phủ nhận trong thế giới giày thể thao, đại diện cho sự độc đáo và phong cách đương đại của thương hiệu Nike. Ra mắt lần đầu tiên vào năm 1982 và vẫn tiếp tục làm mưa làm gió trong thị trường giày thể thao.')
INSERT [dbo].[Products] ([id], [category_id], [name], [price], [quantity], [available], [description]) VALUES (18, N'NK  ', N'Nike Air Jordan 1', 90, 10, 1, N'Nike Air Force 1, một biểu tượng không thể phủ nhận trong thế giới giày thể thao, đại diện cho sự độc đáo và phong cách đương đại của thương hiệu Nike. Ra mắt lần đầu tiên vào năm 1982 và vẫn tiếp tục làm mưa làm gió trong thị trường giày thể thao.')
INSERT [dbo].[Products] ([id], [category_id], [name], [price], [quantity], [available], [description]) VALUES (19, N'NK  ', N'Nike React Element 55', 60, 10, 1, N'Nike Air Force 1, một biểu tượng không thể phủ nhận trong thế giới giày thể thao, đại diện cho sự độc đáo và phong cách đương đại của thương hiệu Nike. Ra mắt lần đầu tiên vào năm 1982 và vẫn tiếp tục làm mưa làm gió trong thị trường giày thể thao.')
INSERT [dbo].[Products] ([id], [category_id], [name], [price], [quantity], [available], [description]) VALUES (20, N'NK  ', N'Nike Dunk Low', 40, 10, 1, N'Nike Air Force 1, một biểu tượng không thể phủ nhận trong thế giới giày thể thao, đại diện cho sự độc đáo và phong cách đương đại của thương hiệu Nike. Ra mắt lần đầu tiên vào năm 1982 và vẫn tiếp tục làm mưa làm gió trong thị trường giày thể thao.')
INSERT [dbo].[Products] ([id], [category_id], [name], [price], [quantity], [available], [description]) VALUES (21, N'NK  ', N'Nike Cortez', 80, 10, 1, N'Nike Air Force 1, một biểu tượng không thể phủ nhận trong thế giới giày thể thao, đại diện cho sự độc đáo và phong cách đương đại của thương hiệu Nike. Ra mắt lần đầu tiên vào năm 1982 và vẫn tiếp tục làm mưa làm gió trong thị trường giày thể thao.')
INSERT [dbo].[Products] ([id], [category_id], [name], [price], [quantity], [available], [description]) VALUES (22, N'NK  ', N'Nike Air Max 270', 90, 10, 1, N'Nike Air Force 1, một biểu tượng không thể phủ nhận trong thế giới giày thể thao, đại diện cho sự độc đáo và phong cách đương đại của thương hiệu Nike. Ra mắt lần đầu tiên vào năm 1982 và vẫn tiếp tục làm mưa làm gió trong thị trường giày thể thao.')
INSERT [dbo].[Products] ([id], [category_id], [name], [price], [quantity], [available], [description]) VALUES (23, N'NK  ', N'Nike Zoom Pegasus 37', 90, 10, 1, N'Nike Air Force 1, một biểu tượng không thể phủ nhận trong thế giới giày thể thao, đại diện cho sự độc đáo và phong cách đương đại của thương hiệu Nike. Ra mắt lần đầu tiên vào năm 1982 và vẫn tiếp tục làm mưa làm gió trong thị trường giày thể thao.')
INSERT [dbo].[Products] ([id], [category_id], [name], [price], [quantity], [available], [description]) VALUES (24, N'NK  ', N'Nike Blazer Mid', 50, 10, 1, N'Nike Air Force 1, một biểu tượng không thể phủ nhận trong thế giới giày thể thao, đại diện cho sự độc đáo và phong cách đương đại của thương hiệu Nike. Ra mắt lần đầu tiên vào năm 1982 và vẫn tiếp tục làm mưa làm gió trong thị trường giày thể thao.')
INSERT [dbo].[Products] ([id], [category_id], [name], [price], [quantity], [available], [description]) VALUES (25, N'NK  ', N'Nike SB Dunk High', 90, 10, 1, NULL)
INSERT [dbo].[Products] ([id], [category_id], [name], [price], [quantity], [available], [description]) VALUES (31, N'AD  ', N'kkjaskdjfka', 90, NULL, 0, NULL)
INSERT [dbo].[Products] ([id], [category_id], [name], [price], [quantity], [available], [description]) VALUES (35, N'puma', N'Puma Anzarun 2.0 Open Road', 75, NULL, 1, NULL)
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[replys] ON 

INSERT [dbo].[replys] ([id], [description], [create_date], [product_id], [comment_id], [username]) VALUES (46, N'234', CAST(N'2026-11-29' AS Date), 1, 1037, N'vietbx23@gmail.com')
SET IDENTITY_INSERT [dbo].[replys] OFF
INSERT [dbo].[Roles] ([id], [name]) VALUES (N'CUST', N'Customers')
INSERT [dbo].[Roles] ([id], [name]) VALUES (N'DIRE', N'Directors')
INSERT [dbo].[Roles] ([id], [name]) VALUES (N'STAF', N'Staffs')
SET IDENTITY_INSERT [dbo].[ShoppingCarts] ON 

INSERT [dbo].[ShoppingCarts] ([id], [username], [product_id], [image], [name], [size], [price], [qty], [total], [status]) VALUES (1181, N'nv02', 3, N'm3_1.jpg', N'MLB Bigball Chunky A New York Yankees', 42, 90, 1, 90, 1)
INSERT [dbo].[ShoppingCarts] ([id], [username], [product_id], [image], [name], [size], [price], [qty], [total], [status]) VALUES (1182, N'nv02', 3, N'm3_1.jpg', N'MLB Bigball Chunky A New York Yankees', 39, 90, 1, 90, 1)
INSERT [dbo].[ShoppingCarts] ([id], [username], [product_id], [image], [name], [size], [price], [qty], [total], [status]) VALUES (1189, N'vietbxps22788@fpt.edu.vn', 3, N'm3_1.jpg', N'MLB Bigball Chunky A New York Yankees', 39, 90, 1, 90, 0)
INSERT [dbo].[ShoppingCarts] ([id], [username], [product_id], [image], [name], [size], [price], [qty], [total], [status]) VALUES (1190, N'vietbxps22788@fpt.edu.vn', 3, N'm3_1.jpg', N'MLB Bigball Chunky A New York Yankees', 42, 90, 1, 90, 0)
INSERT [dbo].[ShoppingCarts] ([id], [username], [product_id], [image], [name], [size], [price], [qty], [total], [status]) VALUES (1191, N'vietbxps22788@fpt.edu.vn', 1, N'm1_1.jpg', N'MLB Chunky Liner Mid Denim Boston Red', 40, 90, 1, 90, 1)
INSERT [dbo].[ShoppingCarts] ([id], [username], [product_id], [image], [name], [size], [price], [qty], [total], [status]) VALUES (1192, N'vietbxps22788@fpt.edu.vn', 1, N'm1_1.jpg', N'MLB Chunky Liner Mid Denim Boston Red', 43, 90, 2, 180, 1)
INSERT [dbo].[ShoppingCarts] ([id], [username], [product_id], [image], [name], [size], [price], [qty], [total], [status]) VALUES (1198, N'nv01', 1, N'm1_1.jpg', N'MLB Chunky Liner Mid Denim Boston Red', 39, 90, 1, 90, 1)
SET IDENTITY_INSERT [dbo].[ShoppingCarts] OFF
SET IDENTITY_INSERT [dbo].[Sizes] ON 

INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (2, 1, 39, 35)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (3, 1, 40, 909)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (4, 1, 41, 0)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (5, 1, 42, 0)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (6, 1, 43, 0)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (9, 2, 39, 0)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (10, 2, 40, 0)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (11, 2, 41, 0)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (12, 2, 42, 90)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (13, 2, 43, 0)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (14, 2, 44, 0)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (15, 3, 38, 6)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (16, 3, 39, 5)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (17, 3, 40, 0)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (18, 3, 41, 0)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (19, 3, 42, 2)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (20, 3, 43, 9)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (21, 3, 44, 6)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (22, 4, 38, 9)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (23, 4, 39, 6)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (24, 4, 40, 4)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (25, 4, 41, 3)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (26, 4, 42, 6)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (27, 4, 43, 5)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (28, 4, 44, 6)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (29, 5, 38, 6)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (30, 5, 39, 7)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (31, 5, 40, 5)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (32, 5, 41, 0)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (33, 5, 42, 5)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (34, 5, 43, 2)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (35, 5, 44, 6)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (36, 6, 38, 5)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (37, 6, 39, 7)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (38, 6, 40, 8)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (39, 6, 41, 0)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (40, 6, 42, 6)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (41, 6, 43, 5)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (42, 6, 44, 3)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (43, 7, 38, 6)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (44, 7, 39, 5)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (45, 7, 40, 6)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (46, 7, 41, 3)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (47, 7, 42, 2)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (48, 7, 43, 1)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (49, 7, 44, 2)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (50, 8, 38, 2)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (51, 8, 39, 1)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (52, 8, 40, 1)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (53, 8, 41, 6)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (54, 8, 42, 2)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (55, 8, 43, 1)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (56, 8, 44, 2)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (57, 9, 38, 3)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (58, 9, 39, 6)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (59, 9, 40, 5)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (60, 9, 41, 1)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (61, 9, 42, 5)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (62, 9, 43, 63)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (63, 9, 44, 2)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (64, 10, 38, 4)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (65, 10, 39, 6)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (66, 10, 40, 5)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (67, 10, 41, 7)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (68, 10, 42, 4)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (69, 10, 43, 22)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (70, 10, 44, 3)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (71, 11, 40, 2)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (72, 11, 41, 2)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (73, 12, 40, 5)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (74, 12, 42, 5)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (75, 13, 40, 6)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (76, 13, 41, 6)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (77, 14, 40, 6)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (78, 14, 41, 6)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (79, 15, 40, 5)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (80, 15, 41, 4)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (81, 16, 40, 4)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (82, 16, 41, 3)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (83, 17, 40, 3)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (84, 17, 41, 4)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (85, 18, 40, 5)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (86, 18, 41, 6)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (87, 19, 44, 5)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (88, 20, 39, 3)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (89, 21, 44, 5)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (90, 22, 39, 5)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (91, 23, 43, 3)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (92, 24, 45, 2)
INSERT [dbo].[Sizes] ([id], [product_id], [size], [quantity]) VALUES (93, 25, 39, 3)
SET IDENTITY_INSERT [dbo].[Sizes] OFF
ALTER TABLE [dbo].[Authorities]  WITH CHECK ADD FOREIGN KEY([roleId])
REFERENCES [dbo].[Roles] ([id])
GO
ALTER TABLE [dbo].[comments]  WITH CHECK ADD  CONSTRAINT [FK__comments__produc__2C3393D0] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[comments] CHECK CONSTRAINT [FK__comments__produc__2C3393D0]
GO
ALTER TABLE [dbo].[comments]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[Accounts] ([username])
GO
ALTER TABLE [dbo].[discount_product]  WITH CHECK ADD  CONSTRAINT [FK__discount___produ__2E1BDC42] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[discount_product] CHECK CONSTRAINT [FK__discount___produ__2E1BDC42]
GO
ALTER TABLE [dbo].[Images]  WITH CHECK ADD  CONSTRAINT [FK_Images_Products] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Images] CHECK CONSTRAINT [FK_Images_Products]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([id])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK__OrderDeta__produ__286302EC] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK__OrderDeta__produ__286302EC]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([discountID])
REFERENCES [dbo].[discount_codes] ([id])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK__Products__catego__239E4DCF] FOREIGN KEY([category_id])
REFERENCES [dbo].[Categories] ([id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK__Products__catego__239E4DCF]
GO
ALTER TABLE [dbo].[replys]  WITH CHECK ADD  CONSTRAINT [FK__replys__comment___34C8D9D1] FOREIGN KEY([comment_id])
REFERENCES [dbo].[comments] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[replys] CHECK CONSTRAINT [FK__replys__comment___34C8D9D1]
GO
ALTER TABLE [dbo].[replys]  WITH CHECK ADD  CONSTRAINT [FK__replys__product___35BCFE0A] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[replys] CHECK CONSTRAINT [FK__replys__product___35BCFE0A]
GO
ALTER TABLE [dbo].[replys]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[Accounts] ([username])
GO
ALTER TABLE [dbo].[ShoppingCarts]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCarts_Accounts] FOREIGN KEY([username])
REFERENCES [dbo].[Accounts] ([username])
GO
ALTER TABLE [dbo].[ShoppingCarts] CHECK CONSTRAINT [FK_ShoppingCarts_Accounts]
GO
ALTER TABLE [dbo].[ShoppingCarts]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCarts_Products] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[ShoppingCarts] CHECK CONSTRAINT [FK_ShoppingCarts_Products]
GO
ALTER TABLE [dbo].[Sizes]  WITH CHECK ADD  CONSTRAINT [FK_Sizes_Products] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[Sizes] CHECK CONSTRAINT [FK_Sizes_Products]
GO
/****** Object:  StoredProcedure [dbo].[DeleteAccountAndRelatedData]    Script Date: 12/17/2026 10:37:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[DeleteAccountAndRelatedData]
    @Username NVARCHAR(255)
AS
BEGIN
    DELETE FROM replys WHERE comment_id IN (SELECT id FROM comments WHERE username = @Username);
    DELETE FROM replys WHERE username = @Username;
    DELETE FROM comments WHERE username = @Username;
    DELETE FROM Authorities WHERE username = @Username;
    DELETE FROM Addresses WHERE account_username = @Username;
    DELETE FROM OrderDetails WHERE order_id IN (SELECT id FROM Orders WHERE username = @Username);
    DELETE FROM Orders WHERE username = @Username;
    DELETE FROM ShoppingCarts WHERE username = @Username;
    DELETE FROM Accounts WHERE username = @Username;
END;




GO
USE [master]
GO
ALTER DATABASE [ShoeGalaxy] SET  READ_WRITE 
GO

USE [ShoeGalaxy]
GO
DELETE FROM [dbo].[replys] WHERE [username] <> N'Admin';
DELETE FROM [dbo].[comments] WHERE [username] <> N'Admin';
DELETE FROM [dbo].[OrderDetails] 
WHERE [order_id] IN (SELECT [id] FROM [dbo].[Orders] WHERE [username] <> N'Admin');
DELETE FROM [dbo].[Orders] WHERE [username] <> N'Admin';
DELETE FROM [dbo].[ShoppingCarts] WHERE [username] <> N'Admin';
DELETE FROM [dbo].[Addresses] WHERE [account_username] <> N'Admin';
DELETE FROM [dbo].[Authorities] WHERE [username] <> N'Admin';
DELETE FROM [dbo].[Accounts] WHERE [username] <> N'Admin';
GO
EXEC DeleteAccountAndRelatedData N'vietbx23@gmail.com';
EXEC DeleteAccountAndRelatedData N'hieuptps24504@fpt.edu.vn';
EXEC DeleteAccountAndRelatedData N'phamthieu961@gmail.com';
EXEC DeleteAccountAndRelatedData N'nguyenpham242003@gmail.com';
EXEC DeleteAccountAndRelatedData N'vietbxps22788@fpt.edu.vn';
EXEC DeleteAccountAndRelatedData N'XuanViet123';
EXEC DeleteAccountAndRelatedData N'vietbx23@gmail.com';
EXEC DeleteAccountAndRelatedData N'NV01';
EXEC DeleteAccountAndRelatedData N'NV02';
EXEC DeleteAccountAndRelatedData N'asddd';