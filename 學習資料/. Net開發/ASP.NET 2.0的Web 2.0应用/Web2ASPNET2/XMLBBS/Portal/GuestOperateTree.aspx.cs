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
using Web2ASPNET2.XmlBBS;

public partial class Portal_GuestOperateTree:System.Web.UI.Page
{
	protected void Page_Load(object sender,EventArgs e)
	{	
		if(!Page.IsPostBack)
		{
			BindPageData();
		}
	}

	private void BindPageData()
	{
		Board board = new Board();
		TreeNode parentNode = tvOperation.FindNode("-1/0");
		if(parentNode == null) return;
		board.CreateHiberarchyTree(parentNode,true,true);
	}
}
