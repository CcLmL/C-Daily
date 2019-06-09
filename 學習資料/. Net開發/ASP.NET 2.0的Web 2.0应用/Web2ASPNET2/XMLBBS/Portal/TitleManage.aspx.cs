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

public partial class Portal_TitleManage:System.Web.UI.Page
{
	int boardID = -1;
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
	protected void gvTitle_RowDataBound(object sender,GridViewRowEventArgs e)
	{   ///为删除按钮添加确认对话框
		ImageButton ibtDelete = (ImageButton)e.Row.FindControl("ibtDelete");
		if(ibtDelete != null)
		{
			ibtDelete.Attributes.Add("onclick","return confirm('你确定要删除所选择的数据行吗?');");
		}
	}
	protected void gvTitle_RowCommand(object sender,GridViewCommandEventArgs e)
	{
		if(e.CommandName == "view")
		{
			Server.Transfer("~/Portal/ReplyManage.aspx?TitleID=" + e.CommandArgument.ToString());
		}
		if(e.CommandName == "update")
		{
			Server.Transfer("~/Portal/UpdateTitle.aspx?TitleID=" + e.CommandArgument.ToString());
		}
		if(e.CommandName == "del")
		{   ///执行删除操作
			BBS bbs = new BBS();
			bbs.DeleteReply(DataTypeConvert.ConvertToInt(e.CommandArgument.ToString()));
			///重新绑定控件数据
			BindPageData(boardID);
		}
	}
	protected void btnAdd_Click(object sender,EventArgs e)
	{
		Server.Transfer("~/Portal/AddTitle.aspx?BoardID=" + boardID.ToString());
	}
}
