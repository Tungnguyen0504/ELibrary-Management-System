USE [Elibrary_Management]
GO
/****** Object:  Table [dbo].[Author]    Script Date: 11/13/2021 20:34:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Author](
	[AuthorID] [int] IDENTITY(1,1) NOT NULL,
	[Authorname] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[AuthorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BookIssue]    Script Date: 11/13/2021 20:34:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookIssue](
	[BookIssueID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[BookID] [int] NULL,
	[BorrowedTotal] [int] NULL,
	[BorrowedDate] [datetime] NULL,
	[DueDate] [datetime] NULL,
	[ReturnDate] [datetime] NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[BookIssueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BookMaster]    Script Date: 11/13/2021 20:34:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookMaster](
	[BookID] [int] IDENTITY(1,1) NOT NULL,
	[BookName] [nvarchar](100) NULL,
	[Genre] [nvarchar](100) NULL,
	[AuthorID] [int] NULL,
	[PublisherID] [int] NULL,
	[PublishDate] [datetime] NULL,
	[Language] [nvarchar](100) NULL,
	[Edition] [nvarchar](100) NULL,
	[BookCost] [int] NULL,
	[NoOfPages] [int] NULL,
	[BookDescription] [nvarchar](max) NULL,
	[Available] [int] NULL,
	[BookImage] [nvarchar](100) NULL,
	[CanBorrow] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Penalty]    Script Date: 11/13/2021 20:34:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Penalty](
	[PenaltyID] [int] IDENTITY(1,1) NOT NULL,
	[BookIssueID] [int] NULL,
	[Price] [int] NULL,
	[Detail] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[PenaltyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Publisher]    Script Date: 11/13/2021 20:34:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publisher](
	[PublisherID] [int] IDENTITY(1,1) NOT NULL,
	[Publishername] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[PublisherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Reservation]    Script Date: 11/13/2021 20:34:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservation](
	[ReservationID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[BookID] [int] NULL,
	[Quantity] [int] NULL,
	[Date] [datetime] NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ReservationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 11/13/2021 20:34:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](100) NULL,
	[UserNumberID] [nvarchar](100) NULL,
	[Sex] [int] NULL,
	[Dob] [datetime] NULL,
	[Phone] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[FullAddress] [nvarchar](100) NULL,
	[Password] [nvarchar](100) NULL,
	[Image] [nvarchar](100) NULL,
	[AccountStatus] [int] NULL,
	[IsAdmin] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Author] ON 

INSERT [dbo].[Author] ([AuthorID], [Authorname]) VALUES (1, N'Clair Seine')
INSERT [dbo].[Author] ([AuthorID], [Authorname]) VALUES (2, N'Adrian Dripps')
INSERT [dbo].[Author] ([AuthorID], [Authorname]) VALUES (3, N'Jesse Falkous')
INSERT [dbo].[Author] ([AuthorID], [Authorname]) VALUES (4, N'Georgianna Chastenet')
INSERT [dbo].[Author] ([AuthorID], [Authorname]) VALUES (5, N'Kiel Twidle')
INSERT [dbo].[Author] ([AuthorID], [Authorname]) VALUES (6, N'Aloysia Cuzen')
INSERT [dbo].[Author] ([AuthorID], [Authorname]) VALUES (7, N'Edsel McReynold')
INSERT [dbo].[Author] ([AuthorID], [Authorname]) VALUES (8, N'Chrystal Longcaster')
INSERT [dbo].[Author] ([AuthorID], [Authorname]) VALUES (9, N'Merrick Veelers')
INSERT [dbo].[Author] ([AuthorID], [Authorname]) VALUES (10, N'Issie Merriman')
SET IDENTITY_INSERT [dbo].[Author] OFF
SET IDENTITY_INSERT [dbo].[BookIssue] ON 

INSERT [dbo].[BookIssue] ([BookIssueID], [UserID], [BookID], [BorrowedTotal], [BorrowedDate], [DueDate], [ReturnDate], [Status]) VALUES (16, 2, 1, 1, CAST(N'2021-11-13 00:00:00.000' AS DateTime), CAST(N'2021-11-20 00:00:00.000' AS DateTime), CAST(N'2021-11-13 18:56:33.000' AS DateTime), 1)
INSERT [dbo].[BookIssue] ([BookIssueID], [UserID], [BookID], [BorrowedTotal], [BorrowedDate], [DueDate], [ReturnDate], [Status]) VALUES (17, 2, 2, 1, CAST(N'2021-11-13 00:00:00.000' AS DateTime), CAST(N'2021-11-10 00:00:00.000' AS DateTime), NULL, -1)
INSERT [dbo].[BookIssue] ([BookIssueID], [UserID], [BookID], [BorrowedTotal], [BorrowedDate], [DueDate], [ReturnDate], [Status]) VALUES (18, 2, 1, 1, CAST(N'2021-11-13 00:00:00.000' AS DateTime), CAST(N'2021-11-10 00:00:00.000' AS DateTime), NULL, 0)
INSERT [dbo].[BookIssue] ([BookIssueID], [UserID], [BookID], [BorrowedTotal], [BorrowedDate], [DueDate], [ReturnDate], [Status]) VALUES (19, 2, 3, 1, CAST(N'2021-11-13 00:00:00.000' AS DateTime), CAST(N'2021-11-20 00:00:00.000' AS DateTime), CAST(N'2021-11-13 20:31:55.000' AS DateTime), 1)
INSERT [dbo].[BookIssue] ([BookIssueID], [UserID], [BookID], [BorrowedTotal], [BorrowedDate], [DueDate], [ReturnDate], [Status]) VALUES (20, 1, 1, 1, CAST(N'2021-11-13 00:00:00.000' AS DateTime), CAST(N'2021-11-01 00:00:00.000' AS DateTime), NULL, -1)
INSERT [dbo].[BookIssue] ([BookIssueID], [UserID], [BookID], [BorrowedTotal], [BorrowedDate], [DueDate], [ReturnDate], [Status]) VALUES (21, 1, 2, 1, CAST(N'2021-11-13 00:00:00.000' AS DateTime), CAST(N'2021-11-19 00:00:00.000' AS DateTime), CAST(N'2021-11-13 20:32:52.000' AS DateTime), 1)
INSERT [dbo].[BookIssue] ([BookIssueID], [UserID], [BookID], [BorrowedTotal], [BorrowedDate], [DueDate], [ReturnDate], [Status]) VALUES (22, 1, 3, 1, CAST(N'2021-11-13 00:00:00.000' AS DateTime), CAST(N'2021-11-18 00:00:00.000' AS DateTime), NULL, 0)
SET IDENTITY_INSERT [dbo].[BookIssue] OFF
SET IDENTITY_INSERT [dbo].[BookMaster] ON 

INSERT [dbo].[BookMaster] ([BookID], [BookName], [Genre], [AuthorID], [PublisherID], [PublishDate], [Language], [Edition], [BookCost], [NoOfPages], [BookDescription], [Available], [BookImage], [CanBorrow]) VALUES (1, N'ASP.NET 4.5 in c# and VB', N'Education, IT', 9, 5, CAST(N'2019-06-14 00:00:00.000' AS DateTime), N'English', N'1st', 351, 448, N'curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum', 5, N'1.jpg', 1)
INSERT [dbo].[BookMaster] ([BookID], [BookName], [Genre], [AuthorID], [PublisherID], [PublishDate], [Language], [Edition], [BookCost], [NoOfPages], [BookDescription], [Available], [BookImage], [CanBorrow]) VALUES (2, N'The Complete Reference ASP.Net', N'Education, IT', 5, 4, CAST(N'2019-06-06 00:00:00.000' AS DateTime), N'English', N'2nd', 461, 306, N'libero nullam sit amet turpis elementum ligula vehicula consequat morbi', 18, N'2.jpg', 1)
INSERT [dbo].[BookMaster] ([BookID], [BookName], [Genre], [AuthorID], [PublisherID], [PublishDate], [Language], [Edition], [BookCost], [NoOfPages], [BookDescription], [Available], [BookImage], [CanBorrow]) VALUES (3, N'Programming Microsoft ASP.NET MVC', N'Education, IT', 6, 8, CAST(N'2019-05-09 00:00:00.000' AS DateTime), N'English', N'1st', 254, 209, N'nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor', 12, N'3.jpg', 1)
INSERT [dbo].[BookMaster] ([BookID], [BookName], [Genre], [AuthorID], [PublisherID], [PublishDate], [Language], [Edition], [BookCost], [NoOfPages], [BookDescription], [Available], [BookImage], [CanBorrow]) VALUES (4, N'THE POWER OF YOUR SUBCONSCIOUS MIND', N'Self Help, Motivation', 3, 5, CAST(N'2019-08-07 00:00:00.000' AS DateTime), N'English', N'3rd', 476, 343, N'interdum in ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae', 1, N'4.jpg', 1)
INSERT [dbo].[BookMaster] ([BookID], [BookName], [Genre], [AuthorID], [PublisherID], [PublishDate], [Language], [Edition], [BookCost], [NoOfPages], [BookDescription], [Available], [BookImage], [CanBorrow]) VALUES (5, N'HOW TO WIN FRIENDS INFLUENCE PEOPLE', N'Self Help', 4, 1, CAST(N'2019-09-22 00:00:00.000' AS DateTime), N'English', N'1st', 253, 262, N'consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu', 8, N'5.jpg', 1)
INSERT [dbo].[BookMaster] ([BookID], [BookName], [Genre], [AuthorID], [PublisherID], [PublishDate], [Language], [Edition], [BookCost], [NoOfPages], [BookDescription], [Available], [BookImage], [CanBorrow]) VALUES (6, N'PAST FORWARD', N'Fiction, Romance', 2, 7, CAST(N'2019-04-15 00:00:00.000' AS DateTime), N'English', N'1st', 399, 284, N'sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum', 1, N'6.jpg', 1)
INSERT [dbo].[BookMaster] ([BookID], [BookName], [Genre], [AuthorID], [PublisherID], [PublishDate], [Language], [Edition], [BookCost], [NoOfPages], [BookDescription], [Available], [BookImage], [CanBorrow]) VALUES (7, N'JAVA - HOW TO PROGRAM', N'Education, IT', 7, 5, CAST(N'2019-03-11 00:00:00.000' AS DateTime), N'English', N'2nd', 403, 388, N'viverra diam vitae quam suspendisse potenti nullam porttitor lacus at', 5, N'7.jpg', 1)
INSERT [dbo].[BookMaster] ([BookID], [BookName], [Genre], [AuthorID], [PublisherID], [PublishDate], [Language], [Edition], [BookCost], [NoOfPages], [BookDescription], [Available], [BookImage], [CanBorrow]) VALUES (8, N'Programming Microsoft SQL Server 2012', N'Education, IT', 8, 1, CAST(N'2019-08-05 00:00:00.000' AS DateTime), N'English', N'1st', 411, 287, N'urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam', 8, N'8.jpg', 0)
INSERT [dbo].[BookMaster] ([BookID], [BookName], [Genre], [AuthorID], [PublisherID], [PublishDate], [Language], [Edition], [BookCost], [NoOfPages], [BookDescription], [Available], [BookImage], [CanBorrow]) VALUES (9, N'Microsoft SQL Server 2014', N'Education, IT', 1, 10, CAST(N'2019-02-07 00:00:00.000' AS DateTime), N'English', N'2nd', 279, 213, N'in ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae', 0, N'9.jpg', 1)
SET IDENTITY_INSERT [dbo].[BookMaster] OFF
SET IDENTITY_INSERT [dbo].[Penalty] ON 

INSERT [dbo].[Penalty] ([PenaltyID], [BookIssueID], [Price], [Detail]) VALUES (4, 17, 6, N'Late')
INSERT [dbo].[Penalty] ([PenaltyID], [BookIssueID], [Price], [Detail]) VALUES (5, 20, 24, N'Return late')
SET IDENTITY_INSERT [dbo].[Penalty] OFF
SET IDENTITY_INSERT [dbo].[Publisher] ON 

INSERT [dbo].[Publisher] ([PublisherID], [Publishername]) VALUES (1, N'Seven Stories Press')
INSERT [dbo].[Publisher] ([PublisherID], [Publishername]) VALUES (2, N'New Directions')
INSERT [dbo].[Publisher] ([PublisherID], [Publishername]) VALUES (3, N'Candlewick Press')
INSERT [dbo].[Publisher] ([PublisherID], [Publishername]) VALUES (4, N'Akashic Books')
INSERT [dbo].[Publisher] ([PublisherID], [Publishername]) VALUES (5, N'Puffin Books')
INSERT [dbo].[Publisher] ([PublisherID], [Publishername]) VALUES (6, N'Harper Collins')
INSERT [dbo].[Publisher] ([PublisherID], [Publishername]) VALUES (7, N'Hachette Livre')
INSERT [dbo].[Publisher] ([PublisherID], [Publishername]) VALUES (8, N'Hachette Book Group')
INSERT [dbo].[Publisher] ([PublisherID], [Publishername]) VALUES (9, N'Macmillan')
INSERT [dbo].[Publisher] ([PublisherID], [Publishername]) VALUES (10, N'Kim Dong')
SET IDENTITY_INSERT [dbo].[Publisher] OFF
SET IDENTITY_INSERT [dbo].[Reservation] ON 

INSERT [dbo].[Reservation] ([ReservationID], [UserID], [BookID], [Quantity], [Date], [Status]) VALUES (1, 5, 6, 3, CAST(N'2021-10-07 20:12:47.000' AS DateTime), 0)
INSERT [dbo].[Reservation] ([ReservationID], [UserID], [BookID], [Quantity], [Date], [Status]) VALUES (2, 2, 2, 3, CAST(N'2021-09-10 02:55:49.000' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Reservation] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [FullName], [UserNumberID], [Sex], [Dob], [Phone], [Email], [FullAddress], [Password], [Image], [AccountStatus], [IsAdmin]) VALUES (1, N'Admin', N'IA485361', 1, CAST(N'2004-03-20 18:02:15.000' AS DateTime), N'483-447-3159', N'admin@gmail.com', N'157 6th Hill', N'123', N'avatar-3.jpg', 1, 1)
INSERT [dbo].[User] ([UserID], [FullName], [UserNumberID], [Sex], [Dob], [Phone], [Email], [FullAddress], [Password], [Image], [AccountStatus], [IsAdmin]) VALUES (2, N'Block', N'DG497751', 0, CAST(N'2004-03-07 02:04:24.000' AS DateTime), N'180-497-8826', N'block@gmail.com', N'5882 Parkside Alley', N'123', N'avatar-1.jpg', 1, 0)
INSERT [dbo].[User] ([UserID], [FullName], [UserNumberID], [Sex], [Dob], [Phone], [Email], [FullAddress], [Password], [Image], [AccountStatus], [IsAdmin]) VALUES (3, N'Rodrique Sherrum', N'MK204718', 0, CAST(N'2001-12-17 22:30:39.000' AS DateTime), N'899-221-0258', N'block1@gmail.com', N'1729 Linden Circle', N'123', N'avatar-2.jpg', 0, 0)
INSERT [dbo].[User] ([UserID], [FullName], [UserNumberID], [Sex], [Dob], [Phone], [Email], [FullAddress], [Password], [Image], [AccountStatus], [IsAdmin]) VALUES (4, N'Timothee Oaten', N'IS154458', 0, CAST(N'2001-12-03 09:11:35.000' AS DateTime), N'534-591-2548', N'toaten3@opensource.org', N'75 Evergreen Place', N'sIwFA28Md', N'avatar-1.jpg', 1, 0)
INSERT [dbo].[User] ([UserID], [FullName], [UserNumberID], [Sex], [Dob], [Phone], [Email], [FullAddress], [Password], [Image], [AccountStatus], [IsAdmin]) VALUES (5, N'Bronson Bufton', N'HE366297', 1, CAST(N'2004-04-01 14:14:48.000' AS DateTime), N'427-534-9212', N'bbufton4@skyrock.com', N'06 Victoria Alley', N'SxSiCLML', N'avatar-2.jpg', 1, 0)
INSERT [dbo].[User] ([UserID], [FullName], [UserNumberID], [Sex], [Dob], [Phone], [Email], [FullAddress], [Password], [Image], [AccountStatus], [IsAdmin]) VALUES (6, N'Neron Matias', N'DG491945', 0, CAST(N'2003-11-17 04:37:29.000' AS DateTime), N'835-561-5266', N'nmatias5@networkadvertising.org', N'47512 Ramsey Trail', N'Hu0vfPypJ', N'avatar-1.jpg', 1, 0)
INSERT [dbo].[User] ([UserID], [FullName], [UserNumberID], [Sex], [Dob], [Phone], [Email], [FullAddress], [Password], [Image], [AccountStatus], [IsAdmin]) VALUES (7, N'Stormy Blood', N'IA630279', 0, CAST(N'2000-09-28 04:17:52.000' AS DateTime), N'724-922-0517', N'sblood6@tiny.cc', N'8325 Killdeer Plaza', N'4DhPC4E7XCSZ', N'avatar-5.jpg', 1, 0)
INSERT [dbo].[User] ([UserID], [FullName], [UserNumberID], [Sex], [Dob], [Phone], [Email], [FullAddress], [Password], [Image], [AccountStatus], [IsAdmin]) VALUES (8, N'Denver Dawid', N'HS406817', 0, CAST(N'2004-06-12 14:42:02.000' AS DateTime), N'660-152-2318', N'ddawid7@wikispaces.com', N'10 Maryland Parkway', N'WKX40Gmxp', N'avatar-1.jpg', 1, 1)
INSERT [dbo].[User] ([UserID], [FullName], [UserNumberID], [Sex], [Dob], [Phone], [Email], [FullAddress], [Password], [Image], [AccountStatus], [IsAdmin]) VALUES (9, N'Jerrylee Egan', N'HS834925', 1, CAST(N'2004-10-18 20:40:14.000' AS DateTime), N'745-473-5749', N'jegan8@psu.edu', N'415 Packers Place', N'HncPML', N'avatar-3.jpg', 1, 0)
INSERT [dbo].[User] ([UserID], [FullName], [UserNumberID], [Sex], [Dob], [Phone], [Email], [FullAddress], [Password], [Image], [AccountStatus], [IsAdmin]) VALUES (10, N'Emili Meadmore', N'HS632402', 1, CAST(N'2003-02-23 07:47:13.000' AS DateTime), N'664-617-6955', N'emeadmore9@tamu.edu', N'7046 Armistice Circle', N'KrNoN18', N'avatar-1.jpg', 0, 0)
INSERT [dbo].[User] ([UserID], [FullName], [UserNumberID], [Sex], [Dob], [Phone], [Email], [FullAddress], [Password], [Image], [AccountStatus], [IsAdmin]) VALUES (11, N'Alika Worsnap', N'IS874888', 1, CAST(N'2003-08-01 20:19:01.000' AS DateTime), N'563-502-6626', N'aworsnapa@com.com', N'38677 Knutson Parkway', N'tG1xeFUpFujL', N'avatar-1.jpg', 0, 1)
INSERT [dbo].[User] ([UserID], [FullName], [UserNumberID], [Sex], [Dob], [Phone], [Email], [FullAddress], [Password], [Image], [AccountStatus], [IsAdmin]) VALUES (12, N'Chrysler Mil', N'HE429093', 1, CAST(N'2000-12-08 02:03:40.000' AS DateTime), N'891-548-8082', N'cmilb@lycos.com', N'95 Grover Crossing', N'FhBfHXkqJ', N'avatar-4.jpg', 0, 0)
INSERT [dbo].[User] ([UserID], [FullName], [UserNumberID], [Sex], [Dob], [Phone], [Email], [FullAddress], [Password], [Image], [AccountStatus], [IsAdmin]) VALUES (13, N'Inger Lamanby', N'AI799748', 1, CAST(N'1999-10-17 01:38:27.000' AS DateTime), N'857-443-3758', N'ilamanbyc@ca.gov', N'796 Welch Road', N'pcfhkm3MZm', N'avatar-1.jpg', 1, 0)
INSERT [dbo].[User] ([UserID], [FullName], [UserNumberID], [Sex], [Dob], [Phone], [Email], [FullAddress], [Password], [Image], [AccountStatus], [IsAdmin]) VALUES (14, N'Kariotta Sarsons', N'IA125725', 0, CAST(N'2003-07-04 03:13:21.000' AS DateTime), N'502-107-9987', N'ksarsonsd@sakura.ne.jp', N'2527 Rusk Way', N'9Zx6l4ncCyjx', N'avatar-1.jpg', 1, 1)
INSERT [dbo].[User] ([UserID], [FullName], [UserNumberID], [Sex], [Dob], [Phone], [Email], [FullAddress], [Password], [Image], [AccountStatus], [IsAdmin]) VALUES (15, N'Elsey Sorley', N'HE961136', 0, CAST(N'2002-06-05 04:48:20.000' AS DateTime), N'938-197-0463', N'esorleye@nih.gov', N'086 Valley Edge Alley', N'Bmr84mF', N'avatar-5.jpg', 1, 0)
INSERT [dbo].[User] ([UserID], [FullName], [UserNumberID], [Sex], [Dob], [Phone], [Email], [FullAddress], [Password], [Image], [AccountStatus], [IsAdmin]) VALUES (16, N'Leigha Garbutt', N'DG726469', 1, CAST(N'2004-03-19 03:24:51.000' AS DateTime), N'225-412-7728', N'lgarbuttf@webs.com', N'33795 Tomscot Avenue', N'fFPDYb', N'avatar-1.jpg', 1, 0)
INSERT [dbo].[User] ([UserID], [FullName], [UserNumberID], [Sex], [Dob], [Phone], [Email], [FullAddress], [Password], [Image], [AccountStatus], [IsAdmin]) VALUES (17, N'Sancho Decort', N'MK511626', 0, CAST(N'1999-10-09 14:07:39.000' AS DateTime), N'340-669-4390', N'sdecortg@github.com', N'353 Westerfield Junction', N'bwce5xBl', N'avatar-4.jpg', 1, 0)
INSERT [dbo].[User] ([UserID], [FullName], [UserNumberID], [Sex], [Dob], [Phone], [Email], [FullAddress], [Password], [Image], [AccountStatus], [IsAdmin]) VALUES (18, N'Frazer Hawkridge', N'HE412659', 0, CAST(N'1999-03-14 22:23:44.000' AS DateTime), N'743-278-4281', N'fhawkridgeh@dailymotion.com', N'5 Lindbergh Alley', N'oGpgGgWgMB', N'avatar-1.jpg', 0, 0)
INSERT [dbo].[User] ([UserID], [FullName], [UserNumberID], [Sex], [Dob], [Phone], [Email], [FullAddress], [Password], [Image], [AccountStatus], [IsAdmin]) VALUES (19, N'Katrine Maddox', N'IS340243', 0, CAST(N'1999-04-06 19:37:17.000' AS DateTime), N'874-750-9212', N'kmaddoxi@uol.com.br', N'23 Lotheville Pass', N'kl5YChEi63V', N'avatar-3.jpg', 0, 0)
INSERT [dbo].[User] ([UserID], [FullName], [UserNumberID], [Sex], [Dob], [Phone], [Email], [FullAddress], [Password], [Image], [AccountStatus], [IsAdmin]) VALUES (20, N'Jacky Ferron', N'HS644593', 1, CAST(N'2003-02-14 21:44:53.000' AS DateTime), N'284-996-5200', N'jferronj@yahoo.com', N'3833 Maryland Park', N'MBV5OwMwou', N'avatar-1.jpg', 0, 0)
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[BookIssue]  WITH CHECK ADD FOREIGN KEY([BookID])
REFERENCES [dbo].[BookMaster] ([BookID])
GO
ALTER TABLE [dbo].[BookIssue]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[BookMaster]  WITH CHECK ADD FOREIGN KEY([AuthorID])
REFERENCES [dbo].[Author] ([AuthorID])
GO
ALTER TABLE [dbo].[BookMaster]  WITH CHECK ADD FOREIGN KEY([PublisherID])
REFERENCES [dbo].[Publisher] ([PublisherID])
GO
ALTER TABLE [dbo].[Penalty]  WITH CHECK ADD FOREIGN KEY([BookIssueID])
REFERENCES [dbo].[BookIssue] ([BookIssueID])
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD FOREIGN KEY([BookID])
REFERENCES [dbo].[BookMaster] ([BookID])
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
