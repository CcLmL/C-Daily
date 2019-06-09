<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">	
	protected void btnRedirect_Click(object sender,EventArgs e)
	{
		Response.Redirect("Dir.aspx");	///重定向到Dir.aspx页面		
	}
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>重定向页面</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
		<asp:Button ID="btnRedirect" runat="server" Text="重定向到Dir.aspx页面" OnClick="btnRedirect_Click" />
    </div>
    </form>
</body>
</html>
