<%@ Application Language="C#" %>
<script runat="server">

    void Application_Start(object sender, EventArgs e) 
    {
        // 在应用程序启动时运行的代码

    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  在应用程序关闭时运行的代码

    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // 在出现未处理的错误时运行的代码

    }

    void Session_Start(object sender, EventArgs e) 
    {
		///获取系统配置信息
		Web2ASPNET2.ASPNET2AjaxMail.AjaxMailProfile profile = new Web2ASPNET2.ASPNET2AjaxMail.AjaxMailProfile();
		Web2ASPNET2.ASPNET2AjaxMail.Mail mail = new Web2ASPNET2.ASPNET2AjaxMail.Mail();
		System.Data.SqlClient.SqlDataReader dr = mail.GetMailProfile();
		if(dr.Read())
		{   ///获取邮件服务器IP地址
			profile.ServerIP = dr["IP"].ToString();
			///获取邮件服务器端口
			profile.ServerPort = Web2ASPNET2.CommonOperation.DataTypeConvert.ConvertToInt(
				dr["Port"].ToString());
		}
		dr.Close();
		///保存应用程序的配置
		Application["MailProfile"] = profile;		
    }

    void Session_End(object sender, EventArgs e) 
    {
        // 在会话结束时运行的代码。 
        // 注意: 只有在 Web.config 文件中的 sessionstate 模式设置为
        // InProc 时，才会引发 Session_End 事件。如果会话模式设置为 StateServer 
        // 或 SQLServer，则不会引发该事件。

    }
       
</script>
