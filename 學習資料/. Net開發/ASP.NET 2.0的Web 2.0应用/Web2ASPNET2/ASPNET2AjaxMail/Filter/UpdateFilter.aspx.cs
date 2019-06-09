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
using System.Data.SqlClient;

public partial class Filter_UpdateFilter : System.Web.UI.Page
{
	int filterID = -1;
	protected void Page_Load(object sender,EventArgs e)
	{	///判断用户是否登录
		UserInfo info = (UserInfo)UserCommonOperation.GetUserInfo(Session);
		if(info == null)
		{   ///返回到上一个页面
			Response.Write("<script>history.back()</script>");
			Response.Redirect("~/Portal/UserLogin.aspx");	///跳转到登录页面
			return;
		}
		///获取被修改信息的ID
		if(Request.Params["FilterID"] != null)
		{
			filterID = DataTypeConvert.ConvertToInt(Request.Params["FilterID"].ToString());
		}
		if(!Page.IsPostBack)
		{   ///显示被修改的数据
			if(filterID > -1)
			{
				BindPageData(filterID);
			}
		}
		///设置按钮的可用性
		int[] idList = { filterID };
		ButtonEnable.ControlButtonEnable(btnUpdate,idList);
	}
	private void BindPageData(int filterID)
	{   ///获取单个记录信息
		Filter filter = new Filter();
		SqlDataReader dr = filter.GetSingleFilter(filterID);
		if(dr == null) return;
		///显示信息
		if(dr.Read())
		{
			tbKey.Text = dr["Key"].ToString();
		}
		dr.Close();
	}
	protected void btnUpdate_Click(object sender,EventArgs e)
	{   ///执行修改操作
		Filter filter = new Filter();
		if(filter.UpdateFilter(filterID,tbKey.Text) > 0)
		{
			Dialog.OpenDialogInAjax((Button)sender,"恭喜您，修改过滤器成功……");
			///返回管理页面
			Response.Redirect("~/Filter/FilterManage.aspx");
		}
	}
	protected void btnReturn_Click(object sender,EventArgs e)
	{   ///返回管理页面
		Response.Redirect("~/Filter/FilterManage.aspx");
	}
}
