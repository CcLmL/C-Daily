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

public partial class BaseInfo_BaseNoticeIssuance : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loginName"] == null)
        {
            Response.Write("<script>this.parent.location.href='../Default.aspx'</script>");
        }
    }
    protected void imgBtnSave_Click(object sender, ImageClickEventArgs e)
    {
        BaseClass bc = new BaseClass();
        //bool bl = bc.ExecSQL("insert into tb_notice values('" + txtTitle.Text + "','" + DateTime.Today.ToString("yyyy-MM-dd") + "','" + Session["loginName"].ToString() + "','" + FreeTextBox1.Text + "')");
        bool bl = bc.ExecProcNotice(txtTitle.Text, FreeTextBox1.Text, Session["loginName"].ToString());
        if (bl)
        {
            Response.Write(bc.MessageBox("公告发布－成功！"));
        }
        else
        {
            Response.Write(bc.MessageBox("公告发布－失败！"));
        }
    }
    protected void imgBtnClear_Click(object sender, ImageClickEventArgs e)
    {
        txtTitle.Text = "";
        FreeTextBox1.Text = "";
    }
}
