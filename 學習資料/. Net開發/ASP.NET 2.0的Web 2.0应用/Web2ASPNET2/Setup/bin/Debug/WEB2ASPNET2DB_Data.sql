SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Project]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Project](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectName] [varchar](20) NULL,
 CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AjaxSystemConfig]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AjaxSystemConfig](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IP] [varchar](50) NULL,
	[Port] [int] NULL,
 CONSTRAINT [PK_AjaxSystemConfig] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RSSUrl]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RSSUrl](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) NULL,
	[Url] [varchar](255) NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_RSSUrl] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_DeleteBlogArticleComment]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_DeleteBlogArticleComment]
(
	@ID int
)

AS

DELETE
	BlogArticleComment

WHERE
	ID = @ID

RETURN @@ROWCOUNT
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Prohibit]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Prohibit](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IP] [varchar](20) NULL,
	[State] [tinyint] NULL,
 CONSTRAINT [PK_Prohibit] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BlogFavorite]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BlogFavorite](
	[ID] [int] NOT NULL,
	[Date] [datetime] NULL,
 CONSTRAINT [PK_BlogFavorite] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AjaxFolder]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AjaxFolder](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[MailTotal] [int] NULL,
	[NewMailCount] [int] NULL,
	[Size] [int] NULL,
	[CreateDate] [datetime] NULL,
	[Flag] [tinyint] NULL,
 CONSTRAINT [PK_AjaxFolder] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AjaxTag]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AjaxTag](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_AjaxTag] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_UpdateDirectory]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_UpdateDirectory]
(
	@ID int,
	@Name varchar(50),
	@Remark nvarchar(1000)
)
AS
	
DECLARE @Count int
DECLARE @ParentID int
SET
	@ParentID = ISNULL((SELECT ParentID FROM WebDirectory WHERE ID = @ID),-1)
SET
	@Count = ISNULL((SELECT COUNT(*) FROM WebDirectory WHERE ParentID = @ParentID AND ID <> @ID),0)
IF @Count <= 0
BEGIN
	UPDATE WebDirectory
	SET
		Name = @Name,
		Remark = @Remark
	WHERE
		ID = @ID
		
	RETURN @@ROWCOUNT
END
ELSE
BEGIN
	RETURN @Count
END
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AjaxGroup]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AjaxGroup](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_AjaxGroup] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_UpdateFileCount]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_UpdateFileCount]
(
	@ID int,
	@FileCount int
)
AS
	
UPDATE WebDirectory
SET
	FileCount = @FileCount
WHERE
	ID = @ID
		
RETURN @@ROWCOUNT
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_UpdateUsedSpace]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_UpdateUsedSpace]
(
	@ID int,
	@UsedSpace int
)
AS
	
UPDATE
	WebDirectory
SET
	UsedSpace = @UsedSpace
WHERE
	ID = @ID
		
RETURN @@ROWCOUNT
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_DeleteDirectory]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_DeleteDirectory]
(
	@ID int
)
AS

DELETE
	WebDirectory
WHERE
	ID = @ID

RETURN @@ROWCOUNT
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_GetDirectorys]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_GetDirectorys]

AS

SELECT
	*
FROM
	WebDirectory
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_GetSingleDirectory]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_GetSingleDirectory]
(
	@ID int
)
AS

SELECT
	*
FROM
	WebDirectory
WHERE
	ID = @ID' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AjaxFilter]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AjaxFilter](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Key] [varchar](255) NULL,
	[ISInclude] [bit] NULL,
	[Flag] [tinyint] NULL,
 CONSTRAINT [PK_AjaxFilter] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_UpdateFile]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_UpdateFile]
(
	@ID int,
	@Name varchar(50)
)
AS
	
UPDATE WebFile
SET
	Name = @Name
WHERE
	ID = @ID
		
RETURN @@ROWCOUNT

' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TagCatalog]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TagCatalog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_TagCatalog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_GetAjaxSystemConfig]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_GetAjaxSystemConfig] 

AS

SELECT
	*
FROM
	AjaxSystemConfig' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Role]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Role](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](50) NULL,
	[ProjectID] [int] NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserState]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserState](
	[UserID] [int] NOT NULL,
	[ProjectID] [int] NOT NULL,
	[State] [tinyint] NULL,
 CONSTRAINT [PK_UserState] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[ProjectID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BlogUrl]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BlogUrl](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) NULL,
	[Url] [varchar](255) NULL,
	[CreateDate] [datetime] NULL,
	[CatalogID] [int] NULL,
 CONSTRAINT [PK_BlogUrl] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BlogArticle]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BlogArticle](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) NULL,
	[Body] [text] NULL,
	[CreateDate] [datetime] NULL,
	[Flag] [tinyint] NULL,
	[CatalogID] [int] NULL,
 CONSTRAINT [PK_BlogArticle] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Reply]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Reply](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Body] [text] NULL,
	[CreateDate] [datetime] NULL,
	[State] [tinyint] NULL,
	[ThreadID] [int] NULL,
 CONSTRAINT [PK_Reply] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accessory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Accessory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NULL,
	[Url] [nvarchar](255) NULL,
	[Type] [varchar](50) NULL,
	[ThreadID] [int] NULL,
 CONSTRAINT [PK_Accessory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BlogArticleSource]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BlogArticleSource](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Url] [varchar](255) NULL,
	[CreateDate] [datetime] NULL,
	[IPAddress] [varchar](20) NULL,
	[ArticleID] [int] NULL,
 CONSTRAINT [PK_BlogArticleSource] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BlogComment]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BlogComment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) NULL,
	[Body] [text] NULL,
	[CreateDate] [datetime] NULL,
	[UserID] [int] NULL,
	[ArticleID] [int] NULL,
 CONSTRAINT [PK_BlogComment] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AjaxMail]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AjaxMail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) NULL,
	[Body] [text] NULL,
	[FromAddress] [varchar](255) NULL,
	[TOAddress] [varchar](500) NULL,
	[CCAddress] [varchar](500) NULL,
	[ISHTMLFormat] [bit] NULL,
	[Size] [int] NULL,
	[CreateDate] [datetime] NULL,
	[ISNew] [bit] NULL,
	[AttachmentFlag] [tinyint] NULL,
	[FolderID] [int] NULL,
 CONSTRAINT [PK_AjaxMail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AjaxAttachment]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AjaxAttachment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) NULL,
	[Type] [varchar](100) NULL,
	[Url] [varchar](255) NULL,
	[Size] [int] NULL,
	[MailID] [int] NULL,
 CONSTRAINT [PK_AjaxAttachment] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AjaxTagMail]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AjaxTagMail](
	[TagID] [int] NOT NULL,
	[MailID] [int] NOT NULL,
 CONSTRAINT [PK_AjaxTagMail] PRIMARY KEY CLUSTERED 
(
	[TagID] ASC,
	[MailID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AjaxFilterMail]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AjaxFilterMail](
	[FilterID] [int] NOT NULL,
	[MailID] [int] NOT NULL,
 CONSTRAINT [PK_AjaxFilterMail] PRIMARY KEY CLUSTERED 
(
	[FilterID] ASC,
	[MailID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AjaxLinkman]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AjaxLinkman](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Email] [varchar](255) NULL,
	[GroupID] [int] NULL,
 CONSTRAINT [PK_AjaxLinkman] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WebFile]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WebFile](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Type] [varchar](50) NULL,
	[Size] [int] NULL,
	[Flag] [bit] NULL,
	[DirectoryID] [int] NULL,
	[UploadDate] [datetime] NULL,
 CONSTRAINT [PK_WebFile] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WebFileData]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WebFileData](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FileID] [int] NULL,
	[Data] [image] NULL,
 CONSTRAINT [PK_WebFileData] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_WebFileData_FileID] UNIQUE NONCLUSTERED 
(
	[FileID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WebFileUrl]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WebFileUrl](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FileID] [int] NULL,
	[Url] [varchar](255) NULL,
 CONSTRAINT [PK_WebFileUrl] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_WebFileUrl_FileID] UNIQUE NONCLUSTERED 
(
	[FileID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tag]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Tag](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[CatalogID] [int] NULL,
	[ShowOrder] [int] NULL,
	[ViewCount] [int] NULL,
	[CreateDate] [datetime] NULL,
	[UserID] [int] NULL,
	[Flag] [tinyint] NULL,
	[Remark] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TagUrl]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TagUrl](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) NULL,
	[Url] [varchar](255) NULL,
	[TagID] [int] NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_TagUrl] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TagArticle]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TagArticle](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) NULL,
	[Body] [text] NULL,
	[TagID] [int] NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_TagArticle] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WebDirectory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WebDirectory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[ParentID] [int] NULL,
	[UsedSpace] [int] NULL,
	[FileCount] [int] NULL,
	[SubDirCount] [int] NULL,
	[Flag] [tinyint] NULL,
	[UserID] [int] NULL,
	[CreateDate] [datetime] NULL,
	[Remark] [nvarchar](1000) NULL,
 CONSTRAINT [PK_WebDirectory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BlogSkin]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BlogSkin](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[Skin] [varchar](50) NULL,
 CONSTRAINT [PK_BlogSkin] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BlogCatalog]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BlogCatalog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[ParentID] [int] NULL,
	[ShowOrder] [int] NULL,
	[Flag] [tinyint] NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_BlogCatalog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Thread]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Thread](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NULL,
	[Body] [text] NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[UserID] [int] NULL,
	[State] [tinyint] NULL,
 CONSTRAINT [PK_Thread] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[Password] [varchar](255) NULL,
	[Email] [varchar](255) NULL,
	[RoleID] [int] NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_SaveASMailProfile]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_SaveASMailProfile]
(
	@IP varchar(50),
	@Port int
) 
AS

UPDATE
	AjaxSystemConfig
SET
	IP = @IP,
	Port = @Port

RETURN @@ROWCOUNT' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_GetBlogUrlByCatalog]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_GetBlogUrlByCatalog]
(
	@CatalogID int
)
AS

SELECT
	BlogUrl.*,
	BlogCatalog.Name AS CatalogName
FROM
	BlogUrl
INNER JOIN
	BlogCatalog
	ON BlogCatalog.ID = BlogUrl.CatalogID AND CatalogID = @CatalogID
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_GetSingleBlogCatalog]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_GetSingleBlogCatalog]
(
	@ID int
)
AS

SELECT
	BlogCatalog.*
FROM
	BlogCatalog
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_AddBlogCatalog]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_AddBlogCatalog]
(
	@Name varchar(200),
	@ParentID int,
	@UserID int,
	@Flag tinyint
)
AS

DECLARE @ShowOrder int
SET
	@ShowOrder = ISNULL((SELECT COUNT(*) FROM BlogCatalog WHERE ParentID = @ParentID),0)

INSERT INTO
	BlogCatalog
	(Name,ParentID,UserID,Flag,ShowOrder)VALUES(@Name,@ParentID,@UserID,@Flag,@ShowOrder)

RETURN @@Identity' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_UpdateBlogCatalog]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_UpdateBlogCatalog]
(
	@ID int,
	@Name varchar(200),
	@Flag tinyint
)
AS

UPDATE
	BlogCatalog

SET
	Name = @Name,
	Flag = @Flag
	
WHERE
	ID = @ID

RETURN @@ROWCOUNT' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_DeleteBlogCatalog]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_DeleteBlogCatalog]
(
	@ID int
)
AS

DELETE
	BlogCatalog
	
WHERE
	ID = @ID

RETURN @@ROWCOUNT' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_GetBlogUrls]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_GetBlogUrls]

AS

SELECT
	BlogUrl.*,
	BlogCatalog.Name AS CatalogName
FROM
	BlogUrl
INNER JOIN
	BlogCatalog
	ON BlogCatalog.ID = BlogUrl.CatalogID
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_GetBlogArticleUrlByCatalog]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_GetBlogArticleUrlByCatalog]
(
	@CatalogID int
)
AS

SELECT
	BlogArticle.*,
	BlogCatalog.Name AS CatalogName,
	(SELECT COUNT(*) FROM BlogComment WHERE ArticleID = BlogArticle.ID) AS CommentCount
FROM
	BlogArticle
INNER JOIN
	BlogCatalog
	ON BlogCatalog.ID = BlogArticle.CatalogID AND CatalogID = @CatalogID
	
SELECT
	BlogUrl.*,
	BlogCatalog.Name AS CatalogName
FROM
	BlogUrl
INNER JOIN
	BlogCatalog
	ON BlogCatalog.ID = BlogUrl.CatalogID AND CatalogID = @CatalogID
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_GetSingleBlogUrl]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_GetSingleBlogUrl]
(
	@ID int
)
AS

SELECT
	BlogUrl.*,
	BlogCatalog.Name AS CatalogName
FROM
	BlogUrl
INNER JOIN
	BlogCatalog
	ON BlogCatalog.ID = BlogUrl.CatalogID
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_GetBlogCatalogs]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_GetBlogCatalogs] 
	
AS

SELECT 
	BlogCatalog.*,
	(SELECT COUNT(*) FROM BlogArticle WHERE CatalogID = BlogCatalog.ID) AS ArticleCount
FROM
	BlogCatalog
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_GetBlogArticleByCatalog]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_GetBlogArticleByCatalog]
(
	@CatalogID int
)
AS

SELECT
	BlogArticle.*,
	BlogCatalog.Name AS CatalogName,
	(SELECT COUNT(*) FROM BlogComment WHERE ArticleID = BlogArticle.ID) AS CommentCount
FROM
	BlogArticle
INNER JOIN
	BlogCatalog
	ON BlogCatalog.ID = BlogArticle.CatalogID AND CatalogID = @CatalogID
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_GetBlogArticles]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_GetBlogArticles]

AS

SELECT
	BlogArticle.*,
	BlogCatalog.Name AS CatalogName,
	(SELECT COUNT(*) FROM BlogComment WHERE ArticleID = BlogArticle.ID) AS CommentCount
FROM
	BlogArticle
INNER JOIN
	BlogCatalog
	ON BlogCatalog.ID = BlogArticle.CatalogID
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_GetBlogArticleByDate]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_GetBlogArticleByDate]
(
	@Date datetime
)
AS

SELECT
	BlogArticle.*,
	BlogCatalog.Name AS CatalogName,
	(SELECT COUNT(*) FROM BlogComment WHERE ArticleID = BlogArticle.ID) AS CommentCount
FROM
	BlogArticle
INNER JOIN
	BlogCatalog
	ON BlogCatalog.ID = BlogArticle.CatalogID
	AND DATEDIFF(yyyy,CreateDate,@Date) = 0
	AND DATEDIFF(MM,CreateDate,@Date) = 0
	AND DATEDIFF(dd,CreateDate,@Date) = 0
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_GetSingleBlogArticle]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_GetSingleBlogArticle]
(
	@ID int
)
AS

SELECT
	BlogArticle.*,
	[User].UserName,
	(SELECT COUNT(*) FROM BlogComment WHERE ArticleID = BlogArticle.ID) AS CommentCount
FROM
	BlogArticle
INNER JOIN
	BlogCatalog
	ON BlogCatalog.ID = BlogArticle.CatalogID
INNER JOIN
	[User]
	ON [User].ID = BlogCatalog.UserID

WHERE
	BlogArticle.ID = @ID
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_UpdateRSSUrl]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_UpdateRSSUrl]
(
	@ID int,
	@Name varchar(200),
	@Url varchar(255)
)

AS
	
UPDATE
	RSSUrl
SET
	Name = @Name,
	Url = @Url
	
WHERE
	ID = @ID

RETURN @@ROWCOUNT
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_AddRSSUrl]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_AddRSSUrl]
(
	@Name varchar(200),
	@Url varchar(255)
)

AS
	
INSERT INTO
	RSSUrl
	(Name,Url,CreateDate)VALUES(@Name,@Url,GETDATE())

RETURN @@Identity
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_GetRSSUrls]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_GetRSSUrls] 

AS
	
SELECT
	*
FROM
	RSSUrl

ORDER BY
	CreateDate DESC
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_GetSingleRSSUrl]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_GetSingleRSSUrl]
(
	@ID int
)

AS
	
SELECT
	*
FROM
	RSSUrl
WHERE
	ID = @ID
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_DeleteRSSUrl]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_DeleteRSSUrl]
(
	@ID int
)

AS
	
DELETE
	RSSUrl
WHERE
	ID = @ID

RETURN @@ROWCOUNT
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_AddBlogUrl]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_AddBlogUrl]
(
	@Name varchar(200),
	@Url varchar(255),
	@CatalogID int
)

AS

INSERT INTO
	BlogUrl
	(Name,Url,CatalogID,CreateDate)VALUES(@Name,@Url,@CatalogID,GETDATE())

RETURN @@Identity
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_UpdateBlogUrl]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_UpdateBlogUrl]
(
	@ID int,
	@Name varchar(200),
	@Url varchar(255)
)

AS

UPDATE
	BlogUrl
SET
	Name = @Name,
	Url = @Url

WHERE
	ID = @ID

RETURN @@ROWCOUNT
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_DeleteBlogUrl]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_DeleteBlogUrl]
(
	@ID int
)

AS

DELETE
	BlogUrl

WHERE
	ID = @ID

RETURN @@ROWCOUNT
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_DeleteBlogArticle]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_DeleteBlogArticle]
(
	@ID int
)

AS

DELETE
	BlogArticle

WHERE
	ID = @ID

RETURN @@ROWCOUNT
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_UpdateBlogArticle]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_UpdateBlogArticle]
(
	@ID int,
	@Name varchar(200),
	@Body text,
	@Flag tinyint
)

AS

UPDATE
	BlogArticle
SET
	Name = @Name,
	Body = @Body,
	Flag = @Flag

WHERE
	ID = @ID

RETURN @@ROWCOUNT
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_AddBlogArticle]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_AddBlogArticle]
(
	@Name varchar(200),
	@Body text,
	@Flag tinyint,
	@CatalogID int
)

AS

INSERT INTO
	BlogArticle
	(Name,Body,Flag,CatalogID,CreateDate)VALUES(@Name,@Body,@Flag,@CatalogID,GETDATE())

RETURN @@Identity
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_GetBlogSourceByArticle]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_GetBlogSourceByArticle]
(
	@ArticleID int
)
AS

SELECT
	BlogArticleSource.*,
	BlogArticle.Name AS ArticleName
FROM
	BlogArticleSource
INNER JOIN
	BlogArticle
	ON BlogArticle.ID = BlogArticleSource.ArticleID
WHERE
	BlogArticleSource.ArticleID = @ArticleID
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_GetBlogCommentByArticle]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_GetBlogCommentByArticle]
(
	@ArticleID int
)
AS

SELECT 
	BlogComment.*,
	[User].UserName,
	BlogArticle.Name AS ArticleName
FROM
	BlogComment
INNER JOIN
	[User]
	ON [User].ID = BlogComment.UserID
INNER JOIN
	[BlogArticle]
	ON [BlogArticle].ID = BlogComment.ArticleID
WHERE
	BlogComment.ArticleID = @ArticleID
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_GetBlogArticleSources]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_GetBlogArticleSources]

AS

SELECT
	BlogArticleSource.*,
	BlogArticle.Name AS ArticleName
FROM
	BlogArticleSource
INNER JOIN
	BlogArticle
	ON BlogArticle.ID = BlogArticleSource.ArticleID
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_GetSingleBlogComment]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_GetSingleBlogComment]
(
	@ID int
)
AS

SELECT
	BlogComment.*,
	BlogArticle.Name AS ArticleName,
	[User].UserName
FROM
	BlogComment
INNER JOIN
	BlogArticle
	ON BlogArticle.ID = BlogComment.ArticleID
INNER JOIN
	[User]
	ON [User].ID = BlogComment.UserID

WHERE
	BlogComment.ID = @ID
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_GetBlogSkinByUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_GetBlogSkinByUser]
(
	@UserID int
)

AS

SELECT
	*
FROM
	BlogSkin
WHERE
	UserID = @UserID
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_AddBlogSkin]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_AddBlogSkin]
(
	@UserID int,
	@Skin varchar(50)
)

AS

DECLARE @Count int
SET @Count = ISNULL((SELECT COUNT(*) FROM BlogSKin WHERE UserID = @UserID),0)

IF @Count > 0
BEGIN
	UPDATE
		BlogSkin
	SET
		Skin =@SKin
	WHERE
		UserID = @UserID
		
	SET @Count = @@ROWCOUNT
END
ELSE
BEGIN
	INSERT INTO
		BlogSkin
		(UserID,Skin)VALUES(@UserID,@Skin)
		
	SET @Count = @@Identity
END

RETURN @Count
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_DeleteBlogArticleSource]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_DeleteBlogArticleSource]
(
	@ID int
)

AS

DELETE
	BlogArticleSource

WHERE
	ID = @ID

RETURN @@ROWCOUNT
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_AddBlogArticleSourcee]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_AddBlogArticleSourcee]
(
	@Url varchar(255),
	@IPAddress varchar(20),
	@ArticleID int
)

AS

INSERT INTO
	BlogArticleSource
	(Url,IPAddress,ArticleID,CreateDate)VALUES(@Url,@IPAddress,@ArticleID,GETDATE())

RETURN @@Identity
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_DeleteBlogComment]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_DeleteBlogComment]
(
	@ID int
)
AS

DELETE
	BlogComment

WHERE
	BlogComment.ID = @ID

RETURN @@ROWCOUNT
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_AddBlogComment]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_AddBlogComment]
(
	@Name varchar(200),
	@Body text,
	@UserID int,
	@ArticleID int
)
AS

INSERT INTO
	BlogComment
	(Name,Body,UserID,ArticleID,CreateDate)VALUES(@Name,@Body,@UserID,@ArticleID,GETDATE())

RETURN @@Identity' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_GetFileByDirectory]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_GetFileByDirectory]
(
	@DirectoryID int
)
AS

SELECT
	WebFile.*,
	WebFileUrl.ID AS WebFileUrlID,
	WebFileUrl.Url,
	WebFileData.ID AS WebFileDataID, 
	WebFileData.Data
		
FROM WebFile 
LEFT OUTER JOIN
	WebFileUrl ON WebFile.ID = WebFileUrl.FileID
LEFT JOIN WebFileData ON WebFile.ID = WebFileData.FileID
	
WHERE
	WebFile.DirectoryID = @DirectoryID
	
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_DeleteFile]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_DeleteFile]
(
	@ID int
)
AS

DECLARE @Count int
DECLARE @DirectoryID int

BEGIN TRAN
	DELETE
		WebFileData
	WHERE
		FileID = @ID
	
	DELETE
		WebFileUrl
	WHERE
		FileID = @ID
	
	SET @DirectoryID = (SELECT DirectoryID FROM WebFile WHERE ID = @ID)	
	DELETE
		WebFile
	WHERE
		ID = @ID
		
	UPDATE Directory
	SET	FileCount = FileCount -1
	WHERE ID = @DirectoryID
	
	SET @Count = ISNULL(@@ROWCOUNT,0)
COMMIT TRAN
RETURN @Count' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[View1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[View1]
AS
SELECT dbo.WebFile.ID, dbo.WebFile.Name, dbo.WebFile.Type, dbo.WebFile.Size, 
      dbo.WebFile.Flag, dbo.WebFile.DirectoryID, dbo.WebFile.UploadDate, 
      dbo.WebFileData.FileID, dbo.WebFileData.Data, dbo.WebFileUrl.Url
FROM dbo.WebFile LEFT OUTER JOIN
      dbo.WebFileUrl ON dbo.WebFile.ID = dbo.WebFileUrl.FileID LEFT OUTER JOIN
      dbo.WebFileData ON dbo.WebFile.ID = dbo.WebFileData.FileID
' 
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "WebFile"
            Begin Extent = 
               Top = 59
               Left = 208
               Bottom = 169
               Right = 355
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "WebFileUrl"
            Begin Extent = 
               Top = 6
               Left = 396
               Bottom = 102
               Right = 531
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "WebFileData"
            Begin Extent = 
               Top = 55
               Left = 36
               Bottom = 151
               Right = 171
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'VIEW', @level1name=N'View1'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'VIEW', @level1name=N'View1'

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_GetFiles]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_GetFiles]

AS

SELECT
	WebFile.*,
	WebFileUrl.ID AS WebFileUrlID,
	WebFileUrl.Url,
	WebFileData.ID AS WebFileDataID, 
	WebFileData.Data		
FROM
	WebFile 
LEFT OUTER JOIN
	WebFileUrl
	ON 
	WebFile.ID = WebFileUrl.FileID
LEFT JOIN WebFileData
	 ON 
	 WebFile.ID = WebFileData.FileID

	
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_AddFileData]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_AddFileData]
(
	@Name varchar(50),
	@Type varchar(50),
	@Size int,
	@DirectoryID int,
	@Data image
)
AS

DECLARE @FileID int

BEGIN TRAN
INSERT WebFile
	(Name,Type,Size,Flag,DirectoryID,UploadDate)
	VALUES
	(@Name,@Type,@Size,1,@DirectoryID,GETDATE())
SET 
	@FileID = ISNULL(@@Identity,-1)
IF @FileID > 0
BEGIN
	
	UPDATE WebDirectory
	SET 
		FileCount = FileCount + 1,
		UsedSpace = UsedSpace + @Size
	WHERE
		ID = @DirectoryID
	
	INSERT WebFileData
		(FileID,Data)
		VALUES
		(@FileID,@Data)
END
COMMIT TRAN
RETURN @FileID
	
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_GetSingleFile]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_GetSingleFile]
(
	@ID int
)
AS

SELECT
	WebFile.*,
	WebFileData.ID AS WebFileDataID, 
	WebFileData.Data,
	WebFileUrl.ID AS WebFileUrlID,
	WebFileUrl.Url
FROM
	WebFile
LEFT JOIN
	WebFileData
	ON
	WebFile.ID = WebFileData.FileID
LEFT JOIN
	WebFileUrl
	ON
	WebFile.ID = WebFileUrl.FileID
WHERE
	WebFile.ID = @ID' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_AddFileUrl]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_AddFileUrl]
(
	@Name varchar(50),
	@Type varchar(50),
	@Size int,
	@DirectoryID int,
	@Url varchar(255)
)
AS

DECLARE @FileID int

BEGIN TRAN
INSERT WebFile
	(Name,Type,Size,Flag,DirectoryID,UploadDate)
	VALUES
	(@Name,@Type,@Size,0,@DirectoryID,GETDATE())
SET 
	@FileID = ISNULL(@@Identity,-1)
IF @FileID > 0
BEGIN
	
	UPDATE WebDirectory
	SET 
		FileCount = FileCount + 1,
		UsedSpace = UsedSpace + @Size
	WHERE
		ID = @DirectoryID
		
	INSERT WebFileUrl
		(FileID,Url)
		VALUES
		(@FileID,@Url)
END
COMMIT TRAN
RETURN @FileID
	
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_GetDirectoryAndFile]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_GetDirectoryAndFile]
(
	@DirectoryID int
)
AS

SELECT
	WebDirectory.ID AS ID,
	WebDirectory.Name AS Name,
	WebDirectory.ParentID AS ParentID,
	WebDirectory.UsedSpace AS Contain,
	WebDirectory.FileCount AS FileCount,
	WebDirectory.SubDirCount AS SubDirCount,
	WebDirectory.Flag AS Flag,
	''dir'' AS Type,
	WebDirectory.CreateDate AS CreateDate,	
	''url'' AS Url
FROM
	WebDirectory
WHERE
	ParentID = @DirectoryID
UNION
SELECT
	WebFile.ID AS ID,
	WebFile.Name AS Name,
	WebFile.DirectoryID AS ParentID,
	WebFile.Size AS Contain,
	0 AS FileCount,
	0 AS SubDirCount,
	WebFile.Flag + 1 AS Flag,
	WebFile.Type AS Type,
	WebFile.UploadDate AS CreateDate,
	WebFileUrl.Url
FROM
	WebFile
LEFT OUTER JOIN
	WebFileUrl
	ON
	WebFile.ID = WebFileUrl.FileID
WHERE
	DirectoryID = @DirectoryID' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_GetMailsByFilter]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_GetMailsByFilter]
(
	@Filter varchar(255),
	@Flag varchar(10)
)
AS

IF @Flag = ''0''
BEGIN
	SELECT
		*
	FROM
		AjaxMail
				
	WHERE
		(Name LIKE ''%'' + @Filter + ''%'') OR (Body LIKE ''%'' + @Filter + ''%'')
		
	ORDER BY
		CreateDate DESC
END
ELSE
BEGIN
	IF @Flag = ''1''
	BEGIN
		SELECT
			*
		FROM
			AjaxMail
					
		WHERE
			DATEDIFF(year,CreateDate,CAST(@Filter AS DATETIME)) = 0 
			AND DATEDIFF(month,CreateDate,CAST(@Filter AS DATETIME)) = 0 
			AND DATEDIFF(day,CreateDate,CAST(@Filter AS DATETIME)) = 0
					
		ORDER BY
			CreateDate DESC
	END
	ELSE
		BEGIN
			IF @Flag = ''2''
			BEGIN
				DECLARE @Address varchar(255)
				SET @Address = (SELECT Email FROM [User] WHERE Username = @Filter)
				
				SELECT
					*
				FROM
					AjaxMail
							
				WHERE
					(FromAddress LIKE ''%'' + @Address + ''%'') OR (TOAddress LIKE ''%'' + @Address + ''%'') OR (CCAddress LIKE ''%'' + @Address + ''%'') 					
							
				ORDER BY
					CreateDate DESC
			END
		END	
END
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_DeleteAjaxMail]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_DeleteAjaxMail]
(
	@ID int 
)
AS

DELETE
	AjaxMail
WHERE
	ID = @ID

RETURN @@ROWCOUNT' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_GetAjaxMails]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_GetAjaxMails]
	
AS

SELECT
	*
FROM
	AjaxMail
ORDER BY
	CreateDate DESC
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_GetAjaxMailByFolder]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_GetAjaxMailByFolder]
(
	@FolderID int
)
AS

SELECT
	*
FROM
	AjaxMail
WHERE
	FolderID = @FolderID
ORDER BY
	CreateDate DESC
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_GetSingleAjaxMail]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_GetSingleAjaxMail]
(
	@ID int
)
AS

SELECT
	*
FROM
	AjaxMail
WHERE
	ID = @ID

' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_AddAjaxMail]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_AddAjaxMail]
(
	@Name varchar(200),
	@Body text,
	@From varchar(200),
	@CC varchar(500),
	@TO varchar(500),
	@ISHTMLFormat bit,
	@Size int,
	@AttachmentFlag tinyint
)
AS

INSERT INTO
	AjaxMail
	(Name,Body,FromAddress,TOAddress,CCAddress,ISHTMLFormat,Size,CreateDate,
		ISNew,AttachmentFlag,FolderID)
	VALUES
	(@Name,@Body,@From,@TO,@CC,@ISHTMLFormat,@Size,GETDATE(),
		1,@AttachmentFlag,2)
		
RETURN @@Identity

' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_AddAjaxMailAttachment]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_AddAjaxMailAttachment]
(
	@Name varchar(200),
	@Url varchar(255),
	@Type varchar(200),
	@Size int,
	@MailID int 
)
AS

INSERT INTO
	AjaxAttachment
	(Name,Url,Type,Size,MailID)
	VALUES
	(@Name,@Url,@Type,@Size,@MailID)

RETURN @@Identity' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_GetAttachmentsByMail]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_GetAttachmentsByMail]
(
	@MailID int
)
AS

SELECT
	*
FROM
	AjaxAttachment
WHERE
	MailID = @MailID
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_DeleteTag]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_DeleteTag] 
(
	@ID int
)
AS

DELETE
	AjaxTag
WHERE
	ID = @ID
	 
RETURN @@ROWCOUNT
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_UpdateAjaxTag]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_UpdateAjaxTag] 
(
	@ID int,
	@Name varchar(50)
)
AS

DECLARE @Count int
SET	@Count = ISNULL((SELECT COUNT(*) FROM AjaxTag WHERE Name = @Name),0)

IF @Count <= 0
BEGIN
	UPDATE
		AjaxTag
	SET
		Name = @Name
	WHERE
		ID = @ID
	
	RETURN @@ROWCOUNT
END
ELSE
	RETURN @Count

			
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_AddAjaxTag]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_AddAjaxTag] 
(
	@Name varchar(50)
)
AS

DECLARE @Count int
SET	@Count = ISNULL((SELECT COUNT(*) FROM AjaxTag WHERE Name = @Name),0)

IF @Count <= 0
BEGIN
	INSERT INTO
		AjaxTag
		(Name,CreateDate)
		VALUES
		(@Name,GETDATE())
	
	RETURN @@Identity
END
ELSE
	RETURN @Count

			
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_DeleteAjaxTag]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_DeleteAjaxTag] 
(
	@ID int
)
AS

DELETE
	AjaxTag
WHERE
	ID = @ID
	 
RETURN @@ROWCOUNT
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_GetSingleAjaxTag]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_GetSingleAjaxTag]
(
	@ID int
)
AS

SELECT
	*
FROM
	AjaxTag
WHERE
	ID = @ID
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_GetAjaxTags]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_GetAjaxTags]

AS

SELECT
	AjaxTag.*,(SELECT COUNT(*) FROM AjaxTagMail WHERE AjaxTagMail.TagID = AjaxTag.ID) AS MailCount
FROM
	AjaxTag
ORDER BY CreateDate DESC

' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_AddAjaxMailTag]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_AddAjaxMailTag]
(
	@MailID int,
	@TagID int
)

AS

DECLARE @Count int
SET @Count = ISNULL((SELECT COUNT(*) FROM AjaxTagMail WHERE MailID = @MailID AND TagID = @TagID),-1)

IF @Count <= 0
BEGIN
	INSERT INTO
		AjaxTagMail
		(MailID,TagID)VALUES(@MailID,@TagID)
	
	SET @Count = @@ROWCOUNT
END

RETURN @Count' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_GetAjaxLinkmanByKey]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_GetAjaxLinkmanByKey]
(
	@Key varchar(255)
)
AS

SELECT
	AjaxLinkman.*,AjaxGroup.Name AS GroupName
FROM
	AjaxLinkman
INNER JOIN
	AjaxGroup ON AjaxGroup.ID = AjaxLinkman.GroupID
WHERE
	AjaxLinkman.Name LIKE ''%'' + @Key + ''%''' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_UpdateAjaxGroup]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_UpdateAjaxGroup]
(
	@ID int,
	@Name varchar(50)
)
AS

DECLARE @Count int
SET	@Count = ISNULL((SELECT COUNT(*) FROM AjaxGroup WHERE Name = @Name),0)

IF @Count <= 0
BEGIN
	UPDATE
		AjaxGroup
	SET
		Name = @Name
	WHERE
		ID = @ID
	
	RETURN @@ROWCOUNT
END
ELSE
	RETURN @Count

			
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_GetAjaxLinkmanByGroup]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_GetAjaxLinkmanByGroup]
(
	@GroupID int
)
AS

SELECT
	AjaxLinkman.*,AjaxGroup.Name AS GroupName
FROM
	AjaxLinkman
INNER JOIN
	AjaxGroup
	ON AjaxLinkman.GroupID = AjaxGroup.ID
WHERE
	GroupID = @GroupID
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_AddAjaxGroup]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_AddAjaxGroup]
(
	@Name varchar(50)
)
AS
DECLARE @Count int
SET	@Count = ISNULL((SELECT COUNT(*) FROM AjaxGroup WHERE Name = @Name),0)

IF @Count <= 0
BEGIN
	INSERT INTO
		AjaxGroup
		(Name)
		VALUES
		(@Name)
	
	RETURN @@Identity
END
ELSE
	RETURN @Count
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_DeleteAjaxGroup]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_DeleteAjaxGroup]
(
	@ID int
)
AS

DELETE
	AjaxGroup
WHERE
	ID = @ID
	 
RETURN @@ROWCOUNT
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_GetAjaxGroups]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_GetAjaxGroups]

AS

SELECT
	AjaxGroup.*,(SELECT COUNT(*) FROM AjaxLinkman WHERE AjaxLinkman.GroupID = AjaxGroup.ID) AS LinkmanCount
FROM
	AjaxGroup

' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_GetSingleAjaxGroup]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_GetSingleAjaxGroup]
(
	@ID int
)
AS

SELECT
	*
FROM
	AjaxGroup
WHERE
	ID = @ID
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_GetSingleAjaxLinkman]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_GetSingleAjaxLinkman]
(
	@ID int
)
AS

SELECT
	*
FROM
	AjaxLinkman
WHERE
	ID = @ID
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_AddAjaxLinkman]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_AddAjaxLinkman]
(
	@Name varchar(50),
	@Email varchar(255),
	@GroupID int
)
AS

INSERT INTO
	AjaxLinkman
	(Name,Email,GroupID)
	VALUES
	(@Name,@Email,@GroupID)
	
RETURN @@Identity
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_UpdateAjaxLinkman]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_UpdateAjaxLinkman]
(
	@ID int,
	@Name varchar(50),
	@Email varchar(255)
)
AS

UPDATE 
	AjaxLinkman
SET
	Name = @Name,
	Email = @Email
WHERE
	ID = @ID
	
RETURN @@ROWCOUNT
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_MoveAjaxLinkman]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_MoveAjaxLinkman]
(
	@ID int,
	@GroupID int
)
AS

UPDATE 
	AjaxLinkman
SET
	GroupID = @GroupID
WHERE
	ID = @ID
	
RETURN @@ROWCOUNT
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_DeleteAjaxLinkman]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_DeleteAjaxLinkman]
(
	@ID int
)
AS

DELETE
	AjaxLinkman
WHERE
	ID = @ID
	 
RETURN @@ROWCOUNT
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_GetAjaxFilters]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_GetAjaxFilters]
	
AS

SELECT
	*
FROM
	AjaxFilter
	
ORDER BY
	Flag
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_GetSingleAjaxFilter]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_GetSingleAjaxFilter]
(
	@ID int
)	
AS

SELECT
	*
FROM
	AjaxFilter
	
WHERE
	ID = @ID
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_AddAjaxFilter]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_AddAjaxFilter]
(
	@Key varchar(255),
	@Flag tinyint
)	
AS

INSERT INTO
	AjaxFilter
	([Key],Flag)VALUES(@Key,@Flag)

RETURN @@Identity
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_UpdateAjaxFilter]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_UpdateAjaxFilter]
(
	@ID int,
	@Key varchar(255)
)	
AS

UPDATE
	AjaxFilter
SET
	[Key] = @Key
WHERE
	ID = @ID
	
RETURN @@ROWCOUNT
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_DeleteAjaxFilter]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_DeleteAjaxFilter]
(
	@ID int
)	
AS

DELETE
	AjaxFilter
WHERE
	ID = @ID
	
RETURN @@ROWCOUNT
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_AddDirectory]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_AddDirectory]
(
	@Name varchar(50),
	@ParentID int,
	@UserID int,
	@Remark nvarchar(1000)
)
AS
	
DECLARE @Count int
SET
	@Count = ISNULL((SELECT COUNT(*) FROM WebDirectory WHERE Name = @Name AND ParentID = @ParentID),0)
IF @Count <= 0
BEGIN
	INSERT WebDirectory
		(Name,ParentID,UsedSpace,FileCount,Flag,UserID,CreateDate,Remark)
		VALUES
		(@Name,@ParentID,0,0,0,@UserID,GETDATE(),@Remark)
	
	UPDATE WebDirectory
	SET SubDirCount = SubDirCount + 1
	WHERE ParentID = @ParentID
	
	RETURN @@Identity
END
ELSE
BEGIN
	RETURN @Count
END
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_DeleteTagCatalog]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_DeleteTagCatalog]
(
	@ID int
)
AS

DELETE
	TagCatalog
WHERE
	ID = @ID
	 
RETURN @@ROWCOUNT
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_AddTagCatalog]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_AddTagCatalog]
(
	@Name varchar(50)
)
AS

INSERT INTO
	TagCatalog
	(Name)
	VALUES
	(@Name)

RETURN @@Identity
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_GetSingleTagCatalog]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_GetSingleTagCatalog]
(
	@ID int
)
AS

SELECT
	*
FROM
	TagCatalog
WHERE
	ID = @ID
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_UpdateTagCatalog]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_UpdateTagCatalog]
(
	@ID int,
	@Name varchar(50)
)
AS

UPDATE
	TagCatalog
SET
	Name = @Name
WHERE
	ID = @ID
	
RETURN @@ROWCOUNT

			
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_GetCatalogs]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_GetCatalogs]

AS

SELECT
	*
FROM
	TagCatalog

' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_GetTags]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_GetTags]

AS

SELECT
	Tag.*,
	TagCatalog.Name + ''/'' + Tag.Name AS Name,
	TagCatalog.Name AS CatalogName
FROM
	Tag
INNER JOIN
	TagCatalog
	ON
	Tag.CatalogID = TagCatalog.ID

' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[ViewTag]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[ViewTag]
AS
SELECT dbo.TagCatalog.ID, dbo.TagCatalog.Name, dbo.Tag.ID AS TagID, 
      dbo.Tag.Name AS TagName, dbo.Tag.ShowOrder, dbo.TagArticle.ID AS ArticleID, 
      dbo.TagArticle.Name AS ArticleName, dbo.TagArticle.Body, dbo.TagArticle.CreateDate, 
      dbo.TagUrl.ID AS UrlID, dbo.TagUrl.Name AS UrlName, dbo.TagUrl.Url, 
      dbo.TagUrl.CreateDate AS UrlCreateDate
FROM dbo.Tag INNER JOIN
      dbo.TagArticle ON dbo.Tag.ID = dbo.TagArticle.TagID INNER JOIN
      dbo.TagCatalog ON dbo.Tag.CatalogID = dbo.TagCatalog.ID INNER JOIN
      dbo.TagUrl ON dbo.Tag.ID = dbo.TagUrl.TagID
' 
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[30] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 8
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Tag"
            Begin Extent = 
               Top = 47
               Left = 171
               Bottom = 157
               Right = 312
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TagArticle"
            Begin Extent = 
               Top = 20
               Left = 363
               Bottom = 187
               Right = 504
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TagCatalog"
            Begin Extent = 
               Top = 0
               Left = 8
               Bottom = 82
               Right = 143
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TagUrl"
            Begin Extent = 
               Top = 170
               Left = 394
               Bottom = 297
               Right = 535
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      PaneHidden = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 1800
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'VIEW', @level1name=N'ViewTag'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'VIEW', @level1name=N'ViewTag'

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_UpdateTagUrl]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_UpdateTagUrl]
(
	@ID int,
	@Name varchar(50),
	@Url varchar(255)
)
AS

UPDATE
	TagUrl
SET
	Name = @Name,
	Url = @Url
WHERE
	ID = @ID
	
RETURN @@ROWCOUNT

			
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_GetUrls]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_GetUrls]

AS

SELECT
	TagUrl.*,
	Tag.Name AS TagName
FROM
	TagUrl
INNER JOIN
	Tag
	ON Tag.ID = TagUrl.TagID
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_GetArticleUrlByTag]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_GetArticleUrlByTag]
(
	@TagID int
)
AS

(SELECT
	TagArticle.ID,
	TagArticle.Name,
	'''' AS Url,
	TagArticle.CreateDate,
	TagArticle.TagID,
	0 AS Flag
FROM
	TagArticle
WHERE
	TagID = @TagID
)
UNION
(SELECT
	TagUrl.ID,
	TagUrl.Name,
	TagUrl.Url,
	TagUrl.CreateDate,
	TagUrl.TagID,
	1 AS Flag
FROM
	TagUrl
WHERE
	TagID = @TagID
)
ORDER BY CreateDate DESC' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_GetUrlByTag]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_GetUrlByTag]
(
	@TagID int
)
AS

SELECT
	*
FROM
	TagUrl
WHERE
	TagID = @TagID
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_DeleteTagUrl]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_DeleteTagUrl]
(
	@ID int
)
AS

DELETE
	TagUrl
WHERE
	ID = @ID
	 
RETURN @@ROWCOUNT
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_GetSingleTagUrl]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_GetSingleTagUrl]
(
	@ID int
)
AS

SELECT
	*
FROM
	TagUrl
WHERE
	ID = @ID
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_AddTagUrl]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_AddTagUrl]
(
	@Name varchar(50),
	@Url varchar(255),
	@TagID int
)
AS

INSERT INTO
	TagUrl
	(Name,Url,TagID,CreateDate)
	VALUES
	(@Name,@Url,@TagID,GETDATE())

RETURN @@Identity
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_AddTagArticle]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_AddTagArticle]
(
	@Name varchar(50),
	@Body text,
	@TagID int
)
AS

INSERT INTO
	TagArticle
	(Name,Body,TagID,CreateDate)
	VALUES
	(@Name,@Body,@TagID,GETDATE())

RETURN @@Identity
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_DeleteTagArticle]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_DeleteTagArticle]
(
	@ID int
)
AS

DELETE
	TagArticle
WHERE
	ID = @ID
	 
RETURN @@ROWCOUNT
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_GetSingleTagArticle]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_GetSingleTagArticle]
(
	@ID int
)
AS

SELECT
	*
FROM
	TagArticle
WHERE
	ID = @ID
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_GetArticleByTag]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_GetArticleByTag]
(
	@TagID int
)
AS

SELECT
	*
FROM
	TagArticle
WHERE
	TagID = @TagID
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_UpdateTagArticle]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_UpdateTagArticle]
(
	@ID int,
	@Name varchar(50),
	@Body text
)
AS

UPDATE
	TagArticle
SET
	Name = @Name,
	Body = @Body
WHERE
	ID = @ID
	
RETURN @@ROWCOUNT

			
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_GetArticles]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_GetArticles]

AS

SELECT
	TagArticle.*,
	Tag.Name AS TagName
FROM
	TagArticle
INNER JOIN
	Tag
	ON Tag.ID = TagArticle.TagID
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_GetTagByKey]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_GetTagByKey]
(
	@Key varchar(20)
)
AS

SELECT
	*
FROM
	Tag
WHERE
	Name LIKE ''%'' + @Key + ''%''

			
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_MoveTag]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_MoveTag]
(
	@ID int,
	@CatalogID int
)
AS

UPDATE
	Tag
SET
	CatalogID = @CatalogID
WHERE
	ID = @ID
	
RETURN @@ROWCOUNT

			
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_UpdateTag]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_UpdateTag] 
(
	@ID int,
	@Name varchar(50),
	@Flag tinyint,
	@Remark nvarchar(1000)
)
AS

DECLARE @Count int
DECLARE @CatalogID int
SET	@CatalogID = (SELECT CatalogID FROM Tag WHERE ID = @ID)
SET	@Count = ISNULL((SELECT COUNT(*) FROM Tag WHERE CatalogID = @CatalogID AND Name = @Name),0)

IF @Count <= 0
BEGIN
	UPDATE
		Tag
	SET
		Name = @Name,
		Flag = @Flag,
		Remark = @Remark
	WHERE
		ID = @ID
	
	RETURN @@ROWCOUNT
END
ELSE
	RETURN @Count

			
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_UpdateTagViewCount]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_UpdateTagViewCount] 
(
	@ID int,
	@ViewCount int
)
AS

UPDATE
	Tag
SET
	ViewCount = @ViewCount
WHERE
	ID = @ID
	
RETURN @@ROWCOUNT

			
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_GetTagByCatalog]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_GetTagByCatalog]
(
	@CatalogID int
)
AS

SELECT
	*
FROM
	Tag
WHERE
	CatalogID = @CatalogID

' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_GetSingleTag]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_GetSingleTag]
(
	@ID int
)
AS

SELECT
	*
FROM
	Tag
WHERE
	ID = @ID
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_AddTag]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_AddTag] 
(
	@Name varchar(50),
	@CatalogID int,
	@UserID int,
	@Flag tinyint,
	@Remark nvarchar(1000)
)
AS

DECLARE @Count int
DECLARE @ShowOrder int
SET	@Count = ISNULL((SELECT COUNT(*) FROM Tag WHERE CatalogID = @CatalogID AND Name = @Name),0)
SET	@ShowOrder = ISNULL((SELECT COUNT(*) FROM Tag WHERE CatalogID = @CatalogID),1)

IF @Count <= 0
BEGIN
	INSERT INTO
		Tag
		(Name,CatalogID,ShowOrder,ViewCount,CreateDate,UserID,Flag,Remark)
		VALUES
		(@Name,@CatalogID,@ShowOrder + 1,0,GETDATE(),@UserID,@Flag,@Remark)
	
	RETURN @@Identity
END
ELSE
	RETURN @Count

			
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_CheckUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_CheckUser]
(
	@UserName varchar(50)
)
AS

SELECT
	COUNT(*) 
FROM
	[User]
WHERE
	UserName = @UserName
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_GetSingleUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_GetSingleUser]
(
	@ID int
)
AS

SELECT
	*
FROM
	[User]
WHERE
	ID = @ID
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_DeleteUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_DeleteUser]
(
	@ID int
)
AS

DELETE
	[User]
WHERE
	ID = @ID

RETURN @@ROWCOUNT
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_GetUsers]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_GetUsers]

AS

SELECT
	[User].*,Role.RoleName
FROM
	[User]
INNER JOIN Role
	ON
	[User].RoleID = Role.ID
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_AddUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_AddUser]
(
	@UserName varchar(50),
	@Password varchar(255),
	@Email varchar(255),
	@RoleID int
)
AS

INSERT INTO
	[User]
	(UserName,Password,Email,RoleID,CreateDate)
	VALUES
	(@UserName,@Password,@Email,@RoleID,GetDate())

RETURN @@Identity' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_UpdateUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_UpdateUser]
(
	@ID int,
	@Email varchar(255)
)
AS

UPDATE
	[User]
SET
	Email = @Email
WHERE
	ID = @ID

RETURN @@ROWCOUNT
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_UpdateUserPwd]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_UpdateUserPwd]
(
	@ID int,
	@Password varchar(255)
)
AS

UPDATE
	[User]
SET
	Password = @Password
WHERE
	ID = @ID
	
RETURN @@ROWCOUNT
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_UpdateUserRole]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_UpdateUserRole]
(
	@ID int,
	@RoleID int
)
AS

UPDATE
	[User]
SET
	RoleID = @RoleID
WHERE
	ID = @ID

RETURN @@ROWCOUNT
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_GetUserLogin]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_GetUserLogin]
(
    @UserName varchar(50),
    @Password varchar(255)
)
AS

SELECT
     ID	

FROM
     [User]
     
WHERE
     UserName = @UserName AND Password = @Password
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_GetRoles]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_GetRoles]
(
	@ProjectID int
)
AS

SELECT
	*
FROM
	Role
WHERE
	ProjectID = @ProjectID
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_DeleteRole]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_DeleteRole]
(
	@ID int
)
AS

DELETE
	Role
WHERE
	ID = @ID

RETURN @@ROWCOUNT
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_GetSingleRole]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_GetSingleRole]
(
	@ID int
)
AS

SELECT
	*
FROM
	Role
WHERE
	ID = @ID' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_AddRole]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_AddRole]
(
	@RoleName varchar(50),
	@ProjectID int
)
AS

INSERT INTO
	Role
	(RoleName,ProjectID)VALUES(@RoleName,@ProjectID)
	
RETURN @@Identity' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_UpdateRole]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_UpdateRole]
(
	@ID int,
	@RoleName varchar(50)
)
AS

UPDATE
	Role
SET
	RoleName = @RoleName
WHERE
	ID = @ID

RETURN @@ROWCOUNT
' 
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Role_Project]') AND parent_object_id = OBJECT_ID(N'[dbo].[Role]'))
ALTER TABLE [dbo].[Role]  WITH CHECK ADD  CONSTRAINT [FK_Role_Project] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Project] ([ID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserState_Project]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserState]'))
ALTER TABLE [dbo].[UserState]  WITH CHECK ADD  CONSTRAINT [FK_UserState_Project] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Project] ([ID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserState_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserState]'))
ALTER TABLE [dbo].[UserState]  WITH CHECK ADD  CONSTRAINT [FK_UserState_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BlogUrl_BlogCatalog]') AND parent_object_id = OBJECT_ID(N'[dbo].[BlogUrl]'))
ALTER TABLE [dbo].[BlogUrl]  WITH CHECK ADD  CONSTRAINT [FK_BlogUrl_BlogCatalog] FOREIGN KEY([CatalogID])
REFERENCES [dbo].[BlogCatalog] ([ID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BlogArticle_BlogCatalog]') AND parent_object_id = OBJECT_ID(N'[dbo].[BlogArticle]'))
ALTER TABLE [dbo].[BlogArticle]  WITH CHECK ADD  CONSTRAINT [FK_BlogArticle_BlogCatalog] FOREIGN KEY([CatalogID])
REFERENCES [dbo].[BlogCatalog] ([ID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Reply_Thread]') AND parent_object_id = OBJECT_ID(N'[dbo].[Reply]'))
ALTER TABLE [dbo].[Reply]  WITH CHECK ADD  CONSTRAINT [FK_Reply_Thread] FOREIGN KEY([ThreadID])
REFERENCES [dbo].[Thread] ([ID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Accessory_Thread]') AND parent_object_id = OBJECT_ID(N'[dbo].[Accessory]'))
ALTER TABLE [dbo].[Accessory]  WITH CHECK ADD  CONSTRAINT [FK_Accessory_Thread] FOREIGN KEY([ThreadID])
REFERENCES [dbo].[Thread] ([ID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BlogArticleSource_BlogArticle]') AND parent_object_id = OBJECT_ID(N'[dbo].[BlogArticleSource]'))
ALTER TABLE [dbo].[BlogArticleSource]  WITH CHECK ADD  CONSTRAINT [FK_BlogArticleSource_BlogArticle] FOREIGN KEY([ArticleID])
REFERENCES [dbo].[BlogArticle] ([ID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BlogComment_BlogArticle]') AND parent_object_id = OBJECT_ID(N'[dbo].[BlogComment]'))
ALTER TABLE [dbo].[BlogComment]  WITH CHECK ADD  CONSTRAINT [FK_BlogComment_BlogArticle] FOREIGN KEY([ArticleID])
REFERENCES [dbo].[BlogArticle] ([ID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BlogComment_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[BlogComment]'))
ALTER TABLE [dbo].[BlogComment]  WITH CHECK ADD  CONSTRAINT [FK_BlogComment_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AjaxMail_AjaxFolder]') AND parent_object_id = OBJECT_ID(N'[dbo].[AjaxMail]'))
ALTER TABLE [dbo].[AjaxMail]  WITH CHECK ADD  CONSTRAINT [FK_AjaxMail_AjaxFolder] FOREIGN KEY([FolderID])
REFERENCES [dbo].[AjaxFolder] ([ID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AjaxAttachment_AjaxMail]') AND parent_object_id = OBJECT_ID(N'[dbo].[AjaxAttachment]'))
ALTER TABLE [dbo].[AjaxAttachment]  WITH CHECK ADD  CONSTRAINT [FK_AjaxAttachment_AjaxMail] FOREIGN KEY([MailID])
REFERENCES [dbo].[AjaxMail] ([ID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AjaxTagMail_AjaxMail]') AND parent_object_id = OBJECT_ID(N'[dbo].[AjaxTagMail]'))
ALTER TABLE [dbo].[AjaxTagMail]  WITH CHECK ADD  CONSTRAINT [FK_AjaxTagMail_AjaxMail] FOREIGN KEY([MailID])
REFERENCES [dbo].[AjaxMail] ([ID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AjaxTagMail_AjaxTag]') AND parent_object_id = OBJECT_ID(N'[dbo].[AjaxTagMail]'))
ALTER TABLE [dbo].[AjaxTagMail]  WITH CHECK ADD  CONSTRAINT [FK_AjaxTagMail_AjaxTag] FOREIGN KEY([TagID])
REFERENCES [dbo].[AjaxTag] ([ID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AjaxFilterMail_AjaxFilter]') AND parent_object_id = OBJECT_ID(N'[dbo].[AjaxFilterMail]'))
ALTER TABLE [dbo].[AjaxFilterMail]  WITH CHECK ADD  CONSTRAINT [FK_AjaxFilterMail_AjaxFilter] FOREIGN KEY([FilterID])
REFERENCES [dbo].[AjaxFilter] ([ID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AjaxFilterMail_AjaxMail]') AND parent_object_id = OBJECT_ID(N'[dbo].[AjaxFilterMail]'))
ALTER TABLE [dbo].[AjaxFilterMail]  WITH CHECK ADD  CONSTRAINT [FK_AjaxFilterMail_AjaxMail] FOREIGN KEY([MailID])
REFERENCES [dbo].[AjaxMail] ([ID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AjaxLinkman_AjaxGroup]') AND parent_object_id = OBJECT_ID(N'[dbo].[AjaxLinkman]'))
ALTER TABLE [dbo].[AjaxLinkman]  WITH CHECK ADD  CONSTRAINT [FK_AjaxLinkman_AjaxGroup] FOREIGN KEY([GroupID])
REFERENCES [dbo].[AjaxGroup] ([ID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WebFile_WebDirectory]') AND parent_object_id = OBJECT_ID(N'[dbo].[WebFile]'))
ALTER TABLE [dbo].[WebFile]  WITH CHECK ADD  CONSTRAINT [FK_WebFile_WebDirectory] FOREIGN KEY([DirectoryID])
REFERENCES [dbo].[WebDirectory] ([ID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WebFileData_WebFile]') AND parent_object_id = OBJECT_ID(N'[dbo].[WebFileData]'))
ALTER TABLE [dbo].[WebFileData]  WITH CHECK ADD  CONSTRAINT [FK_WebFileData_WebFile] FOREIGN KEY([FileID])
REFERENCES [dbo].[WebFile] ([ID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WebFileUrl_WebFile]') AND parent_object_id = OBJECT_ID(N'[dbo].[WebFileUrl]'))
ALTER TABLE [dbo].[WebFileUrl]  WITH CHECK ADD  CONSTRAINT [FK_WebFileUrl_WebFile] FOREIGN KEY([FileID])
REFERENCES [dbo].[WebFile] ([ID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Tag_TagCatalog]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tag]'))
ALTER TABLE [dbo].[Tag]  WITH CHECK ADD  CONSTRAINT [FK_Tag_TagCatalog] FOREIGN KEY([CatalogID])
REFERENCES [dbo].[TagCatalog] ([ID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Tag_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tag]'))
ALTER TABLE [dbo].[Tag]  WITH CHECK ADD  CONSTRAINT [FK_Tag_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TagUrl_Tag]') AND parent_object_id = OBJECT_ID(N'[dbo].[TagUrl]'))
ALTER TABLE [dbo].[TagUrl]  WITH CHECK ADD  CONSTRAINT [FK_TagUrl_Tag] FOREIGN KEY([TagID])
REFERENCES [dbo].[Tag] ([ID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TagArticle_Tag]') AND parent_object_id = OBJECT_ID(N'[dbo].[TagArticle]'))
ALTER TABLE [dbo].[TagArticle]  WITH CHECK ADD  CONSTRAINT [FK_TagArticle_Tag] FOREIGN KEY([TagID])
REFERENCES [dbo].[Tag] ([ID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WebDirectory_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[WebDirectory]'))
ALTER TABLE [dbo].[WebDirectory]  WITH CHECK ADD  CONSTRAINT [FK_WebDirectory_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BlogSkin_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[BlogSkin]'))
ALTER TABLE [dbo].[BlogSkin]  WITH CHECK ADD  CONSTRAINT [FK_BlogSkin_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BlogCatalog_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[BlogCatalog]'))
ALTER TABLE [dbo].[BlogCatalog]  WITH CHECK ADD  CONSTRAINT [FK_BlogCatalog_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Thread_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[Thread]'))
ALTER TABLE [dbo].[Thread]  WITH CHECK ADD  CONSTRAINT [FK_Thread_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_Role]') AND parent_object_id = OBJECT_ID(N'[dbo].[User]'))
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([ID])
