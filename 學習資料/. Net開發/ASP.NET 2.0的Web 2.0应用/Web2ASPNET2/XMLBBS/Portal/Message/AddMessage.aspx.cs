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

public partial class Portal_Message_AddMessage:System.Web.UI.Page
{
	private string reciever;
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
		///获取接受短信息的ID值
		if(Request.Params["Reciever"] != null)
		{
			reciever = Request.Params["Reciever"].ToString();
		}
		if(!Page.IsPostBack)
		{
			BindPageData();
		}		
		///设置按钮的可用性
		ListControl[] list = {
			ddlUser,		
		};
		ButtonEnable.ControlButtonEnable(btnAdd,list);
		ButtonEnable.ControlButtonEnable(btnAddAndReturn,list);
	}
	private void BindPageData()
	{   ///显示接收短信息的用户信息
		Web2ASPNET2.XmlBBS.User user = new Web2ASPNET2.XmlBBS.User();
		Web2ASPNET2.CommonOperation.DataBinder.BindListData(
			ddlUser,user.GetUsersByDS(),"UserName","ID");
		if(string.IsNullOrEmpty(reciever) == false)
		{
			ListSelectedItem.ListSelectedItemByValue(ddlUser,reciever);
		}
	}
	protected void btnAdd_Click(object sender,EventArgs e)
	{   ///获取用户登录信息
		UserInfo info = (UserInfo)UserCommonOperation.GetUserInfo(Session);
		if(info == null) return;
		///获取被屏蔽的用户
		Message message = new Message();
		DataTable dt = message.GetShieldUserBySender(info.UserID);
		bool isSender = false;
		if(dt == null){isSender = true;}
		///判断接收的用户是否被屏蔽
		foreach(DataRow row in dt.Rows)
		{
			if(ddlUser.SelectedValue == row["Reciever"].ToString())
			{
				isSender = false;break;
			}
		}
		if(isSender == false)
		{
			Dialog.OpenDialog(Response,"对不起，您不能给该用户发送短信息……");
			return;
		}
		///执行添加操作
		if(message.AddMessage(tbBody.Text,
			info.UserID,
			DataTypeConvert.ConvertToInt(ddlUser.SelectedValue)) > 0)
		{
			Dialog.OpenDialog(Response,"恭喜您，发送短信息成功……");
		}
	}
	protected void btnAddAndReturn_Click(object sender,EventArgs e)
	{   ///获取用户登录信息
		UserInfo info = (UserInfo)UserCommonOperation.GetUserInfo(Session);
		if(info == null) return;

		///获取被屏蔽的用户
		Message message = new Message();
		DataTable dt = message.GetShieldUserBySender(info.UserID);
		bool isSender = false;
		if(dt == null) { isSender = true; }
		///判断接收的用户是否被屏蔽
		foreach(DataRow row in dt.Rows)
		{
			if(ddlUser.SelectedValue == row["Reciever"].ToString())
			{
				isSender = false; break;
			}
		}
		if(isSender == false)
		{
			Dialog.OpenDialog(Response,"对不起，您不能给该用户发送短信息……");
			return;
		}
		///执行添加操作
		if(message.AddMessage(tbBody.Text,
			info.UserID,
			DataTypeConvert.ConvertToInt(ddlUser.SelectedValue)) > 0)
		{
			Dialog.OpenDialog(Response,"恭喜您，发送短信息成功……");
			///返回管理页面
			Server.Transfer("~/Portal/Message/BrowseMessage.aspx");
		}
	}
	protected void btnReturn_Click(object sender,EventArgs e)
	{   ///返回管理页面
		Server.Transfer("~/Portal/Message/BrowseMessage.aspx");
	}
}
