IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FIND_PATIENT_BY_SSN_DOB]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[FIND_PATIENT_BY_SSN_DOB]
GO
/****** Object:  StoredProcedure [dbo].[FIND_PATIENT_BY_SSN_DOB]    Script Date: 05/04/2007 13:16:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Michael Petito
-- Create date: Nov 11 2006
-- Description:	Find a patient by their name only.
-- =============================================
CREATE PROCEDURE FIND_PATIENT_BY_SSN_DOB
	-- Add the parameters for the stored procedure here
	@ssn char(4),
	@dob smalldatetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT patient_id
	FROM patient_subject_join	
	WHERE ssn4 = @ssn AND dob = @dob
END

GO
GRANT EXECUTE ON [dbo].[FIND_PATIENT_BY_SSN_DOB] TO [movement_app]
GO
