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

public partial class Communion_CheckAttendance_SetingTime : System.Web.UI.Page
{
    BaseClass bc = new BaseClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loginName"] == null)
        {
            Response.Write("<script>this.parent.location.href='../Default.aspx'</script>");
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        bool blS = bc.ExecSQL("update tb_signstate set [time]='" + TextBox1.Text + "'where signstateid=1");
        bool blX = bc.ExecSQL("update tb_signstate set [time]='" + TextBox2.Text + "'where signstateid=2");
        if (blS && blX)
        {
            Response.Write(bc.MessageBox("上下班时间设置成功！"));
        }
        else
        {
            Response.Write(bc.MessageBox("上下班时间设置失败！"));
        }
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        TextBox1.Text = "00:00:00";
        TextBox2.Text = "00:00:00";
    }
}
