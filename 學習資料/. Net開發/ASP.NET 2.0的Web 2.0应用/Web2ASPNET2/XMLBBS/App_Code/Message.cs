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
	public class Message
	{
		public Message() { }

		private readonly string MessageTableName = "Message";
		private readonly string MessageShieldTableName = "MessageShield";

		public DataTable GetMessages()
		{
			return DataCommon.GetDataByNoParam(XmlBBS.MessageFilePath,MessageTableName);
		}

		public DataTable GetMessageByUser(int userID)
		{
			XmlParamter[] param = {
		        XmlDatabase.CreateEqualParameter("Reciever",userID.ToString())
		    };
			///获取数据
			return (XmlDatabase.GetData(XmlBBS.MessageFilePath,MessageTableName,param));
		}

		public DataTable GetShieldUserBySender(int senderID)
		{
			XmlParamter[] param = {
		        XmlDatabase.CreateEqualParameter("Sender",senderID.ToString())
		    };
			///获取数据
			return (XmlDatabase.GetData(XmlBBS.MessageShieldFilePath,MessageShieldTableName,param));
		}

		public DataTable GetMessageBySender(int senderID)
		{
			XmlParamter[] param = {
		        XmlDatabase.CreateEqualParameter("Sender",senderID.ToString())
		    };
			///获取数据
			return (XmlDatabase.GetData(XmlBBS.MessageFilePath,MessageTableName,param));
		}
		public DataTable GetMessageByReciever(int recieverID)
		{
			XmlParamter[] param = {
		        XmlDatabase.CreateEqualParameter("Reciever",recieverID.ToString())
		    };
			///获取数据
			return (XmlDatabase.GetData(XmlBBS.MessageFilePath,MessageTableName,param));
		}

		public DataTable GetMessageByUserState(int userID,byte state)
		{
			XmlParamter[] param = {
		        XmlDatabase.CreateEqualParameter("Reciever",userID.ToString()),
				XmlDatabase.CreateEqualParameter("State",state.ToString())
		    };
			///获取数据
			return (XmlDatabase.GetData(XmlBBS.MessageFilePath,MessageTableName,param));
		}

		public DataTable GetSingleMessage(int messageID)
		{   ///获取数据
			return DataCommon.GetDataByIDParam(XmlBBS.MessageFilePath,MessageTableName,messageID);
		}

		public int AddShieldUser(int sender,int reciever)
		{
			XmlParamter[] param = {
				XmlDatabase.CreateInsertParameter("Sender",sender.ToString()),
				XmlDatabase.CreateInsertParameter("Reciever",reciever.ToString())
			};

			return (XmlDatabase.AddData(XmlBBS.MessageShieldFilePath,MessageShieldTableName,param));
		}

		public int AddMessage(string body,int sender,int reciever)
		{
			XmlParamter[] param = {
				XmlDatabase.CreateInsertParameter("Body",body),
				XmlDatabase.CreateInsertParameter("Sender",sender.ToString()),
				XmlDatabase.CreateInsertParameter("Reciever",reciever.ToString()),
				XmlDatabase.CreateInsertParameter("State","0"),
				XmlDatabase.CreateInsertParameter("CreateDate",DateTime.Now.ToString())
			};

			return (XmlDatabase.AddData(XmlBBS.MessageFilePath,MessageTableName,param));
		}

		public int UpdateMessageState(int messageID,byte state)
		{
			XmlParamter[] param = {
				XmlDatabase.CreateEqualParameter("ID",messageID.ToString()),
				XmlDatabase.CreateUpdateParameter("State",state.ToString())
			};

			return (XmlDatabase.UpdateData(XmlBBS.MessageFilePath,MessageTableName,param));
		}

		public int DeleteMessage(int messageID)
		{
			return DataCommon.DeleteDataIDParam(XmlBBS.MessageFilePath,MessageTableName,messageID);
		}

		public int DeleteShieldUser(int senderID)
		{
			XmlParamter[] param = {
		        XmlDatabase.CreateEqualParameter("Sender",senderID.ToString())
		    };
			///获取数据
			return (XmlDatabase.DeleteData(XmlBBS.MessageShieldFilePath,MessageShieldTableName,param));
		}
	}
}
