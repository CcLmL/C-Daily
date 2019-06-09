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
using Web2ASPNET2.WebStore;
using Web2ASPNET2.CommonOperation;
using Web2ASPNET2.UserCommonOperation;

public partial class Portal_AddDirectory:System.Web.UI.Page
{
	int directoryID = -1;
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
		///获取被修改信息的ID
		if(Request.Params["DirectoryID"] != null)
		{
			directoryID = DataTypeConvert.ConvertToInt(Request.Params["DirectoryID"].ToString());
		}  ///显示页面数据
		if(!Page.IsPostBack)
		{
			BindPageData();
		}
		///列表控件集合
		ListControl[] list = {
			ddlDirectory
		};
		///控件按钮的可用性
		ButtonEnable.ControlButtonEnable(btnAdd,list);
		ButtonEnable.ControlButtonEnable(btnAddAndReturn,list);
	}
	private void BindPageData()
	{   ///显示目录的层次信息
		Directory dir = new Directory();
		dir.CreateHiberarchyDirectory(ddlDirectory);
		ListSelectedItem.ListSelectedItemByValue(ddlDirectory,directoryID.ToString());
	}
	protected void btnAdd_Click(object sender,EventArgs e)
	{   ///获取用户信息
		UserInfo info = UserCommonOperation.GetUserInfo(Session);
		if(info == null)return;

		Directory dir = new Directory();
		if(dir.AddDirectory(tbName.Text,
			DataTypeConvert.ConvertToInt(ddlDirectory.SelectedValue),
			info.UserID,tbRemark.Text) > 0)
		{
			Dialog.OpenDialog(Response,"恭喜您，添加新目录成功……");
		}
	}
	protected void btnAddAndReturn_Click(object sender,EventArgs e)
	{   ///获取用户信息
		UserInfo info = UserCommonOperation.GetUserInfo(Session);
		if(info == null)return;

		Directory dir = new Directory();
		if(dir.AddDirectory(tbName.Text,
			DataTypeConvert.ConvertToInt(ddlDirectory.SelectedValue),
			info.UserID,tbRemark.Text) > 0)
		{
			Dialog.OpenDialog(Response,"恭喜您，添加新目录成功……");
			///返回目录页面
			Server.Transfer("~/Portal/ViewDirectoryByList.aspx?ParentID=" + directoryID.ToString());
		}
	}
	protected void btnReturn_Click(object sender,EventArgs e)
	{    ///返回目录页面
		Server.Transfer("~/Portal/ViewDirectoryByList.aspx?ParentID=" + directoryID.ToString());
	}
}
