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

public partial class ShareArea_ViewOnline : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //获取在线人数
        Label1.Text = "当前在线" + Membership.GetNumberOfUsersOnline().ToString() + "人";
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
    {
        //获取当前选择的行
        GridViewRow row = GridView1.SelectedRow;
        //导航到发送信息的页面
        Response.Redirect("~/PersonalArea/MsgSendPage.aspx?employeename=" + row.Cells[1].Text);
    }
}
