IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FIND_PATIENT_BY_DOB]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[FIND_PATIENT_BY_DOB]
GO
/****** Object:  StoredProcedure [dbo].[FIND_PATIENT_BY_DOB]    Script Date: 05/04/2007 13:16:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Christopher Pope
-- Create date: Oct 31 2006
-- Description:	Find a patient by their name and date of birth.
-- =============================================
CREATE PROCEDURE FIND_PATIENT_BY_DOB 
	-- Add the parameters for the stored procedure here
	@name varchar(50),
	@dob smalldatetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	--MPP 11/10/06: modified to use patient_subject_join
	SELECT patient_id
	FROM patient_subject_join
	WHERE "name" = @name
		AND dob = @dob
END

GO
GRANT EXECUTE ON [dbo].[FIND_PATIENT_BY_DOB] TO [movement_app]
GO
