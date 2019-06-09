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

public partial class Portal_Stat_StatTitleReplyTotal:System.Web.UI.Page
{
	protected void Page_Load(object sender,EventArgs e)
	{
		BBS bbs = new BBS();
		DataTable dtTitle = bbs.GetTitles();
		DataTable dtReply = bbs.GetReplys();
		if(dtTitle != null && dtReply != null)
		{
			Response.Write("帖子和回复的总数为： "
					+ (dtTitle.Rows.Count + dtReply.Rows.Count).ToString() + "<br>");
		}
	}
}
