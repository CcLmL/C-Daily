<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Check.aspx.cs" Inherits="PeopleArea_Check" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 585px">
        <tr>
            <td style="width: 118px">
                员工姓名</td>
            <td >
                <asp:TextBox ID="txtname" runat="server"></asp:TextBox></td>
            <td >
            </td>
            <td >
            </td>
        </tr>
        <tr>
            <td style="width: 118px" >
                考核内容</td>
            <td >
                <asp:TextBox ID="txtdata" runat="server" Rows="10" TextMode="MultiLine"></asp:TextBox></td>
            <td >
                考核日期</td>
            <td >
                <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
            </td>
        </tr>
        <tr>
            <td style="width: 118px" >
                <asp:Button ID="Button1" runat="server" Text="登记" OnClick="Button1_Click" Width="74px" /></td>
            <td >
            </td>
            <td >
            </td>
            <td >
            </td>
        </tr>
    </table>
</asp:Content>

