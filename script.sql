USE [master]
GO
/****** Object:  Database [iti_DAta_BAse]    Script Date: 1/16/2021 5:15:34 PM ******/
CREATE DATABASE [iti_DAta_BAse]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'iti_DAta_BAse', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\iti_DAta_BAse.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'iti_DAta_BAse_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\iti_DAta_BAse_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [iti_DAta_BAse] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [iti_DAta_BAse].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [iti_DAta_BAse] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [iti_DAta_BAse] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [iti_DAta_BAse] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [iti_DAta_BAse] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [iti_DAta_BAse] SET ARITHABORT OFF 
GO
ALTER DATABASE [iti_DAta_BAse] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [iti_DAta_BAse] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [iti_DAta_BAse] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [iti_DAta_BAse] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [iti_DAta_BAse] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [iti_DAta_BAse] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [iti_DAta_BAse] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [iti_DAta_BAse] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [iti_DAta_BAse] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [iti_DAta_BAse] SET  DISABLE_BROKER 
GO
ALTER DATABASE [iti_DAta_BAse] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [iti_DAta_BAse] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [iti_DAta_BAse] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [iti_DAta_BAse] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [iti_DAta_BAse] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [iti_DAta_BAse] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [iti_DAta_BAse] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [iti_DAta_BAse] SET RECOVERY FULL 
GO
ALTER DATABASE [iti_DAta_BAse] SET  MULTI_USER 
GO
ALTER DATABASE [iti_DAta_BAse] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [iti_DAta_BAse] SET DB_CHAINING OFF 
GO
ALTER DATABASE [iti_DAta_BAse] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [iti_DAta_BAse] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [iti_DAta_BAse] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'iti_DAta_BAse', N'ON'
GO
USE [iti_DAta_BAse]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 1/16/2021 5:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[Course_ID] [int] IDENTITY(2000,1) NOT NULL,
	[Course_Name] [nvarchar](50) NULL,
	[Topic_ID] [int] NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[Course_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Department]    Script Date: 1/16/2021 5:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[Dept_ID] [int] IDENTITY(10,10) NOT NULL,
	[Dept_Name] [nvarchar](50) NOT NULL,
	[Dept_Desc] [nvarchar](50) NULL,
	[Manager_ID] [int] NULL,
	[Mng_hire_Date] [date] NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[Dept_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Dept_Course]    Script Date: 1/16/2021 5:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dept_Course](
	[Dept_ID] [int] NOT NULL,
	[Course_ID] [int] NOT NULL,
	[Course_Duration] [nvarchar](50) NULL,
 CONSTRAINT [PK_Dept_Course] PRIMARY KEY CLUSTERED 
(
	[Dept_ID] ASC,
	[Course_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Exam]    Script Date: 1/16/2021 5:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exam](
	[Exam_ID] [int] IDENTITY(5000,1) NOT NULL,
	[Exam_Desc] [nvarchar](50) NULL,
	[Exam_Date] [date] NULL,
	[Course_ID] [int] NOT NULL,
 CONSTRAINT [PK_Exams] PRIMARY KEY CLUSTERED 
(
	[Exam_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Exam_Questions]    Script Date: 1/16/2021 5:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exam_Questions](
	[Exam_ID] [int] NOT NULL,
	[Q_ID] [int] NOT NULL,
	[Exam_Q] [nvarchar](250) NOT NULL,
	[Q_rank] [int] NULL,
 CONSTRAINT [PK_Exam_Questions] PRIMARY KEY CLUSTERED 
(
	[Exam_ID] ASC,
	[Q_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Ins_Course]    Script Date: 1/16/2021 5:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ins_Course](
	[Course_ID] [int] NOT NULL,
	[Ins_ID] [int] NOT NULL,
 CONSTRAINT [PK_Ins_Course] PRIMARY KEY CLUSTERED 
(
	[Course_ID] ASC,
	[Ins_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Instructor]    Script Date: 1/16/2021 5:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instructor](
	[Ins_ID] [int] IDENTITY(1000,1) NOT NULL,
	[Ins_FName] [nvarchar](50) NULL,
	[Ins_LName] [nvarchar](50) NULL,
	[Ins_Address] [nvarchar](50) NULL,
	[Ins_DOB] [date] NULL,
	[Ins_Email] [nvarchar](50) NULL,
	[Ins_Salary] [int] NULL,
	[Dept_ID] [int] NULL,
 CONSTRAINT [PK_Instructor] PRIMARY KEY CLUSTERED 
(
	[Ins_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Question]    Script Date: 1/16/2021 5:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Question](
	[Q_ID] [int] IDENTITY(1,1) NOT NULL,
	[Q_Desc] [nvarchar](250) NULL,
	[Q_Model_Ans] [char](1) NULL,
	[Type_ID] [int] NOT NULL,
	[Course_ID] [int] NOT NULL,
	[Choice_1] [char](250) NULL,
	[Choice_2] [char](250) NULL,
	[Choice_3] [char](250) NULL,
	[Choice_4] [char](250) NULL,
 CONSTRAINT [PK_Question] PRIMARY KEY CLUSTERED 
(
	[Q_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Std_Answers]    Script Date: 1/16/2021 5:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Std_Answers](
	[Std_ID] [int] NOT NULL,
	[Exam_ID] [int] NOT NULL,
	[Q_ID] [int] NOT NULL,
	[Std_Ans] [char](1) NOT NULL,
	[rank_number] [int] NOT NULL,
 CONSTRAINT [PK_Std_Answers_1] PRIMARY KEY CLUSTERED 
(
	[Exam_ID] ASC,
	[Q_ID] ASC,
	[rank_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Std_Exam_Result]    Script Date: 1/16/2021 5:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Std_Exam_Result](
	[Std_ID] [int] NOT NULL,
	[Exam_ID] [int] NOT NULL,
	[Std_Result] [int] NOT NULL,
 CONSTRAINT [PK_Std_Exam_Result] PRIMARY KEY CLUSTERED 
(
	[Std_ID] ASC,
	[Exam_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Student]    Script Date: 1/16/2021 5:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[Std_ID] [int] IDENTITY(100,1) NOT NULL,
	[Std_FName] [nvarchar](50) NULL,
	[Std_LName] [nvarchar](50) NULL,
	[Std_Address] [nvarchar](80) NULL,
	[Std_Email] [nvarchar](50) NULL,
	[Std_DOB] [date] NULL,
	[Dept_id] [int] NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Std_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Topic]    Script Date: 1/16/2021 5:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topic](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Topic] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Type]    Script Date: 1/16/2021 5:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[T_ID] [int] IDENTITY(1,1) NOT NULL,
	[T_Desc] [nvarchar](50) NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[T_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([Course_ID], [Course_Name], [Topic_ID]) VALUES (2000, N'C#', 1)
INSERT [dbo].[Course] ([Course_ID], [Course_Name], [Topic_ID]) VALUES (2001, N'Sql', 2)
INSERT [dbo].[Course] ([Course_ID], [Course_Name], [Topic_ID]) VALUES (2002, N'html', 3)
SET IDENTITY_INSERT [dbo].[Course] OFF
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([Dept_ID], [Dept_Name], [Dept_Desc], [Manager_ID], [Mng_hire_Date]) VALUES (10, N'ds', N'development system', 1000, CAST(N'2000-01-01' AS Date))
INSERT [dbo].[Department] ([Dept_ID], [Dept_Name], [Dept_Desc], [Manager_ID], [Mng_hire_Date]) VALUES (20, N'os', N'open source', NULL, NULL)
INSERT [dbo].[Department] ([Dept_ID], [Dept_Name], [Dept_Desc], [Manager_ID], [Mng_hire_Date]) VALUES (30, N'sa', N'system admin', NULL, NULL)
INSERT [dbo].[Department] ([Dept_ID], [Dept_Name], [Dept_Desc], [Manager_ID], [Mng_hire_Date]) VALUES (40, N'ui_ux', N'user interface', NULL, NULL)
INSERT [dbo].[Department] ([Dept_ID], [Dept_Name], [Dept_Desc], [Manager_ID], [Mng_hire_Date]) VALUES (50, N'sc', N'syber security', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Department] OFF
INSERT [dbo].[Dept_Course] ([Dept_ID], [Course_ID], [Course_Duration]) VALUES (20, 2001, N'4 weeks')
SET IDENTITY_INSERT [dbo].[Exam] ON 

INSERT [dbo].[Exam] ([Exam_ID], [Exam_Desc], [Exam_Date], [Course_ID]) VALUES (5000, N'alex', CAST(N'2020-09-08' AS Date), 2000)
INSERT [dbo].[Exam] ([Exam_ID], [Exam_Desc], [Exam_Date], [Course_ID]) VALUES (5001, N'wer', CAST(N'2020-05-05' AS Date), 2001)
INSERT [dbo].[Exam] ([Exam_ID], [Exam_Desc], [Exam_Date], [Course_ID]) VALUES (5002, N'vvv', CAST(N'2020-08-09' AS Date), 2002)
INSERT [dbo].[Exam] ([Exam_ID], [Exam_Desc], [Exam_Date], [Course_ID]) VALUES (5004, N'bb', CAST(N'2010-08-10' AS Date), 2001)
INSERT [dbo].[Exam] ([Exam_ID], [Exam_Desc], [Exam_Date], [Course_ID]) VALUES (5005, N'C#', CAST(N'2008-02-02' AS Date), 2000)
SET IDENTITY_INSERT [dbo].[Exam] OFF
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Q_ID], [Exam_Q], [Q_rank]) VALUES (5000, 1, N'pla ?', NULL)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Q_ID], [Exam_Q], [Q_rank]) VALUES (5000, 2, N'hy?', NULL)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Q_ID], [Exam_Q], [Q_rank]) VALUES (5000, 8, N'wowo?', NULL)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Q_ID], [Exam_Q], [Q_rank]) VALUES (5000, 9, N'pla ?', NULL)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Q_ID], [Exam_Q], [Q_rank]) VALUES (5000, 11, N'pla ?', NULL)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Q_ID], [Exam_Q], [Q_rank]) VALUES (5000, 14, N'lol lol ?', NULL)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Q_ID], [Exam_Q], [Q_rank]) VALUES (5000, 15, N'what is the linked list ?', NULL)
INSERT [dbo].[Exam_Questions] ([Exam_ID], [Q_ID], [Exam_Q], [Q_rank]) VALUES (5004, 16, N'what is your name ?', NULL)
INSERT [dbo].[Ins_Course] ([Course_ID], [Ins_ID]) VALUES (2000, 1000)
INSERT [dbo].[Ins_Course] ([Course_ID], [Ins_ID]) VALUES (2001, 1000)
INSERT [dbo].[Ins_Course] ([Course_ID], [Ins_ID]) VALUES (2001, 1006)
INSERT [dbo].[Ins_Course] ([Course_ID], [Ins_ID]) VALUES (2002, 1000)
INSERT [dbo].[Ins_Course] ([Course_ID], [Ins_ID]) VALUES (2002, 1007)
SET IDENTITY_INSERT [dbo].[Instructor] ON 

INSERT [dbo].[Instructor] ([Ins_ID], [Ins_FName], [Ins_LName], [Ins_Address], [Ins_DOB], [Ins_Email], [Ins_Salary], [Dept_ID]) VALUES (1000, N'aa', N'aa', N'alex', CAST(N'1998-09-09' AS Date), NULL, NULL, 10)
INSERT [dbo].[Instructor] ([Ins_ID], [Ins_FName], [Ins_LName], [Ins_Address], [Ins_DOB], [Ins_Email], [Ins_Salary], [Dept_ID]) VALUES (1002, N'bb', N'bb', N'bb', CAST(N'1995-09-09' AS Date), N's@gmail.om', 222, 20)
INSERT [dbo].[Instructor] ([Ins_ID], [Ins_FName], [Ins_LName], [Ins_Address], [Ins_DOB], [Ins_Email], [Ins_Salary], [Dept_ID]) VALUES (1006, N'ee', N'rr', N'rr', CAST(N'1887-06-06' AS Date), N'w@gmail.com', 333, 30)
INSERT [dbo].[Instructor] ([Ins_ID], [Ins_FName], [Ins_LName], [Ins_Address], [Ins_DOB], [Ins_Email], [Ins_Salary], [Dept_ID]) VALUES (1007, N'kk', N'ee', N'ee', CAST(N'1995-08-08' AS Date), N'f@gmail.com', 8000, 40)
INSERT [dbo].[Instructor] ([Ins_ID], [Ins_FName], [Ins_LName], [Ins_Address], [Ins_DOB], [Ins_Email], [Ins_Salary], [Dept_ID]) VALUES (1008, N'Ahmeddd', N'Karam', N'Cairo', CAST(N'1985-02-08' AS Date), N'karam@gmail.com', 9000, 10)
SET IDENTITY_INSERT [dbo].[Instructor] OFF
SET IDENTITY_INSERT [dbo].[Question] ON 

INSERT [dbo].[Question] ([Q_ID], [Q_Desc], [Q_Model_Ans], [Type_ID], [Course_ID], [Choice_1], [Choice_2], [Choice_3], [Choice_4]) VALUES (1, N'heelo?', N'a', 1, 2000, N'a                                                                                                                                                                                                                                                         ', N'b                                                                                                                                                                                                                                                         ', N'c                                                                                                                                                                                                                                                         ', N'd                                                                                                                                                                                                                                                         ')
INSERT [dbo].[Question] ([Q_ID], [Q_Desc], [Q_Model_Ans], [Type_ID], [Course_ID], [Choice_1], [Choice_2], [Choice_3], [Choice_4]) VALUES (2, N'hy?', N'f', 2, 2000, N'                                                                                                                                                                                                                                                          ', N'                                                                                                                                                                                                                                                          ', N'                                                                                                                                                                                                                                                          ', N'                                                                                                                                                                                                                                                          ')
INSERT [dbo].[Question] ([Q_ID], [Q_Desc], [Q_Model_Ans], [Type_ID], [Course_ID], [Choice_1], [Choice_2], [Choice_3], [Choice_4]) VALUES (8, N'wowo?', N'c', 1, 2000, N'a                                                                                                                                                                                                                                                         ', N'b                                                                                                                                                                                                                                                         ', N'c                                                                                                                                                                                                                                                         ', N'd                                                                                                                                                                                                                                                         ')
INSERT [dbo].[Question] ([Q_ID], [Q_Desc], [Q_Model_Ans], [Type_ID], [Course_ID], [Choice_1], [Choice_2], [Choice_3], [Choice_4]) VALUES (9, N'heelo?', N'd', 1, 2000, N'a                                                                                                                                                                                                                                                         ', N'b                                                                                                                                                                                                                                                         ', N'c                                                                                                                                                                                                                                                         ', N'd                                                                                                                                                                                                                                                         ')
INSERT [dbo].[Question] ([Q_ID], [Q_Desc], [Q_Model_Ans], [Type_ID], [Course_ID], [Choice_1], [Choice_2], [Choice_3], [Choice_4]) VALUES (10, N'here ?', N't', 2, 2000, NULL, NULL, NULL, NULL)
INSERT [dbo].[Question] ([Q_ID], [Q_Desc], [Q_Model_Ans], [Type_ID], [Course_ID], [Choice_1], [Choice_2], [Choice_3], [Choice_4]) VALUES (11, N'pla ?', N'f', 2, 2000, NULL, NULL, NULL, NULL)
INSERT [dbo].[Question] ([Q_ID], [Q_Desc], [Q_Model_Ans], [Type_ID], [Course_ID], [Choice_1], [Choice_2], [Choice_3], [Choice_4]) VALUES (14, N'lol lol ?', N'b', 2, 2001, N'a                                                                                                                                                                                                                                                         ', N'b                                                                                                                                                                                                                                                         ', N'c                                                                                                                                                                                                                                                         ', N'd                                                                                                                                                                                                                                                         ')
INSERT [dbo].[Question] ([Q_ID], [Q_Desc], [Q_Model_Ans], [Type_ID], [Course_ID], [Choice_1], [Choice_2], [Choice_3], [Choice_4]) VALUES (15, N'what is the linked list ?', N'A', 1, 2000, NULL, NULL, NULL, NULL)
INSERT [dbo].[Question] ([Q_ID], [Q_Desc], [Q_Model_Ans], [Type_ID], [Course_ID], [Choice_1], [Choice_2], [Choice_3], [Choice_4]) VALUES (16, N'what is your name ?', N'B', 1, 2000, N'a                                                                                                                                                                                                                                                         ', N'b                                                                                                                                                                                                                                                         ', N'c                                                                                                                                                                                                                                                         ', N'd                                                                                                                                                                                                                                                         ')
SET IDENTITY_INSERT [dbo].[Question] OFF
INSERT [dbo].[Std_Exam_Result] ([Std_ID], [Exam_ID], [Std_Result]) VALUES (101, 5000, 70)
INSERT [dbo].[Std_Exam_Result] ([Std_ID], [Exam_ID], [Std_Result]) VALUES (101, 5002, 80)
INSERT [dbo].[Std_Exam_Result] ([Std_ID], [Exam_ID], [Std_Result]) VALUES (101, 5004, 90)
INSERT [dbo].[Std_Exam_Result] ([Std_ID], [Exam_ID], [Std_Result]) VALUES (101, 5005, 0)
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([Std_ID], [Std_FName], [Std_LName], [Std_Address], [Std_Email], [Std_DOB], [Dept_id]) VALUES (101, N'Ahmed', N'Ali', N'Cairo', N'A.ali@gmail.con', CAST(N'1998-01-01' AS Date), 10)
INSERT [dbo].[Student] ([Std_ID], [Std_FName], [Std_LName], [Std_Address], [Std_Email], [Std_DOB], [Dept_id]) VALUES (103, N'Hassan ', N'Mohamed ', N'Alexandria', N'H.Moh@gmail.com', CAST(N'1997-07-07' AS Date), 50)
INSERT [dbo].[Student] ([Std_ID], [Std_FName], [Std_LName], [Std_Address], [Std_Email], [Std_DOB], [Dept_id]) VALUES (104, N'Aya', N'Ragab', N'Alexandria', N'a.rgab@gmail.com', CAST(N'1995-08-09' AS Date), 30)
INSERT [dbo].[Student] ([Std_ID], [Std_FName], [Std_LName], [Std_Address], [Std_Email], [Std_DOB], [Dept_id]) VALUES (105, N'Menna', N'Mohmoud ', N'Cairo ', N'M.M88@gmail.com', CAST(N'1994-04-09' AS Date), 20)
INSERT [dbo].[Student] ([Std_ID], [Std_FName], [Std_LName], [Std_Address], [Std_Email], [Std_DOB], [Dept_id]) VALUES (106, N'Ashraf', N'Mohamed', N'Asuit', N'Ashraf11@gmail.com', CAST(N'1996-04-03' AS Date), 10)
INSERT [dbo].[Student] ([Std_ID], [Std_FName], [Std_LName], [Std_Address], [Std_Email], [Std_DOB], [Dept_id]) VALUES (107, N'Hossam ', N'Mousa ', N'Damnhour', N'Mou88@gmail.com', CAST(N'1998-04-21' AS Date), 40)
INSERT [dbo].[Student] ([Std_ID], [Std_FName], [Std_LName], [Std_Address], [Std_Email], [Std_DOB], [Dept_id]) VALUES (108, N'Mayar', N'Ahmed', N'Cairo ', N'Mayarm@gmail.com', CAST(N'1997-08-14' AS Date), 20)
INSERT [dbo].[Student] ([Std_ID], [Std_FName], [Std_LName], [Std_Address], [Std_Email], [Std_DOB], [Dept_id]) VALUES (109, N'Mai', N'Montaser', N'cairo', N'kokooo@gmail.com', CAST(N'1995-04-29' AS Date), 50)
INSERT [dbo].[Student] ([Std_ID], [Std_FName], [Std_LName], [Std_Address], [Std_Email], [Std_DOB], [Dept_id]) VALUES (110, N'Hamza', N'Mohamed', N'Alexandria ', N'Hamzaaa@gmail.com', CAST(N'1999-05-07' AS Date), 10)
INSERT [dbo].[Student] ([Std_ID], [Std_FName], [Std_LName], [Std_Address], [Std_Email], [Std_DOB], [Dept_id]) VALUES (112, N'Mazen', N'Mahmoud ', N'Cairo ', N'm.mahmod@gmail.com', CAST(N'1997-08-16' AS Date), 30)
INSERT [dbo].[Student] ([Std_ID], [Std_FName], [Std_LName], [Std_Address], [Std_Email], [Std_DOB], [Dept_id]) VALUES (114, N'Lalia ', N'Ahmed', N'Alexndria', N'lalia55@gmail.com', CAST(N'1998-08-09' AS Date), 40)
INSERT [dbo].[Student] ([Std_ID], [Std_FName], [Std_LName], [Std_Address], [Std_Email], [Std_DOB], [Dept_id]) VALUES (117, N'Mayar', N'zaghlol', N'Alexandria ', N'mayarm4@gmail.com', CAST(N'1998-10-01' AS Date), 20)
INSERT [dbo].[Student] ([Std_ID], [Std_FName], [Std_LName], [Std_Address], [Std_Email], [Std_DOB], [Dept_id]) VALUES (118, N'Berry ', N'Karem ', N'Mansoura ', N'bery2@gmail.com', CAST(N'1995-02-01' AS Date), 50)
INSERT [dbo].[Student] ([Std_ID], [Std_FName], [Std_LName], [Std_Address], [Std_Email], [Std_DOB], [Dept_id]) VALUES (119, N'Karem', N'Elgzar', N'Asuit', N'k.elgzar@gmail.com', CAST(N'1995-01-11' AS Date), 10)
INSERT [dbo].[Student] ([Std_ID], [Std_FName], [Std_LName], [Std_Address], [Std_Email], [Std_DOB], [Dept_id]) VALUES (121, N'Omnia ', N'Mahmoud', N'cairo ', N'Om33@gmail.com', CAST(N'1997-02-14' AS Date), 40)
INSERT [dbo].[Student] ([Std_ID], [Std_FName], [Std_LName], [Std_Address], [Std_Email], [Std_DOB], [Dept_id]) VALUES (123, N'Salwa', N'osman', N'Damnhour', N'salw55@gmail.com', CAST(N'1998-07-12' AS Date), 30)
INSERT [dbo].[Student] ([Std_ID], [Std_FName], [Std_LName], [Std_Address], [Std_Email], [Std_DOB], [Dept_id]) VALUES (124, N'saiid', N'Fawzy', N'Cairo', N'sf 33@gmail.com', CAST(N'1996-12-12' AS Date), 20)
INSERT [dbo].[Student] ([Std_ID], [Std_FName], [Std_LName], [Std_Address], [Std_Email], [Std_DOB], [Dept_id]) VALUES (125, N'Salma', N'Musa', N'Asuit', N'ssm55@gmail.com', CAST(N'1997-11-16' AS Date), 50)
INSERT [dbo].[Student] ([Std_ID], [Std_FName], [Std_LName], [Std_Address], [Std_Email], [Std_DOB], [Dept_id]) VALUES (127, N'Sahar', N'saad', N'Damnhour', N'sahar266@gmail.com', CAST(N'1999-10-08' AS Date), 10)
INSERT [dbo].[Student] ([Std_ID], [Std_FName], [Std_LName], [Std_Address], [Std_Email], [Std_DOB], [Dept_id]) VALUES (129, N'Amal', N'Wanis', N'Alexandria', N'amalz555@gmail.com', CAST(N'1995-09-11' AS Date), 40)
INSERT [dbo].[Student] ([Std_ID], [Std_FName], [Std_LName], [Std_Address], [Std_Email], [Std_DOB], [Dept_id]) VALUES (130, N'sief', N'emad', N'Asuit', N'seif88@gmail.com', CAST(N'1993-04-21' AS Date), 30)
INSERT [dbo].[Student] ([Std_ID], [Std_FName], [Std_LName], [Std_Address], [Std_Email], [Std_DOB], [Dept_id]) VALUES (131, N'Diana', N'medhat ', N'Behera', N'diana00@gmail.com', CAST(N'1997-05-03' AS Date), 20)
INSERT [dbo].[Student] ([Std_ID], [Std_FName], [Std_LName], [Std_Address], [Std_Email], [Std_DOB], [Dept_id]) VALUES (135, N'Khaled', N'Hossam', N'Cairo', N'khaled44@gmail.com', CAST(N'1995-08-06' AS Date), 50)
INSERT [dbo].[Student] ([Std_ID], [Std_FName], [Std_LName], [Std_Address], [Std_Email], [Std_DOB], [Dept_id]) VALUES (136, N'Hassan', N'Zaghlol', N'Mnofia', N'Has99@gmail.com', CAST(N'1997-04-02' AS Date), 10)
INSERT [dbo].[Student] ([Std_ID], [Std_FName], [Std_LName], [Std_Address], [Std_Email], [Std_DOB], [Dept_id]) VALUES (137, N'Rahma', N'Hassan', N'Alexandria', N'rahma11@gmail', CAST(N'1994-06-08' AS Date), 40)
INSERT [dbo].[Student] ([Std_ID], [Std_FName], [Std_LName], [Std_Address], [Std_Email], [Std_DOB], [Dept_id]) VALUES (139, N'Wael ', N'Gassar', N'Cairo ', N'Wael78@gmail.com', CAST(N'1996-02-26' AS Date), 30)
INSERT [dbo].[Student] ([Std_ID], [Std_FName], [Std_LName], [Std_Address], [Std_Email], [Std_DOB], [Dept_id]) VALUES (140, N'Momen ', N'Yassin', N'Behera', N'moemn777@gmail.com', CAST(N'1997-09-22' AS Date), 20)
INSERT [dbo].[Student] ([Std_ID], [Std_FName], [Std_LName], [Std_Address], [Std_Email], [Std_DOB], [Dept_id]) VALUES (142, N'Mona', N'Zaki', N'Mnofia', N'Mona666@gmail.com', CAST(N'1994-05-26' AS Date), 50)
INSERT [dbo].[Student] ([Std_ID], [Std_FName], [Std_LName], [Std_Address], [Std_Email], [Std_DOB], [Dept_id]) VALUES (143, N'Eman', N'Bakr', N'Mansoura', N'Eman888@gmail.com', CAST(N'1999-06-05' AS Date), 10)
INSERT [dbo].[Student] ([Std_ID], [Std_FName], [Std_LName], [Std_Address], [Std_Email], [Std_DOB], [Dept_id]) VALUES (144, N'Alaa', N'Amin', N'Alexandria', N'A.amin99@gmail.com', CAST(N'1996-10-07' AS Date), 40)
INSERT [dbo].[Student] ([Std_ID], [Std_FName], [Std_LName], [Std_Address], [Std_Email], [Std_DOB], [Dept_id]) VALUES (145, N'Celia', N'Kalash', N'Alexandreia', N'c.k999@gmail.com', CAST(N'1999-02-14' AS Date), 30)
INSERT [dbo].[Student] ([Std_ID], [Std_FName], [Std_LName], [Std_Address], [Std_Email], [Std_DOB], [Dept_id]) VALUES (146, N'Hedy', N'Elgazar', N'Cairo', N'H..8@gmail.com', CAST(N'1996-05-28' AS Date), 20)
INSERT [dbo].[Student] ([Std_ID], [Std_FName], [Std_LName], [Std_Address], [Std_Email], [Std_DOB], [Dept_id]) VALUES (147, N'Adham ', N'Fathy', N'Asuit', N'Ad332gmail.com', CAST(N'1997-03-04' AS Date), 50)
INSERT [dbo].[Student] ([Std_ID], [Std_FName], [Std_LName], [Std_Address], [Std_Email], [Std_DOB], [Dept_id]) VALUES (148, N'Nadeen ', N'Ahmed', N'Behera', N'N.33@gmail.com', CAST(N'1995-09-01' AS Date), 10)
INSERT [dbo].[Student] ([Std_ID], [Std_FName], [Std_LName], [Std_Address], [Std_Email], [Std_DOB], [Dept_id]) VALUES (149, N'Ramy', N'Bakr', N'Mnofia', N'ramy77@gmail.com', CAST(N'1997-04-02' AS Date), 40)
INSERT [dbo].[Student] ([Std_ID], [Std_FName], [Std_LName], [Std_Address], [Std_Email], [Std_DOB], [Dept_id]) VALUES (150, N'Mohamed', N'Hamdy', N'Mnofia ', N'M.hamdy22@gmail.com', CAST(N'1998-05-07' AS Date), 20)
INSERT [dbo].[Student] ([Std_ID], [Std_FName], [Std_LName], [Std_Address], [Std_Email], [Std_DOB], [Dept_id]) VALUES (151, N'yo ', N' rou', N'alal ', N'monofya@gmAIL.COM', CAST(N'1998-02-02' AS Date), 50)
SET IDENTITY_INSERT [dbo].[Student] OFF
SET IDENTITY_INSERT [dbo].[Topic] ON 

INSERT [dbo].[Topic] ([ID], [Name]) VALUES (1, N'programming ')
INSERT [dbo].[Topic] ([ID], [Name]) VALUES (2, N'DB')
INSERT [dbo].[Topic] ([ID], [Name]) VALUES (3, N'Sql ')
INSERT [dbo].[Topic] ([ID], [Name]) VALUES (4, N'Front End ')
INSERT [dbo].[Topic] ([ID], [Name]) VALUES (6, N'BackENd')
SET IDENTITY_INSERT [dbo].[Topic] OFF
SET IDENTITY_INSERT [dbo].[Type] ON 

INSERT [dbo].[Type] ([T_ID], [T_Desc]) VALUES (1, N't or f')
INSERT [dbo].[Type] ([T_ID], [T_Desc]) VALUES (2, N'MCQ')
SET IDENTITY_INSERT [dbo].[Type] OFF
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Courses_Topic] FOREIGN KEY([Topic_ID])
REFERENCES [dbo].[Topic] ([ID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Courses_Topic]
GO
ALTER TABLE [dbo].[Dept_Course]  WITH CHECK ADD  CONSTRAINT [FK_Dept_Course_Course] FOREIGN KEY([Course_ID])
REFERENCES [dbo].[Course] ([Course_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Dept_Course] CHECK CONSTRAINT [FK_Dept_Course_Course]
GO
ALTER TABLE [dbo].[Dept_Course]  WITH CHECK ADD  CONSTRAINT [FK_Dept_Course_Department] FOREIGN KEY([Dept_ID])
REFERENCES [dbo].[Department] ([Dept_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Dept_Course] CHECK CONSTRAINT [FK_Dept_Course_Department]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exams_Courses] FOREIGN KEY([Course_ID])
REFERENCES [dbo].[Course] ([Course_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exams_Courses]
GO
ALTER TABLE [dbo].[Exam_Questions]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Questions_Exam] FOREIGN KEY([Exam_ID])
REFERENCES [dbo].[Exam] ([Exam_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Exam_Questions] CHECK CONSTRAINT [FK_Exam_Questions_Exam]
GO
ALTER TABLE [dbo].[Ins_Course]  WITH CHECK ADD  CONSTRAINT [FK_Ins_Course_Course] FOREIGN KEY([Course_ID])
REFERENCES [dbo].[Course] ([Course_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Ins_Course] CHECK CONSTRAINT [FK_Ins_Course_Course]
GO
ALTER TABLE [dbo].[Ins_Course]  WITH CHECK ADD  CONSTRAINT [FK_Ins_Course_Instructor] FOREIGN KEY([Ins_ID])
REFERENCES [dbo].[Instructor] ([Ins_ID])
GO
ALTER TABLE [dbo].[Ins_Course] CHECK CONSTRAINT [FK_Ins_Course_Instructor]
GO
ALTER TABLE [dbo].[Instructor]  WITH CHECK ADD  CONSTRAINT [FK_Instructor_Department] FOREIGN KEY([Dept_ID])
REFERENCES [dbo].[Department] ([Dept_ID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Instructor] CHECK CONSTRAINT [FK_Instructor_Department]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_Course] FOREIGN KEY([Course_ID])
REFERENCES [dbo].[Course] ([Course_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_Course]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_Type] FOREIGN KEY([Type_ID])
REFERENCES [dbo].[Type] ([T_ID])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_Type]
GO
ALTER TABLE [dbo].[Std_Answers]  WITH CHECK ADD  CONSTRAINT [FK_Std_Answers_Exam] FOREIGN KEY([Exam_ID])
REFERENCES [dbo].[Exam] ([Exam_ID])
GO
ALTER TABLE [dbo].[Std_Answers] CHECK CONSTRAINT [FK_Std_Answers_Exam]
GO
ALTER TABLE [dbo].[Std_Answers]  WITH CHECK ADD  CONSTRAINT [FK_Std_Answers_Question] FOREIGN KEY([Q_ID])
REFERENCES [dbo].[Question] ([Q_ID])
GO
ALTER TABLE [dbo].[Std_Answers] CHECK CONSTRAINT [FK_Std_Answers_Question]
GO
ALTER TABLE [dbo].[Std_Answers]  WITH CHECK ADD  CONSTRAINT [FK_Std_Answers_Student] FOREIGN KEY([Std_ID])
REFERENCES [dbo].[Student] ([Std_ID])
GO
ALTER TABLE [dbo].[Std_Answers] CHECK CONSTRAINT [FK_Std_Answers_Student]
GO
ALTER TABLE [dbo].[Std_Exam_Result]  WITH CHECK ADD  CONSTRAINT [FK_Std_Exam_Result_Exam] FOREIGN KEY([Exam_ID])
REFERENCES [dbo].[Exam] ([Exam_ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Std_Exam_Result] CHECK CONSTRAINT [FK_Std_Exam_Result_Exam]
GO
ALTER TABLE [dbo].[Std_Exam_Result]  WITH CHECK ADD  CONSTRAINT [FK_Std_Exam_Result_Student] FOREIGN KEY([Std_ID])
REFERENCES [dbo].[Student] ([Std_ID])
GO
ALTER TABLE [dbo].[Std_Exam_Result] CHECK CONSTRAINT [FK_Std_Exam_Result_Student]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Department] FOREIGN KEY([Dept_id])
REFERENCES [dbo].[Department] ([Dept_ID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Department]
GO
/****** Object:  StoredProcedure [dbo].[INSERTINTOCOURSES]    Script Date: 1/16/2021 5:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[INSERTINTOCOURSES]  (@C_name nvarchar(50) , @T_ID int )
as 
insert into Course (Course_Name,Topic_ID)
values (@C_name , @T_ID)

GO
/****** Object:  StoredProcedure [dbo].[INSERTINTODEP]    Script Date: 1/16/2021 5:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[INSERTINTODEP] (@name nvarchar(50),@Desc nvarchar(50) , @id int = null  , @Hire_D date =  null  )
as 
if @id is null
    begin
	  insert into Department values (@name ,@Desc ,@id ,@Hire_D ) 
    end
   else
     begin
        if exists(select ins.Ins_ID from Instructor as ins where ins.Ins_ID=@id)
		  insert into Department values (@name ,@Desc ,@id ,@Hire_D ) 
		  else
		  begin
		    select 'There is no instructor with this id'
		  end
	  end

GO
/****** Object:  StoredProcedure [dbo].[INSERTINTOTOPIC]    Script Date: 1/16/2021 5:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[INSERTINTOTOPIC] (@name nvarchar (50))	
as 
insert into Topic (Name)
values (@name)


GO
/****** Object:  StoredProcedure [dbo].[INSERTINTOTYPE]    Script Date: 1/16/2021 5:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[INSERTINTOTYPE] (@name nvarchar (50))	
as 
insert into Type(T_Desc)
values (@name)


GO
/****** Object:  StoredProcedure [dbo].[SELECTFROMTOPIC]    Script Date: 1/16/2021 5:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SELECTFROMTOPIC] (@SEARCH nvarchar(50))
as
if (ISNUMERIC(@SEARCH)=1)
begin
declare @id int;
select @id =  CONVERT(int,@SEARCH)
end
select * from Topic  as T  
where t.name =@SEARCH or t.ID=@id


GO
/****** Object:  StoredProcedure [dbo].[SELECTFROMTYPE]    Script Date: 1/16/2021 5:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SELECTFROMTYPE] (@SEARCH nvarchar(50))
as
if (ISNUMERIC(@SEARCH)=1)
begin
declare @id int;
select @id =  CONVERT(int,@SEARCH)
end
select * from Type as T  
where t.T_Desc=@SEARCH or T_ID=@id

GO
/****** Object:  StoredProcedure [dbo].[sp_ansExam]    Script Date: 1/16/2021 5:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ansExam] (@std_ID int,@Exam_ID int,@ans1 nvarchar(250),@ans2 nvarchar(250),@ans3 nvarchar(250),@ans4 nvarchar(250),@ans5 nvarchar(250)
,@ans6 nvarchar(250),@ans7 nvarchar(250),@ans8 nvarchar(250),@ans9 nvarchar(250),@ans10 nvarchar(250))

as 

exec sp_stdAnsts @std_ID,@Exam_ID,1,@ans1
exec sp_stdAnsts @std_ID,@Exam_ID,2,@ans2
exec sp_stdAnsts @std_ID,@Exam_ID,3,@ans3
exec sp_stdAnsts @std_ID,@Exam_ID,4,@ans4
exec sp_stdAnsts @std_ID,@Exam_ID,5,@ans5
exec sp_stdAnsts @std_ID,@Exam_ID,6,@ans6
exec sp_stdAnsts @std_ID,@Exam_ID,7,@ans7
exec sp_stdAnsts @std_ID,@Exam_ID,8,@ans8
exec sp_stdAnsts @std_ID,@Exam_ID,9,@ans9
exec sp_stdAnsts @std_ID,@Exam_ID,10,@ans10
GO
/****** Object:  StoredProcedure [dbo].[SP_DELETECOURSE]    Script Date: 1/16/2021 5:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_DELETECOURSE] (@Selector nvarchar(50))
as
if(ISNUMERIC(@Selector) = 1)
begin
declare @id int
select @id = CONVERT(int,@Selector)
delete from Course where Course_ID=@id
end
else
begin
delete from Course where Course_Name=@Selector
end

GO
/****** Object:  StoredProcedure [dbo].[SP_DELETEDEPARTMENTCOURSE]    Script Date: 1/16/2021 5:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_DELETEDEPARTMENTCOURSE] (@deo_ID nvarchar(50) , @course_ID nvarchar(50))

as
	if (ISNUMERIC(@deo_ID)=1)
		begin
			if(ISNUMERIC(@course_ID)=1)
				begin
					if exists (select * from Dept_Course as dc where dc.Dept_ID=@deo_ID and dc.Course_ID=@course_ID)
						begin
							delete from Dept_Course where Dept_ID=@deo_ID and Course_ID=@course_ID
						end
					else
						begin
							select 'check you data, no data with your Inputs'
						end
				end
		end
	else
		begin
			select 'enter a valid data to continue'
		end

GO
/****** Object:  StoredProcedure [dbo].[SP_DELETEEXAM]    Script Date: 1/16/2021 5:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_DELETEEXAM] (@Selector nvarchar(50))

as
	if(ISNUMERIC(@Selector) =1)
		begin
			declare @id int;
			select @id = convert(int , @selector)
				if exists (select * from Exam where Exam_ID=@id)
					begin
						delete from Exam where Exam_ID=@id
						select 'Done, The Exam with id :'+' '+convert(nvarchar(50),@id)+' '+'is deleted'
					end
				else
					begin
						select 'There is no Exam with this ID : ' + convert(nvarchar(50),@id)
					end
		end	
GO
/****** Object:  StoredProcedure [dbo].[SP_DELETEFROMQUESTION]    Script Date: 1/16/2021 5:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_DELETEFROMQUESTION](@QUESTION nvarchar(50))
	as
		if(ISNUMERIC(@QUESTION)=0)
			begin
				if exists(select * from Question where Q_Desc=@QUESTION)
					begin
						delete from Question where Q_Desc=@QUESTION
						select 'This question is deleted :'+@QUESTION
					end
				else
					begin
						select 'No Question with this Entry : '+@QUESTION
					end
			end
		else
			BEGIN
				SELECT	'Check your data !!'
			END
GO
/****** Object:  StoredProcedure [dbo].[SP_DELETEINSCOURSE]    Script Date: 1/16/2021 5:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_DELETEINSCOURSE](@isn_ID nvarchar(50), @course_ID nvarchar(50))
	as
		if(ISNUMERIC(@isn_ID)=1)
			begin
				if(ISNUMERIC(@course_ID)=1)
					begin
						if exists (select * from Ins_Course as ic where ic.Course_ID=@course_ID and ic.Ins_ID=@isn_ID)
							begin
								delete from Ins_Course where Course_ID=@course_ID and Ins_ID=@isn_ID
								select 'These data are deleted : course_ID -> '+@course_ID+'  ins_ID  -> '+@isn_ID
							end
						else
							begin
								select 'There is no data with this selectors !!'
							end
					end
				else
					begin
						select 'Check the data !!'
					end
			end
		else
			begin
				select 'Check the data !!'
			end
GO
/****** Object:  StoredProcedure [dbo].[SP_DELETEINSTRUCTOR]    Script Date: 1/16/2021 5:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_DELETEINSTRUCTOR] (@Selector nvarchar(50))
as
	if(ISNUMERIC(@Selector) =1)
		begin
			declare @id int;
			select @id = convert(int , @selector)
				if exists (select * from Instructor where Ins_ID=@id)
					begin
						delete from Instructor where Ins_ID=@id
						select 'Done, The Instructor with id :'+' '+convert(nvarchar(50),@id)+' '+'is deleted'
					end
				else
					begin
						select 'There is no Instructor with this ID : ' + convert(nvarchar(50),@id)
					end
		end	
	else
		begin
			if exists (select * from Instructor where (Ins_FName+' '+Ins_LName) =@Selector)
				begin
					delete from Instructor where (Ins_FName+' '+Ins_LName) =@Selector
					select 'Done, The Instructor with name :'+' '+@Selector+' '+'is deleted'
				end
			else
				begin
					select 'There is no Instructor with this name : ' + @Selector
				end
		end

GO
/****** Object:  StoredProcedure [dbo].[SP_DELETESTUDENT]    Script Date: 1/16/2021 5:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_DELETESTUDENT] (@Selector nvarchar(50))
as
	if(ISNUMERIC(@Selector) =1)
		begin
			declare @id int;
			select @id = convert(int , @selector)
				if exists (select * from Student where Std_ID=@id)
					begin
						delete from Student where Std_ID=@id
						select 'Done, The student with id :'+' '+convert(nvarchar(50),@id)+' '+'is deleted'
					end
				else
					begin
						select 'There is no Student with this ID : ' + convert(nvarchar(50),@id)
					end
		end	
	else
		begin
			if exists (select * from student where (Std_FName+' '+Std_LName) =@Selector)
				begin
					delete from Student where (Std_FName+' '+Std_LName) =@Selector
					select 'Done, The student with name :'+' '+@Selector+' '+'is deleted'
				end
			else
				begin
					select 'There is no student with this name : ' + @Selector
				end
		end

GO
/****** Object:  StoredProcedure [dbo].[SP_DELETETOPIC]    Script Date: 1/16/2021 5:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_DELETETOPIC] (@Selector nvarchar(50))
as
if(ISNUMERIC(@Selector) = 1)
begin
declare @id int
select @id = CONVERT(int,@Selector)
delete from Topic where ID=@id
end
else
begin
delete from Topic where Name=@Selector
end

GO
/****** Object:  StoredProcedure [dbo].[SP_DELETETYPE]    Script Date: 1/16/2021 5:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_DELETETYPE] (@Selector nvarchar(50))
as
if(ISNUMERIC(@Selector) = 1)
begin
declare @id int
select @id = CONVERT(int,@Selector)
delete from Type where T_ID=@id
end
else
begin
delete from Type where T_Desc=@Selector
end


GO
/****** Object:  StoredProcedure [dbo].[Sp_GenerateExam]    Script Date: 1/16/2021 5:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Sp_GenerateExam] (@e_ID int,@c_ID int)
as
insert into Exam_Questions (Exam_ID,Q_ID,Exam_Q,Q_rank) 

select top(2) e.Exam_ID,qu.Q_ID,qu.Q_Desc  , Dense_rank()over(partition by qu.Course_ID order by newid()) 
from dbo.Question as qu 
inner join    dbo.Course as co
on co.Course_ID = qu.Course_ID and qu.Course_ID=@c_ID and qu.Type_ID=2
inner join Exam as e 
on e.Course_ID = co.Course_ID and e.Exam_ID=@e_ID

union all

select top(2)e.Exam_ID,qu.Q_ID,qu.Q_Desc , Dense_rank()over(partition by qu.Course_ID order by newid()) 
from dbo.Question as qu 
inner join  dbo.Course as co
on co.Course_ID = qu.Course_ID and qu.Course_ID=@c_ID and qu.Type_ID=1
inner join Exam as e 
on e.Course_ID = co.Course_ID and e.Exam_ID=@e_ID
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERTDEPARTMENTCOURSE]    Script Date: 1/16/2021 5:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_INSERTDEPARTMENTCOURSE] ( @dep_ID nvarchar(50) , @Course_ID nvarchar(50) , @duration nvarchar(50)=NULL )

	as
		if(ISNUMERIC(@dep_ID)=1)
			begin
				if(ISNUMERIC(@Course_ID)=1)
					begin
						if exists (select * from Department as d where d.Dept_ID=@dep_ID)
							begin
								if exists(select * from Course as c where c.Course_ID=@Course_ID)
									begin
										insert into Dept_Course Values (@dep_ID,@Course_ID,@duration)
									end
								else
									begin
										select 'Check the course Number'
									end
							end
						else
							begin
								select 'Check the deprtment Number'
							end
					end
				else
					begin
						select 'Enter a valid Data'
					end

			end
		else
			begin
				select 'Enter a Valid Data !!'
			end

GO
/****** Object:  StoredProcedure [dbo].[SP_INSERTINSCOURSES]    Script Date: 1/16/2021 5:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_INSERTINSCOURSES] (@ins_Selector nvarchar(50) , @course_Selector nvarchar(50))
	as
		if(ISNUMERIC(@ins_Selector)=1)
			begin
				if(ISNUMERIC(@course_Selector)=1)
					begin
						if exists (select * from Instructor where Ins_ID=@ins_Selector)
							begin
								if exists (select * from Course where Course_ID=@course_Selector)
									begin
										if exists (select * from Ins_Course as c where c.Course_ID=@course_Selector and c.Ins_ID=@ins_Selector)
											begin
												select 'This data is already  exists'
											end
										else
											begin
												insert into Ins_Course (Course_ID,Ins_ID) values (@course_Selector,@ins_Selector)
												select 'Data inserted'
											end
									end
								else
									begin
										select 'Course id not valid'
									end
							end
						else
							begin
								select 'Instructor id not valid'
							end
					end
				else
					begin
						select 'Check your data !! the both entries must be names or ids'
					end
			end
		else
			begin
				declare @ins_ID int;
				declare @course_ID int;
				if exists (select i.Ins_ID from Instructor as i where (Ins_FName+' '+Ins_LName)=@ins_Selector)
					begin
						if exists (select * from Course as c where c.Course_Name=@course_Selector)
							begin
								select @ins_ID = i.Ins_ID from Instructor as i where (Ins_FName+' '+Ins_LName)=@ins_Selector
								select @course_ID = c.Course_ID  from Course as c where c.Course_Name=@course_Selector
								
										if exists (select * from Ins_Course as c where c.Course_ID=@course_ID and c.Ins_ID=@ins_ID)
											begin
												select 'This data is already  exists'
											end
										else
											begin
												insert into Ins_Course values (@course_ID,@ins_ID)
												select 'Data inserted ...'
											end
							end
						else
							begin
								select 'Course name not valid'
							end
					end
				else
					begin
						select 'Instructor name not valid'
					end
			end
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERTINTOEXAM]    Script Date: 1/16/2021 5:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_INSERTINTOEXAM] (@Desc nvarchar(50), @Date date ,@id int)
as
if exists (select c.Course_ID from course as c where c.Course_ID=@id)
  begin
    insert into Exam (Exam_Desc ,Exam_Date ,Course_ID )
    values (@Desc , @Date , @id) 
  end
   else 
     begin
       select 'There is no Course with this ID '
    end 
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERTINTOINST]    Script Date: 1/16/2021 5:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_INSERTINTOINST] (@Fname nvarchar(50),@Lname nvarchar(50),@Address nvarchar(50) ,@BOD date,@Email nvarchar(50),@salary int , @id int)
as
if exists (select d.Dept_ID from Department as d where d.Dept_ID=@id)
  begin
    insert into dbo.Instructor (Ins_FName , Ins_LName, Ins_Address, Ins_DOB  , Ins_Email , Ins_Salary , Dept_ID)
    values (@Fname,@Lname,@Address,@BOD,@Email ,@salary,@id) 
  end
   else 
     begin
       select 'There is no Department with this ID '
    end 




GO
/****** Object:  StoredProcedure [dbo].[SP_INSERTINTOSTD]    Script Date: 1/16/2021 5:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_INSERTINTOSTD] (@Fname nvarchar(50),@Lname nvarchar(50),@Address nvarchar(80) ,@Email nvarchar(50), @BOD date ,@id int)
as
if exists (select d.Dept_ID from Department as d where d.Dept_ID=@id)
  begin
    insert into Student(Std_FName , Std_LName , Std_Address, Std_Email, Std_DOB , Dept_ID)
    values (@Fname,@Lname,@Address,@Email ,@BOD,@id) 
  end
   else 
     begin
       select 'There is no Department with this ID '
    end 

GO
/****** Object:  StoredProcedure [dbo].[SP_INSERTQUESTION]    Script Date: 1/16/2021 5:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_INSERTQUESTION] 
(
@Q_desc nvarchar(50),@Q_Model nvarchar(50),@Q_type nvarchar(50),@course_ID nvarchar(50),
@ch1 nvarchar(50)=null,@ch2 nvarchar(50)=null,@ch3 nvarchar(50)=null,@ch4 nvarchar(50)=null
)
	as
		if exists (select * from Type where T_ID=@Q_type) 
			begin
				 if exists (select * from course where course_ID=@course_ID) 
					begin
						insert into Question (Q_Desc,Q_Model_Ans,Type_ID,Course_ID,Choice_1,Choice_2,Choice_3,Choice_4)
						values (@Q_desc,@Q_Model,@Q_type,@course_ID,@ch1,@ch2,@ch3,@ch4)
						select 'Data inserted...'
					end
				else
					begin
						select 'check course id !!'
					end
			end
		else
			begin
				select 'check the type !!'
			end
GO
/****** Object:  StoredProcedure [dbo].[SP_RP_COURSETOPIC]    Script Date: 1/16/2021 5:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_RP_COURSETOPIC](@co_ID nvarchar(50))
	as
		if(ISNUMERIC(@co_ID)=1)
			begin
				if exists (select * from Course as c where c.Course_ID=@co_ID)
					begin
						select  c.Course_ID , c.Course_Name , t.Name from Course as c
						inner join Topic as t on c.Topic_ID = t.ID
						where c.Course_ID=@co_ID 
					end
				else
					begin
						select 'There is no course with this ID : '+@co_ID
					end
			end
		else
			begin
				select 'Check the data !!'
			end
GO
/****** Object:  StoredProcedure [dbo].[SP_RP_INSTRUCTORCOURSESWITHSTUDENT]    Script Date: 1/16/2021 5:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_RP_INSTRUCTORCOURSESWITHSTUDENT] (@ins_ID nvarchar(50))
	as
		if(ISNUMERIC(@ins_ID)=1)
			begin
				if exists (select * from Instructor as i where i.Ins_ID=@ins_ID)
					begin
						select COUNT(s.Std_ID) as NO_OF_STUDENTS,i.Ins_ID,i.Ins_FName,ic.Course_ID,c.Course_Name
						from Student as s 
						inner join Department as d on d.Dept_ID=s.Dept_id
						inner join Instructor as i on i.Dept_ID=d.Dept_ID
						inner join Ins_Course as ic on ic.Ins_ID=i.Ins_ID and ic.Ins_ID=@ins_ID
						inner join Course     as c  on c.Course_ID=ic.Course_ID
						group by s.Dept_id , i.Ins_ID , ic.Course_ID , i.Ins_FName ,c.Course_Name
					end
				else
					begin
						select 'There is no instructor with this id : '+@ins_ID
					end
			end
		else
			begin
				select 'Check your data !!'
			end
GO
/****** Object:  StoredProcedure [dbo].[SP_RP_SELECTEXAMQUESTIONWITHCHOICES]    Script Date: 1/16/2021 5:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_RP_SELECTEXAMQUESTIONWITHCHOICES] (@examNumber nvarchar(50))
	as
		if(ISNUMERIC(@examNumber)=1)
			begin
				if exists(select * from Exam as e where e.Exam_ID=@examNumber)
					begin
						if exists (select * from Exam_Questions as eq where eq.Exam_ID=@examNumber)
							begin
								select eq.Exam_ID , q.Q_ID , q.Q_Desc,q.Choice_1,q.Choice_2,q.Choice_3,q.Choice_4  from Exam_Questions as eq 
								inner join Question as q on eq.Q_ID=q.Q_ID
								where eq.Exam_ID=@examNumber
							end
						else
							begin
								select 'There is no Questions for this exam : '+@examNumber
							end
					end
				else
					begin
						select 'There is no exam with this id :'+@examNumber
					end
			end
		else
			begin
				select 'Check your data the input must an exam ID !!!'
			end
GO
/****** Object:  StoredProcedure [dbo].[SP_RP_SELECTSTDANSWERS]    Script Date: 1/16/2021 5:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_RP_SELECTSTDANSWERS](@STD_ID nvarchar(50),@EXAM_ID nvarchar(50))
	as 
		if(ISNUMERIC(@STD_ID)=1)
			begin
				if(ISNUMERIC(@EXAM_ID)=1)
					begin
						if exists (select * from Student as s where s.Std_ID=@STD_ID)
							begin
								if exists (select * from Exam as ex where ex.Exam_ID=@EXAM_ID)
									begin
										if exists (select * from Std_Answers as s where s.Exam_ID=@EXAM_ID and s.Std_ID=@STD_ID)
											begin
												select s.Std_ID , s.Exam_ID , s.Q_ID , q.Q_Desc , s.Std_Ans from Std_Answers as s
												inner join Question as q on s.Q_ID=q.Q_ID
											end
										else
											begin
												select 'There is no answers for this student in this selected exam'
											end
									end
								else
									begin
										select 'There is no exam with this id : '+@EXAM_ID
									end
							end
						else
							begin
								select 'There is no student with this id : '+@STD_ID
							end
					end
				else
					begin
						select 'Check the data !!'
					end
			end
		else
			begin
				select 'Check the data !!'
			end
GO
/****** Object:  StoredProcedure [dbo].[SP_RP_STDINF]    Script Date: 1/16/2021 5:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_RP_STDINF] (@dep_ID nvarchar(50))
	as
		if(ISNUMERIC(@dep_ID)=1)
			begin
				if exists (select * from Department where Dept_ID=@dep_ID)
					begin
						select * from Student where Dept_id=@dep_ID
					end
				else
					begin
						select 'There is no department with this id : '+@dep_ID
					end
			end
		else
			begin
				select 'Check the data !!'
			end
GO
/****** Object:  StoredProcedure [dbo].[SP_SELECTALLCOURSESINDEPARTMENT]    Script Date: 1/16/2021 5:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_SELECTALLCOURSESINDEPARTMENT] (@dep_ID nvarchar(50))
	as
		if(ISNUMERIC(@dep_ID)=1)
			begin
				if exists (select * from Dept_Course where  Dept_ID=@dep_ID)
					begin
						select dc.Dept_ID,d.Dept_Name,dc.Course_ID,c.Course_Name,dc.Course_Duration from Dept_Course as dc 
						inner join Course as c on dc.Course_ID = c.Course_ID
						inner join Department as d on dc.Dept_ID = d.Dept_ID
						where  dc.Dept_ID=@dep_ID 
					end
				else
					begin
						select 'No Courses with this Dept_ID'
					end
			end
		else
			begin
				select 'Check Your Data !!' 
			end

GO
/****** Object:  StoredProcedure [dbo].[SP_SELECTEXAMQUESTION]    Script Date: 1/16/2021 5:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_SELECTEXAMQUESTION] (@examNumber nvarchar(50))
	as
		if(ISNUMERIC(@examNumber)=1)
			begin
				if exists(select * from Exam as e where e.Exam_ID=@examNumber)
					begin
						if exists (select * from Exam_Questions as eq where eq.Exam_ID=@examNumber)
							begin
								select eq.Exam_ID , q.Q_ID , q.Q_Desc  from Exam_Questions as eq 
								inner join Question as q on eq.Q_ID=q.Q_ID
								where eq.Exam_ID=@examNumber
							end
						else
							begin
								select 'There is no Questions for this exam : '+@examNumber
							end
					end
				else
					begin
						select 'There is no exam with this id :'+@examNumber
					end
			end
		else
			begin
				select 'Check your data the input must an exam ID !!!'
			end
GO
/****** Object:  StoredProcedure [dbo].[SP_SELECTFROMCOURSE]    Script Date: 1/16/2021 5:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_SELECTFROMCOURSE] (@SEARCH nvarchar(50))
as
if (ISNUMERIC(@SEARCH)=1)
begin
declare @id int;
select @id =  CONVERT(int,@SEARCH)
end
select * from Course as c
where c.Course_Name=@SEARCH or c.Course_ID=@id

GO
/****** Object:  StoredProcedure [dbo].[SP_SELECTFROMDEP]    Script Date: 1/16/2021 5:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_SELECTFROMDEP] (@SEARCH nvarchar(50))
as
if (ISNUMERIC(@SEARCH)=1)
begin
declare @id int;
select @id =  CONVERT(int,@SEARCH)
end
select * from Department as D
where D.Dept_Name=@SEARCH or D.Dept_ID=@id

GO
/****** Object:  StoredProcedure [dbo].[SP_SELECTFROMEXAM]    Script Date: 1/16/2021 5:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_SELECTFROMEXAM] (@SEARCH nvarchar(50))
as
if (ISNUMERIC(@SEARCH)=1)
begin
declare @id int;
select @id =  CONVERT(int,@SEARCH)
end
select * from Exam as E
where E.Exam_Desc=@SEARCH
or E.Exam_Date=@SEARCH or E.Exam_ID=@id
GO
/****** Object:  StoredProcedure [dbo].[SP_SELECTFROMINST]    Script Date: 1/16/2021 5:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_SELECTFROMINST] (@SEARCH nvarchar(50))
as
if (ISNUMERIC(@SEARCH)=1)
begin
declare @id int , @date date ;
select @id =  CONVERT(int,@SEARCH)
select @date = CONVERT(date ,@SEARCH )
end
select * from Instructor as I
where I.Ins_FName=@SEARCH or I.Ins_LName=@SEARCH or 
i.Ins_Address=@SEARCH or I.Ins_Salary= @id or 
i.Ins_DOB=@date or i.Ins_ID=@id



GO
/****** Object:  StoredProcedure [dbo].[SP_SELECTFROMSTD]    Script Date: 1/16/2021 5:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_SELECTFROMSTD] (@SEARCH nvarchar(50))
as
if (ISNUMERIC(@SEARCH)=1)
begin
declare @id int , @date date ;
select @id =  CONVERT(int,@SEARCH)
select @date = CONVERT(date ,@SEARCH )
end
select * from Student as S
where s.Std_FName=@SEARCH or S.std_LName=@SEARCH or 
S.Std_Address=@SEARCH or s.Std_Email= @SEARCH or 
S.Std_DOB=@date or S.Std_ID=@id


GO
/****** Object:  StoredProcedure [dbo].[SP_SELECTINSCOURSE]    Script Date: 1/16/2021 5:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_SELECTINSCOURSE](@ins_selctor nvarchar(50))
	as

		if(ISNUMERIC(@ins_selctor)=1)
			begin
				if exists (select * from Instructor as i where i.Ins_ID=@ins_selctor)
					begin
						if exists (select * from Ins_Course as ic where ic.Ins_ID=@ins_selctor)
							begin
								select ic.Ins_ID,(i.Ins_FName+' '+i.Ins_LName) , ic.Course_ID, c.Course_Name 
								from Ins_Course as ic 
								inner join Course as c on c.Course_ID=ic.Course_ID
								inner join Instructor as i on i.Ins_ID = ic.Ins_ID
								where ic.Ins_ID=@ins_selctor
							end
						else
							begin
								select 'This instructor not assigned to any courses...'
							end
					end
				else
					begin
						select 'There is no instructor with this ID : '+@ins_selctor 
					end
			end
		else
			begin
				if exists (select * from Instructor as i where (i.Ins_FName+' '+i.Ins_LName)=@ins_selctor)
					begin
						declare @ins_ID nvarchar(50);
						select @ins_ID=i.Ins_ID from Instructor as i where (i.Ins_FName+' '+i.Ins_LName)=@ins_selctor
						select ic.Ins_ID,(i.Ins_FName+' '+i.Ins_LName) , ic.Course_ID, c.Course_Name 
								from Ins_Course as ic 
								inner join Course as c on c.Course_ID=ic.Course_ID
								inner join Instructor as i on i.Ins_ID = ic.Ins_ID
								where ic.Ins_ID=@ins_ID
					end
				else
					begin
						select 'There is no instructor with this name : '+@ins_selctor
					end

			end

GO
/****** Object:  StoredProcedure [dbo].[SP_SELECTQUESTION]    Script Date: 1/16/2021 5:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_SELECTQUESTION] (@selector nvarchar(50))
	as
		if(ISNUMERIC(@selector)=1)
			begin

				if exists (select * from Course as c where c.Course_ID=@selector)
					begin
						select * from Question as Q where Q.Course_ID=@selector
					end
				else
					begin
						select 'There is no course with this ID'
					end
			end
		else
			begin
				if exists (select * from Question where Q_Desc=@selector)
					begin
						select * from Question where Q_Desc=@selector
					end
				else
					begin
						select 'There is no Question matched'
					end
			end

GO
/****** Object:  StoredProcedure [dbo].[SP_SELECTSTDANSWERS]    Script Date: 1/16/2021 5:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_SELECTSTDANSWERS](@STD_ID nvarchar(50),@EXAM_ID nvarchar(50))
	as 
		if(ISNUMERIC(@STD_ID)=1)
			begin
				if(ISNUMERIC(@EXAM_ID)=1)
					begin
						if exists (select * from Student as s where s.Std_ID=@STD_ID)
							begin
								if exists (select * from Exam as ex where ex.Exam_ID=@EXAM_ID)
									begin
										if exists (select * from Std_Answers as s where s.Exam_ID=@EXAM_ID and s.Std_ID=@STD_ID)
											begin
												select s.Std_ID , s.Exam_ID , s.Q_ID , q.Q_Desc , s.Std_Ans from Std_Answers as s
												inner join Question as q on s.Q_ID=q.Q_ID
											end
										else
											begin
												select 'There is no answers for this student in this selected exam'
											end
									end
								else
									begin
										select 'There is no exam with this id : '+@EXAM_ID
									end
							end
						else
							begin
								select 'There is no student with this id : '+@STD_ID
							end
					end
				else
					begin
						select 'Check the data !!'
					end
			end
		else
			begin
				select 'Check the data !!'
			end
GO
/****** Object:  StoredProcedure [dbo].[SP_SELECTSTUDENTRESULTS]    Script Date: 1/16/2021 5:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_SELECTSTUDENTRESULTS] (@std_ID nvarchar(50) , @course_name nvarchar(50)=null)
	as
		if(ISNUMERIC(@std_ID)=1)
			begin
				if(ISNUMERIC(@course_name)=0)
					begin
						if(@course_name is not null)
							begin

								if exists (select * from Student where Std_ID=@std_ID)
									begin
										if exists (select * from Course as c where c.Course_Name=@course_name)
											begin
												declare @co_ID nvarchar(50);
												select @co_ID=c.Course_ID from Course as c where c.Course_Name=@course_name
												select er.Std_ID , er.Exam_ID , er.Std_Result from Std_Exam_Result as er
												where er.Std_ID=@std_ID and er.Exam_ID in (select e.Exam_ID from Exam as e where e.Course_ID=@co_ID)
											end
										else
											begin
												select 'There is no course with this name : '+@course_name
											end
									end
								else
									begin
										select 'There is no student with this id : '+@std_ID
									end
							end
						else
							begin


								 if(@course_name is null)
									begin
										select 'ana null'
										select * from Std_Exam_Result as er where Std_ID=@std_ID
									end
								else
									begin
										select 'Check the data 11 !!'
									end

							end
					end
				else
					begin
						select 'Check the data 22 !!'
					end
			end
		else
			begin
				select 'Check the data 33 !!'
			end
GO
/****** Object:  StoredProcedure [dbo].[SP_stdAnsts]    Script Date: 1/16/2021 5:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_stdAnsts] (@stu int,@ex int,@num int,@ans nvarchar(250))
as
update Std_Answers 
set Std_ID =@stu
where Exam_ID=@ex
update  Std_Answers
set Std_Ans =@ans
where Exam_ID=@ex and Q_ID=@num
GO
/****** Object:  StoredProcedure [dbo].[SP_UBDATEQUESTIONTYPE_OR_QUESTION]    Script Date: 1/16/2021 5:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_UBDATEQUESTIONTYPE_OR_QUESTION] (@Question nvarchar(50) , @newdata nvarchar(50))
	as
		if(ISNUMERIC(@newdata)=1)
			begin
				if exists (select * from Question where Q_Desc = @Question)
					begin
						if exists (select * from dbo.Type where T_ID = @newdata)
							begin
								update Question set Type_ID=@newdata where Q_Desc=@Question
								select 'Type Updated'
							end
						else
							begin
								select 'Check the type, There is no Type with this id : '+@newdata
							end
					end
				else
					begin
						select 'Can not update type, There is no Question with this description : '+@Question
					end
			end
		else
			begin
				if exists (select * from Question where Q_Desc = @Question)
					begin
						update Question set Q_Desc=@newdata where Q_Desc=@Question
						select 'Question Updated'
					end
				else
					begin
						select 'Can not update Question, There is no Question with this description : '+@Question
					end
			end
GO
/****** Object:  StoredProcedure [dbo].[SP_UPDATEADDRESS]    Script Date: 1/16/2021 5:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[SP_UPDATEADDRESS] (@id int , @Address nvarchar(50))

as 
if exists (select i.Ins_ID from Instructor as i  where i.Ins_ID=@id)
 begin
         update Instructor set Ins_Address=@Address where Ins_ID=@id
	     select 'Colum Updated '
		end
      else
	     begin
		   select 'There is no instructor with this id'    
         end
GO
/****** Object:  StoredProcedure [dbo].[SP_UPDATECOURSE]    Script Date: 1/16/2021 5:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_UPDATECOURSE] (@Old_Data nvarchar(50) , @New_Data nvarchar(50))
as 
if(ISNUMERIC(@Old_Data)=1)
begin
declare @id int;
select @id = CONVERT(int,@Old_Data)
update Course set Course_Name=@New_Data 
where Course.Course_ID=@id
end
else
begin
update Course set Course_Name=@New_Data 
where Course.Course_Name=@Old_Data
end

GO
/****** Object:  StoredProcedure [dbo].[SP_UPDATEDEP]    Script Date: 1/16/2021 5:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_UPDATEDEP] (@id int , @Dept_name nvarchar(50),@Dept_desc nvarchar(50))
as
if exists (select d.Dept_ID from Department as d where d.Dept_ID=@id)
  begin 
    update Department set Dept_Name=@Dept_name , Dept_Desc=@Dept_desc where Dept_ID=@id
  end
  else 
    begin
       select 'There is no Department with this ID to update'
    end

GO
/****** Object:  StoredProcedure [dbo].[SP_UPDATEDEPMANAGER]    Script Date: 1/16/2021 5:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_UPDATEDEPMANAGER] (@id int , @MANAGER_Dept_id int , @HIRE_DATE date)
as
if exists (select d.Dept_ID from Department as d where d.Dept_ID=@id)
  begin 
      if exists(select ins.Dept_ID from Instructor as ins where ins.Ins_ID=@MANAGER_Dept_id)
         begin
		    update Department set Manager_ID=@MANAGER_Dept_id , Mng_hire_Date=@HIRE_DATE where Dept_ID=@id
			select 'Manager Involved'
		 end 
      else
	     begin
		   select 'There is no instructor with this id'    
         end
  end
  else 
    begin
       select 'There is no Department with this ID to update'
    end 

GO
/****** Object:  StoredProcedure [dbo].[SP_UPDATEDEPTCOURSESDURATION]    Script Date: 1/16/2021 5:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_UPDATEDEPTCOURSESDURATION] (@dept_ID nvarchar(50) , @course_ID nvarchar(50),@duration nvarchar(50))
	as
		if(ISNUMERIC(@dept_ID)=1)
			begin
				if(ISNUMERIC(@course_ID)=1)
					begin
						if exists (select * from Dept_Course as dc where dc.Dept_ID=@dept_ID and dc.Course_ID=@course_ID)
							begin
								update Dept_Course set Course_Duration=@duration where Dept_ID=@dept_ID and Course_ID=@course_ID
								select 'Done, data updated'
							end
						else 
							begin
								select 'There is no data with these inputs'
							end
					end
				else
					begin
						select 'check the course ID'
					end
			end
		else
			begin
				select 'Check the department ID'
			end

GO
/****** Object:  StoredProcedure [dbo].[SP_UPDATEEXAMQUESTION]    Script Date: 1/16/2021 5:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_UPDATEEXAMQUESTION] (@exam_ID nvarchar(50) , @old_Q nvarchar(50) , @new_Q nvarchar(50))
	as
		if(ISNUMERIC(@new_Q)=0)
			begin
				if exists(select * from Question as q where q.Q_Desc=@new_Q)
					begin
						declare @new_Q_ID nvarchar(50);
						select @new_Q_ID = q.Q_ID from Question AS q where q.Q_Desc=@new_Q
						if(ISNUMERIC(@exam_ID)=1)
							begin
								if(ISNUMERIC(@old_Q)=0)
									begin
										if exists (select * from Exam_Questions as eq where eq.Exam_ID=@exam_ID and eq.Exam_Q=@old_Q)
											begin
												if not exists (select * from Exam_Questions as q where q.Q_ID=@new_Q_ID and q.Exam_ID=@exam_ID)
													begin
														update Exam_Questions set Exam_Q=@new_Q , Q_ID=@new_Q_ID where Exam_ID=@exam_ID and Exam_Q=@old_Q
														select 'Data updated ...'
													end
												else 
													begin 
														select 'This question is already exists ...'
													end
											end
										else
											begin
												select 'This question is not involved in this exam, or enter a correct data !!'
											end
									end
								else
									begin
										select 'Check the data !!'
									end
							end
						else 
							begin 
								select 'Check the data  !!'
							end 
						 
 					end
				else 
					begin 
						select 'There is no question with this description'
					end 
			end
		else
			begin
				select 'Check the data !!'
			end
GO
/****** Object:  StoredProcedure [dbo].[SP_UPDATEINSCOURSE]    Script Date: 1/16/2021 5:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_UPDATEINSCOURSE] (@ins_ID nvarchar(50),@Course_ID nvarchar(50),@NEW_INS_ID nvarchar(50))
	as
		if(ISNUMERIC(@NEW_INS_ID)=1)
			begin
				if exists (select * from Instructor as i where i.Ins_ID=@NEW_INS_ID)
					begin
						if(ISNUMERIC(@ins_ID)=1)
							begin
								if(ISNUMERIC(@Course_ID)=1)
									begin
										if exists (select * from Ins_Course as ic where ic.Course_ID=@Course_ID and ic.Ins_ID=@ins_ID)
											begin
												update Ins_Course set Ins_ID=@NEW_INS_ID where Course_ID=@Course_ID and Ins_ID=@ins_ID
												select 'Data updated Successfully'
											end
										else
											begin
												select 'There is no data with this selectors'
											end
									end
								else
									begin
										select 'Check the data !!'
									end
							end
						else
							begin
								select 'Check the data !!'
							end

					end
				else
					begin
						select 'This instructor id not involved !!'
					end
			end
		else
			begin
				select 'Check the data !!'
			end
GO
/****** Object:  StoredProcedure [dbo].[SP_UPDATEINSTRACTOR]    Script Date: 1/16/2021 5:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_UPDATEINSTRACTOR] ( @id int ,@DATA nvarchar (50) = null ,@Email nvarchar(50)=null, @Salary int = null  )
as
if exists (select i.Ins_ID from Instructor as i  where i.Ins_ID=@id)
  begin
         update Instructor set Ins_Address=@Data,Ins_Email=@Email,Ins_Salary=@Salary where Ins_ID=@id
	     select 'Manager Involved'
		end
      else
	     begin
		   select 'There is no instructor with this id'    
         end
   


GO
/****** Object:  StoredProcedure [dbo].[SP_UPDATEINTOTOPIC]    Script Date: 1/16/2021 5:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[SP_UPDATEINTOTOPIC] (@id int , @Name nvarchar(50))
as 
if exists (select ID from  topic where ID= @id)
 begin
  update Topic set Name=@Name where ID= @id 
 end
  else 
   begin 
   select 'invalid id !'
   end
  


GO
/****** Object:  StoredProcedure [dbo].[SP_UPDATESALARY]    Script Date: 1/16/2021 5:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_UPDATESALARY] (@id int , @Salary  nvarchar(50))

as 
if exists (select i.Ins_ID from Instructor as i  where i.Ins_ID=@id)
 begin
         update Instructor set Ins_Salary=@Salary where Ins_ID=@id
	     select 'Colum Updated '
		end
      else
	     begin
		   select 'There is no instructor with this id'    
         end
GO
/****** Object:  StoredProcedure [dbo].[SP_UPDATESTDADRESS]    Script Date: 1/16/2021 5:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[SP_UPDATESTDADRESS] (@id int , @Address nvarchar(50))

as 
if exists (select s.Std_ID from Student as s  where s.Std_ID=@id)
 begin
         update Student set Std_Address=@Address where Std_ID=@id
	     select 'Colum Updated '
		end
      else
	     begin
		   select 'There is no Student with this id !'    
         end
  

GO
/****** Object:  StoredProcedure [dbo].[SP_UPDATESTDEMAIL]    Script Date: 1/16/2021 5:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_UPDATESTDEMAIL] (@id int , @Email nvarchar(50))

as 
if exists (select s.Std_ID from Student as s  where s.Std_ID=@id)
 begin
         update Student set Std_Email=@Email where Std_ID=@id
	     select 'Colum Updated '
		end
      else
	     begin
		   select 'There is no student with this id !'    
         end

GO
/****** Object:  StoredProcedure [dbo].[SP_UPDATETOPIC]    Script Date: 1/16/2021 5:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_UPDATETOPIC] (@Old_Data nvarchar(50) , @New_Data nvarchar(50))
as 
if(ISNUMERIC(@Old_Data)=1)
begin
declare @id int;
select @id = CONVERT(int,@Old_Data)
update Topic set Name=@New_Data 
where Topic.ID=@id
end
else
begin
update Topic set Name=@New_Data 
where topic.Name=@Old_Data
end

GO
/****** Object:  StoredProcedure [dbo].[SP_UPDATETYPE]    Script Date: 1/16/2021 5:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_UPDATETYPE] (@Old_Data nvarchar(50) , @New_Data nvarchar(50))
as 
if(ISNUMERIC(@Old_Data)=1)
begin
declare @id int;
select @id = CONVERT(int,@Old_Data)
update Type set T_Desc=@New_Data 
where T_ID=@id
end
else
begin
update Type set T_Desc=@New_Data 
where T_Desc=@Old_Data
end


GO
/****** Object:  StoredProcedure [dbo].[SP_UPDATEXAMDATE]    Script Date: 1/16/2021 5:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[SP_UPDATEXAMDATE](@id int , @Date date)

as 
if exists (select E.Exam_ID from Exam as E  where E.Exam_ID=@id)
 begin
         update Exam set Exam_Date=@Date where Exam_ID=@id
	     select 'Colum Updated '
		end
      else
	     begin
		   select 'There is no Exam with this id !'    
         end
GO
USE [master]
GO
ALTER DATABASE [iti_DAta_BAse] SET  READ_WRITE 
GO
