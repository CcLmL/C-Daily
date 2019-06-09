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

public partial class Portal_AddTag:System.Web.UI.Page
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
	protected void btnAdd_Click(object sender,EventArgs e)
	{  	///执行添加操作
		Tag tag = new Tag();		
		if(tag.AddTag(tbName.Text) > 0)
		{
			Dialog.OpenDialogInAjax((Button)sender,"恭喜您，添加新标签成功……");
		}
	}
	protected void btnAddAndReturn_Click(object sender,EventArgs e)
	{  	///执行添加操作
		Tag tag = new Tag();
		if(tag.AddTag(tbName.Text) > 0)
		{
			Dialog.OpenDialogInAjax((Button)sender,"恭喜您，添加新标签成功……");
			///返回管理页面
			Response.Redirect("~/Portal/TagManage.aspx");
		}
	}
	protected void btnReturn_Click(object sender,EventArgs e)
	{   ///返回管理页面
		Response.Redirect("~/Portal/TagManage.aspx");
	}
}
