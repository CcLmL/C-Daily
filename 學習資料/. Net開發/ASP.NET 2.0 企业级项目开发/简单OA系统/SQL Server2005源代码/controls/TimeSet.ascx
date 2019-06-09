<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TimeSet.ascx.cs" Inherits="controls_TimeSet" %>
<table style="width: 495px; height: 123px">
    <tr>
        <td colspan="2">
            时间设置请参考格式:08:30,18:00</td>
    </tr>
    <tr>
        <td style="width: 90px">
            上班时间</td>
        <td style="width: 1px">
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
    </tr>
    <tr>
        <td style="width: 90px">
            下班时间</td>
        <td style="width: 1px">
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
    </tr>
    <tr>
        <td style="width: 90px">
        </td>
        <td style="width: 1px">
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="设置" Width="84px" /></td>
    </tr>
</table>
