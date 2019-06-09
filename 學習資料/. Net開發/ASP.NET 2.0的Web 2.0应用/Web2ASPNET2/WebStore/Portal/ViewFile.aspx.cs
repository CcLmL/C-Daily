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
using Web2ASPNET2.CommonOperation;
using Web2ASPNET2.WebStore;
using Web2ASPNET2.UserCommonOperation;

public partial class Portal_ViewFile:System.Web.UI.Page
{
	int fileID = -1;
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
		///显示文件的信息
		Web2ASPNET2.WebStore.File file = new Web2ASPNET2.WebStore.File();
		SqlDataReader dr = file.GetSingleFile(fileID);
		if(dr == null) return;
		if(dr.Read())
		{   ///显示文件名称、类型、大小、上载时间
			tbName.Text = dr["Name"].ToString();
			lbType.Text = dr["Type"].ToString();
			lbSize.Text = (DataTypeConvert.ConvertToInt(dr["Size"].ToString()) / 1024).ToString() + " B";
			lbUploadDate.Text = dr["UploadDate"].ToString();
			///设置选择项
			ListSelectedItem.ListSelectedItemByValue(ddlDirectory,
				dr["DirectoryID"].ToString());
			ListSelectedItem.ListSelectedItemByValue(ddlStoreMethod,
				dr["Flag"].ToString().ToLower() == "true" ? "1" : "0");
			///设置下载文件的地址
			if(ddlStoreMethod.SelectedValue == "0")
			{   ///直接下载
				aUrl.HRef = "../" + dr["Url"].ToString();
			}
			else
			{   ///从数据库中读取之后下载
				aUrl.HRef = "ShowFile.aspx?FileID=" + fileID.ToString();
			}
		}
		dr.Close();
	}
	protected void btnReturn_Click(object sender,EventArgs e)
	{    ///返回目录页面
		Server.Transfer("~/Portal/ViewDirectoryByList.aspx");
	}
}
