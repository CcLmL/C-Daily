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

public partial class Portal_AddLinkman:System.Web.UI.Page
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
		if(!Page.IsPostBack)
		{
			BindPageData();
		}
		///设置按钮的可用性
		ListControl[] list = {
			ddlGroup
		};
		ButtonEnable.ControlButtonEnable(btnAdd,list);
		ButtonEnable.ControlButtonEnable(btnAddAndReturn,list);
	}
	private void BindPageData()
	{   ///显示标签种类信息
		Group group = new Group();
		Web2ASPNET2.CommonOperation.DataBinder.BindListData(
			ddlGroup,group.GetGroups(),"Name","ID");
	}
	
	protected void btnAdd_Click(object sender,EventArgs e)
	{  	///执行添加操作
		Linkman linkman = new Linkman();
		if(linkman.AddLinkman(tbName.Text,
			tbEmail.Text,
			DataTypeConvert.ConvertToInt(ddlGroup.SelectedValue)) > 0)
		{
			Dialog.OpenDialogInAjax((Button)sender,"恭喜您，添加新联系人成功……");
		}
	}
	protected void btnAddAndReturn_Click(object sender,EventArgs e)
	{  	///执行添加操作
		Linkman linkman = new Linkman();
		if(linkman.AddLinkman(tbName.Text,
			tbEmail.Text,
			DataTypeConvert.ConvertToInt(ddlGroup.SelectedValue)) > 0)
		{
			Dialog.OpenDialogInAjax((Button)sender,"恭喜您，添加新联系人成功……");
			///返回管理页面
			if(ddlGroup.SelectedItem != null)
			{
				Response.Redirect("~/Portal/GroupLinkmanManage.aspx?GroupID=" + ddlGroup.SelectedValue);
			}
		}
	}
	protected void btnReturn_Click(object sender,EventArgs e)
	{   ///返回管理页面
		if(ddlGroup.SelectedItem != null)
		{
			Response.Redirect("~/Portal/GroupLinkmanManage.aspx?GroupID=" + ddlGroup.SelectedValue);
		}
		else
		{
			Response.Redirect("~/Portal/GroupLinkmanManage.aspx");
		}
	}
}
