<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

	protected void btnReturn_Click(object sender,EventArgs e)
	{
		Response.Redirect("DirPage.aspx");
	}
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>获取上一页地址</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
		<asp:Button ID="btnReturn" runat="server" Text="下一页" OnClick="btnReturn_Click" />
    </div>
    </form>
</body>
</html>
