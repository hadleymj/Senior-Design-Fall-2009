IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[test]') AND type in (N'U'))
DROP TABLE [dbo].[test]
GO
/****** Object:  Table [dbo].[test]    Script Date: 05/04/2007 13:18:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test](
	[test_id] [int] IDENTITY(1,1) NOT NULL,
	[timestamp] [smalldatetime] NOT NULL,
	[script_id] [int] NOT NULL,
	[user_id] [int] NULL,
	[subject_id] [uniqueidentifier] NOT NULL,
	[hand] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[mode] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[rotation] [smallint] NOT NULL,
 CONSTRAINT [PK_Test] PRIMARY KEY CLUSTERED 
(
	[test_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Index [IX_test_subject]    Script Date: 05/04/2007 13:18:01 ******/
CREATE NONCLUSTERED INDEX [IX_test_subject] ON [dbo].[test] 
(
	[subject_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
GRANT SELECT ON [dbo].[test] TO [db_researcher]
GO
ALTER TABLE [dbo].[test]  WITH CHECK ADD  CONSTRAINT [FK_test_subject] FOREIGN KEY([subject_id])
REFERENCES [dbo].[subject] ([subject_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[test] CHECK CONSTRAINT [FK_test_subject]
GO
ALTER TABLE [dbo].[test]  WITH CHECK ADD  CONSTRAINT [FK_test_test_script1] FOREIGN KEY([script_id])
REFERENCES [dbo].[test_script] ([script_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[test] CHECK CONSTRAINT [FK_test_test_script1]
GO
ALTER TABLE [dbo].[test]  WITH CHECK ADD  CONSTRAINT [FK_Test_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[user] ([user_id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[test] CHECK CONSTRAINT [FK_Test_User]
GO
