<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
	protected void gvFile_RowCommand(object sender,GridViewCommandEventArgs e)
	{
		if(e.CommandName.ToLower() == "download")
		{   ///重定向到下载文件页面
			Response.Redirect("File.aspx?FileID=" + e.CommandArgument.ToString());
		}
	}
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>下载文件</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
		<asp:GridView ID="gvFile" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataKeyNames="ID" DataSourceID="mySqlDSFile" OnRowCommand="gvFile_RowCommand">
			<FooterStyle BackColor="White" ForeColor="#333333" />
			<Columns>
				<asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
					SortExpression="ID" />
				<asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
				<asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
				<asp:TemplateField>
					<ItemTemplate>
						<asp:LinkButton ID="btnFile" runat="server" CommandName="download" Text="下载" CommandArgument='<%# Eval("ID") %>'></asp:LinkButton>
					</ItemTemplate>
				</asp:TemplateField>				
			</Columns>
			<RowStyle BackColor="White" ForeColor="#333333" />
			<SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
			<PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
			<HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
		</asp:GridView>
		<asp:SqlDataSource ID="mySqlDSFile" runat="server" ConnectionString="<%$ ConnectionStrings:WEB2ASPNET2DBConnectionString %>"
			SelectCommand="SELECT [ID], [Name], [Type], [Data] FROM [Files]"></asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
