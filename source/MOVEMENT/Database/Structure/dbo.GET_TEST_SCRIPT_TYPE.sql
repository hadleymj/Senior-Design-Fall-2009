IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GET_TEST_SCRIPT_TYPE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GET_TEST_SCRIPT_TYPE]
GO
/****** Object:  StoredProcedure [dbo].[GET_TEST_SCRIPT_TYPE]    Script Date: 05/04/2007 13:16:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Michael Petito
-- Create date: Nov 12 2006
-- Description:	Retrieve the script type for a specified script type id.
-- =============================================
CREATE PROCEDURE [dbo].[GET_TEST_SCRIPT_TYPE] 
	-- Add the parameters for the stored procedure here
	@typeID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Find the test script type
	SELECT *
	FROM test_script_type
	WHERE type_id = @typeID
	
	IF @@ROWCOUNT = 0
	BEGIN
		RAISERROR('The specified test script type does not exist.', 16, 1);
	END
	
END


GO
GRANT EXECUTE ON [dbo].[GET_TEST_SCRIPT_TYPE] TO [movement_app]
GO
