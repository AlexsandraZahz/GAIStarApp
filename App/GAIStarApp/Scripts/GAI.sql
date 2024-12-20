USE [GAI]
GO
/****** Object:  Table [dbo].[Accidents]    Script Date: 17.12.2024 21:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accidents](
	[AccidentID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NULL,
	[Time] [time](7) NULL,
	[Location] [varchar](100) NULL,
	[Description] [text] NULL,
	[DamageAmount] [decimal](10, 2) NULL,
	[VehicleID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[AccidentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 17.12.2024 21:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[BrandID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[BrandID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cameras]    Script Date: 17.12.2024 21:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cameras](
	[CameraID] [int] IDENTITY(1,1) NOT NULL,
	[Location] [varchar](100) NULL,
	[Status] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[CameraID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Drivers]    Script Date: 17.12.2024 21:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Drivers](
	[DriverID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [varchar](100) NOT NULL,
	[DateOfBirth] [date] NULL,
	[LicenseNumber] [varchar](20) NOT NULL,
	[UserID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[DriverID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fines]    Script Date: 17.12.2024 21:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fines](
	[FineID] [int] IDENTITY(1,1) NOT NULL,
	[DriverID] [int] NULL,
	[DateOfViolation] [date] NULL,
	[ViolationID] [int] NULL,
	[Amount] [decimal](10, 2) NULL,
	[IsPaid] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[FineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GAIEmployees]    Script Date: 17.12.2024 21:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GAIEmployees](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [varchar](100) NOT NULL,
	[Position] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentMethods]    Script Date: 17.12.2024 21:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentMethods](
	[PaymentMethodID] [int] IDENTITY(1,1) NOT NULL,
	[PaymentMethodName] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentMethodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 17.12.2024 21:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[PaymentID] [int] IDENTITY(1,1) NOT NULL,
	[FineID] [int] NULL,
	[UserID] [int] NULL,
	[PaymentDate] [datetime] NULL,
	[PaymentAmount] [decimal](10, 2) NULL,
	[PaymentMethodID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reports]    Script Date: 17.12.2024 21:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reports](
	[ReportID] [int] IDENTITY(1,1) NOT NULL,
	[ReportType] [nvarchar](50) NOT NULL,
	[DateGenerated] [datetime] NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ReportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 17.12.2024 21:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 17.12.2024 21:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[PasswordHash] [varchar](255) NOT NULL,
	[RoleID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehicles]    Script Date: 17.12.2024 21:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicles](
	[VehicleID] [int] IDENTITY(1,1) NOT NULL,
	[BrandID] [int] NULL,
	[Model] [varchar](50) NULL,
	[VIN] [varchar](17) NOT NULL,
	[LicensePlate] [varchar](10) NOT NULL,
	[OwnerID] [int] NULL,
	[InsuranceInfo] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[VehicleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Violations]    Script Date: 17.12.2024 21:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Violations](
	[ViolationID] [int] IDENTITY(1,1) NOT NULL,
	[ViolationType] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ViolationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Accidents] ON 

INSERT [dbo].[Accidents] ([AccidentID], [Date], [Time], [Location], [Description], [DamageAmount], [VehicleID]) VALUES (1, CAST(N'2023-03-10' AS Date), CAST(N'14:30:00' AS Time), N'Main Street', N'Minor collision', CAST(500.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Accidents] ([AccidentID], [Date], [Time], [Location], [Description], [DamageAmount], [VehicleID]) VALUES (2, CAST(N'2023-04-15' AS Date), CAST(N'10:15:00' AS Time), N'Park Avenue', N'Rear-end collision', CAST(1500.00 AS Decimal(10, 2)), 2)
INSERT [dbo].[Accidents] ([AccidentID], [Date], [Time], [Location], [Description], [DamageAmount], [VehicleID]) VALUES (3, CAST(N'2023-05-20' AS Date), CAST(N'16:45:00' AS Time), N'Lenin Street', N'Side collision', CAST(800.00 AS Decimal(10, 2)), 3)
INSERT [dbo].[Accidents] ([AccidentID], [Date], [Time], [Location], [Description], [DamageAmount], [VehicleID]) VALUES (1002, CAST(N'2024-12-13' AS Date), CAST(N'12:00:00' AS Time), N'Ispo,Polytech', N'GG', CAST(300.00 AS Decimal(10, 2)), 8)
INSERT [dbo].[Accidents] ([AccidentID], [Date], [Time], [Location], [Description], [DamageAmount], [VehicleID]) VALUES (1003, CAST(N'2024-12-12' AS Date), CAST(N'12:00:00' AS Time), N'Isoi', N'afffafsf', CAST(100.00 AS Decimal(10, 2)), 2)
INSERT [dbo].[Accidents] ([AccidentID], [Date], [Time], [Location], [Description], [DamageAmount], [VehicleID]) VALUES (1004, CAST(N'2024-12-05' AS Date), CAST(N'12:00:00' AS Time), N'dghggasdasd!!@@@', N'ffaffsa!!@!', CAST(342.00 AS Decimal(10, 2)), 1005)
INSERT [dbo].[Accidents] ([AccidentID], [Date], [Time], [Location], [Description], [DamageAmount], [VehicleID]) VALUES (1005, CAST(N'2024-12-12' AS Date), CAST(N'12:00:00' AS Time), N'2313231331', N'dsadadasdada', CAST(322.00 AS Decimal(10, 2)), 1010)
INSERT [dbo].[Accidents] ([AccidentID], [Date], [Time], [Location], [Description], [DamageAmount], [VehicleID]) VALUES (1006, CAST(N'2014-12-12' AS Date), CAST(N'12:00:00' AS Time), N'Polytech', N'HEHEHEHHEHEHEHEHE', CAST(100.00 AS Decimal(10, 2)), 1010)
SET IDENTITY_INSERT [dbo].[Accidents] OFF
GO
SET IDENTITY_INSERT [dbo].[Brands] ON 

INSERT [dbo].[Brands] ([BrandID], [Description]) VALUES (1, N'Toyota')
INSERT [dbo].[Brands] ([BrandID], [Description]) VALUES (2, N'Ford')
INSERT [dbo].[Brands] ([BrandID], [Description]) VALUES (3, N'BMW')
INSERT [dbo].[Brands] ([BrandID], [Description]) VALUES (4, N'Honda')
INSERT [dbo].[Brands] ([BrandID], [Description]) VALUES (5, N'Volkswagen')
INSERT [dbo].[Brands] ([BrandID], [Description]) VALUES (6, N'Mercedes-Benz')
INSERT [dbo].[Brands] ([BrandID], [Description]) VALUES (7, N'Lada')
SET IDENTITY_INSERT [dbo].[Brands] OFF
GO
SET IDENTITY_INSERT [dbo].[Cameras] ON 

INSERT [dbo].[Cameras] ([CameraID], [Location], [Status]) VALUES (1, N'Nevsky Prospect, St. Petersburg', N'Online')
INSERT [dbo].[Cameras] ([CameraID], [Location], [Status]) VALUES (2, N'Palace Square, St. Petersburg', N'Offline')
INSERT [dbo].[Cameras] ([CameraID], [Location], [Status]) VALUES (3, N'Peter and Paul Fortress, St. Petersburg', N'Online')
INSERT [dbo].[Cameras] ([CameraID], [Location], [Status]) VALUES (4, N'Hermitage Museum, St. Petersburg', N'Offline')
INSERT [dbo].[Cameras] ([CameraID], [Location], [Status]) VALUES (5, N'Kazan Cathedral, St. Petersburg', N'Online')
INSERT [dbo].[Cameras] ([CameraID], [Location], [Status]) VALUES (6, N'Church of the Savior on Spilled Blood, St. Petersburg', N'Offline')
INSERT [dbo].[Cameras] ([CameraID], [Location], [Status]) VALUES (7, N'Mariinsky Theatre, St. Petersburg', N'Online')
INSERT [dbo].[Cameras] ([CameraID], [Location], [Status]) VALUES (8, N'Vasilyevsky Island, St. Petersburg', N'Offline')
INSERT [dbo].[Cameras] ([CameraID], [Location], [Status]) VALUES (9, N'St. Isaac''s Cathedral, St. Petersburg', N'Online')
INSERT [dbo].[Cameras] ([CameraID], [Location], [Status]) VALUES (10, N'Alexander Nevsky Monastery, St. Petersburg', N'Offline')
INSERT [dbo].[Cameras] ([CameraID], [Location], [Status]) VALUES (11, N'Ligovsky Avenue, St. Petersburg', N'Online')
INSERT [dbo].[Cameras] ([CameraID], [Location], [Status]) VALUES (12, N'Moskovsky Prospekt, St. Petersburg', N'Offline')
INSERT [dbo].[Cameras] ([CameraID], [Location], [Status]) VALUES (13, N'Gorkovskaya Metro Station, St. Petersburg', N'Online')
INSERT [dbo].[Cameras] ([CameraID], [Location], [Status]) VALUES (14, N'Avtovo Metro Station, St. Petersburg', N'Offline')
INSERT [dbo].[Cameras] ([CameraID], [Location], [Status]) VALUES (15, N'Pushkinskaya Metro Station, St. Petersburg', N'Online')
INSERT [dbo].[Cameras] ([CameraID], [Location], [Status]) VALUES (16, N'Vladimirskaya Metro Station, St. Petersburg', N'Offline')
INSERT [dbo].[Cameras] ([CameraID], [Location], [Status]) VALUES (17, N'Admiralteyskaya Metro Station, St. Petersburg', N'Online')
INSERT [dbo].[Cameras] ([CameraID], [Location], [Status]) VALUES (18, N'Sadovaya Street, St. Petersburg', N'Offline')
INSERT [dbo].[Cameras] ([CameraID], [Location], [Status]) VALUES (19, N'Zayachy Island, St. Petersburg', N'Online')
INSERT [dbo].[Cameras] ([CameraID], [Location], [Status]) VALUES (20, N'Krestovsky Island, St. Petersburg', N'Offline')
INSERT [dbo].[Cameras] ([CameraID], [Location], [Status]) VALUES (21, N'Lenexpo Exhibition Complex, St. Petersburg', N'Online')
INSERT [dbo].[Cameras] ([CameraID], [Location], [Status]) VALUES (22, N'Pulkovo Airport, St. Petersburg', N'Offline')
INSERT [dbo].[Cameras] ([CameraID], [Location], [Status]) VALUES (23, N'Finlyandsky Railway Station, St. Petersburg', N'Online')
INSERT [dbo].[Cameras] ([CameraID], [Location], [Status]) VALUES (24, N'Moskovsky Railway Station, St. Petersburg', N'Offline')
INSERT [dbo].[Cameras] ([CameraID], [Location], [Status]) VALUES (25, N'Vitebsky Railway Station, St. Petersburg', N'Online')
INSERT [dbo].[Cameras] ([CameraID], [Location], [Status]) VALUES (26, N'Dostoevsky Museum, St. Petersburg', N'Offline')
INSERT [dbo].[Cameras] ([CameraID], [Location], [Status]) VALUES (27, N'Summer Garden, St. Petersburg', N'Online')
INSERT [dbo].[Cameras] ([CameraID], [Location], [Status]) VALUES (28, N'Tauride Garden, St. Petersburg', N'Offline')
INSERT [dbo].[Cameras] ([CameraID], [Location], [Status]) VALUES (29, N'Petrogradskaya Side, St. Petersburg', N'Online')
INSERT [dbo].[Cameras] ([CameraID], [Location], [Status]) VALUES (30, N'Kirovsky District, St. Petersburg', N'Offline')
INSERT [dbo].[Cameras] ([CameraID], [Location], [Status]) VALUES (31, N'Frunzensky District, St. Petersburg', N'Online')
INSERT [dbo].[Cameras] ([CameraID], [Location], [Status]) VALUES (32, N'Primorsky District, St. Petersburg', N'Offline')
INSERT [dbo].[Cameras] ([CameraID], [Location], [Status]) VALUES (33, N'Lomonosov, St. Petersburg Region', N'Online')
INSERT [dbo].[Cameras] ([CameraID], [Location], [Status]) VALUES (34, N'Peterhof, St. Petersburg Region', N'Offline')
INSERT [dbo].[Cameras] ([CameraID], [Location], [Status]) VALUES (35, N'Pushkin (Tsarskoye Selo), St. Petersburg Region', N'Online')
INSERT [dbo].[Cameras] ([CameraID], [Location], [Status]) VALUES (36, N'Pavlovsk, St. Petersburg Region', N'Offline')
INSERT [dbo].[Cameras] ([CameraID], [Location], [Status]) VALUES (37, N'Kronshtadt, St. Petersburg Region', N'Online')
INSERT [dbo].[Cameras] ([CameraID], [Location], [Status]) VALUES (38, N'Sestroretsk, St. Petersburg Region', N'Offline')
INSERT [dbo].[Cameras] ([CameraID], [Location], [Status]) VALUES (39, N'Kurortny District, St. Petersburg', N'Online')
INSERT [dbo].[Cameras] ([CameraID], [Location], [Status]) VALUES (40, N'Shushary, St. Petersburg', N'Offline')
SET IDENTITY_INSERT [dbo].[Cameras] OFF
GO
SET IDENTITY_INSERT [dbo].[Drivers] ON 

INSERT [dbo].[Drivers] ([DriverID], [FullName], [DateOfBirth], [LicenseNumber], [UserID]) VALUES (1, N'Zazharskaya Alexsandra Vitalevna', CAST(N'1988-07-20' AS Date), N'C112233445', 1)
INSERT [dbo].[Drivers] ([DriverID], [FullName], [DateOfBirth], [LicenseNumber], [UserID]) VALUES (2, N'Krotov Alexey Dmitrievich', CAST(N'1992-03-10' AS Date), N'D556677889', 2)
INSERT [dbo].[Drivers] ([DriverID], [FullName], [DateOfBirth], [LicenseNumber], [UserID]) VALUES (3, N'Putin Vladimir Vladimirovish', CAST(N'1980-11-25' AS Date), N'E998877665', 9)
INSERT [dbo].[Drivers] ([DriverID], [FullName], [DateOfBirth], [LicenseNumber], [UserID]) VALUES (4, N'Petrov Ivan Ivanovish', CAST(N'1995-09-05' AS Date), N'F443322110', 10)
INSERT [dbo].[Drivers] ([DriverID], [FullName], [DateOfBirth], [LicenseNumber], [UserID]) VALUES (5, N'Anichenko Polina Vitalevna', CAST(N'1952-10-07' AS Date), N'G123456789', 11)
INSERT [dbo].[Drivers] ([DriverID], [FullName], [DateOfBirth], [LicenseNumber], [UserID]) VALUES (1002, N'Krotov Dmitrii Aleksandrovich', CAST(N'1970-08-12' AS Date), N'3213331323132', 2002)
INSERT [dbo].[Drivers] ([DriverID], [FullName], [DateOfBirth], [LicenseNumber], [UserID]) VALUES (1003, N'bxcnklbxcvklbxczklihxdgfklidshlidvshkuidgzfhlibdzfohlibsvkjgeswbnjgewbzsoljidgsnktewdsfolsjdgsfnklsb', CAST(N'1459-01-05' AS Date), N'3354637478', 2003)
INSERT [dbo].[Drivers] ([DriverID], [FullName], [DateOfBirth], [LicenseNumber], [UserID]) VALUES (1004, N'???? ?????? ????????', CAST(N'1990-01-01' AS Date), N'1234567890', 2004)
INSERT [dbo].[Drivers] ([DriverID], [FullName], [DateOfBirth], [LicenseNumber], [UserID]) VALUES (1005, N'Toplenov Kilka Maslovish', CAST(N'2001-03-22' AS Date), N'3232132132', 2005)
INSERT [dbo].[Drivers] ([DriverID], [FullName], [DateOfBirth], [LicenseNumber], [UserID]) VALUES (1006, N'Vanish Vanish Vanish', CAST(N'1980-08-12' AS Date), N'3321332313', 2006)
SET IDENTITY_INSERT [dbo].[Drivers] OFF
GO
SET IDENTITY_INSERT [dbo].[Fines] ON 

INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (1, 3, CAST(N'2023-01-20' AS Date), 2, CAST(300.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (2, 4, CAST(N'2023-02-15' AS Date), 4, CAST(750.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (3, 5, CAST(N'2023-03-10' AS Date), 6, CAST(200.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (7, 1, CAST(N'2023-03-10' AS Date), 2, CAST(367.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (8, 1, CAST(N'2023-02-15' AS Date), 4, CAST(757.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (9, 1, CAST(N'2023-01-20' AS Date), 2, CAST(370.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (10, 1, CAST(N'2023-01-01' AS Date), 1, CAST(500.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (11, 1, CAST(N'2023-01-15' AS Date), 2, CAST(100.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (12, 1, CAST(N'2023-02-10' AS Date), 3, CAST(750.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (13, 1, CAST(N'2023-03-05' AS Date), 4, CAST(300.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (14, 1, CAST(N'2023-04-20' AS Date), 5, CAST(200.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (15, 1, CAST(N'2023-05-12' AS Date), 6, CAST(150.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (16, 1, CAST(N'2023-06-08' AS Date), 7, CAST(800.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (17, 1, CAST(N'2023-07-14' AS Date), 8, CAST(600.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (18, 1, CAST(N'2023-08-25' AS Date), 1, CAST(400.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (19, 1, CAST(N'2023-09-30' AS Date), 2, CAST(900.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (20, 2, CAST(N'2023-01-02' AS Date), 3, CAST(500.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (21, 2, CAST(N'2023-01-16' AS Date), 4, CAST(100.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (22, 2, CAST(N'2023-02-11' AS Date), 5, CAST(750.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (23, 2, CAST(N'2023-03-06' AS Date), 6, CAST(300.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (24, 2, CAST(N'2023-04-21' AS Date), 7, CAST(200.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (25, 2, CAST(N'2023-05-13' AS Date), 8, CAST(150.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (26, 2, CAST(N'2023-06-09' AS Date), 1, CAST(800.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (27, 2, CAST(N'2023-07-15' AS Date), 2, CAST(600.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (28, 2, CAST(N'2023-08-26' AS Date), 3, CAST(400.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (29, 2, CAST(N'2023-09-30' AS Date), 4, CAST(900.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (30, 3, CAST(N'2023-01-03' AS Date), 5, CAST(500.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (31, 3, CAST(N'2023-01-17' AS Date), 6, CAST(100.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (32, 3, CAST(N'2023-02-12' AS Date), 7, CAST(750.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (33, 3, CAST(N'2023-03-07' AS Date), 8, CAST(300.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (34, 3, CAST(N'2023-04-22' AS Date), 1, CAST(200.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (35, 3, CAST(N'2023-05-14' AS Date), 2, CAST(150.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (36, 3, CAST(N'2023-06-10' AS Date), 3, CAST(800.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (37, 3, CAST(N'2023-07-16' AS Date), 4, CAST(600.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (38, 3, CAST(N'2023-08-27' AS Date), 5, CAST(400.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (39, 3, CAST(N'2023-09-30' AS Date), 6, CAST(900.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (40, 4, CAST(N'2023-01-04' AS Date), 7, CAST(500.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (41, 4, CAST(N'2023-01-18' AS Date), 8, CAST(100.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (42, 4, CAST(N'2023-02-13' AS Date), 1, CAST(750.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (43, 4, CAST(N'2023-03-08' AS Date), 2, CAST(300.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (44, 4, CAST(N'2023-04-23' AS Date), 3, CAST(200.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (45, 4, CAST(N'2023-05-15' AS Date), 4, CAST(150.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (46, 4, CAST(N'2023-06-11' AS Date), 5, CAST(800.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (47, 4, CAST(N'2023-07-17' AS Date), 6, CAST(600.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (48, 4, CAST(N'2023-08-28' AS Date), 7, CAST(400.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (49, 4, CAST(N'2023-09-30' AS Date), 8, CAST(900.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (50, 5, CAST(N'2023-01-05' AS Date), 1, CAST(500.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (51, 5, CAST(N'2023-01-19' AS Date), 2, CAST(100.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (52, 5, CAST(N'2023-02-14' AS Date), 3, CAST(750.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (53, 5, CAST(N'2023-03-09' AS Date), 4, CAST(300.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (54, 5, CAST(N'2023-04-24' AS Date), 5, CAST(2000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (55, 5, CAST(N'2023-05-16' AS Date), 6, CAST(1500.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (56, 5, CAST(N'2023-06-12' AS Date), 7, CAST(800.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (57, 5, CAST(N'2023-07-18' AS Date), 8, CAST(600.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (58, 5, CAST(N'2023-08-29' AS Date), 1, CAST(400.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (59, 5, CAST(N'2023-09-30' AS Date), 2, CAST(900.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (60, 1, CAST(N'2022-09-30' AS Date), 8, CAST(157.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (61, 1, CAST(N'2022-06-14' AS Date), 5, CAST(236.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (62, 1, CAST(N'2022-02-03' AS Date), 7, CAST(421.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (63, 1, CAST(N'2022-06-05' AS Date), 1, CAST(127.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (64, 1, CAST(N'2022-03-02' AS Date), 8, CAST(269.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (65, 1, CAST(N'2022-08-08' AS Date), 5, CAST(214.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (66, 1, CAST(N'2022-06-22' AS Date), 8, CAST(493.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (67, 1, CAST(N'2022-02-05' AS Date), 4, CAST(283.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (68, 1, CAST(N'2022-10-28' AS Date), 8, CAST(525.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (69, 1, CAST(N'2022-06-13' AS Date), 2, CAST(730.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (70, 2, CAST(N'2022-04-06' AS Date), 8, CAST(248.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (71, 2, CAST(N'2022-09-03' AS Date), 1, CAST(474.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (72, 2, CAST(N'2022-06-02' AS Date), 4, CAST(380.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (73, 2, CAST(N'2022-06-09' AS Date), 7, CAST(172.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (74, 2, CAST(N'2022-06-06' AS Date), 8, CAST(343.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (75, 2, CAST(N'2022-11-13' AS Date), 5, CAST(548.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (76, 2, CAST(N'2022-04-07' AS Date), 6, CAST(514.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (77, 2, CAST(N'2022-01-28' AS Date), 6, CAST(397.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (78, 2, CAST(N'2022-02-09' AS Date), 2, CAST(319.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (79, 2, CAST(N'2022-03-23' AS Date), 5, CAST(232.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (80, 3, CAST(N'2022-08-19' AS Date), 2, CAST(140.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (81, 3, CAST(N'2022-12-10' AS Date), 1, CAST(56.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (82, 3, CAST(N'2022-01-22' AS Date), 4, CAST(190.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (83, 3, CAST(N'2022-09-26' AS Date), 7, CAST(484.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (84, 3, CAST(N'2022-12-05' AS Date), 6, CAST(346.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (85, 3, CAST(N'2022-11-15' AS Date), 4, CAST(408.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (86, 3, CAST(N'2022-10-02' AS Date), 6, CAST(519.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (87, 3, CAST(N'2022-04-27' AS Date), 8, CAST(510.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (88, 3, CAST(N'2022-07-06' AS Date), 2, CAST(525.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (89, 3, CAST(N'2022-07-18' AS Date), 7, CAST(172.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (90, 4, CAST(N'2022-05-28' AS Date), 5, CAST(335.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (91, 4, CAST(N'2022-11-10' AS Date), 7, CAST(292.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (92, 4, CAST(N'2022-07-09' AS Date), 1, CAST(452.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (93, 4, CAST(N'2022-03-21' AS Date), 6, CAST(304.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (94, 4, CAST(N'2022-12-12' AS Date), 8, CAST(455.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (95, 4, CAST(N'2022-11-05' AS Date), 3, CAST(439.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (96, 4, CAST(N'2022-10-24' AS Date), 5, CAST(419.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (97, 4, CAST(N'2022-10-02' AS Date), 8, CAST(298.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (98, 4, CAST(N'2022-01-15' AS Date), 4, CAST(441.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (99, 4, CAST(N'2022-06-05' AS Date), 1, CAST(432.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (100, 5, CAST(N'2022-09-27' AS Date), 1, CAST(549.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (101, 5, CAST(N'2022-02-28' AS Date), 1, CAST(289.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (102, 5, CAST(N'2022-11-22' AS Date), 4, CAST(482.00 AS Decimal(10, 2)), 1)
GO
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (103, 5, CAST(N'2022-07-27' AS Date), 4, CAST(164.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (104, 5, CAST(N'2022-03-02' AS Date), 8, CAST(266.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (105, 5, CAST(N'2022-06-24' AS Date), 1, CAST(235.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (106, 5, CAST(N'2022-05-12' AS Date), 3, CAST(359.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (107, 5, CAST(N'2022-09-11' AS Date), 5, CAST(298.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (108, 5, CAST(N'2022-03-10' AS Date), 2, CAST(408.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (109, 5, CAST(N'2022-08-17' AS Date), 2, CAST(319.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (1002, 1, CAST(N'2024-12-12' AS Date), 6, CAST(100.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (1003, 3, CAST(N'2024-11-27' AS Date), 3, CAST(434.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (1004, 1002, CAST(N'2024-12-04' AS Date), 4, CAST(3424243.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (1005, 3, CAST(N'2024-12-04' AS Date), 3, CAST(100.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Fines] ([FineID], [DriverID], [DateOfViolation], [ViolationID], [Amount], [IsPaid]) VALUES (1006, 5, CAST(N'2014-12-12' AS Date), 4, CAST(100.00 AS Decimal(10, 2)), 1)
SET IDENTITY_INSERT [dbo].[Fines] OFF
GO
SET IDENTITY_INSERT [dbo].[GAIEmployees] ON 

INSERT [dbo].[GAIEmployees] ([EmployeeID], [FullName], [Position]) VALUES (1, N'Ivanov Ivan Ivanovich', N'Traffic Officer')
INSERT [dbo].[GAIEmployees] ([EmployeeID], [FullName], [Position]) VALUES (2, N'Petrov Petr Ivanovich', N'Main Inspektor')
INSERT [dbo].[GAIEmployees] ([EmployeeID], [FullName], [Position]) VALUES (3, N'Sidorov Sergey Sidorovich', N'Traffic Officer')
INSERT [dbo].[GAIEmployees] ([EmployeeID], [FullName], [Position]) VALUES (4, N'Kuznetsov Konstantin Kuznetsovich', N'Inspektor ISPO')
INSERT [dbo].[GAIEmployees] ([EmployeeID], [FullName], [Position]) VALUES (5, N'Mikhailov Mikhail Mikhailovich', N'Traffic Officer')
INSERT [dbo].[GAIEmployees] ([EmployeeID], [FullName], [Position]) VALUES (7, N'Nikolaev Nikolay Nikolaevich', N'Traffic Officer')
INSERT [dbo].[GAIEmployees] ([EmployeeID], [FullName], [Position]) VALUES (8, N'Dmitriev Dmitry Dmitrievich', N'Traffic Officer')
INSERT [dbo].[GAIEmployees] ([EmployeeID], [FullName], [Position]) VALUES (9, N'Bratishkin Vladimir Vladimirovich', N'Inspektor Twitch')
SET IDENTITY_INSERT [dbo].[GAIEmployees] OFF
GO
SET IDENTITY_INSERT [dbo].[PaymentMethods] ON 

INSERT [dbo].[PaymentMethods] ([PaymentMethodID], [PaymentMethodName]) VALUES (1, N'Credit Card')
INSERT [dbo].[PaymentMethods] ([PaymentMethodID], [PaymentMethodName]) VALUES (2, N'Cash')
INSERT [dbo].[PaymentMethods] ([PaymentMethodID], [PaymentMethodName]) VALUES (3, N'Bank Transfer')
INSERT [dbo].[PaymentMethods] ([PaymentMethodID], [PaymentMethodName]) VALUES (4, N'Mobile Payment')
SET IDENTITY_INSERT [dbo].[PaymentMethods] OFF
GO
SET IDENTITY_INSERT [dbo].[Payments] ON 

INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1, 1, 1, CAST(N'2023-01-16T00:00:00.000' AS DateTime), CAST(50.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (2, 2, 2, CAST(N'2023-02-21T00:00:00.000' AS DateTime), CAST(100.00 AS Decimal(10, 2)), 2)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (3, 3, 3, CAST(N'2023-01-21T00:00:00.000' AS DateTime), CAST(30.00 AS Decimal(10, 2)), 3)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1003, 1, 3, CAST(N'2023-01-21T00:00:00.000' AS DateTime), CAST(30.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1004, 11, 1, CAST(N'2023-01-16T00:00:00.000' AS DateTime), CAST(1000.00 AS Decimal(10, 2)), 4)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1005, 13, 1, CAST(N'2023-03-06T00:00:00.000' AS DateTime), CAST(300.00 AS Decimal(10, 2)), 3)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1006, 15, 1, CAST(N'2023-05-13T00:00:00.000' AS DateTime), CAST(1500.00 AS Decimal(10, 2)), 4)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1007, 17, 1, CAST(N'2023-07-15T00:00:00.000' AS DateTime), CAST(600.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1008, 19, 1, CAST(N'2023-10-01T00:00:00.000' AS DateTime), CAST(900.00 AS Decimal(10, 2)), 3)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1009, 20, 2, CAST(N'2023-01-03T00:00:00.000' AS DateTime), CAST(500.00 AS Decimal(10, 2)), 2)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1010, 22, 2, CAST(N'2023-02-12T00:00:00.000' AS DateTime), CAST(750.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1011, 24, 2, CAST(N'2023-04-22T00:00:00.000' AS DateTime), CAST(2000.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1012, 26, 2, CAST(N'2023-06-10T00:00:00.000' AS DateTime), CAST(800.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1013, 28, 2, CAST(N'2023-08-27T00:00:00.000' AS DateTime), CAST(400.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1014, 31, 3, CAST(N'2023-01-18T00:00:00.000' AS DateTime), CAST(1000.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1015, 33, 3, CAST(N'2023-03-08T00:00:00.000' AS DateTime), CAST(300.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1016, 35, 3, CAST(N'2023-05-15T00:00:00.000' AS DateTime), CAST(1500.00 AS Decimal(10, 2)), 4)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1017, 37, 3, CAST(N'2023-07-17T00:00:00.000' AS DateTime), CAST(600.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1018, 39, 3, CAST(N'2023-10-01T00:00:00.000' AS DateTime), CAST(900.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1019, 40, 4, CAST(N'2023-01-05T00:00:00.000' AS DateTime), CAST(500.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1020, 42, 4, CAST(N'2023-02-14T00:00:00.000' AS DateTime), CAST(750.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1021, 44, 4, CAST(N'2023-04-24T00:00:00.000' AS DateTime), CAST(2000.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1022, 46, 4, CAST(N'2023-06-12T00:00:00.000' AS DateTime), CAST(800.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1023, 48, 4, CAST(N'2023-08-29T00:00:00.000' AS DateTime), CAST(400.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1024, 51, 5, CAST(N'2023-01-20T00:00:00.000' AS DateTime), CAST(1000.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1025, 53, 5, CAST(N'2023-03-10T00:00:00.000' AS DateTime), CAST(300.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1026, 55, 5, CAST(N'2023-05-17T00:00:00.000' AS DateTime), CAST(1500.00 AS Decimal(10, 2)), 3)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1027, 57, 5, CAST(N'2023-07-19T00:00:00.000' AS DateTime), CAST(600.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1028, 59, 5, CAST(N'2023-10-01T00:00:00.000' AS DateTime), CAST(900.00 AS Decimal(10, 2)), 4)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1029, 60, 1, CAST(N'2022-10-01T00:00:00.000' AS DateTime), CAST(157.00 AS Decimal(10, 2)), 3)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1030, 61, 1, CAST(N'2022-06-15T00:00:00.000' AS DateTime), CAST(236.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1031, 62, 1, CAST(N'2022-02-04T00:00:00.000' AS DateTime), CAST(421.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1032, 63, 1, CAST(N'2022-06-06T00:00:00.000' AS DateTime), CAST(127.00 AS Decimal(10, 2)), 4)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1033, 64, 1, CAST(N'2022-03-03T00:00:00.000' AS DateTime), CAST(269.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1034, 65, 1, CAST(N'2022-08-09T00:00:00.000' AS DateTime), CAST(214.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1035, 66, 1, CAST(N'2022-06-23T00:00:00.000' AS DateTime), CAST(493.00 AS Decimal(10, 2)), 4)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1036, 67, 1, CAST(N'2022-02-06T00:00:00.000' AS DateTime), CAST(283.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1037, 68, 1, CAST(N'2022-10-29T00:00:00.000' AS DateTime), CAST(525.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1038, 69, 1, CAST(N'2022-06-14T00:00:00.000' AS DateTime), CAST(73.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1039, 70, 2, CAST(N'2022-04-07T00:00:00.000' AS DateTime), CAST(248.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1040, 71, 2, CAST(N'2022-09-04T00:00:00.000' AS DateTime), CAST(474.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1041, 72, 2, CAST(N'2022-06-03T00:00:00.000' AS DateTime), CAST(380.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1042, 73, 2, CAST(N'2022-06-10T00:00:00.000' AS DateTime), CAST(172.00 AS Decimal(10, 2)), 3)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1043, 74, 2, CAST(N'2022-06-07T00:00:00.000' AS DateTime), CAST(343.00 AS Decimal(10, 2)), 3)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1044, 75, 2, CAST(N'2022-11-14T00:00:00.000' AS DateTime), CAST(548.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1045, 76, 2, CAST(N'2022-04-08T00:00:00.000' AS DateTime), CAST(514.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1046, 77, 2, CAST(N'2022-01-29T00:00:00.000' AS DateTime), CAST(397.00 AS Decimal(10, 2)), 2)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1047, 78, 2, CAST(N'2022-02-10T00:00:00.000' AS DateTime), CAST(319.00 AS Decimal(10, 2)), 2)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1048, 79, 2, CAST(N'2022-03-24T00:00:00.000' AS DateTime), CAST(232.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1049, 80, 3, CAST(N'2022-08-20T00:00:00.000' AS DateTime), CAST(140.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1050, 81, 3, CAST(N'2022-12-11T00:00:00.000' AS DateTime), CAST(56.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1051, 82, 3, CAST(N'2022-01-23T00:00:00.000' AS DateTime), CAST(190.00 AS Decimal(10, 2)), 4)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1052, 83, 3, CAST(N'2022-09-27T00:00:00.000' AS DateTime), CAST(484.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1053, 84, 3, CAST(N'2022-12-06T00:00:00.000' AS DateTime), CAST(346.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1054, 85, 3, CAST(N'2022-11-16T00:00:00.000' AS DateTime), CAST(408.00 AS Decimal(10, 2)), 3)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1055, 86, 3, CAST(N'2022-10-03T00:00:00.000' AS DateTime), CAST(519.00 AS Decimal(10, 2)), 4)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1056, 87, 3, CAST(N'2022-04-28T00:00:00.000' AS DateTime), CAST(510.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1057, 88, 3, CAST(N'2022-07-07T00:00:00.000' AS DateTime), CAST(525.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1058, 89, 3, CAST(N'2022-07-19T00:00:00.000' AS DateTime), CAST(172.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1059, 90, 4, CAST(N'2022-05-29T00:00:00.000' AS DateTime), CAST(335.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1060, 91, 4, CAST(N'2022-11-11T00:00:00.000' AS DateTime), CAST(292.00 AS Decimal(10, 2)), 4)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1061, 92, 4, CAST(N'2022-07-10T00:00:00.000' AS DateTime), CAST(452.00 AS Decimal(10, 2)), 3)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1062, 93, 4, CAST(N'2022-03-22T00:00:00.000' AS DateTime), CAST(304.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1063, 94, 4, CAST(N'2022-12-13T00:00:00.000' AS DateTime), CAST(455.00 AS Decimal(10, 2)), 4)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1064, 95, 4, CAST(N'2022-11-06T00:00:00.000' AS DateTime), CAST(439.00 AS Decimal(10, 2)), 4)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1065, 96, 4, CAST(N'2022-10-25T00:00:00.000' AS DateTime), CAST(419.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1066, 97, 4, CAST(N'2022-10-03T00:00:00.000' AS DateTime), CAST(298.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1067, 98, 4, CAST(N'2022-01-16T00:00:00.000' AS DateTime), CAST(441.00 AS Decimal(10, 2)), 3)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1068, 99, 4, CAST(N'2022-06-06T00:00:00.000' AS DateTime), CAST(432.00 AS Decimal(10, 2)), 2)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1069, 100, 5, CAST(N'2022-09-28T00:00:00.000' AS DateTime), CAST(549.00 AS Decimal(10, 2)), 3)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1070, 101, 5, CAST(N'2022-03-01T00:00:00.000' AS DateTime), CAST(289.00 AS Decimal(10, 2)), 4)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1071, 102, 5, CAST(N'2022-11-23T00:00:00.000' AS DateTime), CAST(482.00 AS Decimal(10, 2)), 2)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1072, 103, 5, CAST(N'2022-07-28T00:00:00.000' AS DateTime), CAST(164.00 AS Decimal(10, 2)), 2)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1073, 104, 5, CAST(N'2022-03-03T00:00:00.000' AS DateTime), CAST(266.00 AS Decimal(10, 2)), 3)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1074, 105, 5, CAST(N'2022-06-25T00:00:00.000' AS DateTime), CAST(235.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1075, 106, 5, CAST(N'2022-05-13T00:00:00.000' AS DateTime), CAST(359.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1076, 107, 5, CAST(N'2022-09-12T00:00:00.000' AS DateTime), CAST(298.00 AS Decimal(10, 2)), 3)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1077, 108, 5, CAST(N'2022-03-11T00:00:00.000' AS DateTime), CAST(408.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Payments] ([PaymentID], [FineID], [UserID], [PaymentDate], [PaymentAmount], [PaymentMethodID]) VALUES (1078, 109, 5, CAST(N'2022-08-18T00:00:00.000' AS DateTime), CAST(319.00 AS Decimal(10, 2)), 1)
SET IDENTITY_INSERT [dbo].[Payments] OFF
GO
SET IDENTITY_INSERT [dbo].[Reports] ON 

INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (1, N'Accident Report', CAST(N'2023-03-10T00:00:00.000' AS DateTime), N'Driver: Putin Vladimir Vladimirovish, Date of Birth: 25.11.1980, License Number: E998877665, Vehicle: 3 X5, License Plate: C789DE, Damage Amount: 500.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (2, N'Accident Report', CAST(N'2023-04-15T00:00:00.000' AS DateTime), N'Driver: Petrov Ivan Ivanovish, Date of Birth: 05.09.1995, License Number: F443322110, Vehicle: 4 Civic, License Plate: D012EF, Damage Amount: 1500.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (3, N'Accident Report', CAST(N'2023-05-20T00:00:00.000' AS DateTime), N'Driver: Anichenko Polina Vitalevna, Date of Birth: 07.10.1952, License Number: G123456789, Vehicle: 5 Golf, License Plate: E345FG, Damage Amount: 800.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (4, N'Accident Report', CAST(N'2024-12-13T00:00:00.000' AS DateTime), N'Driver: Zazharskaya Alexsandra Vitalevna, Date of Birth: 20.07.1988, License Number: C112233445, Vehicle: 3 X4, License Plate: C14124, Damage Amount: 300.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (5, N'Accident Report', CAST(N'2024-12-12T00:00:00.000' AS DateTime), N'Driver: Petrov Ivan Ivanovish, Date of Birth: 05.09.1995, License Number: F443322110, Vehicle: 4 Civic, License Plate: D012EF, Damage Amount: 100.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (6, N'Accident Report', CAST(N'2024-12-05T00:00:00.000' AS DateTime), N'Driver: Krotov Alexey Dmitrievich, Date of Birth: 10.03.1992, License Number: D556677889, Vehicle: 1 @$!$@!$@$$, License Plate: 41421414, Damage Amount: 342.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (7, N'Accident Report', CAST(N'2024-12-12T00:00:00.000' AS DateTime), N'Driver: Anichenko Polina Vitalevna, Date of Birth: 07.10.1952, License Number: G123456789, Vehicle: 3 3223, License Plate: A000AA33, Damage Amount: 322.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (8, N'Accident Report', CAST(N'2014-12-12T00:00:00.000' AS DateTime), N'Driver: Anichenko Polina Vitalevna, Date of Birth: 07.10.1952, License Number: G123456789, Vehicle: 3 3223, License Plate: A000AA33, Damage Amount: 100.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (9, N'Fine Report', CAST(N'2023-01-20T00:00:00.000' AS DateTime), N'Driver: Putin Vladimir Vladimirovish, Date of Birth: 25.11.1980, License Number: E998877665, Fine Amount: 300.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (10, N'Fine Report', CAST(N'2023-02-15T00:00:00.000' AS DateTime), N'Driver: Petrov Ivan Ivanovish, Date of Birth: 05.09.1995, License Number: F443322110, Fine Amount: 750.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (11, N'Fine Report', CAST(N'2023-03-10T00:00:00.000' AS DateTime), N'Driver: Anichenko Polina Vitalevna, Date of Birth: 07.10.1952, License Number: G123456789, Fine Amount: 200.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (12, N'Fine Report', CAST(N'2023-03-10T00:00:00.000' AS DateTime), N'Driver: Zazharskaya Alexsandra Vitalevna, Date of Birth: 20.07.1988, License Number: C112233445, Fine Amount: 367.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (13, N'Fine Report', CAST(N'2023-02-15T00:00:00.000' AS DateTime), N'Driver: Zazharskaya Alexsandra Vitalevna, Date of Birth: 20.07.1988, License Number: C112233445, Fine Amount: 757.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (14, N'Fine Report', CAST(N'2023-01-20T00:00:00.000' AS DateTime), N'Driver: Zazharskaya Alexsandra Vitalevna, Date of Birth: 20.07.1988, License Number: C112233445, Fine Amount: 370.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (15, N'Fine Report', CAST(N'2023-01-01T00:00:00.000' AS DateTime), N'Driver: Zazharskaya Alexsandra Vitalevna, Date of Birth: 20.07.1988, License Number: C112233445, Fine Amount: 500.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (16, N'Fine Report', CAST(N'2023-01-15T00:00:00.000' AS DateTime), N'Driver: Zazharskaya Alexsandra Vitalevna, Date of Birth: 20.07.1988, License Number: C112233445, Fine Amount: 100.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (17, N'Fine Report', CAST(N'2023-02-10T00:00:00.000' AS DateTime), N'Driver: Zazharskaya Alexsandra Vitalevna, Date of Birth: 20.07.1988, License Number: C112233445, Fine Amount: 750.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (18, N'Fine Report', CAST(N'2023-03-05T00:00:00.000' AS DateTime), N'Driver: Zazharskaya Alexsandra Vitalevna, Date of Birth: 20.07.1988, License Number: C112233445, Fine Amount: 300.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (19, N'Fine Report', CAST(N'2023-04-20T00:00:00.000' AS DateTime), N'Driver: Zazharskaya Alexsandra Vitalevna, Date of Birth: 20.07.1988, License Number: C112233445, Fine Amount: 200.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (20, N'Fine Report', CAST(N'2023-05-12T00:00:00.000' AS DateTime), N'Driver: Zazharskaya Alexsandra Vitalevna, Date of Birth: 20.07.1988, License Number: C112233445, Fine Amount: 150.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (21, N'Fine Report', CAST(N'2023-06-08T00:00:00.000' AS DateTime), N'Driver: Zazharskaya Alexsandra Vitalevna, Date of Birth: 20.07.1988, License Number: C112233445, Fine Amount: 800.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (22, N'Fine Report', CAST(N'2023-07-14T00:00:00.000' AS DateTime), N'Driver: Zazharskaya Alexsandra Vitalevna, Date of Birth: 20.07.1988, License Number: C112233445, Fine Amount: 600.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (23, N'Fine Report', CAST(N'2023-08-25T00:00:00.000' AS DateTime), N'Driver: Zazharskaya Alexsandra Vitalevna, Date of Birth: 20.07.1988, License Number: C112233445, Fine Amount: 400.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (24, N'Fine Report', CAST(N'2023-09-30T00:00:00.000' AS DateTime), N'Driver: Zazharskaya Alexsandra Vitalevna, Date of Birth: 20.07.1988, License Number: C112233445, Fine Amount: 900.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (25, N'Fine Report', CAST(N'2023-01-02T00:00:00.000' AS DateTime), N'Driver: Krotov Alexey Dmitrievich, Date of Birth: 10.03.1992, License Number: D556677889, Fine Amount: 500.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (26, N'Fine Report', CAST(N'2023-01-16T00:00:00.000' AS DateTime), N'Driver: Krotov Alexey Dmitrievich, Date of Birth: 10.03.1992, License Number: D556677889, Fine Amount: 100.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (27, N'Fine Report', CAST(N'2023-02-11T00:00:00.000' AS DateTime), N'Driver: Krotov Alexey Dmitrievich, Date of Birth: 10.03.1992, License Number: D556677889, Fine Amount: 750.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (28, N'Fine Report', CAST(N'2023-03-06T00:00:00.000' AS DateTime), N'Driver: Krotov Alexey Dmitrievich, Date of Birth: 10.03.1992, License Number: D556677889, Fine Amount: 300.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (29, N'Fine Report', CAST(N'2023-04-21T00:00:00.000' AS DateTime), N'Driver: Krotov Alexey Dmitrievich, Date of Birth: 10.03.1992, License Number: D556677889, Fine Amount: 200.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (30, N'Fine Report', CAST(N'2023-05-13T00:00:00.000' AS DateTime), N'Driver: Krotov Alexey Dmitrievich, Date of Birth: 10.03.1992, License Number: D556677889, Fine Amount: 150.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (31, N'Fine Report', CAST(N'2023-06-09T00:00:00.000' AS DateTime), N'Driver: Krotov Alexey Dmitrievich, Date of Birth: 10.03.1992, License Number: D556677889, Fine Amount: 800.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (32, N'Fine Report', CAST(N'2023-07-15T00:00:00.000' AS DateTime), N'Driver: Krotov Alexey Dmitrievich, Date of Birth: 10.03.1992, License Number: D556677889, Fine Amount: 600.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (33, N'Fine Report', CAST(N'2023-08-26T00:00:00.000' AS DateTime), N'Driver: Krotov Alexey Dmitrievich, Date of Birth: 10.03.1992, License Number: D556677889, Fine Amount: 400.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (34, N'Fine Report', CAST(N'2023-09-30T00:00:00.000' AS DateTime), N'Driver: Krotov Alexey Dmitrievich, Date of Birth: 10.03.1992, License Number: D556677889, Fine Amount: 900.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (35, N'Fine Report', CAST(N'2023-01-03T00:00:00.000' AS DateTime), N'Driver: Putin Vladimir Vladimirovish, Date of Birth: 25.11.1980, License Number: E998877665, Fine Amount: 500.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (36, N'Fine Report', CAST(N'2023-01-17T00:00:00.000' AS DateTime), N'Driver: Putin Vladimir Vladimirovish, Date of Birth: 25.11.1980, License Number: E998877665, Fine Amount: 100.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (37, N'Fine Report', CAST(N'2023-02-12T00:00:00.000' AS DateTime), N'Driver: Putin Vladimir Vladimirovish, Date of Birth: 25.11.1980, License Number: E998877665, Fine Amount: 750.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (38, N'Fine Report', CAST(N'2023-03-07T00:00:00.000' AS DateTime), N'Driver: Putin Vladimir Vladimirovish, Date of Birth: 25.11.1980, License Number: E998877665, Fine Amount: 300.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (39, N'Fine Report', CAST(N'2023-04-22T00:00:00.000' AS DateTime), N'Driver: Putin Vladimir Vladimirovish, Date of Birth: 25.11.1980, License Number: E998877665, Fine Amount: 200.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (40, N'Fine Report', CAST(N'2023-05-14T00:00:00.000' AS DateTime), N'Driver: Putin Vladimir Vladimirovish, Date of Birth: 25.11.1980, License Number: E998877665, Fine Amount: 150.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (41, N'Fine Report', CAST(N'2023-06-10T00:00:00.000' AS DateTime), N'Driver: Putin Vladimir Vladimirovish, Date of Birth: 25.11.1980, License Number: E998877665, Fine Amount: 800.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (42, N'Fine Report', CAST(N'2023-07-16T00:00:00.000' AS DateTime), N'Driver: Putin Vladimir Vladimirovish, Date of Birth: 25.11.1980, License Number: E998877665, Fine Amount: 600.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (43, N'Fine Report', CAST(N'2023-08-27T00:00:00.000' AS DateTime), N'Driver: Putin Vladimir Vladimirovish, Date of Birth: 25.11.1980, License Number: E998877665, Fine Amount: 400.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (44, N'Fine Report', CAST(N'2023-09-30T00:00:00.000' AS DateTime), N'Driver: Putin Vladimir Vladimirovish, Date of Birth: 25.11.1980, License Number: E998877665, Fine Amount: 900.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (45, N'Fine Report', CAST(N'2023-01-04T00:00:00.000' AS DateTime), N'Driver: Petrov Ivan Ivanovish, Date of Birth: 05.09.1995, License Number: F443322110, Fine Amount: 500.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (46, N'Fine Report', CAST(N'2023-01-18T00:00:00.000' AS DateTime), N'Driver: Petrov Ivan Ivanovish, Date of Birth: 05.09.1995, License Number: F443322110, Fine Amount: 100.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (47, N'Fine Report', CAST(N'2023-02-13T00:00:00.000' AS DateTime), N'Driver: Petrov Ivan Ivanovish, Date of Birth: 05.09.1995, License Number: F443322110, Fine Amount: 750.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (48, N'Fine Report', CAST(N'2023-03-08T00:00:00.000' AS DateTime), N'Driver: Petrov Ivan Ivanovish, Date of Birth: 05.09.1995, License Number: F443322110, Fine Amount: 300.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (49, N'Fine Report', CAST(N'2023-04-23T00:00:00.000' AS DateTime), N'Driver: Petrov Ivan Ivanovish, Date of Birth: 05.09.1995, License Number: F443322110, Fine Amount: 200.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (50, N'Fine Report', CAST(N'2023-05-15T00:00:00.000' AS DateTime), N'Driver: Petrov Ivan Ivanovish, Date of Birth: 05.09.1995, License Number: F443322110, Fine Amount: 150.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (51, N'Fine Report', CAST(N'2023-06-11T00:00:00.000' AS DateTime), N'Driver: Petrov Ivan Ivanovish, Date of Birth: 05.09.1995, License Number: F443322110, Fine Amount: 800.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (52, N'Fine Report', CAST(N'2023-07-17T00:00:00.000' AS DateTime), N'Driver: Petrov Ivan Ivanovish, Date of Birth: 05.09.1995, License Number: F443322110, Fine Amount: 600.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (53, N'Fine Report', CAST(N'2023-08-28T00:00:00.000' AS DateTime), N'Driver: Petrov Ivan Ivanovish, Date of Birth: 05.09.1995, License Number: F443322110, Fine Amount: 400.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (54, N'Fine Report', CAST(N'2023-09-30T00:00:00.000' AS DateTime), N'Driver: Petrov Ivan Ivanovish, Date of Birth: 05.09.1995, License Number: F443322110, Fine Amount: 900.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (55, N'Fine Report', CAST(N'2023-01-05T00:00:00.000' AS DateTime), N'Driver: Anichenko Polina Vitalevna, Date of Birth: 07.10.1952, License Number: G123456789, Fine Amount: 500.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (56, N'Fine Report', CAST(N'2023-01-19T00:00:00.000' AS DateTime), N'Driver: Anichenko Polina Vitalevna, Date of Birth: 07.10.1952, License Number: G123456789, Fine Amount: 100.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (57, N'Fine Report', CAST(N'2023-02-14T00:00:00.000' AS DateTime), N'Driver: Anichenko Polina Vitalevna, Date of Birth: 07.10.1952, License Number: G123456789, Fine Amount: 750.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (58, N'Fine Report', CAST(N'2023-03-09T00:00:00.000' AS DateTime), N'Driver: Anichenko Polina Vitalevna, Date of Birth: 07.10.1952, License Number: G123456789, Fine Amount: 300.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (59, N'Fine Report', CAST(N'2023-04-24T00:00:00.000' AS DateTime), N'Driver: Anichenko Polina Vitalevna, Date of Birth: 07.10.1952, License Number: G123456789, Fine Amount: 2000.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (60, N'Fine Report', CAST(N'2023-05-16T00:00:00.000' AS DateTime), N'Driver: Anichenko Polina Vitalevna, Date of Birth: 07.10.1952, License Number: G123456789, Fine Amount: 1500.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (61, N'Fine Report', CAST(N'2023-06-12T00:00:00.000' AS DateTime), N'Driver: Anichenko Polina Vitalevna, Date of Birth: 07.10.1952, License Number: G123456789, Fine Amount: 800.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (62, N'Fine Report', CAST(N'2023-07-18T00:00:00.000' AS DateTime), N'Driver: Anichenko Polina Vitalevna, Date of Birth: 07.10.1952, License Number: G123456789, Fine Amount: 600.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (63, N'Fine Report', CAST(N'2023-08-29T00:00:00.000' AS DateTime), N'Driver: Anichenko Polina Vitalevna, Date of Birth: 07.10.1952, License Number: G123456789, Fine Amount: 400.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (64, N'Fine Report', CAST(N'2023-09-30T00:00:00.000' AS DateTime), N'Driver: Anichenko Polina Vitalevna, Date of Birth: 07.10.1952, License Number: G123456789, Fine Amount: 900.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (65, N'Fine Report', CAST(N'2022-09-30T00:00:00.000' AS DateTime), N'Driver: Zazharskaya Alexsandra Vitalevna, Date of Birth: 20.07.1988, License Number: C112233445, Fine Amount: 157.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (66, N'Fine Report', CAST(N'2022-06-14T00:00:00.000' AS DateTime), N'Driver: Zazharskaya Alexsandra Vitalevna, Date of Birth: 20.07.1988, License Number: C112233445, Fine Amount: 236.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (67, N'Fine Report', CAST(N'2022-02-03T00:00:00.000' AS DateTime), N'Driver: Zazharskaya Alexsandra Vitalevna, Date of Birth: 20.07.1988, License Number: C112233445, Fine Amount: 421.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (68, N'Fine Report', CAST(N'2022-06-05T00:00:00.000' AS DateTime), N'Driver: Zazharskaya Alexsandra Vitalevna, Date of Birth: 20.07.1988, License Number: C112233445, Fine Amount: 127.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (69, N'Fine Report', CAST(N'2022-03-02T00:00:00.000' AS DateTime), N'Driver: Zazharskaya Alexsandra Vitalevna, Date of Birth: 20.07.1988, License Number: C112233445, Fine Amount: 269.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (70, N'Fine Report', CAST(N'2022-08-08T00:00:00.000' AS DateTime), N'Driver: Zazharskaya Alexsandra Vitalevna, Date of Birth: 20.07.1988, License Number: C112233445, Fine Amount: 214.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (71, N'Fine Report', CAST(N'2022-06-22T00:00:00.000' AS DateTime), N'Driver: Zazharskaya Alexsandra Vitalevna, Date of Birth: 20.07.1988, License Number: C112233445, Fine Amount: 493.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (72, N'Fine Report', CAST(N'2022-02-05T00:00:00.000' AS DateTime), N'Driver: Zazharskaya Alexsandra Vitalevna, Date of Birth: 20.07.1988, License Number: C112233445, Fine Amount: 283.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (73, N'Fine Report', CAST(N'2022-10-28T00:00:00.000' AS DateTime), N'Driver: Zazharskaya Alexsandra Vitalevna, Date of Birth: 20.07.1988, License Number: C112233445, Fine Amount: 525.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (74, N'Fine Report', CAST(N'2022-06-13T00:00:00.000' AS DateTime), N'Driver: Zazharskaya Alexsandra Vitalevna, Date of Birth: 20.07.1988, License Number: C112233445, Fine Amount: 730.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (75, N'Fine Report', CAST(N'2022-04-06T00:00:00.000' AS DateTime), N'Driver: Krotov Alexey Dmitrievich, Date of Birth: 10.03.1992, License Number: D556677889, Fine Amount: 248.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (76, N'Fine Report', CAST(N'2022-09-03T00:00:00.000' AS DateTime), N'Driver: Krotov Alexey Dmitrievich, Date of Birth: 10.03.1992, License Number: D556677889, Fine Amount: 474.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (77, N'Fine Report', CAST(N'2022-06-02T00:00:00.000' AS DateTime), N'Driver: Krotov Alexey Dmitrievich, Date of Birth: 10.03.1992, License Number: D556677889, Fine Amount: 380.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (78, N'Fine Report', CAST(N'2022-06-09T00:00:00.000' AS DateTime), N'Driver: Krotov Alexey Dmitrievich, Date of Birth: 10.03.1992, License Number: D556677889, Fine Amount: 172.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (79, N'Fine Report', CAST(N'2022-06-06T00:00:00.000' AS DateTime), N'Driver: Krotov Alexey Dmitrievich, Date of Birth: 10.03.1992, License Number: D556677889, Fine Amount: 343.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (80, N'Fine Report', CAST(N'2022-11-13T00:00:00.000' AS DateTime), N'Driver: Krotov Alexey Dmitrievich, Date of Birth: 10.03.1992, License Number: D556677889, Fine Amount: 548.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (81, N'Fine Report', CAST(N'2022-04-07T00:00:00.000' AS DateTime), N'Driver: Krotov Alexey Dmitrievich, Date of Birth: 10.03.1992, License Number: D556677889, Fine Amount: 514.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (82, N'Fine Report', CAST(N'2022-01-28T00:00:00.000' AS DateTime), N'Driver: Krotov Alexey Dmitrievich, Date of Birth: 10.03.1992, License Number: D556677889, Fine Amount: 397.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (83, N'Fine Report', CAST(N'2022-02-09T00:00:00.000' AS DateTime), N'Driver: Krotov Alexey Dmitrievich, Date of Birth: 10.03.1992, License Number: D556677889, Fine Amount: 319.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (84, N'Fine Report', CAST(N'2022-03-23T00:00:00.000' AS DateTime), N'Driver: Krotov Alexey Dmitrievich, Date of Birth: 10.03.1992, License Number: D556677889, Fine Amount: 232.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (85, N'Fine Report', CAST(N'2022-08-19T00:00:00.000' AS DateTime), N'Driver: Putin Vladimir Vladimirovish, Date of Birth: 25.11.1980, License Number: E998877665, Fine Amount: 140.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (86, N'Fine Report', CAST(N'2022-12-10T00:00:00.000' AS DateTime), N'Driver: Putin Vladimir Vladimirovish, Date of Birth: 25.11.1980, License Number: E998877665, Fine Amount: 56.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (87, N'Fine Report', CAST(N'2022-01-22T00:00:00.000' AS DateTime), N'Driver: Putin Vladimir Vladimirovish, Date of Birth: 25.11.1980, License Number: E998877665, Fine Amount: 190.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (88, N'Fine Report', CAST(N'2022-09-26T00:00:00.000' AS DateTime), N'Driver: Putin Vladimir Vladimirovish, Date of Birth: 25.11.1980, License Number: E998877665, Fine Amount: 484.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (89, N'Fine Report', CAST(N'2022-12-05T00:00:00.000' AS DateTime), N'Driver: Putin Vladimir Vladimirovish, Date of Birth: 25.11.1980, License Number: E998877665, Fine Amount: 346.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (90, N'Fine Report', CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'Driver: Putin Vladimir Vladimirovish, Date of Birth: 25.11.1980, License Number: E998877665, Fine Amount: 408.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (91, N'Fine Report', CAST(N'2022-10-02T00:00:00.000' AS DateTime), N'Driver: Putin Vladimir Vladimirovish, Date of Birth: 25.11.1980, License Number: E998877665, Fine Amount: 519.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (92, N'Fine Report', CAST(N'2022-04-27T00:00:00.000' AS DateTime), N'Driver: Putin Vladimir Vladimirovish, Date of Birth: 25.11.1980, License Number: E998877665, Fine Amount: 510.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (93, N'Fine Report', CAST(N'2022-07-06T00:00:00.000' AS DateTime), N'Driver: Putin Vladimir Vladimirovish, Date of Birth: 25.11.1980, License Number: E998877665, Fine Amount: 525.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (94, N'Fine Report', CAST(N'2022-07-18T00:00:00.000' AS DateTime), N'Driver: Putin Vladimir Vladimirovish, Date of Birth: 25.11.1980, License Number: E998877665, Fine Amount: 172.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (95, N'Fine Report', CAST(N'2022-05-28T00:00:00.000' AS DateTime), N'Driver: Petrov Ivan Ivanovish, Date of Birth: 05.09.1995, License Number: F443322110, Fine Amount: 335.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (96, N'Fine Report', CAST(N'2022-11-10T00:00:00.000' AS DateTime), N'Driver: Petrov Ivan Ivanovish, Date of Birth: 05.09.1995, License Number: F443322110, Fine Amount: 292.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (97, N'Fine Report', CAST(N'2022-07-09T00:00:00.000' AS DateTime), N'Driver: Petrov Ivan Ivanovish, Date of Birth: 05.09.1995, License Number: F443322110, Fine Amount: 452.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (98, N'Fine Report', CAST(N'2022-03-21T00:00:00.000' AS DateTime), N'Driver: Petrov Ivan Ivanovish, Date of Birth: 05.09.1995, License Number: F443322110, Fine Amount: 304.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (99, N'Fine Report', CAST(N'2022-12-12T00:00:00.000' AS DateTime), N'Driver: Petrov Ivan Ivanovish, Date of Birth: 05.09.1995, License Number: F443322110, Fine Amount: 455.00')
GO
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (100, N'Fine Report', CAST(N'2022-11-05T00:00:00.000' AS DateTime), N'Driver: Petrov Ivan Ivanovish, Date of Birth: 05.09.1995, License Number: F443322110, Fine Amount: 439.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (101, N'Fine Report', CAST(N'2022-10-24T00:00:00.000' AS DateTime), N'Driver: Petrov Ivan Ivanovish, Date of Birth: 05.09.1995, License Number: F443322110, Fine Amount: 419.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (102, N'Fine Report', CAST(N'2022-10-02T00:00:00.000' AS DateTime), N'Driver: Petrov Ivan Ivanovish, Date of Birth: 05.09.1995, License Number: F443322110, Fine Amount: 298.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (103, N'Fine Report', CAST(N'2022-01-15T00:00:00.000' AS DateTime), N'Driver: Petrov Ivan Ivanovish, Date of Birth: 05.09.1995, License Number: F443322110, Fine Amount: 441.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (104, N'Fine Report', CAST(N'2022-06-05T00:00:00.000' AS DateTime), N'Driver: Petrov Ivan Ivanovish, Date of Birth: 05.09.1995, License Number: F443322110, Fine Amount: 432.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (105, N'Fine Report', CAST(N'2022-09-27T00:00:00.000' AS DateTime), N'Driver: Anichenko Polina Vitalevna, Date of Birth: 07.10.1952, License Number: G123456789, Fine Amount: 549.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (106, N'Fine Report', CAST(N'2022-02-28T00:00:00.000' AS DateTime), N'Driver: Anichenko Polina Vitalevna, Date of Birth: 07.10.1952, License Number: G123456789, Fine Amount: 289.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (107, N'Fine Report', CAST(N'2022-11-22T00:00:00.000' AS DateTime), N'Driver: Anichenko Polina Vitalevna, Date of Birth: 07.10.1952, License Number: G123456789, Fine Amount: 482.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (108, N'Fine Report', CAST(N'2022-07-27T00:00:00.000' AS DateTime), N'Driver: Anichenko Polina Vitalevna, Date of Birth: 07.10.1952, License Number: G123456789, Fine Amount: 164.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (109, N'Fine Report', CAST(N'2022-03-02T00:00:00.000' AS DateTime), N'Driver: Anichenko Polina Vitalevna, Date of Birth: 07.10.1952, License Number: G123456789, Fine Amount: 266.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (110, N'Fine Report', CAST(N'2022-06-24T00:00:00.000' AS DateTime), N'Driver: Anichenko Polina Vitalevna, Date of Birth: 07.10.1952, License Number: G123456789, Fine Amount: 235.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (111, N'Fine Report', CAST(N'2022-05-12T00:00:00.000' AS DateTime), N'Driver: Anichenko Polina Vitalevna, Date of Birth: 07.10.1952, License Number: G123456789, Fine Amount: 359.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (112, N'Fine Report', CAST(N'2022-09-11T00:00:00.000' AS DateTime), N'Driver: Anichenko Polina Vitalevna, Date of Birth: 07.10.1952, License Number: G123456789, Fine Amount: 298.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (113, N'Fine Report', CAST(N'2022-03-10T00:00:00.000' AS DateTime), N'Driver: Anichenko Polina Vitalevna, Date of Birth: 07.10.1952, License Number: G123456789, Fine Amount: 408.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (114, N'Fine Report', CAST(N'2022-08-17T00:00:00.000' AS DateTime), N'Driver: Anichenko Polina Vitalevna, Date of Birth: 07.10.1952, License Number: G123456789, Fine Amount: 319.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (115, N'Fine Report', CAST(N'2024-12-12T00:00:00.000' AS DateTime), N'Driver: Zazharskaya Alexsandra Vitalevna, Date of Birth: 20.07.1988, License Number: C112233445, Fine Amount: 100.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (116, N'Fine Report', CAST(N'2024-11-27T00:00:00.000' AS DateTime), N'Driver: Putin Vladimir Vladimirovish, Date of Birth: 25.11.1980, License Number: E998877665, Fine Amount: 434.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (117, N'Fine Report', CAST(N'2024-12-04T00:00:00.000' AS DateTime), N'Driver: Krotov Dmitrii Aleksandrovich, Date of Birth: 12.08.1970, License Number: 3213331323132, Fine Amount: 3424243.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (118, N'Fine Report', CAST(N'2024-12-04T00:00:00.000' AS DateTime), N'Driver: Putin Vladimir Vladimirovish, Date of Birth: 25.11.1980, License Number: E998877665, Fine Amount: 100.00')
INSERT [dbo].[Reports] ([ReportID], [ReportType], [DateGenerated], [Content]) VALUES (119, N'Fine Report', CAST(N'2014-12-12T00:00:00.000' AS DateTime), N'Driver: Anichenko Polina Vitalevna, Date of Birth: 07.10.1952, License Number: G123456789, Fine Amount: 100.00')
SET IDENTITY_INSERT [dbo].[Reports] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (1, N'Driver')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (2, N'Traffic Police Officer')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (3, N'Admin')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [Username], [PasswordHash], [RoleID]) VALUES (1, N'driver4', N'6469195267c878fd44251baf9fdef60fe6b8b0eeb07a0ad46ca188479625169b', 1)
INSERT [dbo].[Users] ([UserID], [Username], [PasswordHash], [RoleID]) VALUES (2, N'driver5', N'6469195267c878fd44251baf9fdef60fe6b8b0eeb07a0ad46ca188479625169b', 1)
INSERT [dbo].[Users] ([UserID], [Username], [PasswordHash], [RoleID]) VALUES (3, N'officer4', N'6469195267c878fd44251baf9fdef60fe6b8b0eeb07a0ad46ca188479625169b', 2)
INSERT [dbo].[Users] ([UserID], [Username], [PasswordHash], [RoleID]) VALUES (4, N'officer5', N'6469195267c878fd44251baf9fdef60fe6b8b0eeb07a0ad46ca188479625169b', 2)
INSERT [dbo].[Users] ([UserID], [Username], [PasswordHash], [RoleID]) VALUES (5, N'admin4', N'8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 3)
INSERT [dbo].[Users] ([UserID], [Username], [PasswordHash], [RoleID]) VALUES (6, N'admin5', N'8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 3)
INSERT [dbo].[Users] ([UserID], [Username], [PasswordHash], [RoleID]) VALUES (9, N'driver6', N'6469195267c878fd44251baf9fdef60fe6b8b0eeb07a0ad46ca188479625169b', 1)
INSERT [dbo].[Users] ([UserID], [Username], [PasswordHash], [RoleID]) VALUES (10, N'driver7', N'6469195267c878fd44251baf9fdef60fe6b8b0eeb07a0ad46ca188479625169b', 1)
INSERT [dbo].[Users] ([UserID], [Username], [PasswordHash], [RoleID]) VALUES (11, N'driver8', N'd74ff0ee8da3b9806b18c877dbf29bbde50b5bd8e4dad7a3a725000feb82e8f1', 1)
INSERT [dbo].[Users] ([UserID], [Username], [PasswordHash], [RoleID]) VALUES (1002, N'officer1', N'6469195267c878fd44251baf9fdef60fe6b8b0eeb07a0ad46ca188479625169b', 2)
INSERT [dbo].[Users] ([UserID], [Username], [PasswordHash], [RoleID]) VALUES (1003, N'officer2', N'6469195267c878fd44251baf9fdef60fe6b8b0eeb07a0ad46ca188479625169b', 2)
INSERT [dbo].[Users] ([UserID], [Username], [PasswordHash], [RoleID]) VALUES (1004, N'officer3', N'6469195267c878fd44251baf9fdef60fe6b8b0eeb07a0ad46ca188479625169b', 2)
INSERT [dbo].[Users] ([UserID], [Username], [PasswordHash], [RoleID]) VALUES (1005, N'officer7', N'6469195267c878fd44251baf9fdef60fe6b8b0eeb07a0ad46ca188479625169b', 2)
INSERT [dbo].[Users] ([UserID], [Username], [PasswordHash], [RoleID]) VALUES (1006, N'officer9', N'6469195267c878fd44251baf9fdef60fe6b8b0eeb07a0ad46ca188479625169b', 2)
INSERT [dbo].[Users] ([UserID], [Username], [PasswordHash], [RoleID]) VALUES (1007, N'officer6', N'6469195267c878fd44251baf9fdef60fe6b8b0eeb07a0ad46ca188479625169b', 2)
INSERT [dbo].[Users] ([UserID], [Username], [PasswordHash], [RoleID]) VALUES (2002, N'driver111', N'6469195267c878fd44251baf9fdef60fe6b8b0eeb07a0ad46ca188479625169b', 1)
INSERT [dbo].[Users] ([UserID], [Username], [PasswordHash], [RoleID]) VALUES (2003, N'pass', N'6469195267c878fd44251baf9fdef60fe6b8b0eeb07a0ad46ca188479625169b', 1)
INSERT [dbo].[Users] ([UserID], [Username], [PasswordHash], [RoleID]) VALUES (2004, N'ivan_ivanov', N'6469195267c878fd44251baf9fdef60fe6b8b0eeb07a0ad46ca188479625169b', 1)
INSERT [dbo].[Users] ([UserID], [Username], [PasswordHash], [RoleID]) VALUES (2005, N'kilkasuper', N'53f35b3860444716ee383f109f3ee105dbd7dd7f796a48c388d771c685ebe952', 1)
INSERT [dbo].[Users] ([UserID], [Username], [PasswordHash], [RoleID]) VALUES (2006, N'vanich', N'fc797ced193ce8c6b26e986ebce888ef067008a66b2efd2adf140274c31cb51f', 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[Vehicles] ON 

INSERT [dbo].[Vehicles] ([VehicleID], [BrandID], [Model], [VIN], [LicensePlate], [OwnerID], [InsuranceInfo]) VALUES (1, 3, N'X5', N'3HGCM82633A123458', N'C789DE', 3, N'Insurance Policy 987654')
INSERT [dbo].[Vehicles] ([VehicleID], [BrandID], [Model], [VIN], [LicensePlate], [OwnerID], [InsuranceInfo]) VALUES (2, 4, N'Civic', N'4HGCM82633A123459', N'D012EF', 4, N'Insurance Policy 456789')
INSERT [dbo].[Vehicles] ([VehicleID], [BrandID], [Model], [VIN], [LicensePlate], [OwnerID], [InsuranceInfo]) VALUES (3, 5, N'Golf', N'5HGCM82633A123460', N'E345FG', 5, N'Insurance Policy 321654')
INSERT [dbo].[Vehicles] ([VehicleID], [BrandID], [Model], [VIN], [LicensePlate], [OwnerID], [InsuranceInfo]) VALUES (8, 3, N'X4', N'3313231323132313', N'C14124', 1, N'Insurance Policy 324242')
INSERT [dbo].[Vehicles] ([VehicleID], [BrandID], [Model], [VIN], [LicensePlate], [OwnerID], [InsuranceInfo]) VALUES (1002, 5, N'Russian edition', N'42144141', N'4241412', 3, N'Russian Federation')
INSERT [dbo].[Vehicles] ([VehicleID], [BrandID], [Model], [VIN], [LicensePlate], [OwnerID], [InsuranceInfo]) VALUES (1003, 6, N'Russian Federation', N'44121241', N'421414', 1, N'fsfafsfafsf')
INSERT [dbo].[Vehicles] ([VehicleID], [BrandID], [Model], [VIN], [LicensePlate], [OwnerID], [InsuranceInfo]) VALUES (1005, 1, N'@$!$@!$@$$', N'2142414', N'41421414', 2, N'sdaadsdada')
INSERT [dbo].[Vehicles] ([VehicleID], [BrandID], [Model], [VIN], [LicensePlate], [OwnerID], [InsuranceInfo]) VALUES (1007, 3, N'$^&^$&#^Sdddsda', N'2313dsd3131323313', N'M442MM123', 3, N'weeqe')
INSERT [dbo].[Vehicles] ([VehicleID], [BrandID], [Model], [VIN], [LicensePlate], [OwnerID], [InsuranceInfo]) VALUES (1008, 7, N'Pro Edition Russian mAx Super TI Perfect GT RS RTX', N'dfaslds8217892563', N'3456284111', 2, N'dygfsastnmszwtmjn')
INSERT [dbo].[Vehicles] ([VehicleID], [BrandID], [Model], [VIN], [LicensePlate], [OwnerID], [InsuranceInfo]) VALUES (1009, 3, N'2313231', N'33231333313331233', N'3132313131', 3, N'31323131231')
INSERT [dbo].[Vehicles] ([VehicleID], [BrandID], [Model], [VIN], [LicensePlate], [OwnerID], [InsuranceInfo]) VALUES (1010, 3, N'3223', N'33212333123132131', N'A000AA33', 5, N'3313132131231')
INSERT [dbo].[Vehicles] ([VehicleID], [BrandID], [Model], [VIN], [LicensePlate], [OwnerID], [InsuranceInfo]) VALUES (1011, 4, N'4234342', N'32434234432424242', N'D232DD232', 2, N'dsadsdad')
INSERT [dbo].[Vehicles] ([VehicleID], [BrandID], [Model], [VIN], [LicensePlate], [OwnerID], [InsuranceInfo]) VALUES (1012, 5, N'231233', N'32131313132131321', N'M189MM33', 2, N'32132133')
INSERT [dbo].[Vehicles] ([VehicleID], [BrandID], [Model], [VIN], [LicensePlate], [OwnerID], [InsuranceInfo]) VALUES (1013, 1, N'Camry', N'1HGCM82633A123456', N'A123BC777', 1004, N'????? 1234567890')
INSERT [dbo].[Vehicles] ([VehicleID], [BrandID], [Model], [VIN], [LicensePlate], [OwnerID], [InsuranceInfo]) VALUES (1014, 5, N'333', N'32131323312313132', N'C666CC89', 1002, N'OSAGO 233131')
SET IDENTITY_INSERT [dbo].[Vehicles] OFF
GO
SET IDENTITY_INSERT [dbo].[Violations] ON 

INSERT [dbo].[Violations] ([ViolationID], [ViolationType]) VALUES (1, N'Speeding')
INSERT [dbo].[Violations] ([ViolationID], [ViolationType]) VALUES (2, N'Parking Violation')
INSERT [dbo].[Violations] ([ViolationID], [ViolationType]) VALUES (3, N'Red Light Violation')
INSERT [dbo].[Violations] ([ViolationID], [ViolationType]) VALUES (4, N'Seatbelt Violation')
INSERT [dbo].[Violations] ([ViolationID], [ViolationType]) VALUES (5, N'Driving Without License')
INSERT [dbo].[Violations] ([ViolationID], [ViolationType]) VALUES (6, N'Illegal U-Turn')
INSERT [dbo].[Violations] ([ViolationID], [ViolationType]) VALUES (7, N'Overloading')
INSERT [dbo].[Violations] ([ViolationID], [ViolationType]) VALUES (8, N'Drunk Driving')
SET IDENTITY_INSERT [dbo].[Violations] OFF
GO
ALTER TABLE [dbo].[Accidents]  WITH CHECK ADD FOREIGN KEY([VehicleID])
REFERENCES [dbo].[Vehicles] ([VehicleID])
GO
ALTER TABLE [dbo].[Drivers]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Fines]  WITH CHECK ADD FOREIGN KEY([DriverID])
REFERENCES [dbo].[Drivers] ([DriverID])
GO
ALTER TABLE [dbo].[Fines]  WITH CHECK ADD FOREIGN KEY([ViolationID])
REFERENCES [dbo].[Violations] ([ViolationID])
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD FOREIGN KEY([FineID])
REFERENCES [dbo].[Fines] ([FineID])
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD FOREIGN KEY([PaymentMethodID])
REFERENCES [dbo].[PaymentMethods] ([PaymentMethodID])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[Vehicles]  WITH CHECK ADD FOREIGN KEY([BrandID])
REFERENCES [dbo].[Brands] ([BrandID])
GO
ALTER TABLE [dbo].[Vehicles]  WITH CHECK ADD FOREIGN KEY([OwnerID])
REFERENCES [dbo].[Drivers] ([DriverID])
GO
