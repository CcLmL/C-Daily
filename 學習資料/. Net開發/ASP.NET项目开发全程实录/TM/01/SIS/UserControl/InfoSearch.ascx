<%@ Control Language="C#" AutoEventWireup="true" CodeFile="InfoSearch.ascx.cs" Inherits="UserControl_InfoSearch" %>
<table align="center" cellpadding="0" cellspacing="0" width="184">
    <tr>
        <td align="left" class="henhong">
            输入关键字</td>
    </tr>
    <tr>
        <td align="left">
            <asp:TextBox ID="txtKey" runat="server" CssClass="TextBox" Width="184px"></asp:TextBox></td>
    </tr>
    <tr>
        <td align="left" height="36">
            <a href="#"></a>
            &nbsp;<asp:ImageButton ID="ImageButton1" runat="server" AlternateText="开始搜索" Height="22px"
                Width="67px" OnClick="ImageButton1_Click" ImageUrl="~/images/anhiu1.jpg" />
            <asp:ImageButton ID="ImageButton2" runat="server" AlternateText="搜索帮助？" Height="22px"
                Width="67px" ImageUrl="~/images/anhiu2.jpg" PostBackUrl="~/Help.aspx" /><a href="#"></a></td>
    </tr>
</table>
