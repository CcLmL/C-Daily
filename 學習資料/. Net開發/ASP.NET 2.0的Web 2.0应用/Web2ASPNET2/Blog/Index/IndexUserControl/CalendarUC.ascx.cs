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

public partial class Index_IndexUserControl_CalendarUC:Web2ASPNET2.WebBlog.UserControlBase
{
	protected void Page_Load(object sender,EventArgs e)
	{

	}
	protected void cDate_SelectionChanged(object sender,EventArgs e)
	{   ///重定向到Index.aspx页面
		Response.Redirect("~/Index/Index.aspx?Date=" + cDate.SelectedDate.ToShortDateString());
	}
}
