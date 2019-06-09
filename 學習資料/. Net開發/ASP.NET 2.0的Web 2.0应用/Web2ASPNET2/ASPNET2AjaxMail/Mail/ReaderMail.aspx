<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ReaderMail.aspx.cs" Inherits="Mail_ReaderMail" StylesheetTheme="Web2ASPNET2" %>
<%@ Register Src="../UserControl/ModuleTitle.ascx" TagName="ModuleTitle" TagPrefix="ucTitle" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body style="margin:0;border:0" class="Body">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="smForm" runat="server" />
    <asp:UpdatePanel ID="upForm" runat="server" UpdateMode="Always" RenderMode="Block">
		<ContentTemplate>
			<table class="Table" cellpadding="2" cellspacing="0" border="1" bordercolor="#daeeee">
				<tr>
					<td colspan="2"><ucTitle:ModuleTitle ID="ModuleTitle1" runat="server" Title="读邮件" /></td>
				</tr>		
				<tr>
					<td width="150" height="30" valign="middle" class="LeftTD" align="right">
						收件人:</td>
					<td valign="middle"><asp:TextBox ID="tbTo" CssClass="TextBox" runat="server" SkinID="tbSkin" MaxLength="255" Width="300px"></asp:TextBox>
					</td>
				</tr>	
				<tr>
					<td width="150" height="30" valign="middle" class="LeftTD" align="right">
						抄送:</td>
					<td valign="middle"><asp:TextBox ID="tbCC" CssClass="TextBox" runat="server" SkinID="tbSkin" MaxLength="500" Width="300px"></asp:TextBox>
					</td>
				</tr>	
				<tr>
					<td width="150" height="30" valign="middle" class="LeftTD" align="right">
						主题:</td>
					<td valign="middle"><asp:TextBox ID="tbName" CssClass="TextBox" runat="server" SkinID="tbSkin" MaxLength="200" Width="300px"></asp:TextBox>
					</td>
				</tr>
				<tr>
					<td width="150" height="30" valign="middle" class="LeftTD" align="right">
						内容:</td>
					<td valign="middle"><asp:TextBox ID="tbBody" CssClass="TextBox" runat="server" SkinID="tbSkin" Width="100%" Height="100px" TextMode="MultiLine"></asp:TextBox>
					</td>
				</tr>		
				<tr>
					<td width="150" height="30" valign="middle" class="LeftTD" align="right">邮件格式:</td>
					<td valign="middle"><input id="cbHtmlFormt" type="checkbox" runat="server" />HTML格式
					</td>
				</tr>		
				<tr>
					<td width="150" height="30" valign="middle" class="LeftTD" align="right">邮件附件列表:</td>
					<td valign="middle">
						<asp:GridView ID="gvAttachment" runat="server" AutoGenerateColumns="False" Font-Names="Tahoma" Width="100%" SkinID="gvSkin" DataKeyNames="ID">
							<HeaderStyle Font-Names="Tahoma" HorizontalAlign="Center" />
							<RowStyle BorderColor="#DAEEEE" BorderStyle="Ridge" BorderWidth="1px" HorizontalAlign="Center" />
							<Columns>
								<asp:TemplateField ItemStyle-Width="35%" ItemStyle-HorizontalAlign="Left" HeaderText="标题">
									<ItemTemplate>
										<a href='<%#Eval("Url") %>'><%# Eval("Name")%></a> 
									</ItemTemplate>
								</asp:TemplateField>
								<asp:TemplateField ItemStyle-Width="16%" ItemStyle-HorizontalAlign="center" HeaderText="类型">
									<ItemTemplate>
										<%# Eval("Type")%>
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
					<td width="150" height="30" valign="middle" class="LeftTD" align="right">
						<asp:Label ID="Label1" runat="server" Width="150px"></asp:Label></td>
					<td valign="middle" width="100%">
						<asp:Button ID="btnSender" runat="server" Text="回   复" CssClass="Button" OnClick="btnSender_Click" SkinID="btnSkin" />&nbsp;&nbsp;&nbsp;
						<asp:Button ID="btnReturn" runat="server" CssClass="Button" Text="返   回" CausesValidation="False" OnClick="btnReturn_Click" SkinID="btnSkin" /></td>
				</tr>
			</table>    
		</ContentTemplate> 
    </asp:UpdatePanel>
    </form>
</body>
</html>
