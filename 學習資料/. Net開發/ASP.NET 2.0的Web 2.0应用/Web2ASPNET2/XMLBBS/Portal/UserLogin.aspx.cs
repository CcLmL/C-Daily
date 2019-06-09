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
using System.Data.SqlClient;
using Web2ASPNET2.UserCommonOperation;
using Web2ASPNET2.CommonOperation;

public partial class Portal_UserLogin:System.Web.UI.Page
{
	protected void Page_Load(object sender,EventArgs e)
	{

	}
	protected void btnLogin_Click(object sender,EventArgs e)
	{
		Web2ASPNET2.XmlBBS.User user = new User();
		SqlDataReader dr = user.GetUserLogin(tbName.Text.Trim(),
			tbPassword.Text.Trim());

		bool isLogin = false;
		if(dr.Read())
		{   ///创建用户信息
			UserInfo info = new UserInfo();
			info.UserID = DataTypeConvert.ConvertToInt(dr["ID"].ToString());
			info.UserName = tbName.Text;
			info.LoginDate = DateTime.Now;
			///保存登录信息到Session中
			UserCommonOperation.StoreUserInfo(Session,info);
			///标识登录成功
			isLogin = true;
		}
		dr.Close();
		if(true == isLogin)
		{
			Server.Transfer("~/Portal/Index.aspx");
		}
	}
	protected void btnReturn_Click(object sender,EventArgs e)
	{
		tbName.Text = tbPassword.Text = "";
	}
	protected void btnGuestLogin_Click(object sender,EventArgs e)
	{
		Response.Redirect("~/Portal/GuestIndex.aspx");
	}
}
