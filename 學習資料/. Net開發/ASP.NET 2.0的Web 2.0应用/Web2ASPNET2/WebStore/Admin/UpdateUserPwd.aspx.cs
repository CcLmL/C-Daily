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
using Web2ASPNET2.CommonOperation;
using Web2ASPNET2.WebStore;
using Web2ASPNET2.UserCommonOperation;

public partial class Admin_UpdateUserPwd:System.Web.UI.Page
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
		tbName.Text = info.UserName;
	}
	protected void btnUpdatePwd_Click(object sender,EventArgs e)
	{	///获取用户信息
		Web2ASPNET2.WebStore.User user = new User();
		SqlDataReader dr = user.GetUserLogin(tbName.Text.Trim(),
			tbPassword.Text.Trim());
		if(dr.Read())
		{  	///修改用户密码
			if(user.UpdateUserPassword(
				Int32.Parse(dr["ID"].ToString()),tbPwdNew.Text) > 0)
			{   ///显示提示信息
				Dialog.OpenDialog(Response,
					"修改用户密码成功……");
			}
		}
		else
		{   ///显示提示信息
			Dialog.OpenDialog(Response,
				"原始密码或用户名称输入错误……");
		}
		dr.Close();
	}
	protected void btnReturn_Click(object sender,EventArgs e)
	{
		tbPassword.Text = tbPwdNew.Text = tbPwdNewStr.Text = "";
	}
}
