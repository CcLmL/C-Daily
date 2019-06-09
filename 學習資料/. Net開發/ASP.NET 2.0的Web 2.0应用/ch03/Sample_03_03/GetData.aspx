<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
	protected void Page_Load(object sender,EventArgs e)
	{
		if(Application["WebData"] != null)
		{
			Response.Write("网站数据：" + Application["WebData"].ToString() + "<br />");
		}
		if(Session["UserData"] != null)
		{
			Response.Write("用户数据：" + Session["UserData"].ToString() + "<br />");
		}
		if(ViewState["PageData"] != null)
		{
			Response.Write("页面数据：" + ViewState["PageData"].ToString() + "<br />");
		}
		else
		{
			Response.Write("页面数据为空。");
		}			
	}
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
</body>
</html>
