using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using jmail;
public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //创建一个新邮件
        MessageClass message = new MessageClass();
        //设置邮件的编码格式-中文
        message.Charset = "gb2312";
        //邮件的发送者
        message.From = txtsendmail.Text;
        //邮件的发送者显示的名字
        message.FromName =txtsendname.Text;
        //邮件的主题
        message.Subject = subject.Text;
        //邮件的内容
        message.Body = txtcontent.Text;
        //邮件服务器的验证名称和密码
        message.MailServerUserName = txtValidatename.Text;
        message.MailServerPassWord = txtValidatepass.Text;
        //添加附件
        //判断是否选择了文件
        if (FileUpload1.PostedFile.FileName !="")
        {
            //文件的路径
            string filepath = FileUpload1.PostedFile.FileName;
            //添加到邮件的附件中
            message.AddAttachment(filepath, true, "text/html");
        }
        //邮件的接收人
        message.AddRecipient( txtreceive.Text,"","");
        //发送-参数是邮件的服务器，不同邮件地址、服务器肯定不同
        message.Send(smtp.Text, false);
        //提示信息
        Response.Write("<script language='javascript'> alert('发送成功');</script>");
    }
}
