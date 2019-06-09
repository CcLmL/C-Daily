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
using System.Data.SqlClient;

public partial class Portal_AddCatalog:System.Web.UI.Page
{
	int parentID = -1;
	protected void Page_Load(object sender,EventArgs e)
	{	///判断用户是否登录
		UserInfo info = (UserInfo)UserCommonOperation.GetUserInfo(Session);
		if(info == null)
		{   ///返回到上一个页面
			Response.Write("<script>history.back()</script>");			
			Server.Transfer("~/Portal/UserLogin.aspx");    ///跳转到登录页面
			return;
		}
		///获取被修改信息的ID
		if(Request.Params["CatalogID"] != null)
		{
			parentID = DataTypeConvert.ConvertToInt(Request.Params["CatalogID"].ToString());
		}		
		///设置按钮的可用性
		int[] idList = { parentID };
		ButtonEnable.ControlButtonEnable(btnAdd,idList);
		ButtonEnable.ControlButtonEnable(btnAddAndReturn,idList);
	}
	protected void btnAdd_Click(object sender,EventArgs e)
	{   ///获取用户信息
		UserInfo info = (UserInfo)UserCommonOperation.GetUserInfo(Session);
		if(info == null) return;

		Catalog catalog = new Catalog();
		if(catalog.AddCatalog(tbName.Text,parentID,info.UserID,
			byte.Parse(ddlFlag.SelectedValue)) > 0)
		{
			Dialog.OpenDialog(Response,"恭喜您，添加新分类成功……");			
		}
	}
	protected void btnAddAndReturn_Click(object sender,EventArgs e)
	{   ///获取用户信息
		UserInfo info = (UserInfo)UserCommonOperation.GetUserInfo(Session);
		if(info == null) return;

		Catalog catalog = new Catalog();
		if(catalog.AddCatalog(tbName.Text,parentID,info.UserID,
			byte.Parse(ddlFlag.SelectedValue)) > 0)
		{
			Dialog.OpenDialog(Response,"恭喜您，添加新分类成功……");
			///返回管理页面
			Server.Transfer("~/Portal/CatalogManage.aspx");
		}
	}
	protected void btnReturn_Click(object sender,EventArgs e)
	{   ///返回管理页面
		Server.Transfer("~/Portal/CatalogManage.aspx");
	}
}
