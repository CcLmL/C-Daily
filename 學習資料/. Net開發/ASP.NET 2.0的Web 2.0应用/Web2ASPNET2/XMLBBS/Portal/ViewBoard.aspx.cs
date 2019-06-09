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

public partial class Portal_ViewBoard:System.Web.UI.Page
{
	int boardID = -1;
	protected void Page_Load(object sender,EventArgs e)
	{	///判断用户是否登录
		UserInfo info = (UserInfo)UserCommonOperation.GetUserInfo(Session);
		if(info == null)
		{   ///设置添加新帖子按钮不可用
			btnAdd.Enabled = false;
		}
		///获取帖子所属版面的ID
		if(Request.Params["BoardID"] != null)
		{
			boardID = DataTypeConvert.ConvertToInt(Request.Params["BoardID"].ToString());
		}
		if(!Page.IsPostBack)
		{   ///显示帖子的回复
			if(boardID > -1)
			{
				BindPageData(boardID);
			}
		}
	}
	private void BindPageData(int boardID)
	{
		BBS bbs = new BBS();
		Web2ASPNET2.CommonOperation.DataBinder.BindGridViewData(
			gvTitle,bbs.GetTitleByBoard(boardID));
	}
	protected string FormatState(byte state)
	{
		if(state == (byte)TitleState.NotReply)
		{
			return "禁止回复的帖子";
		}
		if(state == (byte)TitleState.NotReplyAttachment)
		{
			return "携带附件并禁止回复的帖子";
		}
		if(state == (byte)TitleState.Reply)
		{
			return "普通帖子";
		}
		if(state == (byte)TitleState.ReplyAttachment)
		{
			return "携带附件的帖子";
		}
		return string.Empty;
	}
	protected void btnAdd_Click(object sender,EventArgs e)
	{
		Server.Transfer("~/Portal/AddTitle.aspx?BoardID=" + boardID.ToString());
	}
}
