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

public partial class Portal_Message_BrowseMessage:System.Web.UI.Page
{
	private byte messageState;
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
		///获取短信息的状态
		if(Request.Params["MessageState"] != null)
		{
			messageState = byte.Parse(Request.Params["MessageState"].ToString());
		}
		else
		{
			messageState = (byte)MessageState.All;
		}
		///显示短信息
		if(!Page.IsPostBack)
		{   ///设置标题
			SetTitle(messageState);
			BindMessageData(messageState);
		}
	}

	private void SetTitle(byte messageState)
	{
		switch(messageState)
		{   ///设置模块的标题
			case 0:	ucMsgTitle.Title = "查看未读短信息";break;
			case 1:	ucMsgTitle.Title = "查看已读短信息";break;
			case 2:	ucMsgTitle.Title = "查看已删除短信息";break;
			default: ucMsgTitle.Title = "查看短信息"; break;
		}
	}

	private void BindMessageData(byte state)
	{   ///获取用户登录信息
		UserInfo info = (UserInfo)UserCommonOperation.GetUserInfo(Session);
		if(info == null)return ;
		///获取数据，并显示短信息
		Message message = new Message();
		if(state == (byte)MessageState.All)
		{   ///获取指定用户的短信息
			Web2ASPNET2.CommonOperation.DataBinder.BindGridViewData(
				gvMessage,message.GetMessageByUser(info.UserID));
		}
		else
		{   ///获取指定用户和状态的短信息
			Web2ASPNET2.CommonOperation.DataBinder.BindGridViewData(
				gvMessage,message.GetMessageByUserState(info.UserID,state));
		}
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
			if((MessageState)messageState == MessageState.Delete)
			{   ///执行删除操作
				message.DeleteMessage(DataTypeConvert.ConvertToInt(e.CommandArgument.ToString()));
			}
			else
			{   ///设置短信为删除标志的短信
				message.UpdateMessageState(DataTypeConvert.ConvertToInt(e.CommandArgument.ToString()),(byte)MessageState.Delete);
			}
			///重新绑定数据
			BindMessageData(messageState);
		}
	}
}
