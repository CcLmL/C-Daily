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
public partial class DetailMail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //建立收邮件对象
        POP3Class popMail = new POP3Class();
        //建立邮件信息接口
        Message mailMessage;
        //建立附件集接口
        Attachments atts;
        //建立附件接口
        Attachment att;
        //创建表-用来存放所有邮件
        DataTable tbl = new DataTable();
        DataColumn col1 = new DataColumn("FromName");
        tbl.Columns.Add(col1);
        DataColumn col2 = new DataColumn("FromMail");
        tbl.Columns.Add(col2);
        DataColumn col3 = new DataColumn("Subject");
        tbl.Columns.Add(col3);
        DataColumn col4 = new DataColumn("Priority");
        tbl.Columns.Add(col4);
        DataColumn col5 = new DataColumn("Size");
        tbl.Columns.Add(col5);
        DataColumn col6 = new DataColumn("Content");
        tbl.Columns.Add(col6);
        try
        {
            //连接信息-请填写自己的登录名和密码，重新配置POP3服务器
            popMail.Connect("champion", "**********", "263.net", 110);
            //如果收到邮件
            if (popMail.Count > 0)
            {
                //根据取到的邮件数量依次取得每封邮件
                for (int i = 1; i <= popMail.Count; i++)
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
                    DataRow myrow=tbl.NewRow();
                    tbl.Rows.Add(myrow);
                    //邮件的优先级 
                    myrow["Priority"] = mailMessage.Priority.ToString();
                    //邮件的发送人的信箱地址               
                    myrow["FromMail"] = mailMessage.From;
                    //邮件的发送人
                    myrow["FromName"] = mailMessage.FromName;
                    //邮件主题
                    myrow["Subject"] = mailMessage.Subject;
                    //邮件内容
                    myrow["Content"] = mailMessage.Body;
                    //邮件大小
                    myrow["Size"] = mailMessage.Size.ToString();
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
            Session["TABLE"] = tbl;
        }
        catch (Exception ex)
        {
            Response.Write(ex);
            Response.Write("请检查邮件服务器的设置是否正确！");
        }
    }
}
