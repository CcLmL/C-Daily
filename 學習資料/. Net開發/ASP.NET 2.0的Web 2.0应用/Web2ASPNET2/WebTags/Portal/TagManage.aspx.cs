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
using System.Data.SqlClient;
using Web2ASPNET2.WebTags;
using Web2ASPNET2.CommonOperation;
using Web2ASPNET2.UserCommonOperation;

public partial class Portal_TagManage:System.Web.UI.Page
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
		///绑定控件的数据
		if(!Page.IsPostBack)
		{
			BindPageData();
		}
	}
	private void BindPageData()
	{   ///绑定控件的数据
		Tag tag = new Tag();
		Web2ASPNET2.CommonOperation.DataBinder.BindGridViewData(
			gvTag,tag.GetTags());
	}
	protected string FormatFlag(byte flag)
	{
		if(flag == (byte)TagState.Public)
		{
			return "公开";
		}
		if(flag == (byte)TagState.Friendly)
		{
			return "好友可见";
		}
		if(flag == (byte)TagState.Private)
		{
			return "私有";
		}
		return string.Empty;
	}
	protected void gvTag_RowDataBound(object sender,GridViewRowEventArgs e)
	{   ///为删除按钮添加确认对话框
		ImageButton ibtDelete = (ImageButton)e.Row.FindControl("ibtDelete");
		if(ibtDelete != null)
		{
			ibtDelete.Attributes.Add("onclick","return confirm('你确定要删除所选择的数据行吗?');");
		}
	}
	protected void gvTag_RowCommand(object sender,GridViewCommandEventArgs e)
	{
		if(e.CommandName == "update")
		{   ///重定向到编辑标签属性页面
			Server.Transfer("~/Portal/UpdateTag.aspx?TagID=" + e.CommandArgument.ToString());
		}
		if(e.CommandName == "move")
		{   ///重定向到移动标签页面
			Server.Transfer("~/Portal/MoveTag.aspx?TagID=" + e.CommandArgument.ToString());
		}
		if(e.CommandName == "del")
		{   ///执行删除操作
			Tag tag = new Tag();
			tag.DeleteTag(DataTypeConvert.ConvertToInt(e.CommandArgument.ToString()));
			///重新绑定控件数据
			BindPageData();
		}
	}
	protected void btnAdd_Click(object sender,EventArgs e)
	{   ///页面重定向
		Server.Transfer("~/Portal/AddTag.aspx");
	}
}
