<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Weather.aspx.cs"   Inherits="ShareArea_Weather" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 589px">
        <tr>
            <td style="width: 100px">
                输入城市</td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server" Width="203px">上海</asp:TextBox></td>
            <td>
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="搜索" Width="69px" /></td>
        </tr>
        <tr>
            <td colspan="3" style="height: 31px">
                <asp:Label ID="Label1" runat="server" Text="Label" Width="545px">
                 </asp:Label></td>
        </tr>
    </table>
</asp:Content>

