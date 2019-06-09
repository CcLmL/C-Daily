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

public partial class System_SystemUserPwdUpdate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loginName"] == null)
        {
            Response.Write("<script>this.parent.location.href='../Default.aspx'</script>");
            return;
        }
        Label1.Text = Session["loginName"].ToString();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        BaseClass bc = new BaseClass();
        bool bl = bc.ExecSQL("update tb_sysUser set userPwd='" + TextBox1.Text + "' where userName='" + Session["loginName"].ToString() + "'");
        if (bl)
        {
            Response.Write(bc.MessageBox("设置新密码成功！"));
        }
    }
}
