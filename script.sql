USE [master]
GO
/****** Object:  Database [Pronia-Db]    Script Date: 17.07.2023 19:57:20 ******/
CREATE DATABASE [Pronia-Db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Pronia-Db', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Pronia-Db.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Pronia-Db_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Pronia-Db_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Pronia-Db] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Pronia-Db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Pronia-Db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Pronia-Db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Pronia-Db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Pronia-Db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Pronia-Db] SET ARITHABORT OFF 
GO
ALTER DATABASE [Pronia-Db] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Pronia-Db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Pronia-Db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Pronia-Db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Pronia-Db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Pronia-Db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Pronia-Db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Pronia-Db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Pronia-Db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Pronia-Db] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Pronia-Db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Pronia-Db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Pronia-Db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Pronia-Db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Pronia-Db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Pronia-Db] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [Pronia-Db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Pronia-Db] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Pronia-Db] SET  MULTI_USER 
GO
ALTER DATABASE [Pronia-Db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Pronia-Db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Pronia-Db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Pronia-Db] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Pronia-Db] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Pronia-Db] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Pronia-Db] SET QUERY_STORE = ON
GO
ALTER DATABASE [Pronia-Db] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Pronia-Db]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 17.07.2023 19:57:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 17.07.2023 19:57:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 17.07.2023 19:57:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 17.07.2023 19:57:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 17.07.2023 19:57:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 17.07.2023 19:57:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 17.07.2023 19:57:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[Address] [nvarchar](max) NULL,
	[Discriminator] [nvarchar](max) NOT NULL,
	[FullName] [nvarchar](max) NULL,
	[IsAdmin] [bit] NULL,
	[Phone] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 17.07.2023 19:57:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BasketItems]    Script Date: 17.07.2023 19:57:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BasketItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PlantId] [int] NOT NULL,
	[Count] [int] NOT NULL,
	[AppUserId] [nvarchar](450) NULL,
 CONSTRAINT [PK_BasketItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 17.07.2023 19:57:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CollectionItems]    Script Date: 17.07.2023 19:57:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CollectionItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[Title] [nvarchar](25) NOT NULL,
	[BtnUrl] [nvarchar](max) NOT NULL,
	[ImageName] [nvarchar](max) NULL,
 CONSTRAINT [PK_CollectionItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Features]    Script Date: 17.07.2023 19:57:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Features](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](40) NOT NULL,
	[Desc] [nvarchar](60) NOT NULL,
	[Icon] [nvarchar](30) NULL,
 CONSTRAINT [PK_Features] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 17.07.2023 19:57:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AppUserId] [nvarchar](450) NULL,
	[FullName] [nvarchar](20) NOT NULL,
	[Phone] [nvarchar](20) NULL,
	[Address] [nvarchar](200) NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Note] [nvarchar](200) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[Status] [tinyint] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItem]    Script Date: 17.07.2023 19:57:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[PlantId] [int] NOT NULL,
	[Count] [int] NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[UnitCostPrice] [money] NOT NULL,
	[DiscountPercent] [money] NOT NULL,
 CONSTRAINT [PK_OrderItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlantImages]    Script Date: 17.07.2023 19:57:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlantImages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PlantId] [int] NOT NULL,
	[ImageName] [nvarchar](max) NULL,
	[PosterStatus] [bit] NULL,
 CONSTRAINT [PK_PlantImages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlantReviews]    Script Date: 17.07.2023 19:57:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlantReviews](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AppUserId] [nvarchar](450) NULL,
	[PlantId] [int] NOT NULL,
	[Text] [nvarchar](500) NOT NULL,
	[Rate] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_PlantReviews] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Plants]    Script Date: 17.07.2023 19:57:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Plants](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[SKU] [nvarchar](20) NOT NULL,
	[Desc] [nvarchar](500) NULL,
	[SalePrice] [money] NOT NULL,
	[CostPrice] [money] NOT NULL,
	[DiscountPercent] [money] NOT NULL,
	[StockStatus] [bit] NOT NULL,
	[IsFeatured] [bit] NOT NULL,
	[IsNew] [bit] NOT NULL,
 CONSTRAINT [PK_Plants] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlantTags]    Script Date: 17.07.2023 19:57:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlantTags](
	[PlantId] [int] NOT NULL,
	[TagId] [int] NOT NULL,
 CONSTRAINT [PK_PlantTags] PRIMARY KEY CLUSTERED 
(
	[TagId] ASC,
	[PlantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Setting]    Script Date: 17.07.2023 19:57:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Setting](
	[Key] [nvarchar](25) NOT NULL,
	[Value] [nvarchar](250) NULL,
 CONSTRAINT [PK_Setting] PRIMARY KEY CLUSTERED 
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sliders]    Script Date: 17.07.2023 19:57:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sliders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](20) NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Desc] [nvarchar](50) NULL,
	[BtnText] [nvarchar](15) NULL,
	[BtnUrl] [nvarchar](150) NULL,
	[ImageName] [nvarchar](100) NULL,
	[Order] [int] NOT NULL,
 CONSTRAINT [PK_Sliders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 17.07.2023 19:57:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230602155219_PlantAndCategoryTableCreated', N'6.0.16')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230602155446_OrdersTableCreated', N'6.0.16')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230602164146_SettingTableCreated', N'6.0.16')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230602164308_SlidersTableCreated', N'6.0.16')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230602164410_TagsTableCreated', N'6.0.16')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230602164520_PlantTagsTableCreated', N'6.0.16')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230602164621_BasketItemTableCreated', N'6.0.16')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230602164741_PlantImagesTableCreated', N'6.0.16')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230602164839_PlantReviewsTableCreated', N'6.0.16')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230603144711_SlideTableAddOrderColumn', N'6.0.16')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230604184511_FeatureTableCreated', N'6.0.16')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230611184138_FeatureModelCorrected', N'6.0.16')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230611225532_CollectionItemsTableCreated', N'6.0.16')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'123d60bb-2037-46f8-8c9d-0ac42c9a3b17', N'Member', N'MEMBER', N'dad5fa74-f942-4e27-883a-6bf3a124e3c4')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'2ff663c7-d54c-4c5b-89fc-6d30be25b1e4', N'Admin', N'ADMIN', N'cc022170-aaaa-489c-9a93-29e226f835b3')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'dccf5122-f88f-4106-81e8-2ce773655053', N'SuperAdmin', N'SUPERADMIN', N'd973ea9b-87c8-4321-a92f-5f373ea153bc')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'75b27247-c73f-4039-8ed3-57b83c55195b', N'123d60bb-2037-46f8-8c9d-0ac42c9a3b17')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'92ac1986-59d0-4d52-9bc9-f71d355a082e', N'123d60bb-2037-46f8-8c9d-0ac42c9a3b17')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'f03e1829-c6c4-4631-8298-6f0732c1fa6f', N'123d60bb-2037-46f8-8c9d-0ac42c9a3b17')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'663c573a-3eeb-44e3-8391-78cac442634a', N'2ff663c7-d54c-4c5b-89fc-6d30be25b1e4')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e30be4f4-b58f-4c0a-aedd-a75f31cba46c', N'dccf5122-f88f-4106-81e8-2ce773655053')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Address], [Discriminator], [FullName], [IsAdmin], [Phone]) VALUES (N'663c573a-3eeb-44e3-8391-78cac442634a', N'rahidadmin', N'SUPERADMIN', N'superadmin@gmail.com', N'SUPERADMIN@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEIdwxPDFrEs73AJ3CgDyFBeojf0AtK6KiaNUvBlc0+yu1YnWOsh5zfUa2GboRoU2LA==', N'3GCX5HQ75AE47CWZBOQ6XMWZE7W6D4JM', N'683c9cfb-5f39-4200-a571-b26e4f938bf2', NULL, 0, 0, NULL, 1, 0, NULL, N'AppUser', N'Rahid Kazimov', 1, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Address], [Discriminator], [FullName], [IsAdmin], [Phone]) VALUES (N'75b27247-c73f-4039-8ed3-57b83c55195b', N'proniacode@gmail.com', N'PRONIACODE@GMAIL.COM', N'proniacode@gmail.com', N'PRONIACODE@GMAIL.COM', 0, NULL, N'PNDTCR65EMLLES3ZIYF4TWTV2UHCQSTS', N'f102ab04-8a29-41fc-8f9f-c44bc2fef0d2', NULL, 0, 0, NULL, 1, 0, NULL, N'AppUser', NULL, 0, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Address], [Discriminator], [FullName], [IsAdmin], [Phone]) VALUES (N'92ac1986-59d0-4d52-9bc9-f71d355a082e', N'UserTest', N'USERTEST', N'mirrahidsk@code.edu.az', N'MIRRAHIDSK@CODE.EDU.AZ', 0, N'AQAAAAEAACcQAAAAEJfoY/id0q+J98aW/NV6871ujJF6ZKlPho9uaJBwY6dYMMcItDa7oTjK+Pa4Hk/pSg==', N'S7ZD3XWS5TKTHMVBGUKWODMY7MTWWHR4', N'af060519-fe79-43b6-b750-d0ed19cbadfc', NULL, 0, 0, NULL, 1, 0, NULL, N'AppUser', N'Test User', 0, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Address], [Discriminator], [FullName], [IsAdmin], [Phone]) VALUES (N'e30be4f4-b58f-4c0a-aedd-a75f31cba46c', N'SuperAdmin', N'ADMIN', N'admin@admin.com', NULL, 0, N'AQAAAAEAACcQAAAAEHkQRPyq4b6BfBaHYSEKIELlkX9oSTuYrjHMb3doS+ZHEc3sI7AbjgG+c/gPWjgspA==', N'CQWE62PCN46NNT7JXPB56TAFKJ6BXCRG', N'77e2a7dd-71c8-45ad-8b62-355aaf1030db', NULL, 0, 0, NULL, 1, 0, NULL, N'AppUser', N'Super Admin', 1, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Address], [Discriminator], [FullName], [IsAdmin], [Phone]) VALUES (N'f03e1829-c6c4-4631-8298-6f0732c1fa6f', N'rahid789', N'RAHID789', N'rhdkazimov@gmail.com', N'RHDKAZIMOV@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEEWIVIhrAaec/nFeyowk9NQIacY1QMGD5jxQxVwOe9FQGeDoEiiRkM0I9RRM+A0Tgg==', N'P3UTY2XOWCHNYUWUIKP46AZ2FF6RQIUV', N'46f9274f-7fee-4bac-b9c1-1b48bdd5b88f', NULL, 0, 0, CAST(N'2023-06-10T00:05:54.2745366+00:00' AS DateTimeOffset), 1, 0, NULL, N'AppUser', N'Rahid Kazimov', 0, NULL)
GO
SET IDENTITY_INSERT [dbo].[BasketItems] ON 

INSERT [dbo].[BasketItems] ([Id], [PlantId], [Count], [AppUserId]) VALUES (4, 1, 1, N'92ac1986-59d0-4d52-9bc9-f71d355a082e')
INSERT [dbo].[BasketItems] ([Id], [PlantId], [Count], [AppUserId]) VALUES (5, 1, 1, N'75b27247-c73f-4039-8ed3-57b83c55195b')
INSERT [dbo].[BasketItems] ([Id], [PlantId], [Count], [AppUserId]) VALUES (6, 4, 1, N'75b27247-c73f-4039-8ed3-57b83c55195b')
INSERT [dbo].[BasketItems] ([Id], [PlantId], [Count], [AppUserId]) VALUES (7, 5, 1, N'75b27247-c73f-4039-8ed3-57b83c55195b')
SET IDENTITY_INSERT [dbo].[BasketItems] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Name]) VALUES (1, N'Tikanli')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (2, N'Çiçəkli')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (3, N'Tropik')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (4, N'Subtropik')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[CollectionItems] ON 

INSERT [dbo].[CollectionItems] ([Id], [Name], [Title], [BtnUrl], [ImageName]) VALUES (1, N'Cactus Collection', N'Pottery Pots & Plant', N'localhost:7022/home', N'97c31b6f-9e22-4384-a6e9-7b1562b437321-1-770x300.jpg')
INSERT [dbo].[CollectionItems] ([Id], [Name], [Title], [BtnUrl], [ImageName]) VALUES (2, N'New Collection', N'New Plants', N'localhost:7022/home', N'19d2c78b-2757-4afb-93b8-fc49381efd6b1-2-370x300.jpg')
INSERT [dbo].[CollectionItems] ([Id], [Name], [Title], [BtnUrl], [ImageName]) VALUES (3, N'Trend Collection', N'Tropic Plants', N'localhost:7022/home', N'5c79103a-1f4e-462c-9bc2-56800a4de5811-3-370x300.jpg')
INSERT [dbo].[CollectionItems] ([Id], [Name], [Title], [BtnUrl], [ImageName]) VALUES (4, N'Collection Of Home', N'Hanging Pots & Plant', N'localhost:7022/home', N'c29b13bc-d502-473b-84fb-950e71d303c31-4-770x300.jpg')
SET IDENTITY_INSERT [dbo].[CollectionItems] OFF
GO
SET IDENTITY_INSERT [dbo].[Features] ON 

INSERT [dbo].[Features] ([Id], [Name], [Desc], [Icon]) VALUES (1, N'Free Shiping', N'Capped at $319 per order', N'car.png')
INSERT [dbo].[Features] ([Id], [Name], [Desc], [Icon]) VALUES (3, N'Safe Payment', N'With our payment gateway', N'card.png')
INSERT [dbo].[Features] ([Id], [Name], [Desc], [Icon]) VALUES (4, N'Best Services', N'Friendly & Supper Services', N'service.png')
SET IDENTITY_INSERT [dbo].[Features] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Id], [AppUserId], [FullName], [Phone], [Address], [Email], [Note], [CreatedAt], [Status]) VALUES (1, N'f03e1829-c6c4-4631-8298-6f0732c1fa6f', N'Rahid Kazimov', NULL, NULL, N'rhdkazimov@gmail.com', NULL, CAST(N'2023-06-07T21:26:44.3214210' AS DateTime2), 1)
INSERT [dbo].[Order] ([Id], [AppUserId], [FullName], [Phone], [Address], [Email], [Note], [CreatedAt], [Status]) VALUES (2, N'f03e1829-c6c4-4631-8298-6f0732c1fa6f', N'Rahid Kazimov', NULL, NULL, N'rhdkazimov@gmail.com', NULL, CAST(N'2023-06-07T21:29:29.0519404' AS DateTime2), 1)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderItem] ON 

INSERT [dbo].[OrderItem] ([Id], [OrderId], [PlantId], [Count], [UnitPrice], [UnitCostPrice], [DiscountPercent]) VALUES (2, 1, 3, 6, -21882.0000, 520.0000, 520.0000)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [PlantId], [Count], [UnitPrice], [UnitCostPrice], [DiscountPercent]) VALUES (3, 2, 3, 3, -21882.0000, 520.0000, 520.0000)
SET IDENTITY_INSERT [dbo].[OrderItem] OFF
GO
SET IDENTITY_INSERT [dbo].[PlantImages] ON 

INSERT [dbo].[PlantImages] ([Id], [PlantId], [ImageName], [PosterStatus]) VALUES (1, 1, N'd47d58d7-a5d9-409e-9efb-18881cc249cb09bf7a72e69611c35f77c4ae4a97cc083ace1a4c_full.jpg', 1)
INSERT [dbo].[PlantImages] ([Id], [PlantId], [ImageName], [PosterStatus]) VALUES (2, 1, N'97ca8dcb-904d-421a-90b5-f3891619211f0d34ef629732f7e365dd6f5385b41ed0.jpg', 0)
INSERT [dbo].[PlantImages] ([Id], [PlantId], [ImageName], [PosterStatus]) VALUES (5, 3, N'd0473a7f-dadc-4f84-b144-97f28f564654cacti.jpg', 1)
INSERT [dbo].[PlantImages] ([Id], [PlantId], [ImageName], [PosterStatus]) VALUES (6, 3, N'c5fe16f4-5396-4313-bd4e-d3bb174690c3download.jpg', 0)
INSERT [dbo].[PlantImages] ([Id], [PlantId], [ImageName], [PosterStatus]) VALUES (7, 4, N'2e7337d8-f0b6-422b-932c-0b876ba55869Marigold-CutYellow-1-600x600.jpg', 1)
INSERT [dbo].[PlantImages] ([Id], [PlantId], [ImageName], [PosterStatus]) VALUES (8, 4, N'03fcad9c-383f-458b-b9b5-707059d8d5c8istockphoto-183412216-612x612.jpg', 0)
INSERT [dbo].[PlantImages] ([Id], [PlantId], [ImageName], [PosterStatus]) VALUES (11, 5, N'c5d7c46a-6732-498f-8d5b-4786ee726e30istockphoto-940932986-612x612.jpg', 1)
INSERT [dbo].[PlantImages] ([Id], [PlantId], [ImageName], [PosterStatus]) VALUES (12, 5, N'9399e89c-747c-478f-bbc0-8434071e4f08asian-bleeding-heart-748549_1280.jpg', 0)
INSERT [dbo].[PlantImages] ([Id], [PlantId], [ImageName], [PosterStatus]) VALUES (13, 5, N'ce1838c4-176a-4339-9b85-caae9a1b8704download.jpg', NULL)
INSERT [dbo].[PlantImages] ([Id], [PlantId], [ImageName], [PosterStatus]) VALUES (14, 4, N'eca8e77a-f77b-48c1-87ae-bad2ab283c62images.jpg', NULL)
INSERT [dbo].[PlantImages] ([Id], [PlantId], [ImageName], [PosterStatus]) VALUES (15, 4, N'5971f2d8-3d2d-4246-995e-c65a3ce48657images3.jpg', NULL)
SET IDENTITY_INSERT [dbo].[PlantImages] OFF
GO
SET IDENTITY_INSERT [dbo].[PlantReviews] ON 

INSERT [dbo].[PlantReviews] ([Id], [AppUserId], [PlantId], [Text], [Rate], [CreatedAt]) VALUES (1, N'92ac1986-59d0-4d52-9bc9-f71d355a082e', 1, N'afaf', 2, CAST(N'2023-06-10T04:07:36.4064930' AS DateTime2))
INSERT [dbo].[PlantReviews] ([Id], [AppUserId], [PlantId], [Text], [Rate], [CreatedAt]) VALUES (2, N'92ac1986-59d0-4d52-9bc9-f71d355a082e', 1, N'shbh', 3, CAST(N'2023-06-10T04:22:32.6359734' AS DateTime2))
INSERT [dbo].[PlantReviews] ([Id], [AppUserId], [PlantId], [Text], [Rate], [CreatedAt]) VALUES (3, N'92ac1986-59d0-4d52-9bc9-f71d355a082e', 1, N'afaf', 4, CAST(N'2023-06-10T04:56:05.4865992' AS DateTime2))
INSERT [dbo].[PlantReviews] ([Id], [AppUserId], [PlantId], [Text], [Rate], [CreatedAt]) VALUES (4, N'92ac1986-59d0-4d52-9bc9-f71d355a082e', 1, N'aagag', 1, CAST(N'2023-06-10T14:28:20.5792659' AS DateTime2))
INSERT [dbo].[PlantReviews] ([Id], [AppUserId], [PlantId], [Text], [Rate], [CreatedAt]) VALUES (5, N'92ac1986-59d0-4d52-9bc9-f71d355a082e', 1, N'gagag', 1, CAST(N'2023-06-10T14:28:55.8915852' AS DateTime2))
INSERT [dbo].[PlantReviews] ([Id], [AppUserId], [PlantId], [Text], [Rate], [CreatedAt]) VALUES (6, N'92ac1986-59d0-4d52-9bc9-f71d355a082e', 1, N'aggagagagag', 1, CAST(N'2023-06-10T14:29:06.9615975' AS DateTime2))
INSERT [dbo].[PlantReviews] ([Id], [AppUserId], [PlantId], [Text], [Rate], [CreatedAt]) VALUES (7, N'92ac1986-59d0-4d52-9bc9-f71d355a082e', 4, N'Beyendim', 3, CAST(N'2023-06-12T03:58:12.3584552' AS DateTime2))
SET IDENTITY_INSERT [dbo].[PlantReviews] OFF
GO
SET IDENTITY_INSERT [dbo].[Plants] ON 

INSERT [dbo].[Plants] ([Id], [CategoryId], [Name], [SKU], [Desc], [SalePrice], [CostPrice], [DiscountPercent], [StockStatus], [IsFeatured], [IsNew]) VALUES (1, 2, N'test', N'4565', N'46', 46.0000, 46.0000, 46.0000, 1, 0, 1)
INSERT [dbo].[Plants] ([Id], [CategoryId], [Name], [SKU], [Desc], [SalePrice], [CostPrice], [DiscountPercent], [StockStatus], [IsFeatured], [IsNew]) VALUES (3, 1, N'Cactus', N'5445632', N'afafgagg', 5210.0000, 520.0000, 520.0000, 1, 1, 1)
INSERT [dbo].[Plants] ([Id], [CategoryId], [Name], [SKU], [Desc], [SalePrice], [CostPrice], [DiscountPercent], [StockStatus], [IsFeatured], [IsNew]) VALUES (4, 2, N'American Merigold', N'SK-525', N'Tagetes is a genus of 50 species of annual or perennial, mostly herbaceous plants in the family Asteraceae. They are among several groups of plants known in English as marigolds. The genus Tagetes was described by Carl Linnaeus in 1753.', 23.0000, 12.0000, 0.0000, 1, 1, 1)
INSERT [dbo].[Plants] ([Id], [CategoryId], [Name], [SKU], [Desc], [SalePrice], [CostPrice], [DiscountPercent], [StockStatus], [IsFeatured], [IsNew]) VALUES (5, 3, N'Bleeding Heart', N'SK-707', N'Dicentra, known as bleeding-hearts, is a genus of eight species of herbaceous plants with oddly shaped flowers and finely divided leaves, native to eastern Asia and North America', 87.0000, 53.0000, 0.0000, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[Plants] OFF
GO
INSERT [dbo].[PlantTags] ([PlantId], [TagId]) VALUES (1, 2)
INSERT [dbo].[PlantTags] ([PlantId], [TagId]) VALUES (1, 3)
INSERT [dbo].[PlantTags] ([PlantId], [TagId]) VALUES (3, 1)
INSERT [dbo].[PlantTags] ([PlantId], [TagId]) VALUES (3, 2)
INSERT [dbo].[PlantTags] ([PlantId], [TagId]) VALUES (3, 3)
INSERT [dbo].[PlantTags] ([PlantId], [TagId]) VALUES (3, 5)
INSERT [dbo].[PlantTags] ([PlantId], [TagId]) VALUES (4, 1)
INSERT [dbo].[PlantTags] ([PlantId], [TagId]) VALUES (4, 2)
INSERT [dbo].[PlantTags] ([PlantId], [TagId]) VALUES (4, 3)
INSERT [dbo].[PlantTags] ([PlantId], [TagId]) VALUES (5, 1)
INSERT [dbo].[PlantTags] ([PlantId], [TagId]) VALUES (5, 5)
GO
INSERT [dbo].[Setting] ([Key], [Value]) VALUES (N'Adress', N'Yasamal ray.')
INSERT [dbo].[Setting] ([Key], [Value]) VALUES (N'ContactPhone', N'+994508859083')
INSERT [dbo].[Setting] ([Key], [Value]) VALUES (N'Email', N'mirrahidsk@code.edu.az')
INSERT [dbo].[Setting] ([Key], [Value]) VALUES (N'FooterInfo', N'Bizi izləməyi unutmayın')
INSERT [dbo].[Setting] ([Key], [Value]) VALUES (N'FooterLogo', N'dark.png')
INSERT [dbo].[Setting] ([Key], [Value]) VALUES (N'HeaderLogo', N'9990f1d2-4ef7-4a52-a3c6-ef985d30cde1dark.png')
INSERT [dbo].[Setting] ([Key], [Value]) VALUES (N'SupportPhone', N'+994508859083')
INSERT [dbo].[Setting] ([Key], [Value]) VALUES (N'WelcomeMessage', N'Saytimiza Xoş Gəlmisiniz')
GO
SET IDENTITY_INSERT [dbo].[Sliders] ON 

INSERT [dbo].[Sliders] ([Id], [Title], [Name], [Desc], [BtnText], [BtnUrl], [ImageName], [Order]) VALUES (2, N'50% endirimler', N'Ramazan Endirimleri', N'Kampaniya', N'Indi Al', N'www.youtube.com', N'b7346450-4a84-40ba-b4b7-c6efca5fa9b11-1-524x617.png', 1)
SET IDENTITY_INSERT [dbo].[Sliders] OFF
GO
SET IDENTITY_INSERT [dbo].[Tags] ON 

INSERT [dbo].[Tags] ([Id], [Name]) VALUES (1, N'Endirim')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (2, N'Kampaniya')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (3, N'Çox Satılanlar')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (5, N'Yeni')
SET IDENTITY_INSERT [dbo].[Tags] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 17.07.2023 19:57:20 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 17.07.2023 19:57:20 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 17.07.2023 19:57:20 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 17.07.2023 19:57:20 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 17.07.2023 19:57:20 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 17.07.2023 19:57:20 ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 17.07.2023 19:57:20 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_BasketItems_AppUserId]    Script Date: 17.07.2023 19:57:20 ******/
CREATE NONCLUSTERED INDEX [IX_BasketItems_AppUserId] ON [dbo].[BasketItems]
(
	[AppUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BasketItems_PlantId]    Script Date: 17.07.2023 19:57:20 ******/
CREATE NONCLUSTERED INDEX [IX_BasketItems_PlantId] ON [dbo].[BasketItems]
(
	[PlantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Order_AppUserId]    Script Date: 17.07.2023 19:57:20 ******/
CREATE NONCLUSTERED INDEX [IX_Order_AppUserId] ON [dbo].[Order]
(
	[AppUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderItem_OrderId]    Script Date: 17.07.2023 19:57:20 ******/
CREATE NONCLUSTERED INDEX [IX_OrderItem_OrderId] ON [dbo].[OrderItem]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderItem_PlantId]    Script Date: 17.07.2023 19:57:20 ******/
CREATE NONCLUSTERED INDEX [IX_OrderItem_PlantId] ON [dbo].[OrderItem]
(
	[PlantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PlantImages_PlantId]    Script Date: 17.07.2023 19:57:20 ******/
CREATE NONCLUSTERED INDEX [IX_PlantImages_PlantId] ON [dbo].[PlantImages]
(
	[PlantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_PlantReviews_AppUserId]    Script Date: 17.07.2023 19:57:20 ******/
CREATE NONCLUSTERED INDEX [IX_PlantReviews_AppUserId] ON [dbo].[PlantReviews]
(
	[AppUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PlantReviews_PlantId]    Script Date: 17.07.2023 19:57:20 ******/
CREATE NONCLUSTERED INDEX [IX_PlantReviews_PlantId] ON [dbo].[PlantReviews]
(
	[PlantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Plants_CategoryId]    Script Date: 17.07.2023 19:57:20 ******/
CREATE NONCLUSTERED INDEX [IX_Plants_CategoryId] ON [dbo].[Plants]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PlantTags_PlantId]    Script Date: 17.07.2023 19:57:20 ******/
CREATE NONCLUSTERED INDEX [IX_PlantTags_PlantId] ON [dbo].[PlantTags]
(
	[PlantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  DEFAULT (N'') FOR [Discriminator]
GO
ALTER TABLE [dbo].[Sliders] ADD  DEFAULT ((0)) FOR [Order]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[BasketItems]  WITH CHECK ADD  CONSTRAINT [FK_BasketItems_AspNetUsers_AppUserId] FOREIGN KEY([AppUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[BasketItems] CHECK CONSTRAINT [FK_BasketItems_AspNetUsers_AppUserId]
GO
ALTER TABLE [dbo].[BasketItems]  WITH CHECK ADD  CONSTRAINT [FK_BasketItems_Plants_PlantId] FOREIGN KEY([PlantId])
REFERENCES [dbo].[Plants] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BasketItems] CHECK CONSTRAINT [FK_BasketItems_Plants_PlantId]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_AspNetUsers_AppUserId] FOREIGN KEY([AppUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_AspNetUsers_AppUserId]
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD  CONSTRAINT [FK_OrderItem_Order_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderItem] CHECK CONSTRAINT [FK_OrderItem_Order_OrderId]
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD  CONSTRAINT [FK_OrderItem_Plants_PlantId] FOREIGN KEY([PlantId])
REFERENCES [dbo].[Plants] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderItem] CHECK CONSTRAINT [FK_OrderItem_Plants_PlantId]
GO
ALTER TABLE [dbo].[PlantImages]  WITH CHECK ADD  CONSTRAINT [FK_PlantImages_Plants_PlantId] FOREIGN KEY([PlantId])
REFERENCES [dbo].[Plants] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlantImages] CHECK CONSTRAINT [FK_PlantImages_Plants_PlantId]
GO
ALTER TABLE [dbo].[PlantReviews]  WITH CHECK ADD  CONSTRAINT [FK_PlantReviews_AspNetUsers_AppUserId] FOREIGN KEY([AppUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[PlantReviews] CHECK CONSTRAINT [FK_PlantReviews_AspNetUsers_AppUserId]
GO
ALTER TABLE [dbo].[PlantReviews]  WITH CHECK ADD  CONSTRAINT [FK_PlantReviews_Plants_PlantId] FOREIGN KEY([PlantId])
REFERENCES [dbo].[Plants] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlantReviews] CHECK CONSTRAINT [FK_PlantReviews_Plants_PlantId]
GO
ALTER TABLE [dbo].[Plants]  WITH CHECK ADD  CONSTRAINT [FK_Plants_Category_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Plants] CHECK CONSTRAINT [FK_Plants_Category_CategoryId]
GO
ALTER TABLE [dbo].[PlantTags]  WITH CHECK ADD  CONSTRAINT [FK_PlantTags_Plants_PlantId] FOREIGN KEY([PlantId])
REFERENCES [dbo].[Plants] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlantTags] CHECK CONSTRAINT [FK_PlantTags_Plants_PlantId]
GO
ALTER TABLE [dbo].[PlantTags]  WITH CHECK ADD  CONSTRAINT [FK_PlantTags_Tags_TagId] FOREIGN KEY([TagId])
REFERENCES [dbo].[Tags] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlantTags] CHECK CONSTRAINT [FK_PlantTags_Tags_TagId]
GO
USE [master]
GO
ALTER DATABASE [Pronia-Db] SET  READ_WRITE 
GO
