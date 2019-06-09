<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Requirement.ascx.cs" Inherits="controls_Requirement" %>
<table id="TABLE1" style="width: 576px">
    <tr>
        <td style="width: 221px">
            客户名称</td>
        <td style="width: 48px">
            <asp:TextBox ID="txtusername" runat="server" Width="254px"></asp:TextBox></td>
    </tr>
    <tr>
        <td style="width: 221px">
            负责员工</td>
        <td style="width: 48px">
            <asp:TextBox ID="txtname" runat="server" Width="251px"></asp:TextBox></td>
    </tr>
    <tr>
        <td style="width: 221px">
            新需求内容</td>
        <td style="width: 48px">
            <asp:TextBox ID="txtcontent" runat="server" Rows="8" TextMode="MultiLine" Width="248px"></asp:TextBox></td>
    </tr>
    <tr>
        <td style="width: 221px">
            <asp:Button ID="Button1" runat="server" Text="登记需求" Width="127px" OnClick="Button1_Click" /></td>
        <td style="width: 48px">
            <asp:Label ID="Label1" runat="server" Width="353px"></asp:Label></td>
    </tr>
</table>
