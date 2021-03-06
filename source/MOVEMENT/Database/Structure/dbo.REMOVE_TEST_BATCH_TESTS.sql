IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[REMOVE_TEST_BATCH_TESTS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[REMOVE_TEST_BATCH_TESTS]
GO
/****** Object:  StoredProcedure [dbo].[REMOVE_TEST_BATCH_TESTS]    Script Date: 05/04/2007 13:17:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Michael Petito
-- Create date: Nov 14 2006
-- Description:	Removes all tests associated with a test batch (used for update).
-- =============================================
CREATE PROCEDURE [dbo].[REMOVE_TEST_BATCH_TESTS] 
	@batchID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DELETE FROM test_batch_tests
	WHERE batch_id = @batchID
END


GO
GRANT EXECUTE ON [dbo].[REMOVE_TEST_BATCH_TESTS] TO [movement_app]
GO
