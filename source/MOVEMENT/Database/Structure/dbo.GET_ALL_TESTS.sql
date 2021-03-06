IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GET_ALL_TESTS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GET_ALL_TESTS]
GO
/****** Object:  StoredProcedure [dbo].[GET_ALL_TESTS]    Script Date: 05/04/2007 13:16:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Christopher Pope
-- Create date: Oct 27 2006
-- Description:	Retrieve all of a given subject's tests.
-- =============================================
CREATE PROCEDURE [dbo].[GET_ALL_TESTS] 
	-- Add the parameters for the stored procedure here
	@patientID int	--MPP 11/12/06: modified to use patientID
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF NOT EXISTS (SELECT * FROM patient WHERE patient_id = @patientID) 
	BEGIN 
		RAISERROR('The subject does not exist.',16,1);
	END

    --MPP 11/12/06: modified to use patientID
	SELECT test.* 
	FROM test
		INNER JOIN patient_subject ON test.subject_id = patient_subject.subject_id
	WHERE patient_subject.patient_id = @patientID
END


GO
GRANT EXECUTE ON [dbo].[GET_ALL_TESTS] TO [movement_app]
GO
