IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[metric_field]') AND type in (N'U'))
DROP TABLE [dbo].[metric_field]
GO
/****** Object:  Table [dbo].[metric_field]    Script Date: 05/04/2007 13:17:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[metric_field](
	[metric_field_id] [int] NOT NULL,
	[name] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_metric_field] PRIMARY KEY CLUSTERED 
(
	[metric_field_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 100) ON [PRIMARY]
) ON [PRIMARY]

GO
GRANT SELECT ON [dbo].[metric_field] TO [db_researcher]
GO
