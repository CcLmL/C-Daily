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

public partial class SendMSG : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //初始化xml文件操作类
        XMLRW myrw = new XMLRW();
        //调用保存XML文件的方法
        myrw.WriteXML(Server.MapPath(".") + @"\XMLFile.xml",txtname.Text
            ,txtmail.Text,txtcontent.Text,txturl.Text);
        //导航到浏览页
        Response.Redirect("Default.aspx");
    }
}
