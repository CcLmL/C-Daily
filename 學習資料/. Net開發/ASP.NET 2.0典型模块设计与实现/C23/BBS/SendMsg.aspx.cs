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

public partial class SendMsg : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        BBSManager mybbs = new BBSManager();
        //获取当前用户名
        string username = HttpContext.Current.User.Identity.Name;
        //添加信息到数据库中
        mybbs.AddMsg(TextBox1.Text,username , int.Parse(Request.QueryString["categoryid"]));
        //添加详细信息到XML中
        mybbs.AddXML(Server.MapPath(".") +@"\content.xml",TextBox1.Text,TextBox2.Text,username);
        Literal1.Text = "帖子发布成功";
    }
}
