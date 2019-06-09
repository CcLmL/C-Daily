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

public partial class Portal_UpdateTitle:System.Web.UI.Page
{
	int titleID = -1;
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
		if(Request.Params["TitleID"] != null)
		{
			titleID = DataTypeConvert.ConvertToInt(Request.Params["TitleID"].ToString());
		}
		///获取版面的ID
		if(Request.Params["BoardID"] != null)
		{
			boardID = DataTypeConvert.ConvertToInt(Request.Params["BoardID"].ToString());
		}
		if(!Page.IsPostBack)
		{   ///显示被修改的数据
			if(titleID > -1)
			{
				BindPageData(titleID);
			}
		}
		///设置按钮的可用性
		int[] idList = { titleID };
		ButtonEnable.ControlButtonEnable(btnUpdateAndReturn,idList);
	}
	private void BindPageData(int titleID)
	{
		BBS bbs = new BBS();
		DataTable dt = bbs.GetSingleTitle(titleID);
		if(dt == null) return;
		if(dt.Rows.Count <= 0) return;
		///显示被修改的数据
		tbName.Text = dt.Rows[0]["Name"].ToString();
		tbBody.Text = dt.Rows[0]["Body"].ToString();
		ListSelectedItem.ListSelectedItemByValue(ddlState,dt.Rows[0]["State"].ToString());
		///获取帖子的附件
		DataTable dtAttachment = bbs.GetAttachmentByTitle(titleID);
		if(dtAttachment == null)
		{
			btnDeleteAttachment.Enabled = false;
			return;
		}
		if(dtAttachment.Rows.Count <= 0)
		{
			btnDeleteAttachment.Enabled = false;
			return;
		}
		btnDeleteAttachment.CommandArgument = dtAttachment.Rows[0]["ID"].ToString();
		btnDeleteAttachment.CommandName = dtAttachment.Rows[0]["Url"].ToString();	
	}
	protected void btnUpdateAndReturn_Click(object sender,EventArgs e)
	{
		BBS bbs = new BBS();
		if(bbs.UpdateTitle(titleID,tbName.Text,
			tbBody.Text,
			byte.Parse(ddlState.SelectedValue)) > 0)
		{
			Dialog.OpenDialog(Response,"恭喜您，修改帖子信息成功……");
			///返回管理页面
			Server.Transfer("~/Portal/TitleManage.aspx?BoardID=" + boardID.ToString());
		}
	}
	protected void btnReturn_Click(object sender,EventArgs e)
	{   ///返回管理页面
		Server.Transfer("~/Portal/TitleManage.aspx?BoardID=" + boardID.ToString());
	}
	protected void btnDeleteAttachment_Command(object sender,CommandEventArgs e)
	{
		if(string.IsNullOrEmpty(e.CommandName) == false)
		{
			BBS bbs = new BBS();
			if(bbs.DeleteAttachment(
				DataTypeConvert.ConvertToInt(e.CommandArgument.ToString())) > 0)
			{
				Dialog.OpenDialog(Response,"恭喜您，删除帖子的附件成功……");
			}
			string fullPath = Server.MapPath(e.CommandName);
			if(File.Exists(fullPath) == false)
			{
				Dialog.OpenDialog(Response,
					"要删除的附件：" + e.CommandName + "不存在。请检查文件是否被意外删除。");
				return;
			}
			try
			{
				File.Delete(fullPath);				
			}
			catch(Exception ex)
			{
				Server.Transfer("~/Portal/ErrorPage.aspx?Url=" + Request.RawUrl + "&ErrorMsg=" + ex.Message,
					false);
			}			
		}
	}
}
