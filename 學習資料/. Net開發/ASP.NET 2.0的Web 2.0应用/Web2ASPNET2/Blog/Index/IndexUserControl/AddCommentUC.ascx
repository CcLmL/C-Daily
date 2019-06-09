<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AddCommentUC.ascx.cs" Inherits="Index_IndexUserControl_AddCommentUC" %>
<table class="Table" cellpadding="2" cellspacing="0" border="1" bordercolor="#daeeee">
	<tr>
		<td width="150" height="30" valign="middle" class="LeftTD" align="right">标题:</td>
		<td valign="middle"><asp:TextBox ID="tbName" CssClass="TextBox" runat="server" SkinID="tbSkin" MaxLength="200" Width="300px"></asp:TextBox><asp:RequiredFieldValidator ID="rfName" runat="server" ControlToValidate="tbName"	ErrorMessage="不能为空。" Display="Dynamic"></asp:RequiredFieldValidator>
		</td>
	</tr>	
	<tr>
		<td width="150" height="30" valign="middle" class="LeftTD" align="right">姓名:</td>
		<td valign="middle"><asp:TextBox ID="tbUserName" CssClass="TextBox" runat="server" SkinID="tbSkin" MaxLength="200" Width="300px" Enabled="False" ForeColor="Gray"></asp:TextBox>
		</td>
	</tr>	
	<tr>
		<td width="150" height="30" valign="top" class="LeftTD" align="right">内容:</td>
		<td valign="middle"><asp:TextBox ID="tbBody" CssClass="TextBox" runat="server" SkinID="tbSkin" Width="100%" Height="100px" TextMode="MultiLine"></asp:TextBox><asp:RequiredFieldValidator ID="rfBody" runat="server" ControlToValidate="tbBody"	ErrorMessage="不能为空。" Display="Dynamic"></asp:RequiredFieldValidator>
		</td>
	</tr>	
	<tr>
		<td width="30" height="30" valign="middle" class="LeftTD" align="right">
			<asp:Label ID="Label1" runat="server" Width="30px"></asp:Label></td>
		<td valign="middle" width="100%">
			<asp:Button ID="btnAdd" runat="server" Text="发表评论" CssClass="Button" OnClick="btnAdd_Click" SkinID="btnSkin" Enabled="False" Width="100px" /></td>
	</tr>
</table>    