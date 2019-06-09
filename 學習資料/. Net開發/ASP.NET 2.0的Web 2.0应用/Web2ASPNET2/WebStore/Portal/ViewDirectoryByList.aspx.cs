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
using Web2ASPNET2.UserCommonOperation;
using System.Data.SqlClient;
using Web2ASPNET2.WebStore;
using Web2ASPNET2.CommonOperation;

public partial class Portal_ViewDirectoryByList:System.Web.UI.Page
{
	private int directoryID = -1;
	private int parentID = -1;
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
		///获取参数DirectoryID的值
		if(Request.Params["DirectoryID"] != null)
		{
			if(Int32.TryParse(Request.Params["DirectoryID"].ToString(),out directoryID) == false)
			{
				return;
			}
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
		{   ///显示目录列表的信息
			BindDirectoryData();
			///当前目录ID > -1，优先级最高
			if(directoryID > -1)
			{
				BindDirectoryData(directoryID);
				ListSelectedItem.ListSelectedItemByValue(ddlDirectory,directoryID.ToString());
				return;
			}
			///父ID大于-1
			if(directoryID <= -1 && parentID > -1) 
			{
				BindDirectoryData(parentID);
				ListSelectedItem.ListSelectedItemByValue(ddlDirectory,parentID.ToString());
				return;
			}
			///当前选择列表
			if(ddlDirectory.Items.Count > 0)
			{
				BindDirectoryData(Int32.Parse(ddlDirectory.SelectedValue));
			}
		}
		btnReturn.Enabled = parentID > 0 ? true : false;
	}
	private void BindDirectoryData()
	{   ///显示目录列表信息
		Web2ASPNET2.WebStore.Directory dir = new Web2ASPNET2.WebStore.Directory();
		dir.CreateHiberarchyDirectory(ddlDirectory);
		if(ddlDirectory.Items.Count > 0)
		{
			ddlDirectory.SelectedIndex = 0;
		}		
	}
	private void BindDirectoryData(int parentID)
	{	///绑定控件的数据
		Web2ASPNET2.WebStore.Directory dir = new Web2ASPNET2.WebStore.Directory();
		Web2ASPNET2.CommonOperation.DataBinder.BindGridViewData(gvDirectory,
			dir.GetDirectoryFile(parentID));
		btnReturn.Visible = parentID > 0 ? true : false;
	}
	protected string FormatImageUrl(int flag,string type)
	{
		if(flag == 0)
		{   ///文件类型
			return ("~/App_Themes/Web2ASPNET2/Images/folder.gif");
		}
		else
		{
			switch(type)
			{   ///bmp文件
				case "image/bmp": return ("~/App_Themes/Web2ASPNET2/Images/bmp.bmp");
				///exe文件
				case "application/octet-stream": return ("~/App_Themes/Web2ASPNET2/Images/exe.bmp");
				default: return ("~/App_Themes/Web2ASPNET2/Images/unknown.gif");
			}
		}		
	}
	protected string FormatHerf(int nDirectoryID,int nParentID,int flag)
	{
		if(flag == 0)
		{
			return ("ViewDirectoryByList.aspx?DirectoryID=" + nDirectoryID.ToString() + "&ParentID=" + nParentID.ToString());
		}
		else
		{
			return ("ViewFile.aspx?FileID=" + nDirectoryID.ToString() + "&ParentID=" + nParentID.ToString());
		}
	}
	protected string FormatDownloadUrl(string url,int fileID)
	{
		if(string.IsNullOrEmpty(url) == true)
		{
			return "ShowFile.aspx?FileID=" + fileID.ToString();
		}
		return "../" + url;
	}
	protected void DirList_SelectedIndexChanged(object sender,EventArgs e)
	{   ///绑定控件的数据
		BindDirectoryData(Int32.Parse(ddlDirectory.SelectedValue));
	}	
	protected void ReturnBtn_Click(object sender,EventArgs e)
	{	///返回到上级目录
		Response.Redirect("~/Portal/ViewDirectoryByList.aspx?DirectoryID=" + parentID.ToString());
	}	
	protected void gvDirectory_RowCommand(object sender,GridViewCommandEventArgs e)
	{
		if(e.CommandName == "byidservice")
		{
			Server.Transfer("~/Portal/ShowFileDataByWebService.aspx?FileID=" + e.CommandArgument.ToString());
		}
		if(e.CommandName == "byurlservice")
		{
			Server.Transfer("~/Portal/ShowFileDataByWebServiceUrl.aspx?FileID=" + e.CommandArgument.ToString());
		}
		if(e.CommandName == "del")
		{	///删除数据
			Web2ASPNET2.WebStore.Directory dir = new Web2ASPNET2.WebStore.Directory();
			dir.DeleteDirectory(DataTypeConvert.ConvertToInt(e.CommandArgument.ToString()));

			///重新绑定控件的数据				
			BindDirectoryData(Int32.Parse(ddlDirectory.SelectedValue));
			Dialog.OpenDialog(Response,"删除数据成功，请妥善保管好你的数据！");
		}
	}
	protected void gvDirectory_RowDataBound(object sender,GridViewRowEventArgs e)
	{
		ImageButton ibtDelete = (ImageButton)e.Row.FindControl("ibtDelete");
		if(ibtDelete != null)
		{
			ibtDelete.Attributes.Add("onclick","return confirm('你确定要删除所选择的数据项吗？');");
		}
	}
}
