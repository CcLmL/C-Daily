<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
	protected void Page_Load(object sender,EventArgs e)
	{   ///判断接收到的参数是否为空
		if(Request.Params["ParamValue"] != null)
		{   ///如果不为空，则输出该参数的值
			Response.Write(Request.Params["ParamValue"].ToString());
		}
	}
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>接收参数的目的页面</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
</body>
</html>
