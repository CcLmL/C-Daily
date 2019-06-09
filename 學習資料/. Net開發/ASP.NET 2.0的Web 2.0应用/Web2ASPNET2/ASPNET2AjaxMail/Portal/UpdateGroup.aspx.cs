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
using Web2ASPNET2.ASPNET2AjaxMail;
using Web2ASPNET2.CommonOperation;
using Web2ASPNET2.UserCommonOperation;
using System.Data.SqlClient;

public partial class Portal_UpdateGroup:System.Web.UI.Page
{
	int groupID = -1;
	protected void Page_Load(object sender,EventArgs e)
	{	///判断用户是否登录
		UserInfo info = (UserInfo)UserCommonOperation.GetUserInfo(Session);
		if(info == null)
		{   ///返回到上一个页面
			Response.Write("<script>history.back()</script>");
			///跳转到登录页面
			Response.Redirect("~/Portal/UserLogin.aspx");
			return;
		}
		///获取被修改信息的ID
		if(Request.Params["GroupID"] != null)
		{
			groupID = DataTypeConvert.ConvertToInt(Request.Params["GroupID"].ToString());
		}
		if(!Page.IsPostBack)
		{   ///显示被修改的数据
			if(groupID > -1)
			{
				BindPageData(groupID);
			}
		}
		///设置按钮的可用性
		int[] idList = { groupID };
		ButtonEnable.ControlButtonEnable(btnUpdateAndReturn,idList);
	}
	private void BindPageData(int groupID)
	{   ///获取单个记录信息
		Group group = new Group();
		SqlDataReader dr = group.GetSingleGroup(groupID);
		if(dr == null) return;
		///显示信息
		if(dr.Read())
		{
			tbName.Text = dr["Name"].ToString();
		}
		dr.Close();
	}
	protected void btnUpdateAndReturn_Click(object sender,EventArgs e)
	{   ///执行修改操作
		Group group = new Group();
		if(group.UpdateGroup(groupID,tbName.Text) > 0)
		{
			Dialog.OpenDialogInAjax((Button)sender,"恭喜您，修改组信息成功……");
			///返回管理页面
			Response.Redirect("~/Portal/GroupManage.aspx");
		}
	}
	protected void btnReturn_Click(object sender,EventArgs e)
	{   ///返回管理页面
		Response.Redirect("~/Portal/GroupManage.aspx");
	}
}
