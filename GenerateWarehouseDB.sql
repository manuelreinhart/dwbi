USE [master]
GO
/****** Object:  Database [WarehouseDB]    Script Date: 27.06.2020 10:15:58 ******/
CREATE DATABASE [WarehouseDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WarehouseDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.XAM\MSSQL\DATA\WarehouseDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'WarehouseDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.XAM\MSSQL\DATA\WarehouseDB_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [WarehouseDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WarehouseDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WarehouseDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WarehouseDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WarehouseDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WarehouseDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WarehouseDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [WarehouseDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WarehouseDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WarehouseDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WarehouseDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WarehouseDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WarehouseDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WarehouseDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WarehouseDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WarehouseDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WarehouseDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WarehouseDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WarehouseDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WarehouseDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WarehouseDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WarehouseDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WarehouseDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WarehouseDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WarehouseDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WarehouseDB] SET  MULTI_USER 
GO
ALTER DATABASE [WarehouseDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WarehouseDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WarehouseDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WarehouseDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [WarehouseDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'WarehouseDB', N'ON'
GO
ALTER DATABASE [WarehouseDB] SET QUERY_STORE = OFF
GO
USE [WarehouseDB]
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
USE [WarehouseDB]
GO
/****** Object:  Table [dbo].[DimDatum]    Script Date: 27.06.2020 10:15:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimDatum](
	[Datum] [date] NULL,
	[Feiertag] [bit] NULL,
	[Kalenderwoche] [varchar](50) NULL,
	[Wochentag] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimOrganisationen]    Script Date: 27.06.2020 10:15:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimOrganisationen](
	[ID] [smallint] NULL,
	[ Name] [varchar](100) NULL,
	[ Staat] [varchar](100) NULL,
	[ Bundesland] [varchar](100) NULL,
	[ Bezirk] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimPersonen]    Script Date: 27.06.2020 10:15:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimPersonen](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PersonNr] [int] NOT NULL,
	[Vorname] [nvarchar](50) NULL,
	[Nachname] [nvarchar](50) NULL,
	[GebDat] [date] NULL,
	[Alter] [int] NOT NULL,
	[Geschlecht] [nvarchar](4) NULL,
	[Art] [nvarchar](50) NULL,
	[Verlauf] [nvarchar](10) NULL,
	[HauptwohnsitzBundesland] [nvarchar](20) NULL,
 CONSTRAINT [PK_Personen] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimVeranstaltungen]    Script Date: 27.06.2020 10:15:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimVeranstaltungen](
	[VerantstaltungsNr] [int] NULL,
	[Veranstaltungsname] [nvarchar](50) NULL,
	[WS] [numeric](10, 2) NULL,
	[Studiengangsname] [nvarchar](50) NULL,
	[Studienrichtung] [nvarchar](50) NULL,
	[Veranstaltungsart] [nvarchar](50) NULL,
	[VortragenderFK] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactEvaluierungen]    Script Date: 27.06.2020 10:15:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactEvaluierungen](
	[EvaluierungNr] [int] NULL,
	[PersonNrFK] [int] NULL,
	[VerantstaltungNrFK] [int] NULL,
	[Datum] [date] NULL,
	[AufbauUndGliederungDerLerhveranstaltung] [int] NULL,
	[LehrveranstaltungsleitungKompetenz] [int] NULL,
	[LehrveranstaltungsleitungEingehenAufFragen] [int] NULL,
	[BesondersGut] [nvarchar](50) NULL,
	[Alter] [int] NULL,
	[OrganisationFk] [int] NULL,
	[QualitaetDerUnterlagen] [int] NULL,
	[VortragenderFK] [int] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[DimDatum] ([Datum], [Feiertag], [Kalenderwoche], [Wochentag]) VALUES (CAST(N'2020-01-03' AS Date), 0, N'1', N'6')
INSERT [dbo].[DimDatum] ([Datum], [Feiertag], [Kalenderwoche], [Wochentag]) VALUES (CAST(N'2020-01-07' AS Date), 0, N'2', N'3')
INSERT [dbo].[DimDatum] ([Datum], [Feiertag], [Kalenderwoche], [Wochentag]) VALUES (CAST(N'2020-02-02' AS Date), 0, N'6', N'1')
INSERT [dbo].[DimDatum] ([Datum], [Feiertag], [Kalenderwoche], [Wochentag]) VALUES (CAST(N'2020-02-03' AS Date), 0, N'6', N'2')
INSERT [dbo].[DimDatum] ([Datum], [Feiertag], [Kalenderwoche], [Wochentag]) VALUES (CAST(N'2020-03-04' AS Date), 0, N'10', N'4')
INSERT [dbo].[DimDatum] ([Datum], [Feiertag], [Kalenderwoche], [Wochentag]) VALUES (CAST(N'2020-03-07' AS Date), 0, N'10', N'7')
INSERT [dbo].[DimDatum] ([Datum], [Feiertag], [Kalenderwoche], [Wochentag]) VALUES (CAST(N'2020-04-04' AS Date), 0, N'14', N'7')
INSERT [dbo].[DimDatum] ([Datum], [Feiertag], [Kalenderwoche], [Wochentag]) VALUES (CAST(N'2020-11-11' AS Date), 0, N'46', N'4')
INSERT [dbo].[DimDatum] ([Datum], [Feiertag], [Kalenderwoche], [Wochentag]) VALUES (CAST(N'2020-12-15' AS Date), 0, N'51', N'3')
INSERT [dbo].[DimOrganisationen] ([ID], [ Name], [ Staat], [ Bundesland], [ Bezirk]) VALUES (1, N' FH Campus02', N' AT', N' Steiermark', N' Graz')
INSERT [dbo].[DimOrganisationen] ([ID], [ Name], [ Staat], [ Bundesland], [ Bezirk]) VALUES (2, N' FH Johanneum', N' AT', N' Steiermark', N' Graz')
INSERT [dbo].[DimOrganisationen] ([ID], [ Name], [ Staat], [ Bundesland], [ Bezirk]) VALUES (3, N' TU Wien', N' AT', N' Wien', N' 12. Bezirk')
INSERT [dbo].[DimOrganisationen] ([ID], [ Name], [ Staat], [ Bundesland], [ Bezirk]) VALUES (4, N' FH Hamburg', N' DE', N' Hamburg', N' Hafenbezirk')
SET IDENTITY_INSERT [dbo].[DimPersonen] ON 

INSERT [dbo].[DimPersonen] ([ID], [PersonNr], [Vorname], [Nachname], [GebDat], [Alter], [Geschlecht], [Art], [Verlauf], [HauptwohnsitzBundesland]) VALUES (2098, 1, N'VornameA', N'NachnameA', CAST(N'1995-12-10' AS Date), 25, N'Frau', N'Lehrpersonal', N'Aktuell', N'Steiermark          ')
INSERT [dbo].[DimPersonen] ([ID], [PersonNr], [Vorname], [Nachname], [GebDat], [Alter], [Geschlecht], [Art], [Verlauf], [HauptwohnsitzBundesland]) VALUES (2099, 2, N'VornameB', N'NachnameB', CAST(N'1996-01-03' AS Date), 24, N'Mann', N'Lehrpersonal', N'Aktuell', N'Burgenland          ')
INSERT [dbo].[DimPersonen] ([ID], [PersonNr], [Vorname], [Nachname], [GebDat], [Alter], [Geschlecht], [Art], [Verlauf], [HauptwohnsitzBundesland]) VALUES (2100, 3, N'VornameC', N'NachnameC', CAST(N'1990-05-07' AS Date), 30, N'Mann', N'StudentIn', N'Aktuell', N'Kärnten             ')
INSERT [dbo].[DimPersonen] ([ID], [PersonNr], [Vorname], [Nachname], [GebDat], [Alter], [Geschlecht], [Art], [Verlauf], [HauptwohnsitzBundesland]) VALUES (2101, 4, N'VornameD', N'VornameD', CAST(N'1996-08-09' AS Date), 24, N'Frau', N'StudentIn', N'Aktuell', N'Wien                ')
INSERT [dbo].[DimPersonen] ([ID], [PersonNr], [Vorname], [Nachname], [GebDat], [Alter], [Geschlecht], [Art], [Verlauf], [HauptwohnsitzBundesland]) VALUES (2102, 5, N'VornameE', N'VornameE', CAST(N'1995-07-07' AS Date), 25, N'Frau', N'StudentIn', N'Aktuell', N'Tirol               ')
INSERT [dbo].[DimPersonen] ([ID], [PersonNr], [Vorname], [Nachname], [GebDat], [Alter], [Geschlecht], [Art], [Verlauf], [HauptwohnsitzBundesland]) VALUES (2103, 6, N'VornameF', N'VornameF', CAST(N'1995-04-10' AS Date), 25, N'Mann', N'Beides', N'Aktuell', N'Südtirol            ')
SET IDENTITY_INSERT [dbo].[DimPersonen] OFF
INSERT [dbo].[DimVeranstaltungen] ([VerantstaltungsNr], [Veranstaltungsname], [WS], [Studiengangsname], [Studienrichtung], [Veranstaltungsart], [VortragenderFK]) VALUES (1, N'Veranstaltung1', CAST(4.00 AS Numeric(10, 2)), N'Studiengang A', N'Informatik', N'Vorlesung', 2)
INSERT [dbo].[DimVeranstaltungen] ([VerantstaltungsNr], [Veranstaltungsname], [WS], [Studiengangsname], [Studienrichtung], [Veranstaltungsart], [VortragenderFK]) VALUES (5, N'Veranstaltung5', CAST(4.00 AS Numeric(10, 2)), N'Studiengang A', N'Informatik', N'Projekt', 2)
INSERT [dbo].[DimVeranstaltungen] ([VerantstaltungsNr], [Veranstaltungsname], [WS], [Studiengangsname], [Studienrichtung], [Veranstaltungsart], [VortragenderFK]) VALUES (10, N'Veranstaltung10', CAST(2.00 AS Numeric(10, 2)), N'Studiengang A', N'Informatik', N'Exkursion', 1)
INSERT [dbo].[DimVeranstaltungen] ([VerantstaltungsNr], [Veranstaltungsname], [WS], [Studiengangsname], [Studienrichtung], [Veranstaltungsart], [VortragenderFK]) VALUES (11, N'Veranstaltung11', CAST(4.00 AS Numeric(10, 2)), N'Studiengang A', N'Informatik', N'Exkursion', 1)
INSERT [dbo].[DimVeranstaltungen] ([VerantstaltungsNr], [Veranstaltungsname], [WS], [Studiengangsname], [Studienrichtung], [Veranstaltungsart], [VortragenderFK]) VALUES (9, N'Veranstaltung9', CAST(4.00 AS Numeric(10, 2)), N'Studiengang A', N'Informatik', N'Exkursion', 1)
INSERT [dbo].[DimVeranstaltungen] ([VerantstaltungsNr], [Veranstaltungsname], [WS], [Studiengangsname], [Studienrichtung], [Veranstaltungsart], [VortragenderFK]) VALUES (7, N'Veranstaltung7', CAST(4.00 AS Numeric(10, 2)), N'Studiengang A', N'Informatik', N'Uebung', 2)
INSERT [dbo].[DimVeranstaltungen] ([VerantstaltungsNr], [Veranstaltungsname], [WS], [Studiengangsname], [Studienrichtung], [Veranstaltungsart], [VortragenderFK]) VALUES (6, N'Veranstaltung6', CAST(2.00 AS Numeric(10, 2)), N'Studiengang A', N'Informatik', N'Uebung', 2)
INSERT [dbo].[DimVeranstaltungen] ([VerantstaltungsNr], [Veranstaltungsname], [WS], [Studiengangsname], [Studienrichtung], [Veranstaltungsart], [VortragenderFK]) VALUES (8, N'Veranstaltung8', CAST(4.00 AS Numeric(10, 2)), N'Studiengang A', N'Informatik', N'Projekt', 1)
INSERT [dbo].[DimVeranstaltungen] ([VerantstaltungsNr], [Veranstaltungsname], [WS], [Studiengangsname], [Studienrichtung], [Veranstaltungsart], [VortragenderFK]) VALUES (4, N'Veranstaltung4', CAST(4.00 AS Numeric(10, 2)), N'Studiengang A', N'Informatik', N'Proseminar', 2)
INSERT [dbo].[DimVeranstaltungen] ([VerantstaltungsNr], [Veranstaltungsname], [WS], [Studiengangsname], [Studienrichtung], [Veranstaltungsart], [VortragenderFK]) VALUES (27, N'Veranstaltung27', CAST(2.00 AS Numeric(10, 2)), N'Studiengang A', N'Informatik', N'Uebung', 2)
INSERT [dbo].[DimVeranstaltungen] ([VerantstaltungsNr], [Veranstaltungsname], [WS], [Studiengangsname], [Studienrichtung], [Veranstaltungsart], [VortragenderFK]) VALUES (13, N'Veranstaltung13', CAST(2.00 AS Numeric(10, 2)), N'Studiengang A', N'Informatik', N'Vorlesung', 1)
INSERT [dbo].[DimVeranstaltungen] ([VerantstaltungsNr], [Veranstaltungsname], [WS], [Studiengangsname], [Studienrichtung], [Veranstaltungsart], [VortragenderFK]) VALUES (12, N'Veranstaltung12', CAST(2.00 AS Numeric(10, 2)), N'Studiengang A', N'Informatik', N'Vorlesung', 2)
INSERT [dbo].[DimVeranstaltungen] ([VerantstaltungsNr], [Veranstaltungsname], [WS], [Studiengangsname], [Studienrichtung], [Veranstaltungsart], [VortragenderFK]) VALUES (2, N'Veranstaltung2', CAST(4.00 AS Numeric(10, 2)), N'Studiengang A', N'Informatik', N'Vorlesung', 1)
INSERT [dbo].[DimVeranstaltungen] ([VerantstaltungsNr], [Veranstaltungsname], [WS], [Studiengangsname], [Studienrichtung], [Veranstaltungsart], [VortragenderFK]) VALUES (3, N'Veranstaltung3', CAST(4.00 AS Numeric(10, 2)), N'Studiengang A', N'Informatik', N'Proseminar', 1)
INSERT [dbo].[DimVeranstaltungen] ([VerantstaltungsNr], [Veranstaltungsname], [WS], [Studiengangsname], [Studienrichtung], [Veranstaltungsart], [VortragenderFK]) VALUES (14, N'Veranstaltung14', CAST(2.00 AS Numeric(10, 2)), N'Studiengang A', N'Informatik', N'Projekt', 2)
INSERT [dbo].[DimVeranstaltungen] ([VerantstaltungsNr], [Veranstaltungsname], [WS], [Studiengangsname], [Studienrichtung], [Veranstaltungsart], [VortragenderFK]) VALUES (24, N'Veranstaltung24', CAST(5.00 AS Numeric(10, 2)), N'Studiengang B', N'Informatik', N'Proseminar', 2)
INSERT [dbo].[DimVeranstaltungen] ([VerantstaltungsNr], [Veranstaltungsname], [WS], [Studiengangsname], [Studienrichtung], [Veranstaltungsart], [VortragenderFK]) VALUES (16, N'Veranstaltung16', CAST(2.00 AS Numeric(10, 2)), N'Studiengang B', N'Informatik', N'Projekt', 2)
INSERT [dbo].[DimVeranstaltungen] ([VerantstaltungsNr], [Veranstaltungsname], [WS], [Studiengangsname], [Studienrichtung], [Veranstaltungsart], [VortragenderFK]) VALUES (18, N'Veranstaltung18', CAST(6.00 AS Numeric(10, 2)), N'Studiengang B', N'Informatik', N'Projekt', 2)
INSERT [dbo].[DimVeranstaltungen] ([VerantstaltungsNr], [Veranstaltungsname], [WS], [Studiengangsname], [Studienrichtung], [Veranstaltungsart], [VortragenderFK]) VALUES (19, N'Veranstaltung19', CAST(2.00 AS Numeric(10, 2)), N'Studiengang B', N'Informatik', N'Projekt', 1)
INSERT [dbo].[DimVeranstaltungen] ([VerantstaltungsNr], [Veranstaltungsname], [WS], [Studiengangsname], [Studienrichtung], [Veranstaltungsart], [VortragenderFK]) VALUES (15, N'Veranstaltung15', CAST(2.00 AS Numeric(10, 2)), N'Studiengang B', N'Informatik', N'Projekt', 1)
INSERT [dbo].[DimVeranstaltungen] ([VerantstaltungsNr], [Veranstaltungsname], [WS], [Studiengangsname], [Studienrichtung], [Veranstaltungsart], [VortragenderFK]) VALUES (17, N'Veranstaltung17', CAST(2.00 AS Numeric(10, 2)), N'Studiengang B', N'Informatik', N'Vorlesung', 2)
INSERT [dbo].[DimVeranstaltungen] ([VerantstaltungsNr], [Veranstaltungsname], [WS], [Studiengangsname], [Studienrichtung], [Veranstaltungsart], [VortragenderFK]) VALUES (23, N'Veranstaltung23', CAST(2.00 AS Numeric(10, 2)), N'Studiengang B', N'Informatik', N'Proseminar', 1)
INSERT [dbo].[DimVeranstaltungen] ([VerantstaltungsNr], [Veranstaltungsname], [WS], [Studiengangsname], [Studienrichtung], [Veranstaltungsart], [VortragenderFK]) VALUES (20, N'Veranstaltung20', CAST(8.00 AS Numeric(10, 2)), N'Studiengang B', N'Informatik', N'Proseminar', 1)
INSERT [dbo].[DimVeranstaltungen] ([VerantstaltungsNr], [Veranstaltungsname], [WS], [Studiengangsname], [Studienrichtung], [Veranstaltungsart], [VortragenderFK]) VALUES (25, N'Veranstaltung25', CAST(2.00 AS Numeric(10, 2)), N'Studiengang B', N'Informatik', N'Uebung', 1)
INSERT [dbo].[DimVeranstaltungen] ([VerantstaltungsNr], [Veranstaltungsname], [WS], [Studiengangsname], [Studienrichtung], [Veranstaltungsart], [VortragenderFK]) VALUES (26, N'Veranstaltung26', CAST(2.00 AS Numeric(10, 2)), N'Studiengang B', N'Informatik', N'Uebung', 1)
INSERT [dbo].[DimVeranstaltungen] ([VerantstaltungsNr], [Veranstaltungsname], [WS], [Studiengangsname], [Studienrichtung], [Veranstaltungsart], [VortragenderFK]) VALUES (22, N'Veranstaltung22', CAST(4.00 AS Numeric(10, 2)), N'Studiengang B', N'Informatik', N'Proseminar', 2)
INSERT [dbo].[DimVeranstaltungen] ([VerantstaltungsNr], [Veranstaltungsname], [WS], [Studiengangsname], [Studienrichtung], [Veranstaltungsart], [VortragenderFK]) VALUES (21, N'Veranstaltung21', CAST(2.00 AS Numeric(10, 2)), N'Studiengang B', N'Informatik', N'Proseminar', 1)
INSERT [dbo].[FactEvaluierungen] ([EvaluierungNr], [PersonNrFK], [VerantstaltungNrFK], [Datum], [AufbauUndGliederungDerLerhveranstaltung], [LehrveranstaltungsleitungKompetenz], [LehrveranstaltungsleitungEingehenAufFragen], [BesondersGut], [Alter], [OrganisationFk], [QualitaetDerUnterlagen], [VortragenderFK]) VALUES (1, 3, 2, CAST(N'2020-01-07' AS Date), 8, 10, 10, N'Projekt', 30, 1, 9, 1)
INSERT [dbo].[FactEvaluierungen] ([EvaluierungNr], [PersonNrFK], [VerantstaltungNrFK], [Datum], [AufbauUndGliederungDerLerhveranstaltung], [LehrveranstaltungsleitungKompetenz], [LehrveranstaltungsleitungEingehenAufFragen], [BesondersGut], [Alter], [OrganisationFk], [QualitaetDerUnterlagen], [VortragenderFK]) VALUES (2, 3, 3, CAST(N'2020-03-04' AS Date), 7, 6, 8, N'Pausenorganisation', 30, 1, 6, 1)
INSERT [dbo].[FactEvaluierungen] ([EvaluierungNr], [PersonNrFK], [VerantstaltungNrFK], [Datum], [AufbauUndGliederungDerLerhveranstaltung], [LehrveranstaltungsleitungKompetenz], [LehrveranstaltungsleitungEingehenAufFragen], [BesondersGut], [Alter], [OrganisationFk], [QualitaetDerUnterlagen], [VortragenderFK]) VALUES (3, 4, 2, CAST(N'2020-01-03' AS Date), 9, 7, 10, N'Projekt', 24, 1, 4, 1)
INSERT [dbo].[FactEvaluierungen] ([EvaluierungNr], [PersonNrFK], [VerantstaltungNrFK], [Datum], [AufbauUndGliederungDerLerhveranstaltung], [LehrveranstaltungsleitungKompetenz], [LehrveranstaltungsleitungEingehenAufFragen], [BesondersGut], [Alter], [OrganisationFk], [QualitaetDerUnterlagen], [VortragenderFK]) VALUES (4, 4, 3, CAST(N'2020-02-03' AS Date), 10, 10, 10, N'Pausenorganisation', 24, 1, 8, 1)
INSERT [dbo].[FactEvaluierungen] ([EvaluierungNr], [PersonNrFK], [VerantstaltungNrFK], [Datum], [AufbauUndGliederungDerLerhveranstaltung], [LehrveranstaltungsleitungKompetenz], [LehrveranstaltungsleitungEingehenAufFragen], [BesondersGut], [Alter], [OrganisationFk], [QualitaetDerUnterlagen], [VortragenderFK]) VALUES (5, 5, 3, CAST(N'2020-04-04' AS Date), 8, 8, 7, N'Projekt', 25, 1, 7, 1)
INSERT [dbo].[FactEvaluierungen] ([EvaluierungNr], [PersonNrFK], [VerantstaltungNrFK], [Datum], [AufbauUndGliederungDerLerhveranstaltung], [LehrveranstaltungsleitungKompetenz], [LehrveranstaltungsleitungEingehenAufFragen], [BesondersGut], [Alter], [OrganisationFk], [QualitaetDerUnterlagen], [VortragenderFK]) VALUES (6, 5, 3, CAST(N'2020-12-15' AS Date), 7, 10, 9, N'Projekt', 25, 1, 10, 1)
INSERT [dbo].[FactEvaluierungen] ([EvaluierungNr], [PersonNrFK], [VerantstaltungNrFK], [Datum], [AufbauUndGliederungDerLerhveranstaltung], [LehrveranstaltungsleitungKompetenz], [LehrveranstaltungsleitungEingehenAufFragen], [BesondersGut], [Alter], [OrganisationFk], [QualitaetDerUnterlagen], [VortragenderFK]) VALUES (7, 6, 1, CAST(N'2020-11-11' AS Date), 10, 4, 8, N'Projekt', 25, 1, 9, 2)
INSERT [dbo].[FactEvaluierungen] ([EvaluierungNr], [PersonNrFK], [VerantstaltungNrFK], [Datum], [AufbauUndGliederungDerLerhveranstaltung], [LehrveranstaltungsleitungKompetenz], [LehrveranstaltungsleitungEingehenAufFragen], [BesondersGut], [Alter], [OrganisationFk], [QualitaetDerUnterlagen], [VortragenderFK]) VALUES (8, 6, 2, CAST(N'2020-03-07' AS Date), 4, 8, 10, N'Pausenorganisation', 25, 1, 7, 1)
INSERT [dbo].[FactEvaluierungen] ([EvaluierungNr], [PersonNrFK], [VerantstaltungNrFK], [Datum], [AufbauUndGliederungDerLerhveranstaltung], [LehrveranstaltungsleitungKompetenz], [LehrveranstaltungsleitungEingehenAufFragen], [BesondersGut], [Alter], [OrganisationFk], [QualitaetDerUnterlagen], [VortragenderFK]) VALUES (9, 6, 3, CAST(N'2020-02-02' AS Date), 10, 9, 10, N'Projekt', 25, 1, NULL, 1)
USE [master]
GO
ALTER DATABASE [WarehouseDB] SET  READ_WRITE 
GO
