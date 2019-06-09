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
using Web2ASPNET2.WebRSS;
using Web2ASPNET2.CommonOperation;
using Web2ASPNET2.UserCommonOperation;

public partial class Admin_UpdateUser:System.Web.UI.Page
{
	int userID = -1;
	protected void Page_Load(object sender,EventArgs e)
	{	///判断用户是否登录
		UserInfo info = (UserInfo)UserCommonOperation.GetUserInfo(Session);
		if(info == null)
		{   ///返回到上一个页面
			Response.Write("<script>history.back()</script>");
			///跳转到登录页面
			Server.Transfer("~/Portal/UserLogin.aspx");
			btnUpdateAndReturn.Enabled = false;
			return;
		}		
		userID = info.UserID;
		if(!Page.IsPostBack)
		{   ///显示被修改的数据
			if(userID > -1)
			{
				BindPageData(userID);
			}
		}
		///设置按钮的可用性
		int[] idList = {userID};
		ButtonEnable.ControlButtonEnable(btnUpdateAndReturn,idList);
	}
	private void BindPageData(int userID)
	{   ///获取单个记录的信息
		Web2ASPNET2.WebRSS.User user = new User();
		SqlDataReader dr = user.GetSingleUser(userID);
		if(dr == null) return;
		if(dr.Read())
		{   ///显示信息
			tbUserName.Text = dr["UserName"].ToString();
			tbEmail.Text = dr["Email"].ToString();
		}
		dr.Close();
	}
	protected void btnUpdateAndReturn_Click(object sender,EventArgs e)
	{   ///执行更新操作
		Web2ASPNET2.WebRSS.User user = new User();
		if(user.UpdateUser(userID,tbEmail.Text) > 0)
		{
			Dialog.OpenDialog(Response,"恭喜您，修改用户信息成功……");
			///返回管理页面
			Server.Transfer("~/Admin/UserManage.aspx");
		}
	}
	protected void btnReturn_Click(object sender,EventArgs e)
	{   ///返回管理页面
		Server.Transfer("~/Admin/UserManage.aspx");
	}
}
