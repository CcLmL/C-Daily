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

public partial class BackMsg : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //初始化论坛操作类
        BBSManager mybbs = new BBSManager();
        //调用保存内容到xml中的方法
        string filename=Server.MapPath(".") + @"\" +Request.QueryString["infoid"] + "file.xml";
        mybbs.UpdateXml(filename, TextBox1.Text,
            TextBox2.Text, HttpContext.Current.User.Identity.Name);
        //更新数据库内的时间和次数信息
        mybbs.UpdateMsg(int.Parse(Request.QueryString["infoid"]));
        Literal1.Text="更新成功";
        //导航到显示页
        Response.Redirect("contentlist.aspx?filename=" + Request.QueryString["infoid"]);
    }
}
