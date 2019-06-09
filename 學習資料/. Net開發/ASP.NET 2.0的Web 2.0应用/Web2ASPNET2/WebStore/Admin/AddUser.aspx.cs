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

public partial class Admin_AddUser:System.Web.UI.Page
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
		Web2ASPNET2.WebStore.User user = new User();
		if(user.AddUser(tbUserName.Text,
			tbPassword.Text,
			WebStore.NormalRoleID,
			tbEmail.Text) > 0)
		{
			Dialog.OpenDialog(Response,"恭喜您，注册新用户成功……");			
		}
	}
	protected void btnAddAndReturn_Click(object sender,EventArgs e)
	{   ///执行添加操作
		Web2ASPNET2.WebStore.User user = new User();
		if(user.AddUser(tbUserName.Text,
			tbPassword.Text,
			WebStore.NormalRoleID,
			tbEmail.Text) > 0)
		{
			Dialog.OpenDialog(Response,"恭喜您，注册新用户成功……");
			///返回管理页面
			Server.Transfer("~/Admin/UserManage.aspx");
		}
	}
	protected void btnReturn_Click(object sender,EventArgs e)
	{   ///返回管理页面
		Server.Transfer("~/Admin/UserManage.aspx");
	}
	protected void btnCheckUser_Click(object sender,EventArgs e)
	{
		if(string.IsNullOrEmpty(tbUserName.Text) == true)
		{
			Dialog.OpenDialog(Response,"用户名称为空，请重新输入……");
			return;
		}
		///检查用户名称是否被用
		Web2ASPNET2.WebStore.User user = new User();
		if(user.CheckUser(tbUserName.Text) <= 0)
		{
			lbUserNameMsg.Text = "恭喜您，您的用户名称可以注册！";
			lbUserNameMsg.ForeColor = System.Drawing.Color.Green;
		}
		else
		{
			lbUserNameMsg.Text = "非常遗憾，您的用户名已经被别人注册，请重新输入用户名称！";
			lbUserNameMsg.ForeColor = System.Drawing.Color.Red;
		}
	}
}
