IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[raw_test_data]') AND type in (N'U'))
DROP TABLE [dbo].[raw_test_data]
GO
/****** Object:  Table [dbo].[raw_test_data]    Script Date: 05/04/2007 13:17:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[raw_test_data](
	[test_id] [int] NOT NULL,
	[time] [int] NOT NULL,
	[x] [smallint] NOT NULL,
	[y] [smallint] NOT NULL,
	[pressure] [smallint] NOT NULL,
 CONSTRAINT [PK_raw_test_data] PRIMARY KEY CLUSTERED 
(
	[test_id] ASC,
	[time] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
GRANT SELECT ON [dbo].[raw_test_data] TO [db_researcher]
GO
ALTER TABLE [dbo].[raw_test_data]  WITH CHECK ADD  CONSTRAINT [FK_Raw Test Data_Test] FOREIGN KEY([test_id])
REFERENCES [dbo].[test] ([test_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[raw_test_data] CHECK CONSTRAINT [FK_Raw Test Data_Test]
GO
