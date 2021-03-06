USE [master]
GO
/****** Object:  Database [biblioteca_jogos]    Script Date: 05/12/2017 02:35:19 ******/
CREATE DATABASE [biblioteca_jogos]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'biblioteca_jogos', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\biblioteca_jogos.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'biblioteca_jogos_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\biblioteca_jogos_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [biblioteca_jogos] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [biblioteca_jogos].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [biblioteca_jogos] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [biblioteca_jogos] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [biblioteca_jogos] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [biblioteca_jogos] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [biblioteca_jogos] SET ARITHABORT OFF 
GO
ALTER DATABASE [biblioteca_jogos] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [biblioteca_jogos] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [biblioteca_jogos] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [biblioteca_jogos] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [biblioteca_jogos] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [biblioteca_jogos] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [biblioteca_jogos] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [biblioteca_jogos] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [biblioteca_jogos] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [biblioteca_jogos] SET  DISABLE_BROKER 
GO
ALTER DATABASE [biblioteca_jogos] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [biblioteca_jogos] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [biblioteca_jogos] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [biblioteca_jogos] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [biblioteca_jogos] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [biblioteca_jogos] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [biblioteca_jogos] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [biblioteca_jogos] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [biblioteca_jogos] SET  MULTI_USER 
GO
ALTER DATABASE [biblioteca_jogos] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [biblioteca_jogos] SET DB_CHAINING OFF 
GO
ALTER DATABASE [biblioteca_jogos] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [biblioteca_jogos] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [biblioteca_jogos] SET DELAYED_DURABILITY = DISABLED 
GO
USE [biblioteca_jogos]
GO
/****** Object:  Table [dbo].[editores]    Script Date: 05/12/2017 02:35:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[editores](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](50) NOT NULL,
 CONSTRAINT [PK_editores] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[generos]    Script Date: 05/12/2017 02:35:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[generos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descricao] [varchar](50) NOT NULL,
 CONSTRAINT [PK_generos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[jogos]    Script Date: 05/12/2017 02:35:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[jogos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[titulo] [varchar](50) NOT NULL,
	[valorPago] [money] NULL,
	[dataCompra] [date] NULL,
	[id_editor] [int] NOT NULL,
	[id_genero] [int] NOT NULL,
	[imagem] [varchar](150) NULL,
 CONSTRAINT [PK_jogos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 05/12/2017 02:35:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[usuarios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[usuario] [varchar](50) NOT NULL,
	[senha] [varchar](50) NOT NULL,
	[perfil] [char](1) NOT NULL,
 CONSTRAINT [PK_usuarios] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[jogos]  WITH CHECK ADD  CONSTRAINT [FK_jogos_editores] FOREIGN KEY([id_editor])
REFERENCES [dbo].[editores] ([id])
GO
ALTER TABLE [dbo].[jogos] CHECK CONSTRAINT [FK_jogos_editores]
GO
ALTER TABLE [dbo].[jogos]  WITH CHECK ADD  CONSTRAINT [FK_jogos_generos] FOREIGN KEY([id_genero])
REFERENCES [dbo].[generos] ([id])
GO
ALTER TABLE [dbo].[jogos] CHECK CONSTRAINT [FK_jogos_generos]
GO
USE [master]
GO
ALTER DATABASE [biblioteca_jogos] SET  READ_WRITE 
GO
