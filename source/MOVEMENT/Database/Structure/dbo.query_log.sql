IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[query_log]') AND type in (N'U'))
DROP TABLE [dbo].[query_log]
GO
/****** Object:  Table [dbo].[query_log]    Script Date: 05/04/2007 13:17:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[query_log](
	[log_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[timestamp] [smalldatetime] NOT NULL,
	[query] [varchar](2000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[count] [int] NOT NULL,
 CONSTRAINT [PK_Query Log] PRIMARY KEY CLUSTERED 
(
	[log_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Index [IX_query_log_user_id]    Script Date: 05/04/2007 13:17:29 ******/
CREATE NONCLUSTERED INDEX [IX_query_log_user_id] ON [dbo].[query_log] 
(
	[user_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[query_log]  WITH CHECK ADD  CONSTRAINT [FK_query_log_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[user] ([user_id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[query_log] CHECK CONSTRAINT [FK_query_log_User]
GO
