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
using System.Data.SqlClient;
using Web2ASPNET2.WebBlog;
using Web2ASPNET2.CommonOperation;
using Web2ASPNET2.UserCommonOperation;

public partial class Portal_UpdateUrl:System.Web.UI.Page
{
	int urlID = -1;
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
		if(Request.Params["UrlID"] != null)
		{
			urlID = DataTypeConvert.ConvertToInt(Request.Params["UrlID"].ToString());
		}
		if(!Page.IsPostBack)
		{   ///显示被修改的数据
			if(urlID > -1)
			{
				BindPageData(urlID);
			}
		}
		///设置按钮的可用性
		int[] idList = { urlID };
		ButtonEnable.ControlButtonEnable(btnUpdateAndReturn,idList);
	}
	private void BindPageData(int urlID)
	{
		Blog blog = new Blog();
		SqlDataReader dr = blog.GetSingleUrl(urlID);
		if(dr == null) return;
		if(dr.Read())
		{
			tbName.Text = dr["Name"].ToString();
			tbUrl.Text = dr["Url"].ToString();
		}
		dr.Close();
	}
	protected void btnUpdateAndReturn_Click(object sender,EventArgs e)
	{
		Blog blog = new Blog();
		if(blog.UpdateUrl(urlID,tbName.Text,tbUrl.Text) > 0)
		{
			Dialog.OpenDialog(Response,"恭喜您，修改链接信息成功……");
			///返回管理页面
			Server.Transfer("~/Portal/UrlManage.aspx");
		}
	}
	protected void btnReturn_Click(object sender,EventArgs e)
	{   ///返回管理页面
		Server.Transfer("~/Portal/UrlManage.aspx");
	}
}
