using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        bool result = Roles.IsUserInRole("管理员");

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Button1.Text = Request.AnonymousID;
    }
}
