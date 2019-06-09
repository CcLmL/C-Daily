<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
	protected void Page_Load(object sender,EventArgs e)
	{   ///使用反射机制输出浏览器各个属性的值
		foreach(System.Reflection.PropertyInfo pi in Request.Browser.GetType().GetProperties())
		{   
			object obj = new object();
			if(pi.GetType().BaseType.Name == "PropertyInfo")
			{  	///获取属性的名称及其值，并输出在页面上
				try
				{
					Response.Write(pi.Name + "=" + pi.GetValue(Request.Browser,null).ToString() + "<br />");
				}
				catch
				{
					continue;
				}
			}			
		}
	}
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>获取客户端信息</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
</body>
</html>
