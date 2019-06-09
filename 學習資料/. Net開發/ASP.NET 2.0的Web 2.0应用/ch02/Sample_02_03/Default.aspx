<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
	
	protected void Page_Init(object sender,EventArgs e)
	{   ///输出事件名称
		Context.Response.Write("Page_Init事件。<br />");
	}
	
	protected void Page_Load(object sender,EventArgs e)
	{   ///输出事件名称
		Context.Response.Write("Page_Load事件。<br />");
	}	

	protected void Page_PreRender(object sender,EventArgs e)
	{   ///输出事件名称
		Context.Response.Write("Page_PreRender事件。<br />");
	}

	protected void Page_Unload(object sender,EventArgs e)
	{   ///输出事件名称
		Context.Response.Write("Page_Unload事件。<br />");
	}
	
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>验证页面的运行过程</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
</body>
</html>
