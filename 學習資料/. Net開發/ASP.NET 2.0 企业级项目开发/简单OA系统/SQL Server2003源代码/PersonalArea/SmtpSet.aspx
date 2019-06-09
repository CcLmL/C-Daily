<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SmtpSet.aspx.cs" Inherits="PersonalArea_SmtpSet" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 586px">
        <tr>
            <td style="width: 160px">
                邮箱全名：</td>
            <td style="width: 13px">
                <asp:TextBox ID="txtmail" runat="server" Width="262px"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 160px">
                SMTP服务器</td>
            <td style="width: 13px">
                <asp:TextBox ID="txthost" runat="server" Width="260px"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 160px">
                端口：</td>
            <td style="width: 13px">
                <asp:TextBox ID="txtport" runat="server" Width="261px">25</asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 160px">
                登录密码：</td>
            <td style="width: 13px">
                <asp:TextBox ID="txtpass" runat="server" Width="257px" TextMode="Password"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 160px">
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="保存配置" Width="131px" /></td>
            <td style="width: 13px">
            </td>
        </tr>
    </table>
</asp:Content>

