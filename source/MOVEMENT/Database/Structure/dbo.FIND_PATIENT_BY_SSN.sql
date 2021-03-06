IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FIND_PATIENT_BY_SSN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[FIND_PATIENT_BY_SSN]
GO
/****** Object:  StoredProcedure [dbo].[FIND_PATIENT_BY_SSN]    Script Date: 05/04/2007 13:16:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Christopher Pope
-- Create date: Oct 31 2006
-- Description:	Find a patient based on their name 
-- and the last four digits of their social 
-- security number.
-- =============================================
CREATE PROCEDURE FIND_PATIENT_BY_SSN 
	-- Add the parameters for the stored procedure here
	@name varchar(50),
	@ssn char(4)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT patient_id FROM patient WHERE name = @name
	AND ssn4 = @ssn;
END

GO
GRANT EXECUTE ON [dbo].[FIND_PATIENT_BY_SSN] TO [movement_app]
GO
