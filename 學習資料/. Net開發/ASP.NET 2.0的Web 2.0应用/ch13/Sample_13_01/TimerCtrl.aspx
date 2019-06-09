<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TimerCtrl.aspx.cs" Inherits="TimerCtrl" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>定时更新网页</title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="smForm" runat="server" />
		<asp:UpdatePanel runat="server" ID="upForm">
			<ContentTemplate>
				<asp:DropDownList ID="ddlUser" runat="server" DataSourceID="sqlDSUser" Width="150px" DataTextField="Username" DataValueField="ID" OnSelectedIndexChanged="ddlUser_SelectedIndexChanged"></asp:DropDownList>
				<asp:Label ID="lbUsername" runat="server"></asp:Label>
				<asp:SqlDataSource ID="sqlDSUser" runat="server" ConnectionString="<%$ ConnectionStrings:SQLCONNECTIONSTRING %>"
					SelectCommand="SELECT [ID], [Username], [Email], [CreateDate] FROM [User]"></asp:SqlDataSource>
				<asp:Timer ID="tUser" runat="server" Interval="1000" OnTick="tUser_Tick">
				</asp:Timer>
			</ContentTemplate>
		</asp:UpdatePanel>	
    </form>
</body>
</html>
