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

public partial class userControl_menu : System.Web.UI.UserControl
{
    CommonClass ccObj = new CommonClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        this.labDate.Text = "今天是：" + System.DateTime.Now.ToString("yyyy年MM月dd日");
    }
    protected void lnkbtnfeedback_Click(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Write(ccObj.MessageBox("您还没有登录！", "Default.aspx"));
        }
        else
        {
            Response.Redirect("feedback.aspx");

        }
    }
    protected void lnkbtnMyWord_Click(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Write(ccObj.MessageBox("您还没有登录！", "Default.aspx"));
        }
        else
        {
            Response.Redirect("MyWord.aspx");

        }
    }
    protected void lnkbtnOut_Click(object sender, EventArgs e)
    {
        if (Session["UserName"] != null)
        {
            Session["UserID"] = null; //用户的ID代号
            Session["Username"] = null;//用户登录名
            Response.Write(ccObj.MessageBox("谢谢您的光顾！", "Default.aspx"));
        }
    }
}
