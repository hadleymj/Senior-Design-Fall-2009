IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[test_batch_tests]') AND type in (N'U'))
DROP TABLE [dbo].[test_batch_tests]
GO
/****** Object:  Table [dbo].[test_batch_tests]    Script Date: 05/04/2007 13:18:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test_batch_tests](
	[batch_id] [int] NOT NULL,
	[sequence] [tinyint] NOT NULL,
	[script_id] [int] NOT NULL,
 CONSTRAINT [PK_test_batch_tests] PRIMARY KEY CLUSTERED 
(
	[batch_id] ASC,
	[sequence] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
GRANT SELECT ON [dbo].[test_batch_tests] TO [db_researcher]
GO
ALTER TABLE [dbo].[test_batch_tests]  WITH CHECK ADD  CONSTRAINT [FK_test_batch_tests_test_batch] FOREIGN KEY([batch_id])
REFERENCES [dbo].[test_batch] ([batch_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[test_batch_tests] CHECK CONSTRAINT [FK_test_batch_tests_test_batch]
GO
ALTER TABLE [dbo].[test_batch_tests]  WITH CHECK ADD  CONSTRAINT [FK_test_batch_tests_test_script] FOREIGN KEY([script_id])
REFERENCES [dbo].[test_script] ([script_id])
GO
ALTER TABLE [dbo].[test_batch_tests] CHECK CONSTRAINT [FK_test_batch_tests_test_script]
GO
