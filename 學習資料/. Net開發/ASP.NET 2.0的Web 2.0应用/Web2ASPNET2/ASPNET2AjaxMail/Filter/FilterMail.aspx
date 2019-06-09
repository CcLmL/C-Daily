<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FilterMail.aspx.cs" Inherits="Filter_FilterMail" StylesheetTheme="Web2ASPNET2" %>
<%@ Register Src="../UserControl/ModuleTitle.ascx" TagName="ModuleTitle" TagPrefix="ucTitle" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>无标题页</title>
</head>
<body style="margin:0;border:0" class="Body">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="smForm" runat="server"/>
    <asp:UpdatePanel ID="upForm" runat="server" UpdateMode="Always" RenderMode="Block">
		<ContentTemplate>
			<table class="Table" width="100%" cellpadding="2" cellspacing="0" border="1" bordercolor="#daeeee">
				<tr>
					<td><ucTitle:ModuleTitle ID="ucTitle" runat="server" Title="过滤邮件" /></td>
				</tr>	
				<tr>
					<td>
						<asp:GridView ID="gvMail" runat="server" AutoGenerateColumns="False" Font-Names="Tahoma" Width="100%" SkinID="gvSkin" DataKeyNames="ID">
							<HeaderStyle Font-Names="Tahoma" HorizontalAlign="Center" />
							<RowStyle BorderColor="#DAEEEE" BorderStyle="Ridge" BorderWidth="1px" HorizontalAlign="Center" />
							<Columns>
								<asp:TemplateField ItemStyle-Width="37%" ItemStyle-HorizontalAlign="Left" HeaderText="发件人">
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
			</table>    
		</ContentTemplate> 
    </asp:UpdatePanel>
    </form>
</body>
</html>
