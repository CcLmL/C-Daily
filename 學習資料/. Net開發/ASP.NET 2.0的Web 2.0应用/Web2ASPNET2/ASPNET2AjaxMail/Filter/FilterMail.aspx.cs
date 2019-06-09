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

public partial class Filter_FilterMail : System.Web.UI.Page
{
	private string filter = string.Empty;
	private string flag = string.Empty;

	protected void Page_Load(object sender,EventArgs e)
	{	///判断用户是否登录
		UserInfo info = (UserInfo)UserCommonOperation.GetUserInfo(Session);
		if(info == null)
		{   ///返回到上一个页面
			Response.Write("<script>history.back()</script>");
			Response.Redirect("~/Portal/UserLogin.aspx");	   ///跳转到登录页面
			return;
		}
		///获取过滤器
		if(Request.Params["Filter"] != null)
		{
			filter = Request.Params["Filter"].ToString();
		}
		///获取过滤器类型
		if(Request.Params["Flag"] != null)
		{
			flag = Request.Params["Flag"].ToString();
		}		
		///绑定控件的数据
		if(!Page.IsPostBack) { BindPageData(filter,flag); }
	}
	private void BindPageData(string filter,string flag)
	{   ///绑定控件的数据
		Mail mail = new Mail();
		Web2ASPNET2.CommonOperation.DataBinder.BindGridViewData(
			gvMail,mail.GetMailsByFilter(filter,flag));		
	}
}
