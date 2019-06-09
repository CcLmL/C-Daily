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

public partial class controls_login : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    {
        //使用Membership类的ValidateUser方法验证用户的输入。
        bool result = Membership.ValidateUser(Login1.UserName, Login1.Password);
       //如果验证成功
        if (result)
        {
            //导航到默认页
            //Response.Redirect("Default.aspx");
            FormsAuthentication.RedirectFromLoginPage(Login1.UserName, false);
        }
    }
}
