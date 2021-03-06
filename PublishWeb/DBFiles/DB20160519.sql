USE [master]
GO
/****** Object:  Database [RTCSEWMS]    Script Date: 5/19/2016 4:40:08 PM ******/
CREATE DATABASE [RTCSEWMS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RTCSEWMS', FILENAME = N'D:\DatabaseFile\RTCSEWMS.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'RTCSEWMS_log', FILENAME = N'D:\DatabaseFile\RTCSEWMS_log.ldf' , SIZE = 16576KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [RTCSEWMS] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RTCSEWMS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RTCSEWMS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RTCSEWMS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RTCSEWMS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RTCSEWMS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RTCSEWMS] SET ARITHABORT OFF 
GO
ALTER DATABASE [RTCSEWMS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RTCSEWMS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RTCSEWMS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RTCSEWMS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RTCSEWMS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RTCSEWMS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RTCSEWMS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RTCSEWMS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RTCSEWMS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RTCSEWMS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RTCSEWMS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RTCSEWMS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RTCSEWMS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RTCSEWMS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RTCSEWMS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RTCSEWMS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RTCSEWMS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RTCSEWMS] SET RECOVERY FULL 
GO
ALTER DATABASE [RTCSEWMS] SET  MULTI_USER 
GO
ALTER DATABASE [RTCSEWMS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RTCSEWMS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RTCSEWMS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RTCSEWMS] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [RTCSEWMS] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'RTCSEWMS', N'ON'
GO
USE [RTCSEWMS]
GO
/****** Object:  Table [dbo].[BugIssue]    Script Date: 5/19/2016 4:40:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BugIssue](
	[BI_ID] [int] IDENTITY(1,1) NOT NULL,
	[BI_FK_SR_ID] [int] NULL,
	[BI_FK_S_ID] [int] NULL,
	[BI_FK_TT_ID] [int] NULL,
	[BI_Title] [varchar](300) NULL,
	[BI_Type] [varchar](50) NULL,
	[BI_Content] [nvarchar](max) NULL,
	[BI_EnvironmentServer] [varchar](100) NULL,
	[BI_TopologyName] [varchar](50) NULL,
	[BI_Remark] [varchar](max) NULL,
	[BI_CaseNumber] [varchar](100) NULL,
	[BI_CreateDate] [varchar](20) NULL,
	[BI_Status] [varchar](10) NULL,
	[BI_Owner] [int] NULL,
	[BI_CloseTime] [varchar](20) NULL,
	[BI_ReferenceBIID] [int] NULL,
	[BI_UpdateTime] [varchar](20) NULL,
	[BI_Priority] [varchar](10) NULL,
	[BI_Resolution] [varchar](50) NULL,
 CONSTRAINT [PK_BugIssue] PRIMARY KEY CLUSTERED 
(
	[BI_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BugIssueReply]    Script Date: 5/19/2016 4:40:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BugIssueReply](
	[BIR_ID] [int] IDENTITY(1,1) NOT NULL,
	[BIR_FK_BI_ID] [int] NULL,
	[BIR_Content] [nvarchar](max) NULL,
	[BIR_CreateTime] [varchar](20) NULL,
	[BIR_CreateUser] [int] NULL,
 CONSTRAINT [PK_BugIssueReply] PRIMARY KEY CLUSTERED 
(
	[BIR_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DailyReport]    Script Date: 5/19/2016 4:40:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DailyReport](
	[DR_ID] [int] IDENTITY(1,1) NOT NULL,
	[DR_Resources] [int] NULL,
	[DR_FK_ID] [varchar](10) NULL,
	[DR_UpdateDate] [varchar](10) NULL,
	[DR_Comments] [varchar](max) NULL,
	[DR_BugIssue] [varchar](50) NULL,
	[DR_Type] [varchar](20) NULL,
 CONSTRAINT [PK_DailyReport] PRIMARY KEY CLUSTERED 
(
	[DR_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Scenario]    Script Date: 5/19/2016 4:40:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Scenario](
	[S_ID] [int] IDENTITY(1,1) NOT NULL,
	[S_FK_TT_ID] [int] NULL,
	[S_ScenarioName] [varchar](300) NULL,
	[S_CreateDate] [varchar](20) NULL,
	[S_IsDelete] [int] NULL,
	[S_HaveRole] [varchar](5) NULL,
 CONSTRAINT [PK_Sceniro] PRIMARY KEY CLUSTERED 
(
	[S_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ScenarioRole]    Script Date: 5/19/2016 4:40:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ScenarioRole](
	[SR_ID] [int] IDENTITY(1,1) NOT NULL,
	[SR_FK_S_ID] [int] NULL,
	[SR_FK_TT_ID] [int] NULL,
	[SR_AssignedUser] [varchar](50) NULL,
	[SR_AssignedUserName] [varchar](200) NULL,
	[SR_RoleTitle] [varchar](100) NULL,
	[SR_CaseNum] [varchar](10) NULL,
	[SR_CasePassed] [varchar](10) NULL,
	[SR_CaseNA] [varchar](10) NULL,
	[SR_CaseFailed] [varchar](10) NULL,
	[SR_CaseRedmond] [varchar](10) NULL,
	[SR_CompleteProgress] [varchar](10) NULL,
	[SR_CreateUser] [varchar](50) NULL,
	[SR_CreateDate] [varchar](20) NULL,
	[SR_Comments] [varchar](max) NULL,
	[SR_TimeStart] [varchar](20) NULL,
	[SR_TimeEnd] [varchar](20) NULL,
	[SR_TimeUsed] [varchar](100) NULL,
	[SR_Status] [varchar](10) NULL,
	[SR_IsDelete] [varchar](5) NULL,
	[SR_CompleteReason] [varchar](20) NULL,
 CONSTRAINT [PK_ScenarioRole] PRIMARY KEY CLUSTERED 
(
	[SR_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TaskDaily]    Script Date: 5/19/2016 4:40:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TaskDaily](
	[TD_ID] [int] IDENTITY(1,1) NOT NULL,
	[TD_FK_TaskTotalID] [int] NULL,
	[TD_Date] [varchar](10) NULL,
	[TD_CaseShouldRunNum] [varchar](10) NULL,
	[TD_CaseRealRunNum] [varchar](10) NULL,
	[TD_CasePassNum] [varchar](10) NULL,
	[TD_CaseNANum] [varchar](10) NULL,
	[TD_CaseFailNum] [varchar](10) NULL,
	[TD_CaseRunInRedmond] [varchar](10) NULL,
	[TD_BugIssueNum] [varchar](max) NULL,
	[TD_ReportLink] [varchar](max) NULL,
	[TD_Comments] [varchar](max) NULL,
	[TD_CreateDate] [varchar](20) NULL,
	[TD_TaskProgress] [varchar](10) NULL,
	[TD_TaskStatus] [varchar](10) NULL,
 CONSTRAINT [PK_TaskDaily] PRIMARY KEY CLUSTERED 
(
	[TD_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TaskPersonal]    Script Date: 5/19/2016 4:40:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TaskPersonal](
	[TP_ID] [int] IDENTITY(1,1) NOT NULL,
	[TP_Title] [varchar](300) NULL,
	[TP_DateStart] [varchar](10) NULL,
	[TP_DateEnd] [varchar](10) NULL,
	[TP_TimeStart] [varchar](20) NULL,
	[TP_TimeEnd] [varchar](20) NULL,
	[TP_TimeUsed] [varchar](100) NULL,
	[TP_Progress] [varchar](10) NULL,
	[TP_CreateUser] [varchar](50) NULL,
	[TP_Owner] [varchar](50) NULL,
	[TP_Comments] [varchar](max) NULL,
	[TP_Status] [varchar](10) NULL,
	[TP_IsDelete] [varchar](5) NULL,
	[TP_CreateDate] [varchar](20) NULL,
	[TP_CompleteReason] [varchar](20) NULL,
 CONSTRAINT [PK_TaskPersonal] PRIMARY KEY CLUSTERED 
(
	[TP_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TaskTotal]    Script Date: 5/19/2016 4:40:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TaskTotal](
	[TT_ID] [int] IDENTITY(1,1) NOT NULL,
	[TT_Title] [varchar](300) NULL,
	[TT_Release] [varchar](10) NULL,
	[TT_CU] [varchar](10) NULL,
	[TT_BuildType] [varchar](20) NULL,
	[TT_BuildNum] [varchar](20) NULL,
	[TT_TaskType] [varchar](20) NULL,
	[TT_CaseTotalNum] [varchar](10) NULL,
	[TT_CaseRealRunNum] [varchar](10) NULL,
	[TT_DateStart] [varchar](10) NULL,
	[TT_DateEnd] [varchar](10) NULL,
	[TT_TaskStyle] [varchar](10) NULL,
	[TT_BugIssueNum] [varchar](max) NULL,
	[TT_ReportLink] [varchar](max) NULL,
	[TT_Comments] [varchar](max) NULL,
	[TT_CreateDate] [varchar](20) NULL,
	[TT_TaskProgress] [varchar](10) NULL,
	[TT_TaskStatus] [varchar](10) NULL,
	[TT_HaveScenario] [varchar](5) NULL,
	[TT_TimeStart] [varchar](20) NULL,
	[TT_TimeEnd] [varchar](20) NULL,
	[TT_TimeUsed] [varchar](100) NULL,
	[TT_CompleteReason] [varchar](20) NULL,
	[TT_ServerClient] [varchar](20) NULL,
 CONSTRAINT [PK_TaskTotal] PRIMARY KEY CLUSTERED 
(
	[TT_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 5/19/2016 4:40:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserInfo](
	[U_ID] [int] IDENTITY(1,1) NOT NULL,
	[U_username] [varchar](50) NULL,
	[U_password] [varchar](200) NULL,
	[U_power] [varchar](10) NULL,
	[U_nickname] [varchar](100) NULL,
	[U_mailbox] [varchar](50) NULL,
	[U_Role] [varchar](50) NULL,
	[U_Comments] [varchar](max) NULL,
	[U_CreateDate] [varchar](20) NULL,
	[U_IsDelete] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[U_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[V_BugIssueTaskTotalTaskPersonal]    Script Date: 5/19/2016 4:40:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_BugIssueTaskTotalTaskPersonal]
AS
SELECT        T.BTT_ID, T.BTT_Title, T.BTT_Status, T.BTT_Progress, T.BTT_OwnerID, OwnerInfo.U_nickname AS BTT_Owner
FROM            (SELECT        'BI' + CONVERT(varchar(10), BI_ID) AS BTT_ID, BI_Title AS BTT_Title, BI_Status AS BTT_Status, 'N/A' AS BTT_Progress, BI_Owner AS BTT_OwnerID
                          FROM            dbo.BugIssue
                          UNION ALL
                          SELECT        'TT' + CONVERT(varchar(10), dbo.ScenarioRole.SR_ID) AS BTT_ID, '"' + dbo.ScenarioRole.SR_RoleTitle + '" - "' + dbo.Scenario.S_ScenarioName + '" OF "' + dbo.TaskTotal.TT_Title + '"' AS BTT_Title, 
                                                   dbo.ScenarioRole.SR_Status AS BTT_Status, dbo.ScenarioRole.SR_CompleteProgress AS BTT_Progress, dbo.ScenarioRole.SR_CreateUser AS BTT_OwnerID
                          FROM            dbo.ScenarioRole LEFT OUTER JOIN
                                                   dbo.TaskTotal ON dbo.ScenarioRole.SR_FK_TT_ID = dbo.TaskTotal.TT_ID LEFT OUTER JOIN
                                                   dbo.Scenario ON dbo.ScenarioRole.SR_FK_S_ID = dbo.Scenario.S_ID
                          UNION ALL
                          SELECT        'TP' + CONVERT(varchar(10), TP_ID) AS BTT_ID, TP_Title AS BTT_Title, TP_Status AS BTT_Progress, TP_Progress, TP_Owner AS BTT_OwnerID
                          FROM            dbo.TaskPersonal) AS T LEFT OUTER JOIN
                         dbo.UserInfo AS OwnerInfo ON T.BTT_OwnerID = OwnerInfo.U_ID

GO
/****** Object:  View [dbo].[V_DailyReport]    Script Date: 5/19/2016 4:40:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_DailyReport]
AS
SELECT        T.DR_Resources, T.DR_UpdateDate, T.DR_Comments, T.DR_BugIssue, T.DR_Type, BTT.BTT_ID, BTT.BTT_Title, T.DR_ID, BTT.BTT_Status, BTT.BTT_Progress, BTT.BTT_Owner, BTT.BTT_OwnerID, 
                         T.DR_ResourcesName
FROM            (SELECT        dbo.DailyReport.DR_FK_ID, dbo.DailyReport.DR_ID, ResourcesInfo.U_nickname AS DR_ResourcesName, dbo.DailyReport.DR_Resources, dbo.DailyReport.DR_UpdateDate, 
                                                    dbo.DailyReport.DR_Comments, dbo.DailyReport.DR_BugIssue, dbo.DailyReport.DR_Type
                          FROM            dbo.UserInfo AS ResourcesInfo RIGHT OUTER JOIN
                                                    dbo.DailyReport ON ResourcesInfo.U_ID = dbo.DailyReport.DR_Resources) AS T LEFT OUTER JOIN
                         dbo.V_BugIssueTaskTotalTaskPersonal AS BTT ON T.DR_FK_ID = BTT.BTT_ID

GO
/****** Object:  View [dbo].[V_BugDetail]    Script Date: 5/19/2016 4:40:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_BugDetail]
AS
SELECT        dbo.BugIssue.BI_ID, dbo.BugIssue.BI_Title, dbo.BugIssue.BI_Type, dbo.BugIssue.BI_Status, dbo.BugIssue.BI_CreateDate, dbo.UserInfo.U_nickname, dbo.TaskTotal.TT_Title, dbo.Scenario.S_ScenarioName, 
                         dbo.ScenarioRole.SR_RoleTitle, dbo.BugIssue.BI_CaseNumber, dbo.BugIssue.BI_EnvironmentServer, dbo.BugIssue.BI_TopologyName, dbo.BugIssue.BI_UpdateTime, dbo.BugIssue.BI_CloseTime, 
                         dbo.BugIssue.BI_Owner, dbo.BugIssue.BI_Priority
FROM            dbo.BugIssue LEFT OUTER JOIN
                         dbo.ScenarioRole ON dbo.BugIssue.BI_FK_SR_ID = dbo.ScenarioRole.SR_ID LEFT OUTER JOIN
                         dbo.Scenario ON dbo.BugIssue.BI_FK_S_ID = dbo.Scenario.S_ID LEFT OUTER JOIN
                         dbo.TaskTotal ON dbo.BugIssue.BI_FK_TT_ID = dbo.TaskTotal.TT_ID LEFT OUTER JOIN
                         dbo.UserInfo ON dbo.BugIssue.BI_Owner = dbo.UserInfo.U_ID

GO
/****** Object:  View [dbo].[V_BugIssueTaskTotal]    Script Date: 5/19/2016 4:40:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_BugIssueTaskTotal]
AS
SELECT        dbo.TaskTotal.TT_Release, dbo.BugIssue.BI_ID, dbo.BugIssue.BI_FK_SR_ID, dbo.BugIssue.BI_FK_S_ID, dbo.BugIssue.BI_FK_TT_ID, dbo.BugIssue.BI_Title, dbo.BugIssue.BI_Type, 
                         dbo.BugIssue.BI_EnvironmentServer, dbo.BugIssue.BI_TopologyName, dbo.BugIssue.BI_Remark, dbo.BugIssue.BI_CaseNumber, dbo.BugIssue.BI_CreateDate, dbo.BugIssue.BI_Status, 
                         dbo.BugIssue.BI_Owner, dbo.BugIssue.BI_CloseTime, dbo.BugIssue.BI_ReferenceBIID, dbo.BugIssue.BI_UpdateTime, dbo.BugIssue.BI_Priority, dbo.BugIssue.BI_Resolution, dbo.TaskTotal.TT_TaskType
FROM            dbo.BugIssue LEFT OUTER JOIN
                         dbo.TaskTotal ON dbo.BugIssue.BI_FK_TT_ID = dbo.TaskTotal.TT_ID

GO
/****** Object:  View [dbo].[V_BugReplyDetail]    Script Date: 5/19/2016 4:40:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_BugReplyDetail]
AS
SELECT        dbo.UserInfo.U_nickname, dbo.BugIssueReply.BIR_ID, dbo.BugIssueReply.BIR_FK_BI_ID, dbo.BugIssueReply.BIR_Content, dbo.BugIssueReply.BIR_CreateTime
FROM            dbo.BugIssueReply INNER JOIN
                         dbo.UserInfo ON dbo.BugIssueReply.BIR_CreateUser = dbo.UserInfo.U_ID

GO
/****** Object:  View [dbo].[V_TaskDetail]    Script Date: 5/19/2016 4:40:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_TaskDetail]
AS
SELECT        dbo.TaskTotal.TT_ID, dbo.TaskTotal.TT_Title AS TD_TaskTitle, dbo.TaskTotal.TT_Release, dbo.TaskTotal.TT_BuildType, dbo.TaskTotal.TT_TaskType, 
                         dbo.TaskTotal.TT_TaskStyle, dbo.TaskTotal.TT_CU, dbo.TaskTotal.TT_BuildNum, dbo.Scenario.S_ScenarioName AS TD_ScenarioTitle, 
                         dbo.ScenarioRole.SR_RoleTitle AS TD_RoleTitle, dbo.ScenarioRole.SR_CaseNum, dbo.ScenarioRole.SR_CasePassed, dbo.ScenarioRole.SR_CaseFailed, 
                         dbo.ScenarioRole.SR_CaseNA, dbo.ScenarioRole.SR_CaseRedmond, dbo.TaskTotal.TT_DateStart AS TD_DateStart, dbo.TaskTotal.TT_DateEnd AS TD_DateEnd, 
                         dbo.UserInfo.U_nickname AS TD_Owner, dbo.ScenarioRole.SR_AssignedUserName AS TD_AssignedUserName, 
                         dbo.ScenarioRole.SR_Comments + dbo.TaskTotal.TT_Comments AS TD_Comments, dbo.ScenarioRole.SR_ID AS TD_ID, 'public' AS TD_CardType, 
                         dbo.ScenarioRole.SR_IsDelete AS TD_IsDelete, dbo.ScenarioRole.SR_CompleteProgress AS TD_Progress, 
                         dbo.ScenarioRole.SR_AssignedUser AS TD_AssignedUserID, dbo.ScenarioRole.SR_TimeStart AS TD_TimeStart, dbo.ScenarioRole.SR_TimeEnd AS TD_TimeEnd, 
                         dbo.ScenarioRole.SR_TimeUsed AS TD_TimeUsed,dbo.ScenarioRole.SR_CompleteReason AS TD_CompleteReason
FROM            dbo.Scenario RIGHT OUTER JOIN
                         dbo.ScenarioRole ON dbo.Scenario.S_ID = dbo.ScenarioRole.SR_FK_S_ID LEFT OUTER JOIN
                         dbo.UserInfo ON dbo.ScenarioRole.SR_CreateUser = dbo.UserInfo.U_ID LEFT OUTER JOIN
                         dbo.TaskTotal ON dbo.ScenarioRole.SR_FK_TT_ID = dbo.TaskTotal.TT_ID
UNION ALL
SELECT        0 AS TT_ID, dbo.TaskPersonal.TP_Title AS TD_TaskTitle, '' AS TT_Release, '' AS TT_BuildType, '' AS TT_TaskType, '' AS TT_TaskStyle, '' AS TT_CU, 
                         '' AS TT_BuildNum, '' AS TD_ScenarioTitle, '' AS TD_RoleTitle, '0' AS SR_CaseNum, '0' AS SR_CasePassed, '0' AS SR_CaseFailed, '0' AS SR_CaseNA, 
                         '0' AS SR_CaseRedmond, dbo.TaskPersonal.TP_DateStart AS TD_DateStart, dbo.TaskPersonal.TP_DateEnd AS TD_DateEnd, U_Owner.U_nickname AS TD_Owner, 
                         U_Create.U_nickname AS TD_AssignedUserName, dbo.TaskPersonal.TP_Comments AS TD_Comments, dbo.TaskPersonal.TP_ID AS TD_ID, 
                         'private' AS TD_CardType, dbo.TaskPersonal.TP_IsDelete, dbo.TaskPersonal.TP_Progress AS TD_Progress, 
                         dbo.TaskPersonal.TP_CreateUser AS TD_AssignedUserID, dbo.TaskPersonal.TP_TimeStart AS TD_TimeStart, dbo.TaskPersonal.TP_TimeEnd AS TD_TimeEnd, 
                         dbo.TaskPersonal.TP_TimeUsed AS TD_TimeUsed,dbo.TaskPersonal.TP_CompleteReason AS TD_CompleteReason
FROM            dbo.TaskPersonal LEFT OUTER JOIN
                         dbo.UserInfo AS U_Create ON dbo.TaskPersonal.TP_CreateUser = U_Create.U_ID LEFT OUTER JOIN
                         dbo.UserInfo AS U_Owner ON dbo.TaskPersonal.TP_Owner = U_Owner.U_ID

GO
/****** Object:  View [dbo].[V_TaskDetailSimple]    Script Date: 5/19/2016 4:40:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_TaskDetailSimple]
AS
SELECT        dbo.ScenarioRole.SR_IsDelete AS TD_IsDelete, dbo.ScenarioRole.SR_Status AS TD_Status, dbo.TaskTotal.TT_Title AS TD_TaskTitle, dbo.Scenario.S_ScenarioName AS TD_ScenarioTitle, 
                         dbo.ScenarioRole.SR_RoleTitle AS TD_RoleTitle, dbo.ScenarioRole.SR_ID AS TD_ID, dbo.ScenarioRole.SR_AssignedUserName AS TD_AssignedUserName, 'public' AS TD_CardType, 
                         dbo.TaskTotal.TT_DateStart AS TD_DateStart, dbo.TaskTotal.TT_DateEnd AS TD_DateEnd, dbo.UserInfo.U_nickname AS TD_Owner, dbo.TaskTotal.TT_TaskType AS TD_TaskType, 
                         dbo.ScenarioRole.SR_AssignedUser AS TD_AssignedUserID, dbo.ScenarioRole.SR_TimeEnd AS TD_TimeEnd,dbo.ScenarioRole.SR_CreateUser AS TD_OwnerID
FROM            dbo.ScenarioRole INNER JOIN
                         dbo.UserInfo ON dbo.ScenarioRole.SR_CreateUser = dbo.UserInfo.U_ID LEFT OUTER JOIN
                         dbo.TaskTotal ON dbo.ScenarioRole.SR_FK_TT_ID = dbo.TaskTotal.TT_ID LEFT OUTER JOIN
                         dbo.Scenario ON dbo.ScenarioRole.SR_FK_S_ID = dbo.Scenario.S_ID
UNION ALL
SELECT        dbo.TaskPersonal.TP_IsDelete AS TD_IsDelete, dbo.TaskPersonal.TP_Status AS TD_Status, dbo.TaskPersonal.TP_Title AS TD_TaskTitle, '' AS TD_ScenarioTitle, '' AS TD_RoleTitle, 
                         dbo.TaskPersonal.TP_ID AS TD_ID, U_Create.U_nickname AS TD_AssignedUserName, 'private' AS TD_CardType, dbo.TaskPersonal.TP_DateStart AS TD_DateStart, 
                         dbo.TaskPersonal.TP_DateEnd AS TD_DateEnd, U_Owner.U_nickname AS TD_Owner, 'Private Task' AS TD_TaskType, ',' + dbo.TaskPersonal.TP_CreateUser + ',' AS TD_AssignedUserID, 
                         dbo.TaskPersonal.TP_TimeEnd AS TD_TimeEnd,dbo.TaskPersonal.TP_Owner AS TD_OwnerID 
FROM            dbo.UserInfo AS U_Owner INNER JOIN
                         dbo.TaskPersonal ON U_Owner.U_ID = dbo.TaskPersonal.TP_Owner LEFT OUTER JOIN
                         dbo.UserInfo AS U_Create ON dbo.TaskPersonal.TP_CreateUser = U_Create.U_ID

GO
/****** Object:  View [dbo].[V_TaskTotalScenario]    Script Date: 5/19/2016 4:40:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_TaskTotalScenario]
AS
SELECT        dbo.TaskTotal.TT_Title, dbo.Scenario.S_ID, dbo.Scenario.S_FK_TT_ID, dbo.Scenario.S_ScenarioName, dbo.Scenario.S_CreateDate, dbo.Scenario.S_IsDelete, 
                         dbo.Scenario.S_HaveRole, dbo.TaskTotal.TT_TaskStatus
FROM            dbo.Scenario LEFT OUTER JOIN
                         dbo.TaskTotal ON dbo.Scenario.S_FK_TT_ID = dbo.TaskTotal.TT_ID

GO
/****** Object:  View [dbo].[V_TaskTotalScenarioScenarioRole]    Script Date: 5/19/2016 4:40:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_TaskTotalScenarioScenarioRole]
AS
SELECT        dbo.TaskTotal.TT_Title, dbo.ScenarioRole.SR_ID, dbo.ScenarioRole.SR_FK_S_ID, dbo.ScenarioRole.SR_FK_TT_ID, dbo.ScenarioRole.SR_AssignedUser, 
                         dbo.ScenarioRole.SR_AssignedUserName, dbo.ScenarioRole.SR_RoleTitle, dbo.ScenarioRole.SR_CaseNum, dbo.ScenarioRole.SR_CasePassed, 
                         dbo.ScenarioRole.SR_CaseNA, dbo.ScenarioRole.SR_CaseFailed, dbo.ScenarioRole.SR_CaseRedmond, dbo.ScenarioRole.SR_CompleteProgress, 
                         dbo.ScenarioRole.SR_CreateUser, dbo.ScenarioRole.SR_Comments, dbo.Scenario.S_ScenarioName, dbo.UserInfo.U_nickname, dbo.ScenarioRole.SR_Status, 
                         dbo.ScenarioRole.SR_IsDelete, dbo.TaskTotal.TT_TaskStatus
FROM            dbo.UserInfo RIGHT OUTER JOIN
                         dbo.ScenarioRole ON dbo.UserInfo.U_ID = dbo.ScenarioRole.SR_CreateUser LEFT OUTER JOIN
                         dbo.TaskTotal ON dbo.ScenarioRole.SR_FK_TT_ID = dbo.TaskTotal.TT_ID LEFT OUTER JOIN
                         dbo.Scenario ON dbo.ScenarioRole.SR_FK_S_ID = dbo.Scenario.S_ID

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Bug or Issue' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BugIssue', @level2type=N'COLUMN',@level2name=N'BI_Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Open, Closed, ReOpen' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BugIssue', @level2type=N'COLUMN',@level2name=N'BI_Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'PublicTask, PersonalTask, BugIssue' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DailyReport', @level2type=N'COLUMN',@level2name=N'DR_Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'minute' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ScenarioRole', @level2type=N'COLUMN',@level2name=N'SR_TimeUsed'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Inprogress, Complete,Pause,Break' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TaskDaily', @level2type=N'COLUMN',@level2name=N'TD_TaskStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'minute' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TaskPersonal', @level2type=N'COLUMN',@level2name=N'TP_TimeUsed'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Yes or No' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TaskTotal', @level2type=N'COLUMN',@level2name=N'TT_HaveScenario'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[58] 4[17] 2[9] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ScenarioRole"
            Begin Extent = 
               Top = 166
               Left = 680
               Bottom = 296
               Right = 890
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Scenario"
            Begin Extent = 
               Top = 217
               Left = 452
               Bottom = 347
               Right = 629
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TaskTotal"
            Begin Extent = 
               Top = 3
               Left = 443
               Bottom = 133
               Right = 646
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "UserInfo"
            Begin Extent = 
               Top = 39
               Left = 0
               Bottom = 273
               Right = 170
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "BugIssue"
            Begin Extent = 
               Top = 3
               Left = 200
               Bottom = 355
               Right = 404
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 2190
         Alias = 900
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_BugDetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_BugDetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_BugDetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "BugIssue"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 255
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 5
         End
         Begin Table = "TaskTotal"
            Begin Extent = 
               Top = 6
               Left = 280
               Bottom = 255
               Right = 483
            End
            DisplayFlags = 280
            TopColumn = 2
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 21
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_BugIssueTaskTotal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_BugIssueTaskTotal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[21] 2[14] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "T"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 222
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "OwnerInfo"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 223
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 5940
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_BugIssueTaskTotalTaskPersonal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_BugIssueTaskTotalTaskPersonal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[28] 4[33] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "UserInfo"
            Begin Extent = 
               Top = 6
               Left = 248
               Bottom = 239
               Right = 418
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "BugIssueReply"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 181
               Right = 210
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_BugReplyDetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_BugReplyDetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "BTT"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 190
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "T"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 239
               Right = 440
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 16
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 3210
         Alias = 1215
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_DailyReport'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_DailyReport'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[19] 4[25] 2[37] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -192
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 30
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 2670
         Alias = 2010
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_TaskDetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_TaskDetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[32] 4[11] 2[34] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 15
         Width = 284
         Width = 1500
         Width = 1500
         Width = 3135
         Width = 3900
         Width = 1500
         Width = 1500
         Width = 2415
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1575
         Alias = 1665
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_TaskDetailSimple'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_TaskDetailSimple'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Scenario"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 168
               Right = 207
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TaskTotal"
            Begin Extent = 
               Top = 6
               Left = 245
               Bottom = 268
               Right = 437
            End
            DisplayFlags = 280
            TopColumn = 12
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_TaskTotalScenario'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_TaskTotalScenario'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "UserInfo"
            Begin Extent = 
               Top = 6
               Left = 708
               Bottom = 254
               Right = 868
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ScenarioRole"
            Begin Extent = 
               Top = 8
               Left = 41
               Bottom = 257
               Right = 244
            End
            DisplayFlags = 280
            TopColumn = 10
         End
         Begin Table = "TaskTotal"
            Begin Extent = 
               Top = 6
               Left = 478
               Bottom = 269
               Right = 670
            End
            DisplayFlags = 280
            TopColumn = 11
         End
         Begin Table = "Scenario"
            Begin Extent = 
               Top = 95
               Left = 300
               Bottom = 254
               Right = 469
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_TaskTotalScenarioScenarioRole'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_TaskTotalScenarioScenarioRole'
GO
USE [master]
GO
ALTER DATABASE [RTCSEWMS] SET  READ_WRITE 
GO
