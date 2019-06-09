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

public partial class PersonalArea_SendMsgHistory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //获取当前登录用户的用户名　
        HiddenField1.Value = HttpContext.Current.User.Identity.Name;
    }
}
