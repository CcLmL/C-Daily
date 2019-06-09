<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BrowseMessage.aspx.cs" Inherits="Portal_Message_BrowseMessage" StylesheetTheme="Web2ASPNET2" %>
<%@ Register Src="../../UserControl/ModuleTitle.ascx" TagName="ModuleTitle" TagPrefix="ucTitle" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>无标题页</title>    
</head>
<body style="margin:0;border:0" class="Body">
    <form id="form1" runat="server">    
    <table class="Table" cellpadding="2" cellspacing="0" border="1" bordercolor="#daeeee">
		<tr>
			<td colspan="2"><ucTitle:ModuleTitle ID="ucMsgTitle" runat="server" Title="查看短信息" /></td>
		</tr>	
		<tr>
			<td colspan="2">
				<asp:GridView ID="gvMessage" runat="server" AutoGenerateColumns="False" Font-Names="Tahoma" Width="100%" SkinID="gvSkin" PageSize="30" DataKeyNames="ID" OnRowCommand="gvMessage_RowCommand" OnRowDataBound="gvMessage_RowDataBound">
					<EmptyDataTemplate>
						你的短信息为空。
					</EmptyDataTemplate>					
					<Columns>
						<asp:TemplateField HeaderText="内容" HeaderStyle-HorizontalAlign="left" ItemStyle-HorizontalAlign="left">
							<ItemTemplate>
								<a href='ViewMessage.aspx?MessageID=<%# Eval("ID") %>'><%# Eval("Body").ToString().Length > 60 ? Eval("Body").ToString().Substring(0,60) + "..." : Eval("Body")%></a>
							</ItemTemplate>
							<ItemStyle Width="55%" />
						</asp:TemplateField>
						<asp:BoundField DataField="Sender" HeaderText="发送者" >
							<ItemStyle Width="14%" />
						</asp:BoundField>
						<asp:BoundField DataField="CreateDate" DataFormatString="{0:yyyy-MM-dd}" HtmlEncode="False" HeaderText="发送时间" >
							<ItemStyle Width="15%" />
						</asp:BoundField>	
						<asp:TemplateField HeaderText="状态">
							<ItemTemplate>
								<asp:Image ID="imgState" runat="server" ImageUrl='<%# "~/App_Themes/Web2ASPNET2/Images/" + FormatStateImage(byte.Parse(Eval("State").ToString())) %>' />								
							</ItemTemplate>
							<ItemStyle Width="8%" />
						</asp:TemplateField>								
						<asp:TemplateField HeaderText="操作">
							<ItemTemplate>
								<asp:ImageButton ID="ibtReply" runat="server" CommandName="reply" ImageUrl="~/App_Themes/Web2ASPNET2/Images/reply.gif" AlternateText="回复该条短信息" CommandArgument='<%# Eval("Sender") %>' />&nbsp;&nbsp;
								<asp:ImageButton ID="ibtDelete" runat="server" CommandName="del" ImageUrl="~/App_Themes/Web2ASPNET2/Images/delete.gif" AlternateText="删除该条短信息" CommandArgument='<%# Eval("ID") %>' />
							</ItemTemplate>
							<ItemStyle Width="8%" />
						</asp:TemplateField>						
					</Columns><HeaderStyle Font-Names="Tahoma" HorizontalAlign="Center" /><EmptyDataRowStyle ForeColor="Blue" />
					<RowStyle BorderColor="#DAEEEE" BorderStyle="Ridge" BorderWidth="1px" HorizontalAlign="Center" />
				</asp:GridView>
			</td>
		</tr>		
		<tr>
			<td width="150" height="25" valign="middle" class="LeftTD" align="right"><asp:Label ID="Label1" runat="server" Width="150px"></asp:Label></td>
			<td valign="middle" width="100%">
				<asp:Button ID="btnAdd" runat="server" BackColor="#DAEEEE" Text="发送新的短信息" CssClass="Button" OnClick="btnAdd_Click" SkinID="btnSkin"/>&nbsp;&nbsp;&nbsp;
			</td>
		</tr>
    </table>    
    </form>
</body>
</html>
