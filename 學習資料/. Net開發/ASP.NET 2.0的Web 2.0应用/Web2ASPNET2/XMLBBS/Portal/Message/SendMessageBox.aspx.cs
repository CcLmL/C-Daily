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

public partial class Portal_Message_SendMessageBox:System.Web.UI.Page
{
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
		///显示短信息
		if(!Page.IsPostBack)
		{   ///获取已经发送的短消息
			BindMessageData();
		}
	}

	private void BindMessageData()
	{   ///获取用户登录信息
		UserInfo info = (UserInfo)UserCommonOperation.GetUserInfo(Session);
		if(info == null) return;
		///获取数据，并显示短信息
		Message message = new Message();
		///获取指定用户的短信息
		Web2ASPNET2.CommonOperation.DataBinder.BindGridViewData(
			gvMessage,message.GetMessageBySender(info.UserID));
	}

	protected string FormatStateImage(byte state)
	{
		switch(state)
		{
			case 0: return "new.gif";          ///新短信息
			case 1: return "pic.gif";          ///已读短信息
			case 2: return "deletered.gif";      ///准备删除的短信息，但是还未删除
			default: return "unknown.gif";     ///未知短信息
		}
	}

	protected void btnAdd_Click(object sender,EventArgs e)
	{   ///重定向到发送短信息页面
		Server.Transfer("~/Portal/Message/AddMessage.aspx");
	}

	protected void gvMessage_RowDataBound(object sender,GridViewRowEventArgs e)
	{   ///添加删除按钮的确认对话框
		ImageButton ibtDelete = (ImageButton)e.Row.FindControl("ibtDelete");
		if(ibtDelete != null)
		{
			ibtDelete.Attributes.Add("onclick","return confirm('你确定要删除所选择的短信息吗?');");
		}
	}
	protected void gvMessage_RowCommand(object sender,GridViewCommandEventArgs e)
	{
		if(e.CommandName == "reply")
		{   ///跳转到修改页面
			Server.Transfer("~/Portal/Message/AddMessage.aspx?Reciever="
				+ e.CommandArgument.ToString());
		}
		if(e.CommandName == "del")
		{
			Message message = new Message();
			///设置短信为删除标志的短信
			message.UpdateMessageState(DataTypeConvert.ConvertToInt(e.CommandArgument.ToString()),(byte)MessageState.Delete);
			///重新绑定数据
			BindMessageData();
		}
	}
}
