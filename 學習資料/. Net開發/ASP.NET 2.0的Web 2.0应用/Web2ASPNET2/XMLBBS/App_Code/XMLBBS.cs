using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

namespace Web2ASPNET2.XmlBBS
{
	public enum TitleState:byte
	{
		Reply = 0,              ///普通帖子
		NotReply = 1,           ///禁止回复的帖子
		ReplyAttachment = 2,    ///携带附件的帖子
		NotReplyAttachment = 3  ///携带附件并禁止回复的帖子
	}

	public enum MessageState:byte
	{
		New = 0,         ///未读				
		Read = 1,         ///已读
		Delete = 2,         ///删除，只是标记删除，但是没有实际被删除
		All = 3          ///未知状态
	}
	public enum TagState:byte
	{
		Public = 0,
		Friendly = 1,
		Private = 2
	}

	public class XmlBBS
	{
		public static int TextStringLength = 2147483647;
		public static int NormalRoleID = 2;
		public static int XmlBBSProjectID = 4;
		public static string XmlBBSTotalVisitNumber = "XMLBBSTOTALVISITNUMBER";
		public XmlBBS()
		{
			///
		}

		private static string boardFilePath;
		public static string BoardFilePath
		{
			get { return boardFilePath; }
			set { boardFilePath = value; }
		}
		private static string titleFilePath;
		public static string TitleFilePath
		{
			get { return titleFilePath; }
			set { titleFilePath = value; }
		}
		private static string replyFilePath;
		public static string ReplyFilePath
		{
			get { return replyFilePath; }
			set { replyFilePath = value; }
		}
		private static string attachmentFilePath;
		public static string AttachmentFilePath
		{
			get { return attachmentFilePath; }
			set { attachmentFilePath = value; }
		}
		private static string messageFilePath;
		public static string MessageFilePath
		{
			get { return messageFilePath; }
			set { messageFilePath = value; }
		}
		private static string messageShieldFilePath;
		public static string MessageShieldFilePath
		{
			get { return messageShieldFilePath; }
			set { messageShieldFilePath = value; }
		}

		private static string userStatFilePath;
		public static string UserStatFilePath
		{
			get { return userStatFilePath; }
			set { userStatFilePath = value; }
		}

		public static void SystemInit(HttpServerUtility server)
		{
			boardFilePath = server.MapPath(
				ConfigurationManager.ConnectionStrings["BOARDFILEPATH"].ConnectionString
				);
			titleFilePath = server.MapPath(
				ConfigurationManager.ConnectionStrings["TITLEFILEPATH"].ConnectionString
				);
			replyFilePath = server.MapPath(
				ConfigurationManager.ConnectionStrings["REPLYFILEPATH"].ConnectionString
				);
			attachmentFilePath = server.MapPath(
				ConfigurationManager.ConnectionStrings["ATTACHMENTFILEPATH"].ConnectionString
				);
			messageFilePath = server.MapPath(
				ConfigurationManager.ConnectionStrings["MESSAGEFILEPATH"].ConnectionString
				);
			messageShieldFilePath = server.MapPath(
				ConfigurationManager.ConnectionStrings["MESSAGESHIELDFILEPATH"].ConnectionString
				);
			userStatFilePath = server.MapPath(
				ConfigurationManager.ConnectionStrings["USERSTATFILEPATH"].ConnectionString
				);
		}
	}
}
