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
using Web2ASPNET2.WebTags;
using Web2ASPNET2.CommonOperation;
using Web2ASPNET2.UserCommonOperation;

public partial class Portal_MoveTag:System.Web.UI.Page
{
	int tagID = -1;
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
	{    ///显示标签种类信息
		Tag tag = new Tag();
		Web2ASPNET2.CommonOperation.DataBinder.BindListData(
			ddlCatalog,tag.GetCatalogs(),"Name","ID");
		Web2ASPNET2.CommonOperation.DataBinder.BindListData(
			ddlNewCatalog,tag.GetCatalogs(),"Name","ID");
		///获取单个记录信息
		SqlDataReader dr = tag.GetSingleTag(tagID);
		if(dr == null) return;
		if(dr.Read())
		{   ///显示信息
			tbName.Text = dr["Name"].ToString();
			ListSelectedItem.ListSelectedItemByValue(ddlCatalog,dr["CatalogID"].ToString());
		}
		dr.Close();
	}
	protected void btnUpdateAndReturn_Click(object sender,EventArgs e)
	{   ///执行移动操作
		Tag tag = new Tag();
		if(tag.MoveTag(tagID,
			DataTypeConvert.ConvertToInt(ddlNewCatalog.SelectedValue)) > 0)
		{
			Dialog.OpenDialog(Response,"恭喜您，移动标签信息成功……");
			///返回管理页面
			Server.Transfer("~/Portal/TagManage.aspx");
		}
	}
	protected void btnReturn_Click(object sender,EventArgs e)
	{   ///返回管理页面
		Server.Transfer("~/Portal/TagManage.aspx");
	}
}
