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

public partial class entry : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Session["userName"] = null;
        }
    }
    protected void btnEntry_Click(object sender, EventArgs e)
    {
        string userName = txtName.Text;
        string Pwd = txtPwd.Text;
        string sql = "select * from tb_user where userName='" + userName + "' and userPwd='" + Pwd + "'";
        if (dataOperate.seleSQL(sql) > 0)
        {
            Session["userName"] = txtName.Text;
            Response.Redirect("index.aspx");
        }
        else
        {
            RegisterStartupScript("", "<script>alert('登录失败！')</script>");
        }
    }
}
