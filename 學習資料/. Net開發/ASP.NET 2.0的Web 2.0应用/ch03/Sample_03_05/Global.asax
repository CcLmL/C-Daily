<%@ Application Language="C#" %>

<script runat="server">

	/// <summary>
	/// 静态变量WebViewCount用来统计网站被访问的总次数
	/// </summary>
	public static int WebViewCount = 0;

	string eventStr = "【{0}】正在执行【{1}】事件……<br />";
	
	public void Application_OnStart(object sender,EventArgs e)
	{   ///添加正在执行的事件的名称
		string str = string.Format(eventStr,sender.ToString(),"Application_OnStart");
		Application["Event"] = str;
	}
	public void Application_BeginRequest(object sender,EventArgs e)
	{   ///添加正在执行的事件的名称
		string str = string.Format(eventStr,sender.ToString()," Application_BeginRequest");
		Application["Event"] += str;
	}
	public void Application_AuthenticateRequest(object sender,EventArgs e)
	{   ///添加正在执行的事件的名称
		string str = string.Format(eventStr,sender.ToString(),"Application_AuthenticateRequest");
		Application["Event"] += str;
	}
	public void Application_PostAuthenticateRequest(object sender,EventArgs e)
	{   ///添加正在执行的事件的名称
		string str = string.Format(eventStr,sender.ToString(),"Application_PostAuthenticateRequest");
		Application["Event"] += str;
	}
	public void Application_AuthorizeRequest(object sender,EventArgs e)
	{   ///添加正在执行的事件的名称
		string str = string.Format(eventStr,sender.ToString(),"Application_AuthorizeRequest");
		Application["Event"] += str;
	}
	public void Application_ResolveRequestCache(object sender,EventArgs e)
	{   ///添加正在执行的事件的名称
		string str = string.Format(eventStr,sender.ToString(),"Application_ResolveRequestCache");
		Application["Event"] += str;
	}
	public void Application_PostResolveRequestCache(object sender,EventArgs e)
	{   ///添加正在执行的事件的名称
		string str = string.Format(eventStr,sender.ToString(),"Application_PostResolveRequestCache");
		Application["Event"] += str;
	}	
	public void Session_OnStart(object sender,EventArgs e)
	{   ///添加正在执行的事件的名称
		string str = string.Format(eventStr,sender.ToString(),"Session_OnStart");
		Application["Event"] += str;
	}	
	public void Application_AcquireRequestState(object sender,EventArgs e)
	{   ///添加正在执行的事件的名称
		string str = string.Format(eventStr,sender.ToString(),"Application_AcquireRequestState");
		Application["Event"] += str;
	}
	public void Application_PreRequestHandlerExecute(object sender,EventArgs e)
	{   ///添加正在执行的事件的名称
		string str = string.Format(eventStr,sender.ToString(),"Application_PreRequestHandlerExecute");
		Application["Event"] += str;
	}
	public void Application_ReleaseRequestState(object sender,EventArgs e)
	{   ///添加正在执行的事件的名称
		string str = string.Format(eventStr,sender.ToString(),"Application_ReleaseRequestState");
		Application["Event"] += str;
	}
	public void Application_PostReleaseRequestState(object sender,EventArgs e)
	{   ///添加正在执行的事件的名称
		string str = string.Format(eventStr,sender.ToString(),"Application_PostReleaseRequestState");
		Application["Event"] += str;
	}
	public void Application_UpdateRequestCache(object sender,EventArgs e)
	{   ///添加正在执行的事件的名称
		string str = string.Format(eventStr,sender.ToString(),"Application_UpdateRequestCache");
		Application["Event"] += str;
	}	
	public void Application_EndRequest(object sender,EventArgs e)
	{   ///添加事件的名称
		string str = string.Format(eventStr,sender.ToString(),"Application_EndRequest");
		Application["Event"] += str;
	}
	public void Application_PreSendRequestHeaders(object sender,EventArgs e)
	{   ///添加正在执行的事件的名称
		string str = string.Format(eventStr,sender.ToString(),"Application_PreSendRequestHeaders");
		Application["Event"] += str;
	}
	public void Application_PreSendRequestContent(object sender,EventArgs e)
	{   ///添加正在执行的事件的名称
		string str = string.Format(eventStr,sender.ToString(),"Application_PreSendRequestContent");
		Application["Event"] += str;
	}	
	public void Application_PostRequestHandlerExecute(object sender,EventArgs e)
	{   ///添加正在执行的事件的名称
		string str = string.Format(eventStr,sender.ToString(),"Application_PostRequestHandlerExecute");
		Application["Event"] += str;
	}
</script>
