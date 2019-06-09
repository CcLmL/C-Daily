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

public partial class communion_VoteItemSetting : System.Web.UI.Page
{
    BaseClass bc = new BaseClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loginName"] == null)
        {
            Response.Write("<script>this.parent.location.href='../Default.aspx'</script>");
            return;
        }
    }
    protected void imgBtnSave_Click(object sender, ImageClickEventArgs e)
    {
        bool bl = bc.ExecSQL("INSERT INTO tb_vote (voteTitle, voteContent) VALUES ('" + txtTitle.Text + "','" + txtContent.Text + "')");
        if (bl)
        {
            Response.Write(bc.MessageBox("数据提交成功！"));
        }
        else
        {
            Response.Write(bc.MessageBox("网络故障，数据提交失败！"));
        }
    }
    protected void imgBtnClear_Click(object sender, ImageClickEventArgs e)
    {
        txtTitle.Text = "";
        txtContent.Text = "";
    }
}
