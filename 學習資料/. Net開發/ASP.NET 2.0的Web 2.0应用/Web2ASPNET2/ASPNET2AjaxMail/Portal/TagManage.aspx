<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TagManage.aspx.cs" Inherits="Portal_TagManage" StylesheetTheme="Web2ASPNET2" %>
<%@ Register Src="../UserControl/ModuleTitle.ascx" TagName="ModuleTitle" TagPrefix="ucTitle" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>无标题页</title>    
</head>
<body style="margin:0;border:0" class="Body" width="100%">
    <form id="form1" runat="server" width="100%">
    <asp:ScriptManager ID="scForm" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="upForm" runat="server" RenderMode="Block">
		<ContentTemplate>
			<table class="Table" cellpadding="2" cellspacing="0" border="1" bordercolor="#daeeee">
				<tr>
					<td colspan="2"><ucTitle:ModuleTitle ID="ModuleTitle1" runat="server" Title="标签管理" /></td>
				</tr>
				<tr>
					<td colspan="2">
						<asp:GridView ID="gvTag" runat="server" AutoGenerateColumns="False" Font-Names="Tahoma" Width="100%" SkinID="gvSkin" DataKeyNames="ID" OnRowCommand="gvTag_RowCommand" OnRowDataBound="gvTag_RowDataBound">
							<HeaderStyle Font-Names="Tahoma" HorizontalAlign="Center" />
							<EmptyDataTemplate>
								标签列表为空，您可用添加新的标签。
							</EmptyDataTemplate>					
							<EmptyDataRowStyle ForeColor="Blue" />
							<RowStyle BorderColor="#DAEEEE" BorderStyle="Ridge" BorderWidth="1px" HorizontalAlign="Center" />
							<Columns>
								<asp:TemplateField ItemStyle-Width="60%" HeaderText="标签名称">
									<ItemTemplate>
										<%# Eval("Name")%>(<%# Eval("MailCount")%>)
									</ItemTemplate>
								</asp:TemplateField>
								<asp:BoundField DataField="CreateDate"  ItemStyle-Width="30%" DataFormatString="{0:d}" HeaderText="创建时间" HtmlEncode="false"/>
								<asp:TemplateField HeaderText="操作" ItemStyle-Width="10%">
									<ItemTemplate>
										<asp:ImageButton ID="ibtUpdate" runat="server" CommandName="update" ImageUrl="../App_Themes/Web2ASPNET2/Images/update.gif" AlternateText="编辑该标签" CommandArgument='<%# Eval("ID") %>' />&nbsp;&nbsp;
										<asp:ImageButton ID="ibtDelete" runat="server" CommandName="del" ImageUrl="../App_Themes/Web2ASPNET2/Images/delete.gif" AlternateText="删除该标签" CommandArgument='<%# Eval("ID") %>' />
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
						<asp:Button ID="btnAdd" runat="server" Text="添加新的标签" CssClass="Button" OnClick="btnAdd_Click" SkinID="btnSkin" Width="150px" />&nbsp;&nbsp;&nbsp;
					</td>				
				</tr>
			</table>
		</ContentTemplate>
    </asp:UpdatePanel>
    </form>
</body>
</html>