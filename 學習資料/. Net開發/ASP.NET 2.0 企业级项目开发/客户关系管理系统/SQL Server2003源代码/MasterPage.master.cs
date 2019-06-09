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

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //判断是否存在XPath路径值
        if(Session["xpath"] !=null)
            //如果存在则重新为XmlDataSource1设置筛选路径
            XmlDataSource1.XPath = Session["xpath"].ToString() ;
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        //改变XML文件的筛选路径
        XmlDataSource1.XPath = "siteMapNode/siteMapNode[@title='基础配置']";
        Session["xpath"] = XmlDataSource1.XPath;
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        XmlDataSource1.XPath = "siteMapNode/siteMapNode[@title='客户管理']";
        Session["xpath"] = XmlDataSource1.XPath;
    }
    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        XmlDataSource1.XPath = "siteMapNode/siteMapNode[@title='员工管理']";
        Session["xpath"] = XmlDataSource1.XPath;
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        //改变XML文件的筛选路径
        XmlDataSource1.XPath = "siteMapNode/siteMapNode[@title='客户服务管理']";
        Session["xpath"] = XmlDataSource1.XPath;
    }
    //private void AddCookie(string path)
    //{
    //    HttpCookie cook = new HttpCookie("xpath", path);
    //    cook.Expires = DateTime.Now.AddDays(1);
    //    Response.Cookies.Add(cook);
    //}
}
