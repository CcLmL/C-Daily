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
using System.Net.Mail;

public partial class PersonalArea_SendMail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //通过当前登录用户名获取其SMTP设置
        SmtpEntity mysmtp = MailMsg.GetUserByName(HttpContext.Current.User.Identity.Name);
        //创建一个Mail实体
        MailMessage mail = new MailMessage();
        //发件人
        mail.From = new MailAddress(mysmtp.Mail);
        //收件人
        mail.To.Add( new MailAddress(txtrec.Text));
        //邮件主题
        mail.Subject = txtsubject.Text;
        //邮件内容
        mail.Body = txtcontent.Text;
        //创建一个邮件服务器类
        SmtpClient client = new SmtpClient();
        client.Host = mysmtp.Host;
        client.Port = mysmtp.Port;
        //此处没有使用邮箱登录名和密码的验证.
        client.Send(mail);
        Response.Write("<script language='javascript'>alert('发送成功')</script>");
    }
}
