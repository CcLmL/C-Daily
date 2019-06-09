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
using Web2ASPNET2.WebBlog;
using Web2ASPNET2.CommonOperation;

public partial class Portal_UrlManage:System.Web.UI.Page
{
	protected void Page_Load(object sender,EventArgs e)
	{
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
			gvUrl,blog.GetUrls());
	}
	protected void gvUrl_RowDataBound(object sender,GridViewRowEventArgs e)
	{   ///为删除按钮添加确认对话框
		ImageButton ibtDelete = (ImageButton)e.Row.FindControl("ibtDelete");
		if(ibtDelete != null)
		{
			ibtDelete.Attributes.Add("onclick","return confirm('你确定要删除所选择的数据行吗?');");
		}
	}
	protected void gvUrl_RowCommand(object sender,GridViewCommandEventArgs e)
	{
		if(e.CommandName == "update")
		{
			Server.Transfer("~/Portal/UpdateUrl.aspx?UrlID=" + e.CommandArgument.ToString());
		}
		if(e.CommandName == "del")
		{   ///执行删除操作
			Blog blog = new Blog();
			blog.DeleteUrl(DataTypeConvert.ConvertToInt(e.CommandArgument.ToString()));
			///重新绑定控件数据
			BindPageData();
		}
	}
	protected void btnAdd_Click(object sender,EventArgs e)
	{
		Server.Transfer("~/Portal/AddUrl.aspx");
	}
}
