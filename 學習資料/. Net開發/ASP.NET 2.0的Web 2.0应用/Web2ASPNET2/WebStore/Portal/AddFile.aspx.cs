using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.SqlClient;
using Web2ASPNET2.WebStore;
using Web2ASPNET2.CommonOperation;
using Web2ASPNET2.UserCommonOperation;

public partial class Portal_AddFile:System.Web.UI.Page
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
		///显示页面数据
		if(!Page.IsPostBack)
		{
			BindPageData();
		}
		///列表控件集合
		ListControl[] list = {
			ddlDirectory
		};
		///控件按钮的可用性
		ButtonEnable.ControlButtonEnable(btnAdd,list);
		ButtonEnable.ControlButtonEnable(btnAddAndReturn,list);
	}
	private void BindPageData()
	{   ///显示目录的层次信息
		Directory dir = new Directory();
		dir.CreateHiberarchyDirectory(ddlDirectory);
		ListSelectedItem.ListSelectedItemByValue(ddlDirectory,directoryID.ToString());
	}
	protected void btnAdd_Click(object sender,EventArgs e)
	{
		Web2ASPNET2.WebStore.File file = new Web2ASPNET2.WebStore.File();
		///上载的文档保存在硬盘中
		if(ddlStoreMethod.SelectedValue == "0")
		{   ///上载新文档
			string url = AddFileUrl(fuDocument);
			if(string.IsNullOrEmpty(url) == true) return;
			///添加上载文档的数据库信息
			if(file.AddFile(tbName.Text,fuDocument.PostedFile.ContentType,
				fuDocument.PostedFile.ContentLength,
				DataTypeConvert.ConvertToInt(ddlDirectory.SelectedValue),
				url) > 0)
			{
				Dialog.OpenDialog(Response,"恭喜您，上载新文档成功……");
			}
			else
			{   ///删除已经上载的文档
				DeleteFileUrl(url);
			}
			return;
		}
		///上载的文档保存在数据库中
		if(ddlStoreMethod.SelectedValue == "1")
		{   ///上载新文档
			ReadyAddFile(fuDocument);
			///添加上载文档的数据库信息
			if(file.AddFile(tbName.Text,fuDocument.PostedFile.ContentType,
				fuDocument.PostedFile.ContentLength,
				DataTypeConvert.ConvertToInt(ddlDirectory.SelectedValue),
				fuDocument.FileBytes) > 0)
			{
				Dialog.OpenDialog(Response,"恭喜您，上载新文档成功……");
			}
		}
	}
	protected void btnAddAndReturn_Click(object sender,EventArgs e)
	{  
		Web2ASPNET2.WebStore.File file = new Web2ASPNET2.WebStore.File();
		///上载的文档保存在硬盘中
		if(ddlStoreMethod.SelectedValue == "0")
		{   ///上载新文档
			string url = AddFileUrl(fuDocument);
			if(string.IsNullOrEmpty(url) == true) return;
			///添加上载文档的数据库信息
			if(file.AddFile(tbName.Text,fuDocument.PostedFile.ContentType,
				fuDocument.PostedFile.ContentLength,
				DataTypeConvert.ConvertToInt(ddlDirectory.SelectedValue),
				url) > 0)
			{
				Dialog.OpenDialog(Response,"恭喜您，上载新文档成功……");
				///返回目录页面
				Server.Transfer("~/Portal/ViewDirectoryByList.aspx?ParentID=" + parentID.ToString());
			}
			else
			{   ///删除已经上载的文档
				DeleteFileUrl(url);
			}
			return;
		}
		///上载的文档保存在数据库中
		if(ddlStoreMethod.SelectedValue == "1")
		{   ///上载新文档
			ReadyAddFile(fuDocument);
			///添加上载文档的数据库信息
			if(file.AddFile(tbName.Text,fuDocument.PostedFile.ContentType,
				fuDocument.PostedFile.ContentLength,
				DataTypeConvert.ConvertToInt(ddlDirectory.SelectedValue),
				fuDocument.FileBytes) > 0)
			{
				Dialog.OpenDialog(Response,"恭喜您，上载新文档成功……");
				///返回目录页面
				Server.Transfer("~/Portal/ViewDirectoryByList.aspx?ParentID=" + parentID.ToString());
			}			
		}
	}
	protected void btnReturn_Click(object sender,EventArgs e)
	{	///返回目录页面
		Server.Transfer("~/Portal/ViewDirectoryByList.aspx?ParentID=" + parentID.ToString());
	}

	private string AddFileUrl(FileUpload fu)
	{	///准备上载文档
		if(ReadyAddFile(fu) == false) return string.Empty;
		///创建文档的名称
		string fileName = DealwithString.CreatedStringByTime();
		fileName += fu.FileName.Substring(fu.FileName.LastIndexOf("."));
		fileName = "WebStore/" + fileName;
		///判断文档是否存在
		string fullName = Server.MapPath("../" + fileName);
		if(System.IO.File.Exists(fullName) == true)
		{
			Dialog.OpenDialog(Response,"上载文件已经存在，请重新选择上载的文件……");
			return string.Empty;
		}
		try
		{   ///上载文档
			fu.SaveAs(fullName);
			return fileName;
		}
		catch(Exception ex)
		{
			Dialog.OpenDialog(Response,"上载文件失败，失败原因为：" + ex.Message);
			return string.Empty;
		}
	}
	private void DeleteFileUrl(string fileName)
	{	///判断文档是否存在
		string fullName = Server.MapPath(fileName);
		if(System.IO.File.Exists(fullName) == true)
		{
			try
			{   ///删除已经上载的文档
				System.IO.File.Delete(fullName);
			}
			catch
			{
				///
			}
		}
	}

	private bool ReadyAddFile(FileUpload fu)
	{
		if(fu.HasFile == false)
		{
			Dialog.OpenDialog(Response,"上载文件为空，请重新选择上载的文件……");
			return false;
		}
		if(fu.PostedFile.ContentLength <= 0)
		{
			Dialog.OpenDialog(Response,"上载文件的大小为空，请重新选择上载的文件……");
			return false;
		}
		return true;
	}
}
