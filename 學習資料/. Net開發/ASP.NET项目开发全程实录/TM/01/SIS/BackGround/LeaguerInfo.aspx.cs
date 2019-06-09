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

public partial class BackGround_LeaguerInfo : System.Web.UI.Page
{
    Operation operation = new Operation();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void imgBtnAdd_Click(object sender, ImageClickEventArgs e)
    {
        operation.InsertLeaguerInfo(ddlType.Text, txtTitle.Text.Trim(), txtInfo.Text.Trim(), txtLinkMan.Text.Trim(), txtTel.Text.Trim(), DateTime.Now.AddDays(Convert.ToInt32(txtDay.Text.Trim())),chkRecommend.Checked);
        WebMessageBox.Show("收费信息发布成功！");
    }
}
