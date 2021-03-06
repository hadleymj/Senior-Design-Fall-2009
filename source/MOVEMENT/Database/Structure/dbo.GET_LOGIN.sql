IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GET_LOGIN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GET_LOGIN]
GO
/****** Object:  StoredProcedure [dbo].[GET_LOGIN]    Script Date: 05/04/2007 13:16:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Christopher Pope
-- Create date: October 24, 2006
-- Description:	Procedure for validating a login attempt by a given user.
-- =============================================
CREATE PROCEDURE [dbo].[GET_LOGIN] 
	-- Add the parameters for the stored procedure here
	@uname varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    --MPP 11/2/06: restrict returned fields
	SELECT user_id, username, password FROM [user] WHERE username = @uname;
END


GO
GRANT EXECUTE ON [dbo].[GET_LOGIN] TO [movement_app]
GO
