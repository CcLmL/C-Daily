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

public partial class Portal_AddBoard:System.Web.UI.Page
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
		ListSelectedItem.ListSelectedItemByValue(ddlBoard,boardID.ToString());
	}
	protected void btnAdd_Click(object sender,EventArgs e)
	{   
		Board board = new Board();	
		///执行添加操作
		if(board.AddBoard(tbName.Text,
			DataTypeConvert.ConvertToInt(ddlBoard.SelectedValue),
			byte.Parse(ddlState.SelectedValue),
			tbRemark.Text) > 0)
		{
			Dialog.OpenDialog(Response,"恭喜您，添加新版面成功……");
		}
	}
	protected void btnAddAndReturn_Click(object sender,EventArgs e)
	{   
		Board board = new Board();
		///执行添加操作
		if(board.AddBoard(tbName.Text,
			DataTypeConvert.ConvertToInt(ddlBoard.SelectedValue),
			byte.Parse(ddlState.SelectedValue),
			tbRemark.Text) > 0)
		{
			Dialog.OpenDialog(Response,"恭喜您，添加新版面成功……");
			///返回管理页面
			Server.Transfer("~/Portal/BoardManage.aspx");
		}
	}
	protected void btnReturn_Click(object sender,EventArgs e)
	{   ///返回管理页面
		Server.Transfer("~/Portal/BoardManage.aspx");
	}
}
