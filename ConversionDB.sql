/****** Object:  Database [Coversion]    Script Date: 14-10-2022 17:44:47 ******/
CREATE DATABASE [Coversion]  (EDITION = 'GeneralPurpose', SERVICE_OBJECTIVE = 'GP_Gen5_2', MAXSIZE = 32 GB) WITH CATALOG_COLLATION = SQL_Latin1_General_CP1_CI_AS, LEDGER = OFF;
GO
ALTER DATABASE [Coversion] SET COMPATIBILITY_LEVEL = 160
GO
ALTER DATABASE [Coversion] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Coversion] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Coversion] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Coversion] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Coversion] SET ARITHABORT OFF 
GO
ALTER DATABASE [Coversion] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Coversion] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Coversion] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Coversion] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Coversion] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Coversion] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Coversion] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Coversion] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Coversion] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [Coversion] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Coversion] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [Coversion] SET  MULTI_USER 
GO
ALTER DATABASE [Coversion] SET ENCRYPTION ON
GO
ALTER DATABASE [Coversion] SET QUERY_STORE = ON
GO
ALTER DATABASE [Coversion] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 100, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
/*** The scripts of database scoped configurations in Azure should be executed inside the target database connection. ***/
GO
-- ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 8;
GO
/****** Object:  UserDefinedFunction [dbo].[ConvertTemprature]    Script Date: 14-10-2022 17:44:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create function [dbo].[ConvertTemprature](@InputValue Int, @ConversionType int)
Returns Decimal(18,6) 
As
Begin 
	Declare @output Int 
	Set @output = (Case @output When 1 Then ((@InputValue * (9.0/5.0)) + 32) Else (5/9.0 * (@InputValue - 32)) End)
	Return (@output) 
End 




  
GO
/****** Object:  Table [dbo].[Imperialtbl]    Script Date: 14-10-2022 17:44:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Imperialtbl](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Imperial_Unit] [varchar](500) NOT NULL,
 CONSTRAINT [PK_Imperialtbl] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImphericalConversiontbl]    Script Date: 14-10-2022 17:44:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImphericalConversiontbl](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ImperialId] [int] NOT NULL,
	[MetricId] [int] NOT NULL,
	[ConversionFormula] [varchar](500) NOT NULL,
	[IsFunction] [bit] NULL,
 CONSTRAINT [PK_ImphericalConversiontbl] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MetricConversiontbl]    Script Date: 14-10-2022 17:44:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MetricConversiontbl](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MetricId] [int] NOT NULL,
	[ConversionFormula] [varchar](5000) NOT NULL,
	[ImperialId] [int] NOT NULL,
	[IsFunctionCall] [bit] NULL,
 CONSTRAINT [PK_MetricConversiontbl] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Metrictbl]    Script Date: 14-10-2022 17:44:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Metrictbl](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Metric_Unit] [varchar](500) NOT NULL,
 CONSTRAINT [PK_Metrictbl] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Imperialtbl] ON 
GO
INSERT [dbo].[Imperialtbl] ([Id], [Imperial_Unit]) VALUES (1, N'Yards')
GO
INSERT [dbo].[Imperialtbl] ([Id], [Imperial_Unit]) VALUES (2, N'Miles')
GO
INSERT [dbo].[Imperialtbl] ([Id], [Imperial_Unit]) VALUES (3, N'Gallons')
GO
INSERT [dbo].[Imperialtbl] ([Id], [Imperial_Unit]) VALUES (4, N'Pounds')
GO
INSERT [dbo].[Imperialtbl] ([Id], [Imperial_Unit]) VALUES (5, N'Fahrenheit')
GO
INSERT [dbo].[Imperialtbl] ([Id], [Imperial_Unit]) VALUES (6, N'Ounces')
GO
SET IDENTITY_INSERT [dbo].[Imperialtbl] OFF
GO
SET IDENTITY_INSERT [dbo].[ImphericalConversiontbl] ON 
GO
INSERT [dbo].[ImphericalConversiontbl] ([Id], [ImperialId], [MetricId], [ConversionFormula], [IsFunction]) VALUES (1, 2, 1, N'1.61', 0)
GO
INSERT [dbo].[ImphericalConversiontbl] ([Id], [ImperialId], [MetricId], [ConversionFormula], [IsFunction]) VALUES (2, 1, 2, N'0.91', 0)
GO
INSERT [dbo].[ImphericalConversiontbl] ([Id], [ImperialId], [MetricId], [ConversionFormula], [IsFunction]) VALUES (3, 3, 3, N'3.785', 0)
GO
INSERT [dbo].[ImphericalConversiontbl] ([Id], [ImperialId], [MetricId], [ConversionFormula], [IsFunction]) VALUES (4, 4, 4, N'0.454', 0)
GO
INSERT [dbo].[ImphericalConversiontbl] ([Id], [ImperialId], [MetricId], [ConversionFormula], [IsFunction]) VALUES (5, 5, 5, N'(@InuputValue - 32)* 5/9', 1)
GO
INSERT [dbo].[ImphericalConversiontbl] ([Id], [ImperialId], [MetricId], [ConversionFormula], [IsFunction]) VALUES (6, 6, 6, N'28.35', 0)
GO
SET IDENTITY_INSERT [dbo].[ImphericalConversiontbl] OFF
GO
SET IDENTITY_INSERT [dbo].[MetricConversiontbl] ON 
GO
INSERT [dbo].[MetricConversiontbl] ([Id], [MetricId], [ConversionFormula], [ImperialId], [IsFunctionCall]) VALUES (1, 1, N'0.62', 2, 0)
GO
INSERT [dbo].[MetricConversiontbl] ([Id], [MetricId], [ConversionFormula], [ImperialId], [IsFunctionCall]) VALUES (2, 2, N'1.09361', 1, 0)
GO
INSERT [dbo].[MetricConversiontbl] ([Id], [MetricId], [ConversionFormula], [ImperialId], [IsFunctionCall]) VALUES (3, 3, N'0.264', 3, 0)
GO
INSERT [dbo].[MetricConversiontbl] ([Id], [MetricId], [ConversionFormula], [ImperialId], [IsFunctionCall]) VALUES (4, 4, N'0.0011', 4, 0)
GO
INSERT [dbo].[MetricConversiontbl] ([Id], [MetricId], [ConversionFormula], [ImperialId], [IsFunctionCall]) VALUES (5, 5, N'((@InuputValue * 9) /5 )+ 32
', 5, 1)
GO
INSERT [dbo].[MetricConversiontbl] ([Id], [MetricId], [ConversionFormula], [ImperialId], [IsFunctionCall]) VALUES (6, 6, N'0.035', 6, 0)
GO
SET IDENTITY_INSERT [dbo].[MetricConversiontbl] OFF
GO
SET IDENTITY_INSERT [dbo].[Metrictbl] ON 
GO
INSERT [dbo].[Metrictbl] ([Id], [Metric_Unit]) VALUES (1, N'Kilometers')
GO
INSERT [dbo].[Metrictbl] ([Id], [Metric_Unit]) VALUES (2, N'Meters')
GO
INSERT [dbo].[Metrictbl] ([Id], [Metric_Unit]) VALUES (3, N'Liters')
GO
INSERT [dbo].[Metrictbl] ([Id], [Metric_Unit]) VALUES (4, N'Kilogram')
GO
INSERT [dbo].[Metrictbl] ([Id], [Metric_Unit]) VALUES (5, N'Celsius')
GO
INSERT [dbo].[Metrictbl] ([Id], [Metric_Unit]) VALUES (6, N'Grams')
GO
SET IDENTITY_INSERT [dbo].[Metrictbl] OFF
GO
/****** Object:  StoredProcedure [dbo].[UnitConversion]    Script Date: 14-10-2022 17:44:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[UnitConversion] @MetericUnitType INT
	,@ImperialUnitType INT
	,@InputValue INT
	,@ConversionType INT
AS
BEGIN
	DECLARE @Message VARCHAR(50)
		,@Conversion DECIMAL(18, 6)
		,@MetricUnit VARCHAR(500)
		,@ImpericalUnit VARCHAR(500)

	IF EXISTS (
			SELECT Count(1)
			FROM MetricConversiontbl
			WHERE Metricid = @MetericUnitType
				AND ImperialId = @MetericUnitType
			)
		IF (@ConversionType = 1) -- Meteric to Imperical
			SELECT @Conversion = (
					SELECT (
							CASE 
								WHEN (
										(
											@ImperialUnitType = 2
											AND @MetericUnitType = 1
											)
										)
									THEN (
											SELECT CAST(ConversionFormula AS DECIMAL(18, 6)) * @InputValue AS conversion
											FROM MetricConversiontbl
											WHERE ImperialId = @ImperialUnitType
												AND MetricId = @MetericUnitType
											)
								WHEN (
										(
											@ImperialUnitType = 1
											AND @MetericUnitType = 1
											)
										)
									THEN (
											SELECT CAST(ConversionFormula AS DECIMAL(18, 6)) * @InputValue AS conversion
											FROM MetricConversiontbl
											WHERE ImperialId = @ImperialUnitType
												AND MetricId = @MetericUnitType
											)
								WHEN (
										(
											@ImperialUnitType = 3
											AND @MetericUnitType = 3
											)
										)
									THEN (
											SELECT CAST(ConversionFormula AS DECIMAL(18, 6)) * @InputValue AS conversion
											FROM MetricConversiontbl
											WHERE ImperialId = @ImperialUnitType
												AND MetricId = @MetericUnitType
											)
								WHEN (
										(
											@ImperialUnitType = 4
											AND @MetericUnitType = 4
											)
										)
									THEN (
											SELECT CAST(ConversionFormula AS DECIMAL(18, 6)) * @InputValue AS conversion
											FROM MetricConversiontbl
											WHERE ImperialId = @ImperialUnitType
												AND MetricId = @MetericUnitType
											)
								WHEN (
										(
											@ImperialUnitType = 5
											AND @MetericUnitType = 5
											)
										)
									THEN (
											SELECT [dbo].[ConvertTemprature](@InputValue, @ConversionType)
											)
								WHEN (
										(
											@ImperialUnitType = 6
											AND @MetericUnitType = 6
											)
										)
									THEN (
											SELECT CAST(ConversionFormula AS DECIMAL(18, 6)) * @InputValue AS conversion
											FROM MetricConversiontbl
											WHERE ImperialId = @ImperialUnitType
												AND MetricId = @MetericUnitType
											)
								ELSE (
										SELECT 0.00
										)
								END
							) AS Conversion
					)

	IF (@ConversionType = 2) -- Imperical to Meteric
		SELECT @Conversion = (
				SELECT (
						CASE 
							WHEN (
									(
										@ImperialUnitType = 2
										AND @MetericUnitType = 1
										)
									)
								THEN (
										SELECT CAST(ConversionFormula AS DECIMAL(18, 6)) * @InputValue AS conversion
										FROM ImphericalConversiontbl
										WHERE ImperialId = @ImperialUnitType
											AND MetricId = @MetericUnitType
										)
							WHEN (
									(
										@ImperialUnitType = 1
										AND @MetericUnitType = 1
										)
									)
								THEN (
										SELECT CAST(ConversionFormula AS DECIMAL(18, 6)) * @InputValue AS conversion
										FROM ImphericalConversiontbl
										WHERE ImperialId = @ImperialUnitType
											AND MetricId = @MetericUnitType
										)
							WHEN (
									(
										@ImperialUnitType = 3
										AND @MetericUnitType = 3
										)
									)
								THEN (
										SELECT CAST(ConversionFormula AS DECIMAL(18, 6)) * @InputValue AS conversion
										FROM ImphericalConversiontbl
										WHERE ImperialId = @ImperialUnitType
											AND MetricId = @MetericUnitType
										)
							WHEN (
									(
										@ImperialUnitType = 4
										AND @MetericUnitType = 4
										)
									)
								THEN (
										SELECT CAST(ConversionFormula AS DECIMAL(18, 6)) * @InputValue AS conversion
										FROM ImphericalConversiontbl
										WHERE ImperialId = @ImperialUnitType
											AND MetricId = @MetericUnitType
										)
							WHEN (
									(
										@ImperialUnitType = 5
										AND @MetericUnitType = 5
										)
									)
								THEN (
										SELECT [dbo].[ConvertTemprature](@InputValue, @ConversionType)
										)
							WHEN (
									(
										@ImperialUnitType = 6
										AND @MetericUnitType = 6
										)
									)
								THEN (
										SELECT CAST(ConversionFormula AS DECIMAL(18, 6)) * @InputValue AS conversion
										FROM ImphericalConversiontbl
										WHERE ImperialId = @ImperialUnitType
											AND MetricId = @MetericUnitType
										)
							ELSE (
									SELECT 0.00
									)
							END
						) AS Conversion
				)

	BEGIN
		SELECT @MetricUnit = Metric_Unit
		FROM Metrictbl
		WHERE Id = @MetericUnitType

		SELECT @ImpericalUnit = Imperial_Unit
		FROM Imperialtbl
		WHERE Id = @MetericUnitType

		SELECT @Message = CASE 
				WHEN @Conversion = 0.00
					THEN 'Invalid Conversion found please check'
				ELSE ''
				END

		SELECT ISNULL(@Conversion, 0.00) AS 'DataValue'
			,ISNULL(@MetricUnit, '') AS 'MetricUnit'
			,ISNULL(@ImpericalUnit, '') AS 'ImpericalUnit'
			,ISNULL(@Message, '') AS 'Message'
			,CASE 
				WHEN @Message = 'Invalid Conversion found please check'
					THEN ''
				ELSE CASE 
						WHEN @ConversionType = 1
							THEN CAST(@InputValue AS VARCHAR(100)) + ' ' + @MetricUnit + ' is equal to ' + CAST(@Conversion AS VARCHAR(100)) + ' ' + @ImpericalUnit
						WHEN @ConversionType = 2
							THEN CAST(@InputValue AS VARCHAR(100)) + ' ' + @ImpericalUnit + ' is equal to ' + CAST(@Conversion AS VARCHAR(100)) + '  ' + @MetricUnit
						END
				END AS 'ConversionMessage'
	END
END
GO
ALTER DATABASE [Coversion] SET  READ_WRITE 
GO
