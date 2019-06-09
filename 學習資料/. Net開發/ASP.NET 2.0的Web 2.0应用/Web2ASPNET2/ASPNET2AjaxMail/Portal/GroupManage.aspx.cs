﻿using System;
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

public partial class Portal_GroupManage:System.Web.UI.Page
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
		///绑定控件的数据
		if(!Page.IsPostBack)
		{
			BindPageData();
		}
	}
	private void BindPageData()
	{   ///绑定控件的数据
		Group group = new Group();
		Web2ASPNET2.CommonOperation.DataBinder.BindGridViewData(
			gvGroup,group.GetGroups());
	}
	protected void gvGroup_RowDataBound(object sender,GridViewRowEventArgs e)
	{   ///为删除按钮添加确认对话框
		ImageButton ibtDelete = (ImageButton)e.Row.FindControl("ibtDelete");
		if(ibtDelete != null)
		{
			ibtDelete.Attributes.Add("onclick","return confirm('你确定要删除所选择的数据行吗?');");
		}
	}
	protected void gvGroup_RowCommand(object sender,GridViewCommandEventArgs e)
	{   ///重定向到编辑页面
		if(e.CommandName == "update")
		{   
			Response.Redirect("~/Portal/UpdateGroup.aspx?GroupID=" + e.CommandArgument.ToString());
		}
		///重定向到编辑页面
		if(e.CommandName == "linkman")
		{
			Response.Redirect("~/Portal/GroupLinkmanManage.aspx?GroupID=" + e.CommandArgument.ToString());
		}
		if(e.CommandName == "del")
		{   ///执行删除操作
			Group group = new Group();
			group.DeleteGroup(DataTypeConvert.ConvertToInt(e.CommandArgument.ToString()));
			///重新绑定控件数据
			BindPageData();
		}
	}
	protected void btnAdd_Click(object sender,EventArgs e)
	{   ///页面重定向
		Response.Redirect("~/Portal/AddGroup.aspx");
	}
}
