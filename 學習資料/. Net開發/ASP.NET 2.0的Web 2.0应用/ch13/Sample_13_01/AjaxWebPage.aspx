<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AjaxWebPage.aspx.cs" Inherits="AjaxWebPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>提供无刷新的Web环境</title>
</head>
<body>
    <form id="form1" runat="server">
	<asp:ScriptManager ID="smForm" runat="server" />
		<asp:UpdatePanel runat="server" ID="upForm">
			<ContentTemplate>
				<asp:GridView ID="gvUser" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False"
					BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px"
					CellPadding="4" DataKeyNames="ID" DataSourceID="sqlDSUser" Font-Size="9pt" GridLines="Horizontal" Width="100%" PageSize="5">
					<FooterStyle BackColor="White" ForeColor="#333333" />
					<Columns>
						<asp:CommandField ShowSelectButton="True" />
						<asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
							SortExpression="ID" />
						<asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
						<asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
						<asp:BoundField DataField="CreateDate" HeaderText="CreateDate" SortExpression="CreateDate" />
					</Columns>
					<RowStyle BackColor="White" ForeColor="#333333" />
					<SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
					<PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
					<HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
				</asp:GridView>
				<asp:SqlDataSource ID="sqlDSUser" runat="server" ConnectionString="<%$ ConnectionStrings:SQLCONNECTIONSTRING %>"
					SelectCommand="SELECT [ID], [Username], [Email], [CreateDate] FROM [User]"></asp:SqlDataSource>
			</ContentTemplate>
		</asp:UpdatePanel>
    </form>
</body>
</html>
