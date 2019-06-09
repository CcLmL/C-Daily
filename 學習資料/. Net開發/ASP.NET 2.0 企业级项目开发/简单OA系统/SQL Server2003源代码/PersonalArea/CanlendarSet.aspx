<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CanlendarSet.aspx.cs" Inherits="PersonalArea_CanlendarSet" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 584px">
        <tr>
            <td style="width: 141px">
                日程主题</td>
            <td>
                <asp:TextBox ID="txttitle" runat="server" Width="324px"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 141px">
                日程内容</td>
            <td>
                <asp:TextBox ID="txtcontent" runat="server" Rows="3" TextMode="MultiLine" Width="329px"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 141px">
                安排日期</td>
            <td>
                <asp:Calendar ID="Calendar1" runat="server" Width="225px"></asp:Calendar>
            </td>
        </tr>
        <tr>
            <td style="width: 141px">
            </td>
            <td>
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="确定" Width="129px" /></td>
        </tr>
    </table>
</asp:Content>

