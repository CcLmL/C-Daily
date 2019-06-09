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

public partial class Portal_UserLogOff:System.Web.UI.Page
{
	protected void Page_Load(object sender,EventArgs e)
	{   ///清空Session的值，并停止Session
		UserCommonOperation.ClearAndAbandon(Session);
		Response.Redirect("~/Portal/UserLogin.aspx");
	}
}
