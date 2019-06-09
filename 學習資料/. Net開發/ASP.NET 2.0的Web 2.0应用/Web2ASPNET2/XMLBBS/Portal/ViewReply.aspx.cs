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

public partial class Portal_ViewReply:System.Web.UI.Page
{
	protected string Body = string.Empty;
	int replyID = -1;
	protected void Page_Load(object sender,EventArgs e)
	{   ///获取显示回复的ID
		if(Request.Params["ReplyID"] != null)
		{
			replyID = DataTypeConvert.ConvertToInt(Request.Params["ReplyID"].ToString());
		}
		if(!Page.IsPostBack)
		{
			if(replyID > 0)
			{
				BindPageData(replyID);
			}
		}
	}

	protected void BindPageData(int replyID)
	{
		BBS bbs = new BBS();
		DataTable dt = bbs.GetSingleReply(replyID);
		if(dt == null) return;
		if(dt.Rows.Count <= 0) return;

		Body = dt.Rows[0]["Body"].ToString();
	}
}
