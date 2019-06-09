<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Notion.ascx.cs" Inherits="controls_Notion" %>
<table style="width: 781px">
    <tr>
        <td style="width: 190px">
            投诉单位</td>
        <td>
            <asp:TextBox ID="txtusername" runat="server" Width="323px"></asp:TextBox></td>
    </tr>
    <tr>
        <td style="width: 190px">
            被投诉人</td>
        <td>
            <asp:TextBox ID="txtname" runat="server" Width="323px"></asp:TextBox></td>
    </tr>
    <tr>
        <td style="width: 190px">
            投诉内容</td>
        <td>
            <asp:TextBox ID="txtcontent" runat="server" Rows="8" TextMode="MultiLine" Width="319px"></asp:TextBox></td>
    </tr>
    <tr>
        <td style="width: 190px">
            <asp:Button ID="Button1" runat="server" BorderStyle="Ridge" OnClick="Button1_Click"
                Text="投诉" Width="102px" /></td>
        <td>
            <asp:Label ID="Label1" runat="server"></asp:Label></td>
    </tr>
</table>
