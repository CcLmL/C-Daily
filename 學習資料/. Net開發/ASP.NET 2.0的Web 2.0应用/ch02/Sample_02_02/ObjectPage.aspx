<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
	void Page_Load(object sender,EventArgs e)
	{
		colors.Add("Red");
		colors.Add("Green");
		colors.Add("Yellow");
		colors.Add("Blue");

		///设置rpColor控件的数据源为colors，并绑定该控件的数据
		rpColor.DataSource = colors;
		rpColor.DataBind();
	}
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
	<title>服务器端对象标记</title>
	<object id="colors" class="System.Collections.ArrayList" runat="server"></object>
</head>
<body>
    <form id="form2" runat="server">
    <asp:Repeater runat="server" ID="rpColor">
		<HeaderTemplate>
			<table>	
		</HeaderTemplate>
		<ItemTemplate>
			<tr>
				<td bgcolor='<%# Container.DataItem %>'><%# Container.DataItem %></td>
			</tr>
		</ItemTemplate>
		<FooterTemplate>
			</table>
		</FooterTemplate>
    </asp:Repeater>
    </form>
</body>
</html>
