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

public partial class Portal_Stat_StatOnlineUser:System.Web.UI.Page
{
	protected void Page_Load(object sender,EventArgs e)
	{
		if(Application[XmlBBS.XmlBBSTotalVisitNumber] != null)
		{
			Response.Write("当前在线人数为： "
				+ Application[XmlBBS.XmlBBSTotalVisitNumber].ToString() + "<br>");
		}	
	}
}
