IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LOG_QUERY]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[LOG_QUERY]
GO
/****** Object:  StoredProcedure [dbo].[LOG_QUERY]    Script Date: 05/04/2007 13:16:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Michael Petito
-- Create date: Nov 5 2006
-- Description:	Logs a query executed by a user.
-- =============================================
CREATE PROCEDURE LOG_QUERY 
	@user_id int,
	@query varchar(2000),
	@count int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO query_log ("user_id", timestamp, query, count)
	VALUES (@user_id, getutcdate(), @query, @count)
	
	
END

GO
GRANT EXECUTE ON [dbo].[LOG_QUERY] TO [movement_app]
GO
