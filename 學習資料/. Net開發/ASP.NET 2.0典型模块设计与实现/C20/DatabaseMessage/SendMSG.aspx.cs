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

public partial class SendMSG : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //初始化数据库操作类
        SQLRW myrw = new SQLRW();
        //调用添加方法并赋值
        myrw.AddMsg(txtname.Text, txturl.Text, txtmail.Text, txtcontent.Text);
        //导航到显示留言列表窗口
        Response.Redirect("Default.aspx");
    }
}
