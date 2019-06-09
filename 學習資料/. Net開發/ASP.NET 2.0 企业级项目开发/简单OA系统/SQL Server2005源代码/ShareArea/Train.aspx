<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Train.aspx.cs" Inherits="ShareArea_Train" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 596px; height: 190px;">
        <tr>
            <td style="width: 154px">
                输入车次</td>
            <td style="width: 292px">
                <asp:TextBox ID="TextBox1" runat="server" Width="278px"></asp:TextBox></td>
            <td>
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="搜索" Width="67px" /></td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Label ID="Label1" runat="server"  Width="422px"></asp:Label></td>
        </tr>
    </table>
</asp:Content>

