<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ModuleTitle.ascx.cs" Inherits="UserControl_ModuleTitle" %>
<table class="Table" bgcolor="#D8E7FA" width="100%" cellpadding="0" cellspacing="0" border="1">		
	<tr>
		<td background='<%# Request.ApplicationPath + "/App_Themes/Web2ASPNET2/Images/titlebg.jpg" %>' colspan="2" height="25">
			<table height="25" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td height="25" valign="middle" align="center">&nbsp;&nbsp;&nbsp;<asp:Image ID="bgImage" runat="server" ImageUrl="~/App_Themes/Web2ASPNET2/Images/titleindex.gif" /></td>
					<td><font class="ModuleTitle">&nbsp;&nbsp;<b><%=title %></b></font></td>
				</tr>
			</table>
		</td>
	</tr>		
</table>