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
using Web2ASPNET2.CommonOperation;
using Web2ASPNET2.ASPNET2AjaxMail;
using Web2ASPNET2.UserCommonOperation;

public partial class Mail_ReaderMail : System.Web.UI.Page
{
	int mailID = -1;
	protected void Page_Load(object sender,EventArgs e)
	{	///判断用户是否登录
		UserInfo info = (UserInfo)UserCommonOperation.GetUserInfo(Session);
		if(info == null)
		{   ///返回到上一个页面
			Response.Write("<script>history.back()</script>");			
			Response.Redirect("~/Portal/UserLogin.aspx");    ///跳转到登录页面
			return;
		}
		///获取邮件的ID值
		if(Request.Params["MailID"] != null)
		{
			mailID = DataTypeConvert.ConvertToInt(Request.Params["MailID"].ToString());
		}
		///显示邮件内容
		if(!Page.IsPostBack && mailID > 0)
		{   
			if(mailID > -1){BindPageData(mailID);}
		}
	}
	private void BindPageData(int mailID)
	{   ///显示邮件的信息
		Mail mail = new Mail();
		SqlDataReader dr = mail.GetSingleMail(mailID);
		if(dr == null) return;
		if(dr.Read())
		{   ///显示邮件的属性
			tbName.Text = dr["Name"].ToString();
			tbCC.Text = dr["CCAddress"].ToString();
			tbTo.Text = dr["TOAddress"].ToString();
			tbBody.Text = dr["Body"].ToString();
			cbHtmlFormt.Checked = dr["ISHtmlFormat"].ToString().ToLower() == "true" ? true : false;
			///显示邮件的附件
			Web2ASPNET2.CommonOperation.DataBinder.BindGridViewData(
				gvAttachment,mail.GetAttachmentsByMail(mailID));
			gvAttachment.Visible = gvAttachment.Rows.Count > 0 ? true : false;
		}
		dr.Close();
	}
	protected void btnSender_Click(object sender,EventArgs e)
	{   ///重定向到发送邮件页面
		Response.Redirect("~/Mail/SenderMail.aspx?MailID=" + mailID.ToString());
	}
	protected void btnReturn_Click(object sender,EventArgs e)
	{   
		Response.Redirect("~/Mail/ViewMail.aspx");   ///返回收件箱
	}
}
