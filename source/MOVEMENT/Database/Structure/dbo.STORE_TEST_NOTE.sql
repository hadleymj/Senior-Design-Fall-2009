IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[STORE_TEST_NOTE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[STORE_TEST_NOTE]
GO
/****** Object:  StoredProcedure [dbo].[STORE_TEST_NOTE]    Script Date: 05/04/2007 13:17:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Christopher Pope
-- Create date: Oct 27 2006
-- Description:	Store a note about a test that was administered.
-- =============================================
CREATE PROCEDURE [dbo].[STORE_TEST_NOTE] 
	-- Add the parameters for the stored procedure here
	@testID int,
	@userID int,
	@note text 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Check that the test exists already.
	IF NOT EXISTS ( SELECT * FROM test WHERE test_id = @testID)
	BEGIN
		RAISERROR('There is no record of the specified test.', 16, 1);
		RETURN
	END

	-- Verify that the user storing the note exists.
	IF NOT EXISTS ( SELECT * FROM [user] WHERE [user_id] = @userID )
	BEGIN
		RAISERROR('The specified user does not exist.', 16, 1);
		RETURN
	END

	-- Set a ROLLBACK point
	BEGIN TRANSACTION

	-- Store the note already!
	INSERT INTO test_note (test_id, timestamp, [user_id], note)
	VALUES (@testID, getutcdate(), @userID, @note);

	IF @@error <> 0 
	BEGIN 
		ROLLBACK TRANSACTION
		RAISERROR('An error occurred while attempting to add a note for the specified test.',16,1);
		RETURN 
	END

	-- Everything is OK
	COMMIT TRANSACTION
	RETURN 0
END


GO
GRANT EXECUTE ON [dbo].[STORE_TEST_NOTE] TO [movement_app]
GO
