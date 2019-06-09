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

public partial class Portal_AddTag:System.Web.UI.Page
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
		if(!Page.IsPostBack)
		{
			BindPageData();
		}
		///设置按钮的可用性
		ListControl[] list = {
			ddlCatalog,
			ddlFlag
		};
		ButtonEnable.ControlButtonEnable(btnAdd,list);
		ButtonEnable.ControlButtonEnable(btnAddAndReturn,list);
	}
	private void BindPageData()
	{   ///显示标签种类信息
		Tag tag = new Tag();
		Web2ASPNET2.CommonOperation.DataBinder.BindListData(
			ddlCatalog,tag.GetCatalogs(),"Name","ID");
	}
	protected void btnAdd_Click(object sender,EventArgs e)
	{   ///获取用户登录信息
		UserInfo info = (UserInfo)UserCommonOperation.GetUserInfo(Session);
		if(info == null) return;

		Tag tag = new Tag();
		///执行添加操作
		if(tag.AddTag(tbName.Text,
			DataTypeConvert.ConvertToInt(ddlCatalog.SelectedValue),
			info.UserID,
			byte.Parse(ddlFlag.SelectedValue),
			tbRemark.Text) > 0)
		{
			Dialog.OpenDialog(Response,"恭喜您，添加新标签成功……");
		}
	}
	protected void btnAddAndReturn_Click(object sender,EventArgs e)
	{   ///获取用户登录信息
		UserInfo info = (UserInfo)UserCommonOperation.GetUserInfo(Session);
		if(info == null) return;

		Tag tag = new Tag();
		///执行添加操作
		if(tag.AddTag(tbName.Text,
			DataTypeConvert.ConvertToInt(ddlCatalog.SelectedValue),
			info.UserID,
			byte.Parse(ddlFlag.SelectedValue),
			tbRemark.Text) > 0)
		{
			Dialog.OpenDialog(Response,"恭喜您，添加新标签成功……");
			///返回管理页面
			Server.Transfer("~/Portal/TagManage.aspx");
		}
	}
	protected void btnReturn_Click(object sender,EventArgs e)
	{   ///返回管理页面
		Server.Transfer("~/Portal/TagManage.aspx");
	}
}
