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
using Web2ASPNET2.WebTags;
using Web2ASPNET2.CommonOperation;
using Web2ASPNET2.UserCommonOperation;

public partial class Portal_UpdateArticle:System.Web.UI.Page
{
	int articleID = -1;
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
		if(Request.Params["ArticleID"] != null)
		{
			articleID = DataTypeConvert.ConvertToInt(Request.Params["ArticleID"].ToString());
		}
		if(!Page.IsPostBack)
		{   ///显示被修改的数据
			if(articleID > -1)
			{
				BindPageData(articleID);
			}
		}
		///设置按钮的可用性
		int[] idList = { articleID };
		ButtonEnable.ControlButtonEnable(btnUpdateAndReturn,idList);
	}
	private void BindPageData(int articleID)
	{   ///获取单个记录信息
		Tag tag = new Tag();
		SqlDataReader dr = tag.GetSingleArticle(articleID);
		if(dr == null) return;
		if(dr.Read())
		{   ///显示信息
			tbName.Text = dr["Name"].ToString();
			tbBody.Text = dr["Body"].ToString();
		}
		dr.Close();
	}
	protected void btnUpdateAndReturn_Click(object sender,EventArgs e)
	{
		Tag tag = new Tag();
		if(tag.UpdateArticle(articleID,tbName.Text,tbBody.Text) > 0)
		{
			Dialog.OpenDialog(Response,"恭喜您，修改文章信息成功……");
			///返回管理页面
			Server.Transfer("~/Portal/ArticleManage.aspx");
		}
	}
	protected void btnReturn_Click(object sender,EventArgs e)
	{   ///返回管理页面
		Server.Transfer("~/Portal/ArticleManage.aspx");
	}
}
