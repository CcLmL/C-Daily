using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Web2ASPNET2.CommonOperation;
using Web2ASPNET2.OperateXmlDatabase;

namespace Web2ASPNET2.XmlBBS
{
	public class AttachmentInfo
	{
		public int ID;
		public string Url;
	}

	public class BBS
	{
		public BBS(){ }

		private readonly string TitleTableName = "Title";
		private readonly string ReplyTableName = "Reply";
		private readonly string AttachmentTableName = "Attachment";
		private readonly string UserStatTableName = "UserStat";

		public DataTable GetTitles()
		{
			return DataCommon.GetDataByNoParam(XmlBBS.TitleFilePath,TitleTableName);			
		}

		public DataTable GetTitleByBoard(int boardID)
		{
			XmlParamter[] param = {
		        XmlDatabase.CreateEqualParameter("BoardID",boardID.ToString())
		    };
			///获取数据
			return (XmlDatabase.GetData(XmlBBS.TitleFilePath,TitleTableName,param));
		}

		public DataTable GetUserStat(int userStatID)
		{
			XmlParamter[] param = {
		        XmlDatabase.CreateEqualParameter("ID",userStatID.ToString())
		    };
			///获取数据
			return (XmlDatabase.GetData(XmlBBS.UserStatFilePath,UserStatTableName,param));
		}

		public DataTable GetTitleByUser(int userID)
		{
			XmlParamter[] param = {
		        XmlDatabase.CreateEqualParameter("UserID",userID.ToString())
		    };
			///获取数据
			return (XmlDatabase.GetData(XmlBBS.TitleFilePath,TitleTableName,param));
		}
		public DataTable GetTitleByDate(DateTime date)
		{
			XmlParamter[] param = {
		        XmlDatabase.CreateEqualParameter("CreateDate",date.ToShortDateString())
		    };
			///获取数据
			return (XmlDatabase.GetData(XmlBBS.TitleFilePath,TitleTableName,param));
		}
		public DataTable GetTitleByNameKey(string key)
		{
			XmlParamter[] param = {
		        XmlDatabase.CreateLikeParameter("Name",key)
		    };
			///获取数据
			return (XmlDatabase.GetData(XmlBBS.TitleFilePath,TitleTableName,param));
		}
		public DataTable GetTitleByBodyKey(string key)
		{
			XmlParamter[] param = {
		        XmlDatabase.CreateLikeParameter("Body",key)
		    };
			///获取数据
			return (XmlDatabase.GetData(XmlBBS.TitleFilePath,TitleTableName,param));
		}

		public DataTable GetSingleTitle(int titleID)
		{
			return DataCommon.GetDataByIDParam(XmlBBS.TitleFilePath,TitleTableName,titleID);
		}

		public int AddTitle(string name,string body,int userID,int boardID,byte state)
		{
			XmlParamter[] param = {
				XmlDatabase.CreateInsertParameter("Name",name),
				XmlDatabase.CreateInsertParameter("Body",body),
				XmlDatabase.CreateInsertParameter("UserID",userID.ToString()),
				XmlDatabase.CreateInsertParameter("BoardID",boardID.ToString()),
				XmlDatabase.CreateInsertParameter("CreateDate",DateTime.Now.ToShortDateString()),
				XmlDatabase.CreateInsertParameter("VisitNum","0"),
				XmlDatabase.CreateInsertParameter("ReplyNum","0"),
				XmlDatabase.CreateInsertParameter("State",state.ToString())		
			};

			return (XmlDatabase.AddData(XmlBBS.TitleFilePath,TitleTableName,param));
		}

		public int UpdateTitle(int titleID,string name,string body,byte state)
		{
			XmlParamter[] param = {
				XmlDatabase.CreateEqualParameter("ID",titleID.ToString()),
				XmlDatabase.CreateUpdateParameter("Name",name),
				XmlDatabase.CreateUpdateParameter("Body",body),
				XmlDatabase.CreateUpdateParameter("State",state.ToString())				
			};

			return (XmlDatabase.UpdateData(XmlBBS.TitleFilePath,TitleTableName,param));
		}

		public int UpdateTitleVisitNum(int titleID,int visitNum)
		{
			XmlParamter[] param = {
				XmlDatabase.CreateEqualParameter("ID",titleID.ToString()),
				XmlDatabase.CreateUpdateParameter("VisitNum",visitNum.ToString())
			};

			return (XmlDatabase.UpdateData(XmlBBS.TitleFilePath,TitleTableName,param));
		}

		public int UpdateTitleReplyNum(int titleID,int replyNum)
		{
			XmlParamter[] param = {
				XmlDatabase.CreateEqualParameter("ID",titleID.ToString()),
				XmlDatabase.CreateUpdateParameter("ReplyNum",replyNum.ToString())
			};

			return (XmlDatabase.UpdateData(XmlBBS.TitleFilePath,TitleTableName,param));
		}

		public int UpdateUserStat(int userStatID,int total)
		{
			XmlParamter[] param = {
				XmlDatabase.CreateEqualParameter("ID",userStatID.ToString()),
				XmlDatabase.CreateUpdateParameter("Total",total.ToString())
			};

			return (XmlDatabase.UpdateData(XmlBBS.UserStatFilePath,UserStatTableName,param));
		}

		public int UpdateTitleFlag(int titleID,byte flag)
		{
			XmlParamter[] param = {
				XmlDatabase.CreateEqualParameter("ID",titleID.ToString()),
				XmlDatabase.CreateUpdateParameter("Flag",flag.ToString())
			};

			return (XmlDatabase.UpdateData(XmlBBS.TitleFilePath,TitleTableName,param));
		}

		public int DeleteTitle(int titleID)
		{
			return DataCommon.DeleteDataIDParam(XmlBBS.TitleFilePath,TitleTableName,titleID);
		}

		public DataTable GetReplys()
		{
			return DataCommon.GetDataByNoParam(XmlBBS.ReplyFilePath,ReplyTableName);
		}

		public DataTable GetReplyByTitle(int titleID)
		{
		    XmlParamter[] param = {
		        XmlDatabase.CreateEqualParameter("TitleID",titleID.ToString())
		    };
			///获取数据
		    return (XmlDatabase.GetData(XmlBBS.ReplyFilePath,ReplyTableName,param));
		}

		public DataTable GetSingleReply(int replyID)
		{   ///获取数据
			return DataCommon.GetDataByIDParam(XmlBBS.ReplyFilePath,ReplyTableName,replyID);
		}

		public int AddReply(string body,int userID,int titleID)
		{
			XmlParamter[] param = {
				XmlDatabase.CreateInsertParameter("Body",body),
				XmlDatabase.CreateInsertParameter("UserID",userID.ToString()),
				XmlDatabase.CreateInsertParameter("TitleID",titleID.ToString()),
				XmlDatabase.CreateInsertParameter("CreateDate",DateTime.Now.ToShortDateString())
			};

			return (XmlDatabase.AddData(XmlBBS.ReplyFilePath,ReplyTableName,param));
		}

		public int DeleteReply(int replyID)
		{
			return DataCommon.DeleteDataIDParam(XmlBBS.ReplyFilePath,ReplyTableName,replyID);
		}

		public DataTable GetAttachments()
		{
			return DataCommon.GetDataByNoParam(XmlBBS.AttachmentFilePath,AttachmentTableName);
		}

		public DataTable GetAttachmentByTitle(int titleID)
		{
			XmlParamter[] param = {
		        XmlDatabase.CreateEqualParameter("TitleID",titleID.ToString())
		    };
			///获取数据
			return (XmlDatabase.GetData(XmlBBS.AttachmentFilePath,AttachmentTableName,param));
		}

		public DataTable GetSingleAttachment(int attachmentID)
		{   ///获取数据
			return DataCommon.GetDataByIDParam(XmlBBS.AttachmentFilePath,AttachmentTableName,attachmentID);
		}

		public int AddAttachment(string name,string url,string type,int titleID)
		{
			XmlParamter[] param = {
				XmlDatabase.CreateInsertParameter("Name",name),
				XmlDatabase.CreateInsertParameter("Url",url),
				XmlDatabase.CreateInsertParameter("Type",type),
				XmlDatabase.CreateInsertParameter("TitleID",titleID.ToString())
			};

			return (XmlDatabase.AddData(XmlBBS.AttachmentFilePath,AttachmentTableName,param));
		}

		public int DeleteAttachment(int attachmentID)
		{
			return DataCommon.DeleteDataIDParam(XmlBBS.AttachmentFilePath,AttachmentTableName,attachmentID);
		}
	}
}