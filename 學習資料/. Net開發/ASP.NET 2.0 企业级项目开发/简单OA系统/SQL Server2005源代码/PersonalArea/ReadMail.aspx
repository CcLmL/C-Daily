<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ReadMail.aspx.cs" Inherits="PersonalArea_ReadMail" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 487px">
        <tr>
            <td>
                邮件服务器：</td>
            <td>
                <asp:TextBox ID="txtpop" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="height: 26px">
                邮件登录名：</td>
            <td style="height: 26px">
                <asp:TextBox ID="txtusername" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>
                邮件密码：</td>
            <td>
                <asp:TextBox ID="txtpass" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>
                收到的新邮件列表</td>
            <td>
                <asp:TextBox ID="txtlist" runat="server" Rows="6" TextMode="MultiLine"></asp:TextBox></td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="接收" Width="94px" /></td>
            <td>
            </td>
        </tr>
    </table>
</asp:Content>

