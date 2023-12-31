
ALTER DATABASE [elecciones] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [elecciones].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [elecciones] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [elecciones] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [elecciones] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [elecciones] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [elecciones] SET ARITHABORT OFF 
GO
ALTER DATABASE [elecciones] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [elecciones] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [elecciones] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [elecciones] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [elecciones] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [elecciones] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [elecciones] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [elecciones] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [elecciones] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [elecciones] SET  DISABLE_BROKER 
GO
ALTER DATABASE [elecciones] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [elecciones] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [elecciones] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [elecciones] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [elecciones] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [elecciones] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [elecciones] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [elecciones] SET RECOVERY FULL 
GO
ALTER DATABASE [elecciones] SET  MULTI_USER 
GO
ALTER DATABASE [elecciones] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [elecciones] SET DB_CHAINING OFF 
GO
ALTER DATABASE [elecciones] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [elecciones] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [elecciones] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'elecciones', N'ON'
GO
ALTER DATABASE [elecciones] SET QUERY_STORE = OFF
GO
USE [elecciones]
GO
/****** Object:  User [alumno]    Script Date: 13/7/2023 15:58:41 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[candidato]    Script Date: 13/7/2023 15:58:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[candidato](
	[idCandidato] [int] IDENTITY(1,1) NOT NULL,
	[idPartido] [int] NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[fechaNacimiento] [date] NOT NULL,
	[foto] [varchar](550) NOT NULL,
	[postulacion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_candidato] PRIMARY KEY CLUSTERED 
(
	[idCandidato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[partido]    Script Date: 13/7/2023 15:58:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[partido](
	[idPartido] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[logo] [varchar](150) NOT NULL,
	[sitioWeb] [varchar](150) NOT NULL,
	[fechaFundacion] [date] NOT NULL,
	[cantDiputados] [int] NOT NULL,
	[cantSenadores] [int] NOT NULL,
 CONSTRAINT [PK_partido] PRIMARY KEY CLUSTERED 
(
	[idPartido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[candidato] ON 

INSERT [dbo].[candidato] ([idCandidato], [idPartido], [apellido], [nombre], [fechaNacimiento], [foto], [postulacion]) VALUES (1, 1, N'Milei', N'Javier', CAST(N'1970-10-22' AS Date), N'https://imagenes.america.elpais.com/resizer/-spvRRjHfNScSGxtaJDrmEbGfUE=/980x980/cloudfront-eu-central-1.images.arcpublishing.com/prisa/4IME4UYB3FH4VC3T3TZAUHYDO4.jpg', N'Presidente')
SET IDENTITY_INSERT [dbo].[candidato] OFF
GO
SET IDENTITY_INSERT [dbo].[partido] ON 

INSERT [dbo].[partido] ([idPartido], [nombre], [logo], [sitioWeb], [fechaFundacion], [cantDiputados], [cantSenadores]) VALUES (1, N'Libertad Avanza', N'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6a/Logo_La_Libertad_Avanza.png/1200px-Logo_La_Libertad_Avanza.png', N'https://milei2023.com.ar/', CAST(N'2021-07-14' AS Date), 3, 0)
INSERT [dbo].[partido] ([idPartido], [nombre], [logo], [sitioWeb], [fechaFundacion], [cantDiputados], [cantSenadores]) VALUES (3, N'Juntos Por El Cambio', N'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f1/Juntos-Por-El-Cambio-Logo.svg/1200px-Juntos-Por-El-Cambio-Logo.svg.png', N'https://jxc.com.ar/', CAST(N'2019-06-12' AS Date), 116, 33)
SET IDENTITY_INSERT [dbo].[partido] OFF
GO
ALTER TABLE [dbo].[candidato]  WITH CHECK ADD  CONSTRAINT [FK_candidato_partido] FOREIGN KEY([idPartido])
REFERENCES [dbo].[partido] ([idPartido])
GO
ALTER TABLE [dbo].[candidato] CHECK CONSTRAINT [FK_candidato_partido]
GO
USE [master]
GO
ALTER DATABASE [elecciones] SET  READ_WRITE 
GO
