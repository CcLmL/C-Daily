<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SendMail.aspx.cs" Inherits="PersonalArea_SendMail" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 574px">
        <tr>
            <td style="width: 65px">
                收件人</td>
            <td style="width: 187px">
                <asp:TextBox ID="txtrec" runat="server" Width="248px"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 65px; height: 26px">
                主题</td>
            <td style="width: 187px; height: 26px">
                <asp:TextBox ID="txtsubject" runat="server" Width="246px"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 65px">
                内容</td>
            <td style="width: 187px">
                <asp:TextBox ID="txtcontent" runat="server" Rows="6" TextMode="MultiLine" Width="245px"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 65px">
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="发送" Width="112px" /></td>
            <td style="width: 187px">
            </td>
        </tr>
    </table>
</asp:Content>

