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
using Web2ASPNET2.WebStore;
using Web2ASPNET2.CommonOperation;
using Web2ASPNET2.UserCommonOperation;

public partial class Portal_UpdateDirectory:System.Web.UI.Page
{
	int directoryID = -1;
	int parentID = -1;
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
		if(Request.Params["DirectoryID"] != null)
		{
			directoryID = DataTypeConvert.ConvertToInt(Request.Params["DirectoryID"].ToString());
		}
		///获取父目录的ID值
		if(Request.Params["ParentID"] != null)
		{
			if(Int32.TryParse(Request.Params["ParentID"].ToString(),out parentID) == false)
			{
				return;
			}
		}
		if(!Page.IsPostBack)
		{   ///显示被修改的数据
			if(directoryID > -1)
			{
				BindPageData(directoryID);
			}
		}		
		///列表控件集合
		ListControl[] list = {
			ddlDirectory
		};
		///控件按钮的可用性
		ButtonEnable.ControlButtonEnable(btnUpdateAndReturn,list);
	}
	private void BindPageData(int directoryID)
	{   ///显示目录的层次信息
		Directory dir = new Directory();
		dir.CreateHiberarchyDirectory(ddlDirectory);
		///显示被修改的信息
		SqlDataReader dr = dir.GetSingleDirectory(directoryID);
		if(dr == null) return;
		if(dr.Read())
		{
			tbName.Text = dr["Name"].ToString();
			tbRemark.Text = dr["Remark"].ToString();
			ListSelectedItem.ListSelectedItemByValue(ddlDirectory,
				dr["ParentID"].ToString());
		}
		dr.Close();
	}

	protected void btnUpdateAndReturn_Click(object sender,EventArgs e)
	{
		Directory dir = new Directory();
		if(dir.UpdateDirectory(directoryID,tbName.Text,tbRemark.Text) > 0)
		{
			Dialog.OpenDialog(Response,"恭喜您，修改目录属性成功……");
			///返回目录页面
			Server.Transfer("~/Portal/ViewDirectoryByList.aspx?ParentID=" + parentID.ToString());
		}
	}
	protected void btnReturn_Click(object sender,EventArgs e)
	{    ///返回目录页面
		Server.Transfer("~/Portal/ViewDirectoryByList.aspx?ParentID=" + parentID.ToString());
	}
}
