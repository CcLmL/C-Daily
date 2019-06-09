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
using Web2ASPNET2.XmlBBS;
using Web2ASPNET2.CommonOperation;
using Web2ASPNET2.UserCommonOperation;
using System.IO;

public partial class Portal_AddTitle:System.Web.UI.Page
{
	int boardID = -1;
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
		if(Request.Params["BoardID"] != null)
		{
			boardID = DataTypeConvert.ConvertToInt(Request.Params["BoardID"].ToString());
		}
		if(!Page.IsPostBack)
		{
			BindPageData();
		}		
		///设置按钮的可用性
		ListControl[] list = {
			ddlBoard,
			ddlState
		};
		ButtonEnable.ControlButtonEnable(btnAdd,list);
		ButtonEnable.ControlButtonEnable(btnAddAndReturn,list);
	}
	private void BindPageData()
	{   ///显示版面的层次信息
		Board board = new Board();
		board.CreateHiberarchyBoard(ddlBoard);
		if(boardID > 0)
		{   ///选择帖子的版面
			ListSelectedItem.ListSelectedItemByValue(ddlBoard,boardID.ToString());
		}
	}
	protected void btnAdd_Click(object sender,EventArgs e)
	{   ///添加新的帖子
		string url = string.Empty;
		int titleID = AddTitle(out url);
		if(titleID > 0 && string.IsNullOrEmpty(url) == true)
		{
			Dialog.OpenDialog(Response,"恭喜您，添加新帖子成功，但是你没有上载附件……");
			return;
		}
		if(titleID > 0)
		{   ///添加附件信息到数据库中
			BBS bbs = new BBS();
			if(bbs.AddAttachment(fuAttachment.FileName,
				url,
				fuAttachment.PostedFile.ContentType,
				titleID) > 0)
			{
				Dialog.OpenDialog(Response,"恭喜您，添加新帖子成功……");
			}
			else
			{
				Dialog.OpenDialog(Response,"恭喜您，添加新帖子成功，但是上载附件失败……");
			}			
		}
	}
	protected void btnAddAndReturn_Click(object sender,EventArgs e)
	{   ///添加新的帖子
		string url = string.Empty;
		int titleID = AddTitle(out url);
		if(titleID > 0 && string.IsNullOrEmpty(url) == true)
		{
			Dialog.OpenDialog(Response,"恭喜您，添加新帖子成功，但是你没有上载附件……");
			///返回管理页面
			Server.Transfer("~/Portal/BoardManage.aspx");
			return;
		}
		if(titleID > 0)
		{   ///添加附件信息到数据库中
			BBS bbs = new BBS();
			if(bbs.AddAttachment(fuAttachment.FileName,
				url,
				fuAttachment.PostedFile.ContentType,
				titleID) > 0)
			{
				Dialog.OpenDialog(Response,"恭喜您，添加新帖子成功……");
			}
			else
			{
				Dialog.OpenDialog(Response,"恭喜您，添加新帖子成功，但是上载附件失败……");
			}
			///返回管理页面
			Server.Transfer("~/Portal/BoardManage.aspx");
		}
	}
	protected void btnReturn_Click(object sender,EventArgs e)
	{   ///返回管理页面
		Server.Transfer("~/Portal/BoardManage.aspx");
	}

	private int AddTitle(out string url)
	{   ///获取用户登录信息
		UserInfo info = (UserInfo)UserCommonOperation.GetUserInfo(Session);
		if(info == null)
		{
			url = string.Empty;
			return -1;
		}

		BBS bbs = new BBS();
		///计算帖子的状态
		byte state = (byte)TitleState.Reply;
		///获取用户上载文件的链接地址
		url = AddAttachment(fuAttachment);
		if(string.IsNullOrEmpty(url) == true)
		{   ///用户未上载附件
			state = byte.Parse(ddlState.SelectedValue);
		}
		else
		{   ///用户上载了附件
			state = (byte)((int)(TitleState.ReplyAttachment) + int.Parse(ddlState.SelectedValue));
		}
		///添加帖子到数据库中
		return (bbs.AddTitle(tbName.Text,
			tbBody.Text,
			info.UserID,
			DataTypeConvert.ConvertToInt(ddlBoard.SelectedValue),
			state));
	}

	private string AddAttachment(FileUpload fu)
	{
		if(fu.HasFile == false) return null;
		///获取文件名称
		string tfName = fu.PostedFile.FileName;
		///创建基于时间的文件名称
		string fileName = DealwithString.CreatedStringByTime()
			+ tfName.Substring(tfName.LastIndexOf("."));
		fileName = "../XmlDatabase/Files/" + fileName;
		///获取服务器端的文件名称
		string fullfilePath = Server.MapPath(fileName);
		if(File.Exists(fullfilePath) == true)
		{
			Dialog.OpenDialog(Response,
				"你上载的文件" + fileName + "已经存在，不能上载所选择的文件");
			return null;
		}

		try
		{   ///上载文件
			fu.SaveAs(fullfilePath);
			return (fileName);
		}
		catch(Exception ex)
		{
			Server.Transfer("~/Portal/ErrorPage.aspx?Url=" + Request.RawUrl + "&ErrorMsg=" + ex.Message,
				false);
		}
		return null;
	}
}
