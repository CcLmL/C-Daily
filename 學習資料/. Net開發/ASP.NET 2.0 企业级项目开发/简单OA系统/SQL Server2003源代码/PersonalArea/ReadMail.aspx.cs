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

public partial class PersonalArea_ReadMail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //初始化一个邮件操作类
        MailMsg mail = new MailMsg();
        //调用方法返回邮件列表
        txtlist.Text = mail.ReadMail(txtpop.Text, txtusername.Text, txtpass.Text);
    }
}
