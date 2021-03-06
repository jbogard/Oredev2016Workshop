USE [EmployeeDirectory]
GO
ALTER TABLE [dbo].[RolePermission] DROP CONSTRAINT [FK_RolePermission_RoleId]
GO
ALTER TABLE [dbo].[EmployeeRole] DROP CONSTRAINT [FK_EmployeeRole_RoleId]
GO
ALTER TABLE [dbo].[EmployeeRole] DROP CONSTRAINT [FK_EmployeeRole_EmployeeId]
GO
/****** Object:  Index [UQ_Role_Name]    Script Date: 8/4/2016 1:36:12 AM ******/
ALTER TABLE [dbo].[Role] DROP CONSTRAINT [UQ_Role_Name]
GO
/****** Object:  Index [UQ_Employee_Username]    Script Date: 8/4/2016 1:36:12 AM ******/
ALTER TABLE [dbo].[Employee] DROP CONSTRAINT [UQ_Employee_Username]
GO
/****** Object:  Table [dbo].[RolePermission]    Script Date: 8/4/2016 1:36:12 AM ******/
DROP TABLE [dbo].[RolePermission]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 8/4/2016 1:36:12 AM ******/
DROP TABLE [dbo].[Role]
GO
/****** Object:  Table [dbo].[EmployeeRole]    Script Date: 8/4/2016 1:36:12 AM ******/
DROP TABLE [dbo].[EmployeeRole]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 8/4/2016 1:36:12 AM ******/
DROP TABLE [dbo].[Employee]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 8/4/2016 1:36:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Employee_Id]  DEFAULT (newsequentialid()),
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Office] [int] NOT NULL,
	[Email] [nvarchar](255) NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[Username] [nvarchar](100) NULL,
	[HashedPassword] [nvarchar](100) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EmployeeRole]    Script Date: 8/4/2016 1:36:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeRole](
	[Id] [uniqueidentifier] NOT NULL CONSTRAINT [DF_EmployeeRole_Id]  DEFAULT (newsequentialid()),
	[EmployeeId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_EmployeeRole] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 8/4/2016 1:36:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Role_Id]  DEFAULT (newsequentialid()),
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RolePermission]    Script Date: 8/4/2016 1:36:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolePermission](
	[Id] [uniqueidentifier] NOT NULL CONSTRAINT [DF_RolePermission_Id]  DEFAULT (newsequentialid()),
	[RoleId] [uniqueidentifier] NOT NULL,
	[Permission] [int] NOT NULL,
 CONSTRAINT [PK_RolePermission] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Employee] ([Id], [FirstName], [LastName], [Title], [Office], [Email], [PhoneNumber], [Username], [HashedPassword]) VALUES (N'a5bc89b6-0c5a-e611-9c03-6003089dae05', N'Andrea', N'Munoz', N'Executive VP of Operations', 1, N'andrea@example.com', N'555-123-0001', N'Andrea.Munoz', N'$2a$10$gcEzk9UTkSPeAszrKkhB6ex9n9l0yBi4bxLQ/xb2meck/zxaFy.SC')
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [LastName], [Title], [Office], [Email], [PhoneNumber], [Username], [HashedPassword]) VALUES (N'a6bc89b6-0c5a-e611-9c03-6003089dae05', N'Nicholas', N'Griffin', N'Chief Technical Architect', 1, N'nicholas@example.com', N'555-123-0002', N'Nicholas.Griffin', N'$2a$10$gcEzk9UTkSPeAszrKkhB6ex9n9l0yBi4bxLQ/xb2meck/zxaFy.SC')
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [LastName], [Title], [Office], [Email], [PhoneNumber], [Username], [HashedPassword]) VALUES (N'a7bc89b6-0c5a-e611-9c03-6003089dae05', N'Virginia', N'Wright', N'Director of Finance', 1, N'virginia@example.com', N'555-123-0003', N'Virginia.Wright', N'$2a$10$gcEzk9UTkSPeAszrKkhB6ex9n9l0yBi4bxLQ/xb2meck/zxaFy.SC')
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [LastName], [Title], [Office], [Email], [PhoneNumber], [Username], [HashedPassword]) VALUES (N'a8bc89b6-0c5a-e611-9c03-6003089dae05', N'Simon', N'Harmon', N'Director of Human Resources', 1, N'simon@example.com', N'555-123-0004', N'Simon.Harmon', N'$2a$10$gcEzk9UTkSPeAszrKkhB6ex9n9l0yBi4bxLQ/xb2meck/zxaFy.SC')
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [LastName], [Title], [Office], [Email], [PhoneNumber], [Username], [HashedPassword]) VALUES (N'a9bc89b6-0c5a-e611-9c03-6003089dae05', N'Nathaniel', N'Henderson', N'Director of Engineering', 1, N'nathaniel@example.com', N'555-123-0005', N'Nathaniel.Henderson', N'$2a$10$gcEzk9UTkSPeAszrKkhB6ex9n9l0yBi4bxLQ/xb2meck/zxaFy.SC')
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [LastName], [Title], [Office], [Email], [PhoneNumber], [Username], [HashedPassword]) VALUES (N'aabc89b6-0c5a-e611-9c03-6003089dae05', N'Marion', N'Farmer', N'Director of Engineering', 3, N'marion@example.com', N'555-123-0006', N'Marion.Farmer', N'$2a$10$gcEzk9UTkSPeAszrKkhB6ex9n9l0yBi4bxLQ/xb2meck/zxaFy.SC')
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [LastName], [Title], [Office], [Email], [PhoneNumber], [Username], [HashedPassword]) VALUES (N'abbc89b6-0c5a-e611-9c03-6003089dae05', N'Marilyn', N'Barber', N'Director of Engineering', 2, N'marilyn@example.com', N'555-123-0007', N'Marilyn.Barber', N'$2a$10$gcEzk9UTkSPeAszrKkhB6ex9n9l0yBi4bxLQ/xb2meck/zxaFy.SC')
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [LastName], [Title], [Office], [Email], [PhoneNumber], [Username], [HashedPassword]) VALUES (N'acbc89b6-0c5a-e611-9c03-6003089dae05', N'Leticia', N'Klein', N'Director of Engineering', 1, N'leticia@example.com', N'555-123-0008', N'Leticia.Klein', N'$2a$10$gcEzk9UTkSPeAszrKkhB6ex9n9l0yBi4bxLQ/xb2meck/zxaFy.SC')
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [LastName], [Title], [Office], [Email], [PhoneNumber], [Username], [HashedPassword]) VALUES (N'adbc89b6-0c5a-e611-9c03-6003089dae05', N'Tiffany', N'Cain', N'Chairman & CEO', 1, N'tiffany@example.com', N'555-123-0009', N'Tiffany.Cain', N'$2a$10$gcEzk9UTkSPeAszrKkhB6ex9n9l0yBi4bxLQ/xb2meck/zxaFy.SC')
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [LastName], [Title], [Office], [Email], [PhoneNumber], [Username], [HashedPassword]) VALUES (N'aebc89b6-0c5a-e611-9c03-6003089dae05', N'Shawna', N'Ryan', N'President', 1, N'shawna@example.com', N'555-123-0010', N'Shawna.Ryan', N'$2a$10$gcEzk9UTkSPeAszrKkhB6ex9n9l0yBi4bxLQ/xb2meck/zxaFy.SC')
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [LastName], [Title], [Office], [Email], [PhoneNumber], [Username], [HashedPassword]) VALUES (N'afbc89b6-0c5a-e611-9c03-6003089dae05', N'System', N'Administrator', N'System Administrator', 1, NULL, NULL, N'admin', N'$2a$10$gcEzk9UTkSPeAszrKkhB6ex9n9l0yBi4bxLQ/xb2meck/zxaFy.SC')
GO
INSERT [dbo].[EmployeeRole] ([Id], [EmployeeId], [RoleId]) VALUES (N'bbbc89b6-0c5a-e611-9c03-6003089dae05', N'afbc89b6-0c5a-e611-9c03-6003089dae05', N'b0bc89b6-0c5a-e611-9c03-6003089dae05')
GO
INSERT [dbo].[Role] ([Id], [Name]) VALUES (N'b1bc89b6-0c5a-e611-9c03-6003089dae05', N'Human Resources')
GO
INSERT [dbo].[Role] ([Id], [Name]) VALUES (N'b2bc89b6-0c5a-e611-9c03-6003089dae05', N'Manager')
GO
INSERT [dbo].[Role] ([Id], [Name]) VALUES (N'b0bc89b6-0c5a-e611-9c03-6003089dae05', N'System Administrator')
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [Permission]) VALUES (N'b3bc89b6-0c5a-e611-9c03-6003089dae05', N'b0bc89b6-0c5a-e611-9c03-6003089dae05', 1)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [Permission]) VALUES (N'b4bc89b6-0c5a-e611-9c03-6003089dae05', N'b0bc89b6-0c5a-e611-9c03-6003089dae05', 2)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [Permission]) VALUES (N'b5bc89b6-0c5a-e611-9c03-6003089dae05', N'b0bc89b6-0c5a-e611-9c03-6003089dae05', 3)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [Permission]) VALUES (N'b6bc89b6-0c5a-e611-9c03-6003089dae05', N'b0bc89b6-0c5a-e611-9c03-6003089dae05', 4)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [Permission]) VALUES (N'b7bc89b6-0c5a-e611-9c03-6003089dae05', N'b1bc89b6-0c5a-e611-9c03-6003089dae05', 2)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [Permission]) VALUES (N'b8bc89b6-0c5a-e611-9c03-6003089dae05', N'b1bc89b6-0c5a-e611-9c03-6003089dae05', 3)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [Permission]) VALUES (N'b9bc89b6-0c5a-e611-9c03-6003089dae05', N'b1bc89b6-0c5a-e611-9c03-6003089dae05', 4)
GO
INSERT [dbo].[RolePermission] ([Id], [RoleId], [Permission]) VALUES (N'babc89b6-0c5a-e611-9c03-6003089dae05', N'b2bc89b6-0c5a-e611-9c03-6003089dae05', 4)
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ_Employee_Username]    Script Date: 8/4/2016 1:36:12 AM ******/
ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [UQ_Employee_Username] UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ_Role_Name]    Script Date: 8/4/2016 1:36:12 AM ******/
ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [UQ_Role_Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EmployeeRole]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeRole_EmployeeId] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[EmployeeRole] CHECK CONSTRAINT [FK_EmployeeRole_EmployeeId]
GO
ALTER TABLE [dbo].[EmployeeRole]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeRole_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[EmployeeRole] CHECK CONSTRAINT [FK_EmployeeRole_RoleId]
GO
ALTER TABLE [dbo].[RolePermission]  WITH CHECK ADD  CONSTRAINT [FK_RolePermission_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[RolePermission] CHECK CONSTRAINT [FK_RolePermission_RoleId]
GO
