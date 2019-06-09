<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

	private string table = "<table border=1><tr><td width=100 bgcolor=Red>这是一个表格</td></tr></table>";

	private string chineseStr = "这是一个中文字符串";
	protected void btnHTML_Click(object sender,EventArgs e)
	{   
		Response.Write(table);    ///直接输出HTML字符
		Response.Write(Server.HtmlEncode(table));   ///输出HTML编码后的字符串
	}

	protected void btnURL_Click(object sender,EventArgs e)
	{
		Response.Write(chineseStr);    ///直接输出URL字符
		Response.Write(Server.UrlEncode(chineseStr));   ///输出URL编码后的字符串
	}
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>HTML、URL编码和解码</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
		<asp:Button ID="btnHTML" runat="server" Text="HTML编码后输出" OnClick="btnHTML_Click" /><br />
		<asp:Button ID="btnURL" runat="server" Text="URL编码后输出" OnClick="btnURL_Click" />&nbsp;</div>
    </form>
</body>
</html>
