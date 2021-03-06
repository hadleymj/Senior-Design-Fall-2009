IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GET_USER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GET_USER]
GO
/****** Object:  StoredProcedure [dbo].[GET_USER]    Script Date: 05/04/2007 13:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Christopher Pope
-- Create date: Oct 31 2006
-- Description:	Retrieve all of a user's information.
-- =============================================
CREATE PROCEDURE GET_USER 
	-- Add the parameters for the stored procedure here
	@userID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Error checking, do they already exist?
	IF NOT EXISTS ( SELECT * FROM [user] WHERE [user_id] = @userID)
	BEGIN
		RAISERROR('The user does not exists.', 16, 1);
		RETURN 0
	END

	SELECT * FROM [user] WHERE [user_id] = @userid;
END

GO
GRANT EXECUTE ON [dbo].[GET_USER] TO [movement_app]
GO
