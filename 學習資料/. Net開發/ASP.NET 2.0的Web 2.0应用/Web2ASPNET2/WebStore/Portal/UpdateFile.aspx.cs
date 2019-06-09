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

public partial class Portal_UpdateFile:System.Web.UI.Page
{
	int fileID = -1;
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
		if(Request.Params["FileID"] != null)
		{
			fileID = DataTypeConvert.ConvertToInt(Request.Params["FileID"].ToString());
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
			if(fileID > -1)
			{
				BindPageData(fileID);
			}
		}
	}
	private void BindPageData(int fileID)
	{   ///显示目录的层次信息
		Directory dir = new Directory();
		dir.CreateHiberarchyDirectory(ddlDirectory);
		///显示被修改的信息
		Web2ASPNET2.WebStore.File file = new Web2ASPNET2.WebStore.File();
		SqlDataReader dr = file.GetSingleFile(fileID);
		if(dr == null) return;
		if(dr.Read())
		{
			tbName.Text = dr["Name"].ToString();
			ListSelectedItem.ListSelectedItemByValue(ddlDirectory,
				dr["DirectoryID"].ToString());
		}
		dr.Close();
	}

	protected void btnUpdateAndReturn_Click(object sender,EventArgs e)
	{
		File file = new File();
		if(file.UpdateFile(fileID,tbName.Text) > 0)
		{
			Dialog.OpenDialog(Response,"恭喜您，修改文档属性成功……");
			///返回目录页面
			Server.Transfer("~/Portal/ViewDirectoryByList.aspx?ParentID=" + parentID.ToString()); 
		}
	}
	protected void btnReturn_Click(object sender,EventArgs e)
	{    ///返回目录页面
		Server.Transfer("~/Portal/ViewDirectoryByList.aspx?ParentID=" + parentID.ToString()); 
	}
}
