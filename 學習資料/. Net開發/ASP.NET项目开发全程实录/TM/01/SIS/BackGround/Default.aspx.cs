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

public partial class BackGround_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                if (Session["UserName"].ToString().ToLower() != "TSOFT".ToLower())
                    WebMessageBox.Show("请登录后方可进入网站后台！", "../Logon.aspx");
            }
            catch { }
        }
    }
    public void PageExit()
    {
        Session["UserName"] = "";
        Response.Write("../Default.aspx");
    }
}
