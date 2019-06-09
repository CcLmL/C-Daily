USE [QQ]
GO
/****** 对象:  Table [dbo].[QQList]    脚本日期: 09/21/2006 15:46:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QQList](
	[ListID] [int] IDENTITY(1,1) NOT NULL,
	[ListQQ] [nvarchar](20) COLLATE Chinese_PRC_CI_AS NOT NULL
) ON [PRIMARY]
