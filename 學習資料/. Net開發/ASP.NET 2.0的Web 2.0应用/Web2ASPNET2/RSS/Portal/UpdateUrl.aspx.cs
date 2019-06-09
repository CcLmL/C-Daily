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
using Web2ASPNET2.WebRSS;
using Web2ASPNET2.CommonOperation;
using Web2ASPNET2.UserCommonOperation;
using System.Data.SqlClient;

public partial class Portal_UpdateUrl:System.Web.UI.Page
{
	int urlID = -1;
	protected void Page_Load(object sender,EventArgs e)
	{	///判断用户是否登录
		UserInfo info = (UserInfo)UserCommonOperation.GetUserInfo(Session);
		if(info == null)
		{   ///返回到上一个页面
			Response.Write("<script>history.back()</script>");
			Server.Transfer("~/Portal/UserLogin.aspx");   ///跳转到登录页面
			return;
		}
		///获取被修改信息的ID
		if(Request.Params["UrlID"] != null)
		{
			urlID = DataTypeConvert.ConvertToInt(Request.Params["UrlID"].ToString());
		}
		///显示被修改的数据
		if(!Page.IsPostBack && urlID > -1)
		{   
			BindPageData(urlID);
		}
		///设置按钮的可用性
		int[] idList = { urlID };
		ButtonEnable.ControlButtonEnable(btnUpdate,idList);
	}
	private void BindPageData(int urlID)
	{   ///获取单个记录的信息
		Url url = new Url();
		SqlDataReader dr = url.GetSingleUrl(urlID);
		if(dr == null) return;
		if(dr.Read())
		{   ///显示信息
			tbName.Text = dr["Name"].ToString();
			tbUrl.Text = dr["Url"].ToString();
		}
		dr.Close();
	}
	protected void btnUpdate_Click(object sender,EventArgs e)
	{   ///执行修改操作
		Url url = new Url();
		if(url.UpdateUrl(urlID,tbName.Text,tbUrl.Text) > 0)
		{
			Dialog.OpenDialog(Response,"恭喜您，修改RSS源成功……");
		}
	}
	protected void btnReturn_Click(object sender,EventArgs e)
	{	///返回管理页面
		Server.Transfer("~/Portal/UrlManage.aspx");
	}
}
