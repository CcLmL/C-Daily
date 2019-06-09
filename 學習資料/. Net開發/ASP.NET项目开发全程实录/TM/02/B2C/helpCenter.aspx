<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="helpCenter.aspx.cs" Inherits="helpCenter" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table style=" font-size: 9pt; font-family: 宋体; width:574px; height :806px; background-repeat :no-repeat; background-image: url(images/显示页面当前位置.jpg);">
<tr>
<td  valign =top >
<br />
        <asp:Label id="labHelp" style="Z-INDEX: 102; LEFT: 344px;" runat="server"
					Width="188px" Font-Size="9pt" ForeColor="Black"></asp:Label><br /><br />
				<asp:TextBox id="txtRead" style="Z-INDEX: 103; LEFT: 344px;" runat="server"
			Width="530px" Height="355px" TextMode="MultiLine" ReadOnly="True"></asp:TextBox>

</td>
</tr>
</table>
</asp:Content>

