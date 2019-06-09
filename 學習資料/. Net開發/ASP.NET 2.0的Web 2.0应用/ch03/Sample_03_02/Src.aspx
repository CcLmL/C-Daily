<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

	protected void btnRedirect_Click(object sender,EventArgs e)
	{
		Server.Transfer("~/Dir.aspx");		
	}

	protected void btnExecute_Click(object sender,EventArgs e)
	{
		Server.Execute("~/Dir.aspx");		
	}
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>重定向页面</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    这是源页面。<br /><asp:Button ID="btnRedirect" runat="server" Text="重定向到目的页面" OnClick="btnRedirect_Click" /><br />
		<asp:Button ID="btnExecute" runat="server" Text="执行到目的页面" OnClick="btnExecute_Click" /><br />
    </div>
    </form>
</body>
</html>
