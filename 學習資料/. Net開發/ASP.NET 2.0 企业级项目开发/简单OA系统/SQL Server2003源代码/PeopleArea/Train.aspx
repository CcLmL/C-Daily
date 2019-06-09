<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Train.aspx.cs" Inherits="PeopleArea_Train" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 574px">
        <tr>
            <td>
                培训主题</td>
            <td colspan="3">
                <asp:TextBox ID="txttitle" runat="server" Width="376px"></asp:TextBox></td>
        </tr>
        <tr>
            <td>
                培训内容</td>
            <td style="width: 8px">
                <asp:TextBox ID="txtcontent" runat="server" Rows="11" TextMode="MultiLine"></asp:TextBox></td>
            <td>
                培训日期</td>
            <td>
                <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
            </td>
        </tr>
        <tr>
            <td>
                被培训的员工</td>
            <td colspan="3">
                <asp:TextBox ID="txtpeople" runat="server" Rows="2" TextMode="MultiLine" Width="393px"></asp:TextBox></td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="添加" Width="85px" /></td>
            <td style="width: 8px">
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
    </table>
</asp:Content>

