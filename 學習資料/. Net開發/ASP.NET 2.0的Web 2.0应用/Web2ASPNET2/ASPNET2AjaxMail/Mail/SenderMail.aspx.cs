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
using System.Data.SqlClient;
using Web2ASPNET2.ASPNET2AjaxMail;
using Web2ASPNET2.CommonOperation;
using Web2ASPNET2.UserCommonOperation;
using System.Net.Mail;
using System.IO;

public partial class Mail_SenderMail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
	{	///判断用户是否登录
		UserInfo info = (UserInfo)UserCommonOperation.GetUserInfo(Session);
		if(info == null)
		{   ///返回到上一个页面
			Response.Write("<script>history.back()</script>");			
			Response.Redirect("~/Portal/UserLogin.aspx");   ///跳转到登录页面
			return;
		}
    }
	protected void btnSender_Click(object sender,EventArgs e)
	{		
		int size = 100;    ///定义保存邮件大小变量size
		///构建新邮件
		MailMessage mail = new MailMessage();
		///添加发件人地址
		mail.From = new MailAddress("ASPNET2AjaxMail@mail.com");
		size += mail.From.Address.Length;		
		///添加收件人地址
		string split = ";";
		string[] toList = tbTo.Text.Trim().Split(split.ToCharArray());
		foreach(string to in toList)
		{
			mail.To.Add(to.Trim());
		}
		size += tbTo.Text.Length;
		///添加抄送地址；
		string[] ccList = tbCC.Text.Trim().Split(split.ToCharArray());
		foreach(string cc in ccList)
		{
			if(string.IsNullOrEmpty(cc.Trim()) == false)
			{
				mail.CC.Add(cc.Trim());
			}
		}
		size += tbCC.Text.Length;
		///添加主题
		mail.Subject = tbName.Text.Trim();
		mail.SubjectEncoding = System.Text.Encoding.UTF8;
		size += tbName.Text.Length;
		///添加内容
		mail.Body = tbBody.Text;
		mail.BodyEncoding = System.Text.Encoding.UTF8;
		mail.IsBodyHtml = cbHtmlFormt.Checked;
		size += tbBody.Text.Length;
		///添加附件		
		HttpFileCollection fileList = HttpContext.Current.Request.Files;
		for(int i = 0; i < fileList.Count; i++)
		{   ///添加单个附件
			HttpPostedFile file = fileList[i];
			if(file.FileName.Length <= 0 || file.ContentLength <= 0) continue;
			Attachment attachment = new Attachment(file.FileName);
			mail.Attachments.Add(attachment);
			size += file.ContentLength;
		}

		Mail ajaxMail = new Mail();
		if(ajaxMail.SenderMail(mail) > 0)
		{
			int mailID = ajaxMail.SaveAsMail(mail.Subject,mail.Body,mail.From.Address,
				tbTo.Text,tbCC.Text,cbHtmlFormt.Checked,size,mail.Attachments.Count > 0 ? true : false);
			if(mailID > 0) return;
			///保存发送邮件的附件
			for(int i = 0; i < fileList.Count; i++)
			{   ///添加单个附件
				HttpPostedFile file = fileList[i];
				if(file.FileName.Length <= 0 || file.ContentLength <= 0) continue;
				///保存附件到硬盘中
				string fileName = Path.GetFileName(file.FileName);
				file.SaveAs(MapPath("Attachments/" + fileName));
				///保存发送邮件的附件
				ajaxMail.SaveAsMailAttachment(fileName,"Attachments/" + fileName,
					file.ContentType,file.ContentLength,mailID);
			}
		}
		Response.Redirect("~/Mail/ViewMail.aspx");
	}
	protected void btnReturn_Click(object sender,EventArgs e)
	{
		Response.Redirect("~/Mail/ViewMail.aspx");
	}
}
