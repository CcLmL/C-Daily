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

public partial class Filter_KeyFilter : System.Web.UI.Page
{
	protected void Page_Load(object sender,EventArgs e)
	{	///判断用户是否登录
		UserInfo info = (UserInfo)UserCommonOperation.GetUserInfo(Session);
		if(info == null)
		{   ///返回到上一个页面
			Response.Write("<script>history.back()</script>");			
			Response.Redirect("~/Portal/UserLogin.aspx");　　///跳转到登录页面
			return;
		}
	}
	protected void btnAdd_Click(object sender,EventArgs e)
	{
		Filter filter = new Filter();
		if(filter.AddFilter(tbKey.Text,byte.Parse(ddlFlag.SelectedValue)) > 0)
		{
			Dialog.OpenDialogInAjax((Button)sender,"恭喜您，添加过滤器成功……");
		}		
	}
	protected void btnReturn_Click(object sender,EventArgs e)
	{
		Response.Redirect("~/Filter/FilterManage.aspx");
	}
}
