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

public partial class controls_MsgRec : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //获取当前登录用户的用户名
        HiddenField1.Value = HttpContext.Current.User.Identity.Name;
    }
    protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        //引用当前选择的行
        GridViewRow myrow = GridView1.Rows[e.NewSelectedIndex];
        //获取行的第一列的值，因为在GridView1中第一列已经设置为MsgID列。
        int msgid = int.Parse(myrow.Cells[1].Text);
        //调用短信息类的更新标志方法
        Msg msg = new Msg();
        msg.UpdateSign(msgid);
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
    }
}
