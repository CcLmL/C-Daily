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
using Web2ASPNET2.WebStore;
using Web2ASPNET2.CommonOperation;
using Web2ASPNET2.UserCommonOperation;

public partial class Portal_DirectoryManage:System.Web.UI.Page
{
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
		if(!Page.IsPostBack)
		{
			BindPageData();
		}
	}
	private void BindPageData()
	{
		Directory dir = new Directory();
		dir.InitDirectoryTree(tvDirectory,false);
	}
	protected void btnAdd_Click(object sender,EventArgs e)
	{
		Server.Transfer("~/Portal/AddFile.aspx");
	}

	protected void btn_Command(object sender,CommandEventArgs e)
	{
		if(tvDirectory.SelectedNode == null)
		{
			Dialog.OpenDialog(Response,"请选择操作的节点");
			return;
		}
		if(string.IsNullOrEmpty(e.CommandName) == true)
		{
			return;
		}
		switch(e.CommandName.ToLower())
		{   ///重定向到添加页面
			case "add":
				Server.Transfer("~/Portal/AddDirectory.aspx?DirectoryID=" + tvDirectory.SelectedValue); break;
			///重定向到编辑页面
			case "update":
				Server.Transfer("~/Portal/UpdateDirectory.aspx?DirectoryID=" + tvDirectory.SelectedValue); break;
			case "delete":
				{   ///执行删除操作之前的判断
					if(tvDirectory.SelectedNode.ChildNodes.Count > 0)
					{
						Dialog.OpenDialog(Response,"您选择被删除的节点还包含子节点，不能被删除。");
						return;
					}
					///执行删除操作
					Directory dir = new Directory();
					dir.DeleteDirectory(DataTypeConvert.ConvertToInt(tvDirectory.SelectedValue));
					///重新显示树的数据
					BindPageData();
					 break;
				}
			///重定向到添加文档页面
			case "adddoc":
				Server.Transfer("~/Portal/AddFile.aspx?DirectoryID=" + tvDirectory.SelectedValue); break;
			default: break;
		}
	}
	
}
