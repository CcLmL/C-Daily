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
using Web2ASPNET2.WebTags;
using Web2ASPNET2.CommonOperation;
using Web2ASPNET2.UserCommonOperation;
using System.Data.SqlClient;

public partial class Portal_AddCatalog:System.Web.UI.Page
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
	}
	protected void btnAdd_Click(object sender,EventArgs e)
	{   ///执行添加操作
		Tag tag = new Tag();
		if(tag.AddCatalog(tbName.Text) > 0)
		{
			Dialog.OpenDialog(Response,"恭喜您，添加新标签分类成功……");			
		}
	}
	protected void btnAddAndReturn_Click(object sender,EventArgs e)
	{   ///执行添加操作
		Tag tag = new Tag();
		if(tag.AddCatalog(tbName.Text) > 0)
		{
			Dialog.OpenDialog(Response,"恭喜您，添加新标签分类成功……");
			///返回管理页面
			Server.Transfer("~/Portal/CatalogManage.aspx");
		}
	}
	protected void btnReturn_Click(object sender,EventArgs e)
	{   ///返回管理页面
		Server.Transfer("~/Portal/CatalogManage.aspx");
	}
}
