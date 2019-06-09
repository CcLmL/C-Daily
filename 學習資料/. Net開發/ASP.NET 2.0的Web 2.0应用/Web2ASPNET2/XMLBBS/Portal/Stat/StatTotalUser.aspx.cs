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

public partial class Portal_Stat_StatTotalUser:System.Web.UI.Page
{
	protected void Page_Load(object sender,EventArgs e)
	{	
		BBS bbs = new BBS();
		DataTable dt = bbs.GetUserStat(1);
		if(dt == null) return;
		if(dt.Rows.Count <= 0) return;
		Response.Write("当前在线人数为： "
				+ dt.Rows[0]["Total"].ToString() + "<br>");
	}
}
