<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
	protected void Page_Load(object sender,EventArgs e)
	{
		Response.Write("这是一段文本。");
		Response.Write("<br />");    ///输出换行符号
		string table = "<table border=1><tr><td width=100 bgcolor=Red>这是一个表格</td></tr></table>";
		Response.Write(table);				 
	}	
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>输出文本和HTML字符串</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
</body>
</html>
