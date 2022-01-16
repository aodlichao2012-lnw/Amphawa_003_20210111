USE [Amphawan_LMS_db_2]
GO

/****** Object:  Table [dbo].[MD_catralog_book]    Script Date: 1/16/2022 3:40:34 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MD_catralog_book]') AND type in (N'U'))
DROP TABLE [dbo].[MD_catralog_book]
GO

/****** Object:  Table [dbo].[MD_catralog_book]    Script Date: 1/16/2022 3:40:34 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[MD_catralog_book](
	[int_id_catalog_book] [int] IDENTITY(1,1) NOT NULL,
	[st_name_book] [nvarchar](max) NULL,
	[st_ISBN_ISSN] [nvarchar](max) NULL,
	[st_detail_book] [nvarchar](max) NULL,
	[dt_DATE_modify] [datetime] NULL,
	[st_type_book] [int] NULL,
	[st_type_book_name] [nvarchar](max) NULL,
	[bool_current] [bit] NULL,
	[int_cheeckin_out] [int] NULL,
	[st_cheeckin_out] [nvarchar](max) NULL,
	[dt_checkout_date] [datetime] NULL,
	[dt_checkin_date] [datetime] NULL,
	[dt_checkin_due] [datetime] NULL,
	[img_book] [varbinary](max) NULL,
	[st_process_name_user] [nvarchar](max) NULL,
	[int_status_yet] [int] NULL,
	[st_status_yet] [nvarchar](max) NULL,
	[img_path] [nvarchar](max) NULL,
	[video_path] [nvarchar](max) NULL,
	[ebook_path] [nvarchar](max) NULL,
	[st_lend_name] [nvarchar](max) NULL,
	[st_author] [nvarchar](max) NULL,
	[st_call_number] [nvarchar](max) NULL,
	[count_print] [nvarchar](max) NULL,
	[plate_print] [nvarchar](max) NULL,
	[company_print] [nvarchar](max) NULL,
	[int_lang] [int] NULL,
	[st_lang] [nvarchar](max) NULL,
	[int_count_view_book] (int)
 CONSTRAINT [PK_dbo.MD_catralog_book] PRIMARY KEY CLUSTERED 
(
	[int_id_catalog_book] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


