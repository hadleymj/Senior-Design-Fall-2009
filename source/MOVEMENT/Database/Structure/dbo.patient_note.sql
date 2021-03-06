IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[patient_note]') AND type in (N'U'))
DROP TABLE [dbo].[patient_note]
GO
/****** Object:  Table [dbo].[patient_note]    Script Date: 05/04/2007 13:17:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[patient_note](
	[patient_id] [int] NOT NULL,
	[timestamp] [smalldatetime] NOT NULL,
	[user_id] [int] NULL,
	[note] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_Patient Note] PRIMARY KEY CLUSTERED 
(
	[patient_id] ASC,
	[timestamp] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [dbo].[patient_note]  WITH CHECK ADD  CONSTRAINT [FK_Patient Note_Patient] FOREIGN KEY([patient_id])
REFERENCES [dbo].[patient] ([patient_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[patient_note] CHECK CONSTRAINT [FK_Patient Note_Patient]
GO
ALTER TABLE [dbo].[patient_note]  WITH CHECK ADD  CONSTRAINT [FK_patient_note_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[user] ([user_id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[patient_note] CHECK CONSTRAINT [FK_patient_note_user]
GO
