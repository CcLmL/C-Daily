<%@ Application Language="C#" %>

<script runat="server">
    void Profile_MigrateAnonymous(Object sender, System.Web.Profile.ProfileMigrateEventArgs e)
    {
        //获取匿名用户的文本框设置
        if (Profile.GetProfile(e.AnonymousID).TextMode.ToString() !="")
        {
            //将匿名用户的配置赋值给当前用户
            Profile.TextMode = Profile.GetProfile(e.AnonymousID).TextMode;
        }
        //获取匿名用户的个人银行
        MyType equtype = new MyType();
        if (!Profile.GetProfile(e.AnonymousID).MyBank.Equals(equtype))
        {
            //将匿名用户的配置赋值给当前用户
            Profile.MyBank = Profile.GetProfile(e.AnonymousID).MyBank;
        }
    }

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
        // 在新会话启动时运行的代码

    }

    void Session_End(object sender, EventArgs e) 
    {
        // 在会话结束时运行的代码。 
        // 注意: 只有在 Web.config 文件中的 sessionstate 模式设置为
        // InProc 时，才会引发 Session_End 事件。如果会话模式设置为 StateServer 
        // 或 SQLServer，则不会引发该事件。

    }
       
</script>
