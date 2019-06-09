USE [Stat]
GO
/****** ����:  Table [dbo].[IPStat]    �ű�����: 09/25/2006 09:56:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IPStat](
	[IP_ID] [int] IDENTITY(1,1) NOT NULL,
	[IP_Address] [nvarchar](20) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[IP_Src] [nvarchar](80) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[IP_DateTime] [datetime] NOT NULL
) ON [PRIMARY]
