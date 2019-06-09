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
using Web2ASPNET2.WebBlog;
using Web2ASPNET2.CommonOperation;
using Web2ASPNET2.UserCommonOperation;

public partial class Portal_ArticleCommentManage:System.Web.UI.Page
{
	private int articleID = -1;
	protected void Page_Load(object sender,EventArgs e)
	{	///判断用户是否登录
		UserInfo info = (UserInfo)UserCommonOperation.GetUserInfo(Session);
		if(info == null)
		{   ///返回到上一个页面
			Response.Write("<script>history.back()</script>");
			Server.Transfer("~/Portal/UserLogin.aspx");    ///跳转到登录页面
			return;
		}
		if(Request.Params["ArticleID"] != null)
		{
			articleID = DataTypeConvert.ConvertToInt(Request.Params["ArticleID"].ToString());
		}
		///绑定控件的数据
		if(!Page.IsPostBack)
		{
			BindPageData();
		}
	}
	private void BindPageData()
	{   ///绑定控件的数据
		Blog blog = new Blog();
		Web2ASPNET2.CommonOperation.DataBinder.BindGridViewData(
			gvComment,blog.GetCommentByArticle(articleID));
	}
	
	protected void gvComment_RowCommand(object sender,GridViewCommandEventArgs e)
	{
		if(e.CommandName == "update")
		{
			Server.Transfer("~/Portal/UpdateArticle.aspx?ArticleID=" + e.CommandArgument.ToString());
		}
		if(e.CommandName == "del")
		{   ///执行删除操作
			Blog blog = new Blog();
			blog.DeleteArticleComment(DataTypeConvert.ConvertToInt(e.CommandArgument.ToString()));
			///重新绑定控件数据
			BindPageData();
		}
	}
	protected void gvComment_RowDataBound(object sender,GridViewRowEventArgs e)
	{
		///为删除按钮添加确认对话框
		ImageButton ibtDelete = (ImageButton)e.Row.FindControl("ibtDelete");
		if(ibtDelete != null)
		{
			ibtDelete.Attributes.Add("onclick","return confirm('你确定要删除所选择的数据行吗?');");
		}
	}
}
