<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
	void Page_Load(Object sender,EventArgs e)
	{   
		ArrayList colors = new ArrayList();
		
		colors.Add("Red");
		colors.Add("Green");
		colors.Add("Yellow");
		colors.Add("Blue");
		
		///绑定控件的数据
		rpColor.DataSource = colors;
		rpColor.DataBind();
	}
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>数据绑定表达式</title>
</head>
<body>
    <form id="form1" runat="server">
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