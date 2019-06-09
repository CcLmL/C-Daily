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
using Web2ASPNET2.CommonOperation;
using Web2ASPNET2.UserCommonOperation;

public partial class Portal_SearchLinkman:System.Web.UI.Page
{
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
	}

	private void BindPageData()
	{   ///绑定控件的数据
		Web2ASPNET2.ASPNET2AjaxMail.Linkman linkman = new Web2ASPNET2.ASPNET2AjaxMail.Linkman();
		Web2ASPNET2.CommonOperation.DataBinder.BindGridViewData(
			gvUser,linkman.GetLinkmanByKey(tbKey.Text));
	}
	protected void btnSearch_Click(object sender,EventArgs e)
	{
		if(string.IsNullOrEmpty(tbKey.Text.Trim()) == true)return;
		BindPageData();   ///显示搜索结果
	}
}
