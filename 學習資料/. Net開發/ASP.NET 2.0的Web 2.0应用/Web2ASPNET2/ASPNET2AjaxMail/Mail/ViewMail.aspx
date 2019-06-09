<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewMail.aspx.cs" Inherits="Mail_ViewMail" StylesheetTheme="Web2ASPNET2" %>
<%@ Register Src="../UserControl/ModuleTitle.ascx" TagName="ModuleTitle" TagPrefix="ucTitle" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body style="margin:0;border:0" class="Body">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="smForm" runat="server"/>
    <asp:UpdatePanel ID="upForm" runat="server" UpdateMode="Always" RenderMode="Block">
		<ContentTemplate>
			<table class="Table" width="100%" cellpadding="2" cellspacing="0" border="1" bordercolor="#daeeee">
				<tr>
					<td><ucTitle:ModuleTitle ID="ucTitle" runat="server" Title="发件箱" /></td>
				</tr>	
				<tr>
					<td>
						<asp:GridView ID="gvMail" runat="server" AutoGenerateColumns="False" Font-Names="Tahoma" Width="100%" SkinID="gvSkin" DataKeyNames="ID">
							<HeaderStyle Font-Names="Tahoma" HorizontalAlign="Center" />
							<EmptyDataTemplate>
								发件箱为空。
							</EmptyDataTemplate>					
							<EmptyDataRowStyle ForeColor="Blue" />
							<RowStyle BorderColor="#DAEEEE" BorderStyle="Ridge" BorderWidth="1px" HorizontalAlign="Center" />
							<Columns>
								<asp:TemplateField ItemStyle-Width="2%" ItemStyle-HorizontalAlign="center">
									<ItemTemplate>
										<asp:CheckBox ID="cbMail" runat="server" />
									</ItemTemplate>
								</asp:TemplateField>
								<asp:TemplateField ItemStyle-Width="35%" ItemStyle-HorizontalAlign="Left" HeaderText="发件人">
									<ItemTemplate>
										<a href='ReaderMail.aspx?MailID=<%#Eval("ID") %>'><%# Eval("FromAddress")%></a> 
									</ItemTemplate>
								</asp:TemplateField>
								<asp:TemplateField ItemStyle-Width="16%" ItemStyle-HorizontalAlign="center" HeaderText="发送时间">
									<ItemTemplate>
										<%# Eval("CreateDate","{0:d}")%>
									</ItemTemplate>
								</asp:TemplateField>
								<asp:TemplateField ItemStyle-Width="35%" ItemStyle-HorizontalAlign="center" HeaderText="主题">
									<ItemTemplate>
										<%# Eval("Name")%>
									</ItemTemplate>
								</asp:TemplateField>
								<asp:TemplateField ItemStyle-Width="12%" ItemStyle-HorizontalAlign="center" HeaderText="邮件大小">
									<ItemTemplate>
										<%# (int)Eval("Size") / 1024 %>KB
									</ItemTemplate>
								</asp:TemplateField>					
							</Columns>
						</asp:GridView>
					</td>
				</tr>
				<tr>
					<td><asp:DropDownList ID="ddlTag" runat="server" SkinID="ddlSkin"></asp:DropDownList><asp:Button ID="btnTag" runat="server" Text="标记选择的邮件" SkinID="btnSkin" OnClick="btnTag_Click" /></td>
				</tr>
			</table>    
		</ContentTemplate> 
    </asp:UpdatePanel>
    </form>
</body>
</html>
