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
using System.Data.SqlClient;
using Web2ASPNET2.ASPNET2AjaxMail;
using Web2ASPNET2.CommonOperation;
using Web2ASPNET2.UserCommonOperation;

public partial class Portal_UpdateTag:System.Web.UI.Page
{
	int tagID = -1;
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
		///获取被修改信息的ID
		if(Request.Params["TagID"] != null)
		{
			tagID = DataTypeConvert.ConvertToInt(Request.Params["TagID"].ToString());
		}
		if(!Page.IsPostBack)
		{   ///显示被修改的数据
			if(tagID > -1)
			{
				BindPageData(tagID);
			}
		}
		///设置按钮的可用性
		int[] idList = { tagID };
		ButtonEnable.ControlButtonEnable(btnUpdateAndReturn,idList);
	}
	private void BindPageData(int tagID)
	{   ///获取单个记录信息
		Tag tag = new Tag();
		SqlDataReader dr = tag.GetSingleTag(tagID);
		if(dr == null) return;
		///显示信息
		if(dr.Read())
		{   
			tbName.Text = dr["Name"].ToString();
		}
		dr.Close();
	}
	protected void btnUpdateAndReturn_Click(object sender,EventArgs e)
	{   ///执行修改操作
		Tag tag = new Tag();
		if(tag.UpdateTag(tagID,tbName.Text) > 0)
		{
			Dialog.OpenDialogInAjax((Button)sender,"恭喜您，修改标签信息成功……");
			///返回管理页面
			Response.Redirect("~/Portal/TagManage.aspx");
		}
	}
	protected void btnReturn_Click(object sender,EventArgs e)
	{   ///返回管理页面
		Response.Redirect("~/Portal/TagManage.aspx");
	}
}
