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
using Web2ASPNET2.UserCommonOperation;

public partial class Admin_UpdateRole:System.Web.UI.Page
{
	int roleID = -1;
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
		if(Request.Params["RoleID"] != null)
		{
			roleID = DataTypeConvert.ConvertToInt(Request.Params["RoleID"].ToString());
		}
		if(!Page.IsPostBack)
		{   ///显示被修改的数据
			if(roleID > -1)
			{
				BindPageData(roleID);
			}
		}
		///设置按钮的可用性
		int[] idList = { roleID };
		ButtonEnable.ControlButtonEnable(btnUpdateAndReturn,idList);
	}
	private void BindPageData(int roleID)
	{
		Role role = new Role();
		SqlDataReader dr = role.GetSingleRole(roleID);
		if(dr == null) return;
		if(dr.Read())
		{
			tbRoleName.Text = dr["RoleName"].ToString();
		}
		dr.Close();
	}
	protected void btnUpdateAndReturn_Click(object sender,EventArgs e)
	{
		Role role = new Role();
		if(role.UpdateRole(roleID,tbRoleName.Text) > 0)
		{
			Dialog.OpenDialog(Response,"恭喜您，修改角色信息成功……");
			///返回管理页面
			Server.Transfer("~/Admin/RoleManage.aspx");
		}
	}
	protected void btnReturn_Click(object sender,EventArgs e)
	{   ///返回管理页面
		Server.Transfer("~/Admin/RoleManage.aspx");
	}
}
