IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[patient_subject]') AND type in (N'U'))
DROP TABLE [dbo].[patient_subject]
GO
/****** Object:  Table [dbo].[patient_subject]    Script Date: 05/04/2007 13:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[patient_subject](
	[patient_id] [int] NOT NULL,
	[subject_id] [uniqueidentifier] NULL,
 CONSTRAINT [PK_patient_subject] PRIMARY KEY CLUSTERED 
(
	[patient_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Index [IX_patient_subject_subject]    Script Date: 05/04/2007 13:17:22 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_patient_subject_subject] ON [dbo].[patient_subject] 
(
	[subject_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[patient_subject]  WITH CHECK ADD  CONSTRAINT [FK_patient_subject_patient] FOREIGN KEY([patient_id])
REFERENCES [dbo].[patient] ([patient_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[patient_subject] CHECK CONSTRAINT [FK_patient_subject_patient]
GO
ALTER TABLE [dbo].[patient_subject]  WITH CHECK ADD  CONSTRAINT [FK_patient_subject_subject] FOREIGN KEY([subject_id])
REFERENCES [dbo].[subject] ([subject_id])
GO
ALTER TABLE [dbo].[patient_subject] CHECK CONSTRAINT [FK_patient_subject_subject]
GO
