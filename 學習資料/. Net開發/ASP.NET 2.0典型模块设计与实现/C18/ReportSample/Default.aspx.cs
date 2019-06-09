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
    protected string _styleSheet;
    protected void Page_Load(object sender, EventArgs e)
    {
        // 判断显示的样式是否是打印格式

        if ( Request.QueryString["Print"] == "true")
        {
            //打印格式
            _styleSheet = "stylesPrint.css";
            PrintButton.Visible = true;
        }
        else
        {
            //普通格式
            _styleSheet = "styles.css";
        }
    }
    //protected void Button1_Click(object sender, EventArgs e)
    //{
    //    Response.Redirect("Default.aspx?Print=true");
    //}
    protected void Button1_Click(object sender, EventArgs e)
    {
        //还是导航到本页，只是传递了一个是否打印的参数
        Response.Redirect("Default.aspx?Print=true");
    }
}
