using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Web2ASPNET2.WebBlog;

public partial class _Default : System.Web.UI.Page 
{
	protected void Page_Load(object sender,EventArgs e)
	{
		Response.Redirect("~/Index/Index.aspx");
	}
}
