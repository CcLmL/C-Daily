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

public partial class Portal_BoardManage:System.Web.UI.Page
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
		btnDelete.Attributes.Add("onclick","return confirm('你确定要删除所选择的版面吗?');");
	}
	private void BindPageData()
	{
		Board board = new Board();
		board.CreateHiberarchyTree(tvBoard,false,false);
	}
	protected void OperationBtn_Command(object sender,CommandEventArgs e)
	{
		if(string.IsNullOrEmpty(e.CommandName) == true) return;

		if(tvBoard.SelectedNode == null)
		{
			Dialog.OpenDialog(Response,"请选择操作的节点。");
			return;
		}
		switch(e.CommandName.ToLower())
		{
			case "add":
				{
					Server.Transfer("~/Portal/AddBoard.aspx?BoardID=" + tvBoard.SelectedNode.Value);
					break;
				}
			case "update":
				{
					Server.Transfer("~/Portal/UpdateBoard.aspx?BoardID=" + tvBoard.SelectedNode.Value);
					break;
				}
			case "title":
				{
					Server.Transfer("~/Portal/TitleManage.aspx?BoardID=" + tvBoard.SelectedNode.Value);
					break;
				}
			case "delete":
				{
					DeleteBoard(DataTypeConvert.ConvertToInt(tvBoard.SelectedNode.Value));
					break;
				}
			case "up":
			case "down":
				{
					MoveBoard(e.CommandName.ToLower());
					break;
				}
			default: break;
		}
	}

	private void DeleteBoard(int boardID)
	{
		if(tvBoard.SelectedNode.ChildNodes.Count > 0)
		{
			Dialog.OpenDialog(Response,
				"要删除的结点包含孩子结点，不能删除，请重新选择结点。");
			return;
		}
		///执行删除操作
		Board board = new Board();
		board.DeleteBoard(boardID);

		///重新绑定版面的数据
		BindPageData();		
	}

	private void MoveBoard(string moveFlagString)
	{
		TreeNode parentNode = tvBoard.SelectedNode.Parent;
		if(parentNode == null)return;
		///第一个结点不上移
		if(moveFlagString == "up"
			&& parentNode.ChildNodes.IndexOf(tvBoard.SelectedNode) == 0)
		{
			Dialog.OpenDialog(Response,	"第一个结点不上移，请重新选择结点。");
			return;
		}
		///最后一个结点不下移
		if(moveFlagString == "down"
			&& parentNode.ChildNodes.IndexOf(tvBoard.SelectedNode)
			== parentNode.ChildNodes.Count - 1)
		{
			Dialog.OpenDialog(Response,"最后一个结点不下移，请重新选择结点。");
			return;
		}

		Board board = new Board();
	}
}
