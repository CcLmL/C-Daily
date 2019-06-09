<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ShowTags.aspx.cs" Inherits="Portal_ShowTags" StylesheetTheme="Web2ASPNET2" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <table class="Table" cellpadding="2" width="780" cellspacing="0" border="1" bordercolor="#daeeee">
		<tr>
			<td>
				<asp:DataList ID="dlTag" runat="server" RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Flow" SkinID="dlSkin">
					<ItemTemplate>
						<a href='ViewTag.aspx?TagID=<%# Eval("ID") %>'><%# Eval("Name") %>(<%# Eval("ViewCount") %>)</a>
					</ItemTemplate>
				</asp:DataList>
			</td>
		</tr>
    </table>   
    </form>
</body>
</html>
