USE [master]
GO
/****** Object:  Database [AusbildungsEvaluierung]    Script Date: 27.06.2020 10:12:46 ******/
CREATE DATABASE [AusbildungsEvaluierung]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AusbildungsEvaluierung', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.XAM\MSSQL\DATA\AusbildungsEvaluierung.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'AusbildungsEvaluierung_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.XAM\MSSQL\DATA\AusbildungsEvaluierung_log.ldf' , SIZE = 1280KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [AusbildungsEvaluierung] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AusbildungsEvaluierung].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AusbildungsEvaluierung] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AusbildungsEvaluierung] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AusbildungsEvaluierung] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AusbildungsEvaluierung] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AusbildungsEvaluierung] SET ARITHABORT OFF 
GO
ALTER DATABASE [AusbildungsEvaluierung] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AusbildungsEvaluierung] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AusbildungsEvaluierung] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AusbildungsEvaluierung] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AusbildungsEvaluierung] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AusbildungsEvaluierung] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AusbildungsEvaluierung] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AusbildungsEvaluierung] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AusbildungsEvaluierung] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AusbildungsEvaluierung] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AusbildungsEvaluierung] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AusbildungsEvaluierung] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AusbildungsEvaluierung] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AusbildungsEvaluierung] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AusbildungsEvaluierung] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AusbildungsEvaluierung] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AusbildungsEvaluierung] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AusbildungsEvaluierung] SET RECOVERY FULL 
GO
ALTER DATABASE [AusbildungsEvaluierung] SET  MULTI_USER 
GO
ALTER DATABASE [AusbildungsEvaluierung] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AusbildungsEvaluierung] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AusbildungsEvaluierung] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AusbildungsEvaluierung] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [AusbildungsEvaluierung] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'AusbildungsEvaluierung', N'ON'
GO
ALTER DATABASE [AusbildungsEvaluierung] SET QUERY_STORE = OFF
GO
USE [AusbildungsEvaluierung]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [AusbildungsEvaluierung]
GO
/****** Object:  Table [dbo].[Evaluierungen]    Script Date: 27.06.2020 10:12:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Evaluierungen](
	[EvaluierungNr] [int] IDENTITY(1,1) NOT NULL,
	[PersonNrFK] [int] NULL,
	[VerantstaltungNrFK] [int] NULL,
	[Datum] [date] NULL,
	[AufbauUndGliederungDerLerhveranstaltung] [int] NULL,
	[LehrveranstaltungsleitungKompetenz] [int] NULL,
	[LehrveranstaltungsleitungEingehenAufFragen] [int] NULL,
	[BesondersGut] [nvarchar](50) NULL,
	[QualitaetDerUnterlagen] [int] NULL,
 CONSTRAINT [PK_Evaluierungen] PRIMARY KEY CLUSTERED 
(
	[EvaluierungNr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personen]    Script Date: 27.06.2020 10:12:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personen](
	[PersonNr] [int] IDENTITY(1,1) NOT NULL,
	[Vorname] [nvarchar](50) NULL,
	[Nachname] [nvarchar](50) NULL,
	[GebDat] [date] NULL,
	[Geschlecht] [bit] NULL,
	[Art] [nvarchar](50) NULL,
	[HauptwohnsitzBundesland] [nchar](20) NULL,
 CONSTRAINT [PK_Personen] PRIMARY KEY CLUSTERED 
(
	[PersonNr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_Evaluierungen]    Script Date: 27.06.2020 10:12:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_Evaluierungen]
AS
SELECT        dbo.Personen.Vorname, dbo.Personen.Nachname, dbo.Personen.GebDat, dbo.Personen.Geschlecht, dbo.Personen.Art, dbo.Evaluierungen.Datum, dbo.Evaluierungen.AufbauUndGliederungDerLerhveranstaltung, 
                         dbo.Evaluierungen.LehrveranstaltungsleitungKompetenz, dbo.Evaluierungen.LehrveranstaltungsleitungEingehenAufFragen, dbo.Evaluierungen.BesondersGut
FROM            dbo.Personen INNER JOIN
                         dbo.Evaluierungen ON dbo.Personen.PersonNr = dbo.Evaluierungen.PersonNrFK

GO
/****** Object:  Table [dbo].[Studiengaenge]    Script Date: 27.06.2020 10:12:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Studiengaenge](
	[StudiengangsNr] [int] IDENTITY(1,1) NOT NULL,
	[Studiengangsname] [nvarchar](50) NULL,
	[StudienrichtungNrFK] [int] NULL,
 CONSTRAINT [PK_Studiengaenge] PRIMARY KEY CLUSTERED 
(
	[StudiengangsNr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Studienrichtungen]    Script Date: 27.06.2020 10:12:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Studienrichtungen](
	[StudienrichtungNr] [int] IDENTITY(1,1) NOT NULL,
	[Studienrichtung] [nvarchar](50) NULL,
	[OrganisationFk] [int] NULL,
 CONSTRAINT [PK_Studienrichtungen] PRIMARY KEY CLUSTERED 
(
	[StudienrichtungNr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Veranstaltungen]    Script Date: 27.06.2020 10:12:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Veranstaltungen](
	[VerantstaltungsNr] [int] IDENTITY(1,1) NOT NULL,
	[Veranstaltungsname] [nvarchar](50) NULL,
	[WS] [decimal](10, 2) NULL,
	[StudiengangNrFK] [int] NULL,
	[VeranstaltungsArtNrFK] [int] NULL,
	[VortragenderFK] [int] NULL,
 CONSTRAINT [PK_Veranstaltungen] PRIMARY KEY CLUSTERED 
(
	[VerantstaltungsNr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Veranstaltungsarten]    Script Date: 27.06.2020 10:12:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Veranstaltungsarten](
	[VerantstaltungsArtNr] [int] IDENTITY(1,1) NOT NULL,
	[Veranstaltungsart] [nvarchar](50) NULL,
 CONSTRAINT [PK_Veranstaltungsarten] PRIMARY KEY CLUSTERED 
(
	[VerantstaltungsArtNr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_Veranstaltungen]    Script Date: 27.06.2020 10:12:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_Veranstaltungen]
AS
SELECT        dbo.Studienrichtungen.Studienrichtung, dbo.Studiengaenge.Studiengangsname, dbo.Veranstaltungsarten.Veranstaltungsart, dbo.Veranstaltungen.Veranstaltungsname
FROM            dbo.Studiengaenge INNER JOIN
                         dbo.Studienrichtungen ON dbo.Studiengaenge.StudienrichtungNrFK = dbo.Studienrichtungen.StudienrichtungNr INNER JOIN
                         dbo.Veranstaltungen ON dbo.Studiengaenge.StudiengangsNr = dbo.Veranstaltungen.StudiengangNrFK INNER JOIN
                         dbo.Veranstaltungsarten ON dbo.Veranstaltungen.VeranstaltungsArtNrFK = dbo.Veranstaltungsarten.VerantstaltungsArtNr

GO
SET IDENTITY_INSERT [dbo].[Evaluierungen] ON 

INSERT [dbo].[Evaluierungen] ([EvaluierungNr], [PersonNrFK], [VerantstaltungNrFK], [Datum], [AufbauUndGliederungDerLerhveranstaltung], [LehrveranstaltungsleitungKompetenz], [LehrveranstaltungsleitungEingehenAufFragen], [BesondersGut], [QualitaetDerUnterlagen]) VALUES (1, 3, 2, CAST(N'2020-01-07' AS Date), 8, 10, 10, N'Projekt', 9)
INSERT [dbo].[Evaluierungen] ([EvaluierungNr], [PersonNrFK], [VerantstaltungNrFK], [Datum], [AufbauUndGliederungDerLerhveranstaltung], [LehrveranstaltungsleitungKompetenz], [LehrveranstaltungsleitungEingehenAufFragen], [BesondersGut], [QualitaetDerUnterlagen]) VALUES (2, 3, 3, CAST(N'2020-03-04' AS Date), 7, 6, 8, N'Pausenorganisation', 6)
INSERT [dbo].[Evaluierungen] ([EvaluierungNr], [PersonNrFK], [VerantstaltungNrFK], [Datum], [AufbauUndGliederungDerLerhveranstaltung], [LehrveranstaltungsleitungKompetenz], [LehrveranstaltungsleitungEingehenAufFragen], [BesondersGut], [QualitaetDerUnterlagen]) VALUES (3, 4, 2, CAST(N'2020-01-03' AS Date), 9, 7, 10, N'Projekt', 4)
INSERT [dbo].[Evaluierungen] ([EvaluierungNr], [PersonNrFK], [VerantstaltungNrFK], [Datum], [AufbauUndGliederungDerLerhveranstaltung], [LehrveranstaltungsleitungKompetenz], [LehrveranstaltungsleitungEingehenAufFragen], [BesondersGut], [QualitaetDerUnterlagen]) VALUES (4, 4, 3, CAST(N'2020-02-03' AS Date), 10, 10, 10, N'Pausenorganisation', 8)
INSERT [dbo].[Evaluierungen] ([EvaluierungNr], [PersonNrFK], [VerantstaltungNrFK], [Datum], [AufbauUndGliederungDerLerhveranstaltung], [LehrveranstaltungsleitungKompetenz], [LehrveranstaltungsleitungEingehenAufFragen], [BesondersGut], [QualitaetDerUnterlagen]) VALUES (5, 5, 3, CAST(N'2020-04-04' AS Date), 8, 8, 7, N'Projekt', 7)
INSERT [dbo].[Evaluierungen] ([EvaluierungNr], [PersonNrFK], [VerantstaltungNrFK], [Datum], [AufbauUndGliederungDerLerhveranstaltung], [LehrveranstaltungsleitungKompetenz], [LehrveranstaltungsleitungEingehenAufFragen], [BesondersGut], [QualitaetDerUnterlagen]) VALUES (6, 5, 3, CAST(N'2020-12-15' AS Date), 7, 10, 9, N'Projekt', 10)
INSERT [dbo].[Evaluierungen] ([EvaluierungNr], [PersonNrFK], [VerantstaltungNrFK], [Datum], [AufbauUndGliederungDerLerhveranstaltung], [LehrveranstaltungsleitungKompetenz], [LehrveranstaltungsleitungEingehenAufFragen], [BesondersGut], [QualitaetDerUnterlagen]) VALUES (7, 6, 1, CAST(N'2020-11-11' AS Date), 10, 4, 8, N'Projekt', 9)
INSERT [dbo].[Evaluierungen] ([EvaluierungNr], [PersonNrFK], [VerantstaltungNrFK], [Datum], [AufbauUndGliederungDerLerhveranstaltung], [LehrveranstaltungsleitungKompetenz], [LehrveranstaltungsleitungEingehenAufFragen], [BesondersGut], [QualitaetDerUnterlagen]) VALUES (8, 6, 2, CAST(N'2020-03-07' AS Date), 4, 8, 10, N'Pausenorganisation', 7)
INSERT [dbo].[Evaluierungen] ([EvaluierungNr], [PersonNrFK], [VerantstaltungNrFK], [Datum], [AufbauUndGliederungDerLerhveranstaltung], [LehrveranstaltungsleitungKompetenz], [LehrveranstaltungsleitungEingehenAufFragen], [BesondersGut], [QualitaetDerUnterlagen]) VALUES (9, 6, 3, CAST(N'2020-02-02' AS Date), 10, 9, 10, N'Projekt', NULL)
SET IDENTITY_INSERT [dbo].[Evaluierungen] OFF
SET IDENTITY_INSERT [dbo].[Personen] ON 

INSERT [dbo].[Personen] ([PersonNr], [Vorname], [Nachname], [GebDat], [Geschlecht], [Art], [HauptwohnsitzBundesland]) VALUES (1, N'VornameA', N'NachnameA', CAST(N'1995-12-10' AS Date), 0, N'Lehrpersonal', N'Steiermark          ')
INSERT [dbo].[Personen] ([PersonNr], [Vorname], [Nachname], [GebDat], [Geschlecht], [Art], [HauptwohnsitzBundesland]) VALUES (2, N'VornameB', N'NachnameB', CAST(N'1996-01-03' AS Date), 1, N'Lehrpersonal', N'Burgenland          ')
INSERT [dbo].[Personen] ([PersonNr], [Vorname], [Nachname], [GebDat], [Geschlecht], [Art], [HauptwohnsitzBundesland]) VALUES (3, N'VornameC', N'NachnameC', CAST(N'1990-05-07' AS Date), 1, N'StudentIn', N'Kärnten             ')
INSERT [dbo].[Personen] ([PersonNr], [Vorname], [Nachname], [GebDat], [Geschlecht], [Art], [HauptwohnsitzBundesland]) VALUES (4, N'VornameD', N'VornameD', CAST(N'1996-08-09' AS Date), 0, N'StudentIn', N'Wien                ')
INSERT [dbo].[Personen] ([PersonNr], [Vorname], [Nachname], [GebDat], [Geschlecht], [Art], [HauptwohnsitzBundesland]) VALUES (5, N'VornameE', N'VornameE', CAST(N'1995-07-07' AS Date), 0, N'StudentIn', N'Tirol               ')
INSERT [dbo].[Personen] ([PersonNr], [Vorname], [Nachname], [GebDat], [Geschlecht], [Art], [HauptwohnsitzBundesland]) VALUES (6, N'VornameF', N'VornameF', CAST(N'1995-04-10' AS Date), 1, N'Beides', N'Südtirol            ')
SET IDENTITY_INSERT [dbo].[Personen] OFF
SET IDENTITY_INSERT [dbo].[Studiengaenge] ON 

INSERT [dbo].[Studiengaenge] ([StudiengangsNr], [Studiengangsname], [StudienrichtungNrFK]) VALUES (1, N'Studiengang A', 1)
INSERT [dbo].[Studiengaenge] ([StudiengangsNr], [Studiengangsname], [StudienrichtungNrFK]) VALUES (2, N'Studiengang B', 1)
INSERT [dbo].[Studiengaenge] ([StudiengangsNr], [Studiengangsname], [StudienrichtungNrFK]) VALUES (3, N'Studiengang C', 1)
INSERT [dbo].[Studiengaenge] ([StudiengangsNr], [Studiengangsname], [StudienrichtungNrFK]) VALUES (4, N'Studiengang D', 1)
INSERT [dbo].[Studiengaenge] ([StudiengangsNr], [Studiengangsname], [StudienrichtungNrFK]) VALUES (5, N'Studiengang E', 1)
INSERT [dbo].[Studiengaenge] ([StudiengangsNr], [Studiengangsname], [StudienrichtungNrFK]) VALUES (6, N'Studiengang F', 2)
INSERT [dbo].[Studiengaenge] ([StudiengangsNr], [Studiengangsname], [StudienrichtungNrFK]) VALUES (7, N'Studiengang G', 2)
INSERT [dbo].[Studiengaenge] ([StudiengangsNr], [Studiengangsname], [StudienrichtungNrFK]) VALUES (8, N'Studiengang H', 3)
INSERT [dbo].[Studiengaenge] ([StudiengangsNr], [Studiengangsname], [StudienrichtungNrFK]) VALUES (9, N'Studiengang I', 3)
INSERT [dbo].[Studiengaenge] ([StudiengangsNr], [Studiengangsname], [StudienrichtungNrFK]) VALUES (10, N'Studiengang J', 3)
INSERT [dbo].[Studiengaenge] ([StudiengangsNr], [Studiengangsname], [StudienrichtungNrFK]) VALUES (11, N'Studiengang K', 3)
INSERT [dbo].[Studiengaenge] ([StudiengangsNr], [Studiengangsname], [StudienrichtungNrFK]) VALUES (12, N'Studiengang L', 3)
INSERT [dbo].[Studiengaenge] ([StudiengangsNr], [Studiengangsname], [StudienrichtungNrFK]) VALUES (13, N'Studiengang M', 3)
INSERT [dbo].[Studiengaenge] ([StudiengangsNr], [Studiengangsname], [StudienrichtungNrFK]) VALUES (14, N'Studiengang N', 3)
INSERT [dbo].[Studiengaenge] ([StudiengangsNr], [Studiengangsname], [StudienrichtungNrFK]) VALUES (15, N'Studiengang O', 4)
INSERT [dbo].[Studiengaenge] ([StudiengangsNr], [Studiengangsname], [StudienrichtungNrFK]) VALUES (16, N'Studiengang P', 4)
INSERT [dbo].[Studiengaenge] ([StudiengangsNr], [Studiengangsname], [StudienrichtungNrFK]) VALUES (17, N'Studiengang Q', 4)
INSERT [dbo].[Studiengaenge] ([StudiengangsNr], [Studiengangsname], [StudienrichtungNrFK]) VALUES (18, N'Studiengang R', 4)
INSERT [dbo].[Studiengaenge] ([StudiengangsNr], [Studiengangsname], [StudienrichtungNrFK]) VALUES (19, N'Studiengang S', 4)
INSERT [dbo].[Studiengaenge] ([StudiengangsNr], [Studiengangsname], [StudienrichtungNrFK]) VALUES (20, N'Studiengang T', 4)
INSERT [dbo].[Studiengaenge] ([StudiengangsNr], [Studiengangsname], [StudienrichtungNrFK]) VALUES (21, N'Studiengang U', 4)
INSERT [dbo].[Studiengaenge] ([StudiengangsNr], [Studiengangsname], [StudienrichtungNrFK]) VALUES (22, N'Studiengang V', 5)
INSERT [dbo].[Studiengaenge] ([StudiengangsNr], [Studiengangsname], [StudienrichtungNrFK]) VALUES (23, N'Studiengang W', 5)
INSERT [dbo].[Studiengaenge] ([StudiengangsNr], [Studiengangsname], [StudienrichtungNrFK]) VALUES (24, N'Studiengang X', 5)
INSERT [dbo].[Studiengaenge] ([StudiengangsNr], [Studiengangsname], [StudienrichtungNrFK]) VALUES (25, N'Studiengang Y', 5)
INSERT [dbo].[Studiengaenge] ([StudiengangsNr], [Studiengangsname], [StudienrichtungNrFK]) VALUES (26, N'Studiengang Z', 5)
SET IDENTITY_INSERT [dbo].[Studiengaenge] OFF
SET IDENTITY_INSERT [dbo].[Studienrichtungen] ON 

INSERT [dbo].[Studienrichtungen] ([StudienrichtungNr], [Studienrichtung], [OrganisationFk]) VALUES (1, N'Informatik', 1)
INSERT [dbo].[Studienrichtungen] ([StudienrichtungNr], [Studienrichtung], [OrganisationFk]) VALUES (2, N'Biologie', 1)
INSERT [dbo].[Studienrichtungen] ([StudienrichtungNr], [Studienrichtung], [OrganisationFk]) VALUES (3, N'Elektrotechnik', 1)
INSERT [dbo].[Studienrichtungen] ([StudienrichtungNr], [Studienrichtung], [OrganisationFk]) VALUES (4, N'Musik', 2)
INSERT [dbo].[Studienrichtungen] ([StudienrichtungNr], [Studienrichtung], [OrganisationFk]) VALUES (5, N'Logistik', 3)
SET IDENTITY_INSERT [dbo].[Studienrichtungen] OFF
SET IDENTITY_INSERT [dbo].[Veranstaltungen] ON 

INSERT [dbo].[Veranstaltungen] ([VerantstaltungsNr], [Veranstaltungsname], [WS], [StudiengangNrFK], [VeranstaltungsArtNrFK], [VortragenderFK]) VALUES (1, N'Veranstaltung1', CAST(4.00 AS Decimal(10, 2)), 1, 1, 2)
INSERT [dbo].[Veranstaltungen] ([VerantstaltungsNr], [Veranstaltungsname], [WS], [StudiengangNrFK], [VeranstaltungsArtNrFK], [VortragenderFK]) VALUES (2, N'Veranstaltung2', CAST(4.00 AS Decimal(10, 2)), 1, 1, 1)
INSERT [dbo].[Veranstaltungen] ([VerantstaltungsNr], [Veranstaltungsname], [WS], [StudiengangNrFK], [VeranstaltungsArtNrFK], [VortragenderFK]) VALUES (3, N'Veranstaltung3', CAST(4.00 AS Decimal(10, 2)), 1, 2, 1)
INSERT [dbo].[Veranstaltungen] ([VerantstaltungsNr], [Veranstaltungsname], [WS], [StudiengangNrFK], [VeranstaltungsArtNrFK], [VortragenderFK]) VALUES (4, N'Veranstaltung4', CAST(4.00 AS Decimal(10, 2)), 1, 2, 2)
INSERT [dbo].[Veranstaltungen] ([VerantstaltungsNr], [Veranstaltungsname], [WS], [StudiengangNrFK], [VeranstaltungsArtNrFK], [VortragenderFK]) VALUES (5, N'Veranstaltung5', CAST(4.00 AS Decimal(10, 2)), 1, 5, 2)
INSERT [dbo].[Veranstaltungen] ([VerantstaltungsNr], [Veranstaltungsname], [WS], [StudiengangNrFK], [VeranstaltungsArtNrFK], [VortragenderFK]) VALUES (6, N'Veranstaltung6', CAST(2.00 AS Decimal(10, 2)), 1, 3, 2)
INSERT [dbo].[Veranstaltungen] ([VerantstaltungsNr], [Veranstaltungsname], [WS], [StudiengangNrFK], [VeranstaltungsArtNrFK], [VortragenderFK]) VALUES (7, N'Veranstaltung7', CAST(4.00 AS Decimal(10, 2)), 1, 3, 2)
INSERT [dbo].[Veranstaltungen] ([VerantstaltungsNr], [Veranstaltungsname], [WS], [StudiengangNrFK], [VeranstaltungsArtNrFK], [VortragenderFK]) VALUES (8, N'Veranstaltung8', CAST(4.00 AS Decimal(10, 2)), 1, 5, 1)
INSERT [dbo].[Veranstaltungen] ([VerantstaltungsNr], [Veranstaltungsname], [WS], [StudiengangNrFK], [VeranstaltungsArtNrFK], [VortragenderFK]) VALUES (9, N'Veranstaltung9', CAST(4.00 AS Decimal(10, 2)), 1, 4, 1)
INSERT [dbo].[Veranstaltungen] ([VerantstaltungsNr], [Veranstaltungsname], [WS], [StudiengangNrFK], [VeranstaltungsArtNrFK], [VortragenderFK]) VALUES (10, N'Veranstaltung10', CAST(2.00 AS Decimal(10, 2)), 1, 4, 1)
INSERT [dbo].[Veranstaltungen] ([VerantstaltungsNr], [Veranstaltungsname], [WS], [StudiengangNrFK], [VeranstaltungsArtNrFK], [VortragenderFK]) VALUES (11, N'Veranstaltung11', CAST(4.00 AS Decimal(10, 2)), 1, 4, 1)
INSERT [dbo].[Veranstaltungen] ([VerantstaltungsNr], [Veranstaltungsname], [WS], [StudiengangNrFK], [VeranstaltungsArtNrFK], [VortragenderFK]) VALUES (12, N'Veranstaltung12', CAST(2.00 AS Decimal(10, 2)), 1, 1, 2)
INSERT [dbo].[Veranstaltungen] ([VerantstaltungsNr], [Veranstaltungsname], [WS], [StudiengangNrFK], [VeranstaltungsArtNrFK], [VortragenderFK]) VALUES (13, N'Veranstaltung13', CAST(2.00 AS Decimal(10, 2)), 1, 1, 1)
INSERT [dbo].[Veranstaltungen] ([VerantstaltungsNr], [Veranstaltungsname], [WS], [StudiengangNrFK], [VeranstaltungsArtNrFK], [VortragenderFK]) VALUES (14, N'Veranstaltung14', CAST(2.00 AS Decimal(10, 2)), 1, 5, 2)
INSERT [dbo].[Veranstaltungen] ([VerantstaltungsNr], [Veranstaltungsname], [WS], [StudiengangNrFK], [VeranstaltungsArtNrFK], [VortragenderFK]) VALUES (15, N'Veranstaltung15', CAST(2.00 AS Decimal(10, 2)), 2, 5, 1)
INSERT [dbo].[Veranstaltungen] ([VerantstaltungsNr], [Veranstaltungsname], [WS], [StudiengangNrFK], [VeranstaltungsArtNrFK], [VortragenderFK]) VALUES (16, N'Veranstaltung16', CAST(2.00 AS Decimal(10, 2)), 2, 5, 2)
INSERT [dbo].[Veranstaltungen] ([VerantstaltungsNr], [Veranstaltungsname], [WS], [StudiengangNrFK], [VeranstaltungsArtNrFK], [VortragenderFK]) VALUES (17, N'Veranstaltung17', CAST(2.00 AS Decimal(10, 2)), 2, 1, 2)
INSERT [dbo].[Veranstaltungen] ([VerantstaltungsNr], [Veranstaltungsname], [WS], [StudiengangNrFK], [VeranstaltungsArtNrFK], [VortragenderFK]) VALUES (18, N'Veranstaltung18', CAST(6.00 AS Decimal(10, 2)), 2, 5, 2)
INSERT [dbo].[Veranstaltungen] ([VerantstaltungsNr], [Veranstaltungsname], [WS], [StudiengangNrFK], [VeranstaltungsArtNrFK], [VortragenderFK]) VALUES (19, N'Veranstaltung19', CAST(2.00 AS Decimal(10, 2)), 2, 5, 1)
INSERT [dbo].[Veranstaltungen] ([VerantstaltungsNr], [Veranstaltungsname], [WS], [StudiengangNrFK], [VeranstaltungsArtNrFK], [VortragenderFK]) VALUES (20, N'Veranstaltung20', CAST(8.00 AS Decimal(10, 2)), 2, 2, 1)
INSERT [dbo].[Veranstaltungen] ([VerantstaltungsNr], [Veranstaltungsname], [WS], [StudiengangNrFK], [VeranstaltungsArtNrFK], [VortragenderFK]) VALUES (21, N'Veranstaltung21', CAST(2.00 AS Decimal(10, 2)), 2, 2, 1)
INSERT [dbo].[Veranstaltungen] ([VerantstaltungsNr], [Veranstaltungsname], [WS], [StudiengangNrFK], [VeranstaltungsArtNrFK], [VortragenderFK]) VALUES (22, N'Veranstaltung22', CAST(4.00 AS Decimal(10, 2)), 2, 2, 2)
INSERT [dbo].[Veranstaltungen] ([VerantstaltungsNr], [Veranstaltungsname], [WS], [StudiengangNrFK], [VeranstaltungsArtNrFK], [VortragenderFK]) VALUES (23, N'Veranstaltung23', CAST(2.00 AS Decimal(10, 2)), 2, 2, 1)
INSERT [dbo].[Veranstaltungen] ([VerantstaltungsNr], [Veranstaltungsname], [WS], [StudiengangNrFK], [VeranstaltungsArtNrFK], [VortragenderFK]) VALUES (24, N'Veranstaltung24', CAST(5.00 AS Decimal(10, 2)), 2, 2, 2)
INSERT [dbo].[Veranstaltungen] ([VerantstaltungsNr], [Veranstaltungsname], [WS], [StudiengangNrFK], [VeranstaltungsArtNrFK], [VortragenderFK]) VALUES (25, N'Veranstaltung25', CAST(2.00 AS Decimal(10, 2)), 2, 3, 1)
INSERT [dbo].[Veranstaltungen] ([VerantstaltungsNr], [Veranstaltungsname], [WS], [StudiengangNrFK], [VeranstaltungsArtNrFK], [VortragenderFK]) VALUES (26, N'Veranstaltung26', CAST(2.00 AS Decimal(10, 2)), 2, 3, 1)
INSERT [dbo].[Veranstaltungen] ([VerantstaltungsNr], [Veranstaltungsname], [WS], [StudiengangNrFK], [VeranstaltungsArtNrFK], [VortragenderFK]) VALUES (27, N'Veranstaltung27', CAST(2.00 AS Decimal(10, 2)), 1, 3, 2)
SET IDENTITY_INSERT [dbo].[Veranstaltungen] OFF
SET IDENTITY_INSERT [dbo].[Veranstaltungsarten] ON 

INSERT [dbo].[Veranstaltungsarten] ([VerantstaltungsArtNr], [Veranstaltungsart]) VALUES (1, N'Vorlesung')
INSERT [dbo].[Veranstaltungsarten] ([VerantstaltungsArtNr], [Veranstaltungsart]) VALUES (2, N'Proseminar')
INSERT [dbo].[Veranstaltungsarten] ([VerantstaltungsArtNr], [Veranstaltungsart]) VALUES (3, N'Uebung')
INSERT [dbo].[Veranstaltungsarten] ([VerantstaltungsArtNr], [Veranstaltungsart]) VALUES (4, N'Exkursion')
INSERT [dbo].[Veranstaltungsarten] ([VerantstaltungsArtNr], [Veranstaltungsart]) VALUES (5, N'Projekt')
SET IDENTITY_INSERT [dbo].[Veranstaltungsarten] OFF
ALTER TABLE [dbo].[Evaluierungen]  WITH CHECK ADD  CONSTRAINT [FK_Evaluierungen_Personen] FOREIGN KEY([PersonNrFK])
REFERENCES [dbo].[Personen] ([PersonNr])
GO
ALTER TABLE [dbo].[Evaluierungen] CHECK CONSTRAINT [FK_Evaluierungen_Personen]
GO
ALTER TABLE [dbo].[Evaluierungen]  WITH CHECK ADD  CONSTRAINT [FK_Evaluierungen_Veranstaltungen] FOREIGN KEY([VerantstaltungNrFK])
REFERENCES [dbo].[Veranstaltungen] ([VerantstaltungsNr])
GO
ALTER TABLE [dbo].[Evaluierungen] CHECK CONSTRAINT [FK_Evaluierungen_Veranstaltungen]
GO
ALTER TABLE [dbo].[Studiengaenge]  WITH CHECK ADD  CONSTRAINT [FK_Studiengaenge_Studienrichtungen] FOREIGN KEY([StudienrichtungNrFK])
REFERENCES [dbo].[Studienrichtungen] ([StudienrichtungNr])
GO
ALTER TABLE [dbo].[Studiengaenge] CHECK CONSTRAINT [FK_Studiengaenge_Studienrichtungen]
GO
ALTER TABLE [dbo].[Veranstaltungen]  WITH CHECK ADD  CONSTRAINT [FK_Veranstaltungen_Studiengaenge] FOREIGN KEY([StudiengangNrFK])
REFERENCES [dbo].[Studiengaenge] ([StudiengangsNr])
GO
ALTER TABLE [dbo].[Veranstaltungen] CHECK CONSTRAINT [FK_Veranstaltungen_Studiengaenge]
GO
ALTER TABLE [dbo].[Veranstaltungen]  WITH CHECK ADD  CONSTRAINT [FK_Veranstaltungen_Veranstaltungsarten] FOREIGN KEY([VeranstaltungsArtNrFK])
REFERENCES [dbo].[Veranstaltungsarten] ([VerantstaltungsArtNr])
GO
ALTER TABLE [dbo].[Veranstaltungen] CHECK CONSTRAINT [FK_Veranstaltungen_Veranstaltungsarten]
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
         Configuration = "(H (1[39] 2[19] 3) )"
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
      ActivePaneConfig = 2
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Personen"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "Evaluierungen"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 165
               Right = 576
            End
            DisplayFlags = 280
            TopColumn = 3
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
         Width = 1155
         Width = 1245
         Width = 1050
         Width = 1065
         Width = 1065
         Width = 1110
         Width = 1320
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      PaneHidden = 
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_Evaluierungen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_Evaluierungen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[32] 4[29] 2[13] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[29] 2[20] 3) )"
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
      ActivePaneConfig = 2
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Studiengaenge"
            Begin Extent = 
               Top = 20
               Left = 220
               Bottom = 110
               Right = 420
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Studienrichtungen"
            Begin Extent = 
               Top = 17
               Left = 0
               Bottom = 113
               Right = 187
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Veranstaltungen"
            Begin Extent = 
               Top = 14
               Left = 458
               Bottom = 104
               Right = 667
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Veranstaltungsarten"
            Begin Extent = 
               Top = 23
               Left = 735
               Bottom = 119
               Right = 935
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
      PaneHidden = 
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
         Or = 135' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_Veranstaltungen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'0
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_Veranstaltungen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_Veranstaltungen'
GO
USE [master]
GO
ALTER DATABASE [AusbildungsEvaluierung] SET  READ_WRITE 
GO
