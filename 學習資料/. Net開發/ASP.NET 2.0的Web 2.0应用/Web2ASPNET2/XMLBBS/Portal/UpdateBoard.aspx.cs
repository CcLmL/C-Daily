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

public partial class Portal_UpdateBoard:System.Web.UI.Page
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
		{   ///显示被修改的数据
			if(boardID > -1)
			{
				BindPageData(boardID);
			}
		}
		///设置按钮的可用性
		int[] idList = { boardID };
		ButtonEnable.ControlButtonEnable(btnUpdateAndReturn,idList);
	}
	private void BindPageData(int boardID)
	{
		Board board = new Board();
		DataTable dt = board.GetSingleBoard(boardID);
		if(dt == null) return;
		if(dt.Rows.Count <= 0) return;
		///显示被修改的数据
		tbName.Text = dt.Rows[0]["Name"].ToString();
		tbRemark.Text = dt.Rows[0]["Remark"].ToString();
		ListSelectedItem.ListSelectedItemByValue(ddlState,dt.Rows[0]["State"].ToString());
	}
	protected void btnUpdateAndReturn_Click(object sender,EventArgs e)
	{
		Board board = new Board();
		if(board.UpdateBoard(boardID,tbName.Text,
			byte.Parse(ddlState.SelectedValue),
			tbRemark.Text) > 0)
		{
			Dialog.OpenDialog(Response,"恭喜您，修改版面信息成功……");
			///返回管理页面
			Server.Transfer("~/Portal/BoardManage.aspx");
		}
	}
	protected void btnReturn_Click(object sender,EventArgs e)
	{   ///返回管理页面
		Server.Transfer("~/Portal/BoardManage.aspx");
	}
}
