using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Web2ASPNET2.XmlBBS;
using Web2ASPNET2.CommonOperation;
using Web2ASPNET2.UserCommonOperation;
using System.Data.SqlClient;

public partial class Portal_Message_FollowMessage:System.Web.UI.Page
{
	protected string Body = string.Empty;
	int messageID = -1;
	protected void Page_Load(object sender,EventArgs e)
	{	///判断用户是否登录
		UserInfo info = (UserInfo)UserCommonOperation.GetUserInfo(Session);
		if(info == null)
		{   ///返回到上一个页面
			Response.Write("<script>history.back()</script>");
			///跳转到登录页面
			Server.Transfer("~/Portal/UserLogin.aspx");
			return;
		}
		///获取阅读短信息的ID值
		if(Request.Params["MessageID"] != null)
		{
			messageID = Int32.Parse(Request.Params["MessageID"].ToString());
		}
		if(!Page.IsPostBack)
		{   ///根据阅读短信息的ID值获取阅读短信息的信息
			if(messageID > 0)
			{
				BindPageData(messageID);
			}
		}
	}
	protected void BindPageData(int messageID)
	{   ///显示发送短信息的用户信息
		Web2ASPNET2.XmlBBS.User user = new Web2ASPNET2.XmlBBS.User();
		Web2ASPNET2.CommonOperation.DataBinder.BindListData(
			ddlUser,user.GetUsersByDS(),"UserName","ID");
		///显示消息
		Message message = new Message();
		DataTable dt = message.GetSingleMessage(messageID);
		if(dt == null) return;
		if(dt.Rows.Count <= 0) return;
		///显示短信息属性
		Body = dt.Rows[0]["Body"].ToString();
		tbCreateDate.Text = dt.Rows[0]["CreateDate"].ToString();
		ListSelectedItem.ListSelectedItemByValue(ddlUser,dt.Rows[0]["Reciever"].ToString());
		///显示消息状态
		ListSelectedItem.ListSelectedItemByValue(ddlStatus,dt.Rows[0]["State"].ToString());
	}
}
