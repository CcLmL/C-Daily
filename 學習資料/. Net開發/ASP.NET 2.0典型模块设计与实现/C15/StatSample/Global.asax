<%@ Application Language="C#" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e) 
    {
        // 在应用程序启动时运行的代码
        //在修改应用程序变量前要锁定
        Application.Lock();
        Application["StatCount"]=0;
        //修改完变量后，要解锁。
        Application.UnLock();
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

        //获取访问者的IP
        string ipAddress = Request.ServerVariables["REMOTE_ADDR"];
        //获取访问者的来源
        string ipSrc;
        //判断是否从搜索引擎导航过来的
        if (Request.UrlReferrer == null)
        {
            ipSrc = "";
        }
        else
        {
            //获取来源地址
            ipSrc = Request.UrlReferrer.ToString();
        }

        //获取访问时间
        DateTime ipDatetime = DateTime.Now.Date;
        //保存IP信息到数据库中
        IPControl cont = new IPControl();
        cont.AddIP(ipAddress, ipSrc, ipDatetime);

        //获取用户访问的页面
        string pageurl = Request.Url.ToString();

        //判断访问的是否是默认页
        if(pageurl.EndsWith("IPStat.aspx"))
        {
            //锁定变量
            Application.Lock();
            //为页面访问量+1
            Application["StatCount"] = int.Parse(Application["StatCount"].ToString()) + 1;
            //解锁
            Application.UnLock();
        }

    }

    void Session_End(object sender, EventArgs e) 
    {
        // 在会话结束时运行的代码。 
        // 注意: 只有在 Web.config 文件中的 sessionstate 模式设置为
        // InProc 时，才会引发 Session_End 事件。如果会话模式设置为 StateServer 
        // 或 SQLServer，则不会引发该事件。

    }
       
</script>
