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
using Web2ASPNET2.CommonOperation;
using Web2ASPNET2.UserCommonOperation;
using System.Data.SqlClient;
using Web2ASPNET2.ASPNET2AjaxMail;

public partial class Admin_SystemConfig:System.Web.UI.Page
{
	protected void Page_Load(object sender,EventArgs e)
	{
		if(!Page.IsPostBack)
		{   ///显示系统配置信息
			BindMailProfile();
		}
	}

	private void BindMailProfile()
	{   ///获取系统配置信息
		Mail mail = new Mail();
		SqlDataReader dr = mail.GetMailProfile();
		if(dr.Read())
		{   ///获取邮件服务器IP地址
			tbIP.Text = dr["IP"].ToString();
			///获取邮件服务器端口
			tbPort.Text = dr["Port"].ToString();
		}
		dr.Close();
	}
	
	protected void btnStore_Click(object sender,EventArgs e)
	{
		///保存用户的配置
		Mail mail = new Mail();
		if(mail.SaveASMailProfile(tbIP.Text.Trim(),DataTypeConvert.ConvertToInt(tbPort.Text.Trim())) > 0)
		{
			Dialog.OpenDialogInAjax((Button)sender,"恭喜您，保存系统配置成功……");
		}
	}
}
