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

public partial class controls_MsgSend : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //判断是否有参数
        if (Request.QueryString["employeename"] != null)
            this.txtreceive.Text = Request.QueryString["employeename"];
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //首先要获取发件人的姓名
        //发件人就是登录的用户名。
        string send = HttpContext.Current.User.Identity.Name.ToString();
        //初始化短信息类，并发送信息
        Msg msg = new Msg();
        bool result = msg.SendMSG(txtreceive.Text, send, txttitle.Text, txtcontent.Text);
        if (result)
            Response.Write("<script language=javascript>alert('发送成功')</script>");
    }
}
