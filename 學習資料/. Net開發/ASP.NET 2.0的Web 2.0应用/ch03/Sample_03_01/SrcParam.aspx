<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">	
	protected void btnRedirect_Click(object sender,EventArgs e)
	{   ///重定向到Dir.aspx页面，并携带参数（tbContent控件的值）
		Response.Redirect("DirParam.aspx?ParamValue=" + tbContent.Text);			
	}
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>传递页面间的参数</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
		<asp:TextBox ID="tbContent" runat="server" Height="64px" TextMode="MultiLine"></asp:TextBox>
		<asp:Button ID="btnRedirect" runat="server" Text="重定向到Dir.aspx页面" OnClick="btnRedirect_Click" />
    </div>
    </form>
</body>
</html>
