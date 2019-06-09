using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Net;
using System.Net.Mail;

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //创建一个Mail实体
        MailMessage mail = new MailMessage();
        //发件人-注意使用的是MailAddress的实例来包装邮箱地址
        mail.From = new MailAddress(MailName.Text);
        //收件人-可通过Add方法实现多个收件人的添加
        mail.To.Add(new MailAddress(Receive.Text));
        //邮件主题
        mail.Subject = Subject.Text;
        //邮件内容
        mail.Body = Body.Text;
        //添加附件
        Attachment myfile = new Attachment(FileUpload1.PostedFile.FileName);
        mail.Attachments.Add(myfile);
        //抄送到其它邮箱
        mail.CC.Add(new MailAddress(txtcc.Text));
        //创建一个邮件服务器类
        SmtpClient client = new SmtpClient();
        //获取SMTP服务器
        client.Host = Smtp.Text;
        //SMTP使用的端口-注意格式的转换
        client.Port = int.Parse(Port.Text);
        //使用邮箱登录名和密码的验证.
        client.Credentials = new NetworkCredential("championchen", "79211chen");
        //发送
        client.Send(mail);
        Label1.Text = "发送成功";
    }
}
