IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[REMOVE_PATIENT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[REMOVE_PATIENT]
GO
/****** Object:  StoredProcedure [dbo].[REMOVE_PATIENT]    Script Date: 05/04/2007 13:17:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Michael Petito
-- Create date: Nov 12 2006
-- Description:	Removes a specified Patient (user) from the database.
-- =============================================
CREATE PROCEDURE [dbo].[REMOVE_PATIENT] 
	-- Add the parameters for the stored procedure here
	@patientID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DELETE FROM patient
	WHERE patient_id = @patientID
	
	IF @@ROWCOUNT = 0
	BEGIN
		RAISERROR('No such patient exists.', 16,1);
		RETURN
	END

END


GO
GRANT EXECUTE ON [dbo].[REMOVE_PATIENT] TO [movement_app]
GO
