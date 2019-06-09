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
using jmail;
public partial class MailReceive : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //建立收邮件对象
        POP3Class popMail = new POP3Class();
        //建立邮件信息接口
        Message mailMessage;
        //建立附件集接口
        Attachments atts;
        //建立附件接口
        Attachment att;
        try
        {
            //连接信息-请填写自己的登录名和密码，重新配置POP3服务器
            popMail.Connect("champion", "****", "263.net", 110);
            //如果收到邮件
            if (popMail.Count > 0)
            {
                //根据取到的邮件数量依次取得每封邮件
                //for (int i = 1; i <= popMail.Count; i++)
                //上面是获取所有邮件的正确代码，下面只是获取第一条邮件
                for (int i = 1; i <= 2; i++)
                {
                    //取得一条邮件信息
                    mailMessage = popMail.Messages[i];
                    //取得该邮件的附件集合
                    atts = mailMessage.Attachments;
                    //设置邮件的编码方式
                    mailMessage.Charset = "GB2312";
                    //设置邮件的附件编码方式
                    mailMessage.Encoding = "Base64";
                    //是否将信头编码成iso-8859-1字符集
                    mailMessage.ISOEncodeHeaders = false;
                    //邮件的优先级 
                    txtPriority.Text = mailMessage.Priority.ToString();
                    //邮件的发送人的信箱地址               
                    txtFrom.Text = mailMessage.From;
                    //邮件的发送人
                    txtFromname.Text = mailMessage.FromName;
                    //邮件主题
                    txtSubject.Text = mailMessage.Subject;
                    //邮件内容
                    txtContent.Text = mailMessage.Body;
                    //邮件大小
                    txtSize.Text = mailMessage.Size.ToString();
                    //取得附件
                    att = atts[0];
                    //附件名称
                    string attname = att.Name;
                    //上传到服务器
                    att.SaveToFile(Page.MapPath(@"Files\") + attname);
                }
                //panMailInfo.Visible = true;
                att = null;
                atts = null;
            }
            else
            {
                Response.Write("没有新邮件!");
            }
            //下载完后删除
            //popMail.DeleteMessages();
            popMail.Disconnect();
            popMail = null;
        }
        catch (Exception ex)
        {
            Response.Write(ex);
            Response.Write("请检查邮件服务器的设置是否正确！");
        }
    }
}
