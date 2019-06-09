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

public partial class PersonalArea_SmtpSet : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //获取当前登录的用户名
        string txtname = HttpContext.Current.User.Identity.Name;
        //初始化SMTP实体类，并赋值
        SmtpEntity mysmtp = new SmtpEntity();
        mysmtp.Host = txthost.Text;
        mysmtp.Port = int.Parse(txtport.Text);
        mysmtp.UserName = txtname;
        mysmtp.Mail = txtmail.Text;
        mysmtp.Password = txtpass.Text;
        //初始化MAIL操作类
        MailMsg mailset = new MailMsg();
        //调用保存配置方法
        mailset.SaveSmtpSet(mysmtp);
        //提示成功信息
        Response.Write("<script language=javascript>alert('设置成功')</script>");
    }
}
