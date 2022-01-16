USE [Amphawan_LMS_db_2]
GO

/****** Object:  Table [dbo].[MD_Account]    Script Date: 1/16/2022 3:52:15 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MD_Account]') AND type in (N'U'))
DROP TABLE [dbo].[MD_Account]
GO

/****** Object:  Table [dbo].[MD_Account]    Script Date: 1/16/2022 3:52:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[MD_Account](
	[int_id] [int] IDENTITY(1,1) NOT NULL,
	[st_user] [nvarchar](max) NULL,
	[st_password] [nvarchar](max) NULL,
	[st_compare_password] [nvarchar](max) NULL,
	[st_email] [nvarchar](max) NULL,
	[dt_cus_birth_day] [datetime]  NULL,
	[dt_cus_begin_cus_day] [datetime] NULL,
	[dt_cus_expire_cus_day] [datetime]  NULL,
	[bool_staus] [bit]  NULL,
	[bool_stop_] [bit] NULL,
	[st_cus_name] [nvarchar](max) NULL,
	[st_post_address] [nvarchar](max) NULL,
	[st_Email_address] [nvarchar](max) NULL,
	[int_type_cus] [int]  NULL,
	[st_type_cus] [nvarchar](max) NULL,
	[st_count] [int]  NULL,
	[decimal_cus_from_least] [decimal](18, 2) NOT NULL,
	[Date_login_user] [datetime]  NULL,
 CONSTRAINT [PK_dbo.MD_Account] PRIMARY KEY CLUSTERED 
(
	[int_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


