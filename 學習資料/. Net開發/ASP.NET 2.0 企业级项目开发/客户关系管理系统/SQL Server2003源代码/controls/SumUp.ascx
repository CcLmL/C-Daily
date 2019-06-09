<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SumUp.ascx.cs" Inherits="controls_SumUp" %>
<table style="width: 873px">
    <tr>
        <td style="width: 97px">
            客户</td>
        <td style="width: 19px">
            <asp:TextBox ID="txtusername" runat="server"></asp:TextBox></td>
        <td style="width: 61px">
            实施员</td>
        <td style="width: 85px">
            <asp:TextBox ID="txtname" runat="server"></asp:TextBox></td>
    </tr>
    <tr>
        <td style="width: 97px">
            软件版本</td>
        <td style="width: 19px">
            <asp:TextBox ID="txtversion" runat="server"></asp:TextBox></td>
        <td style="width: 61px">
            备注</td>
        <td style="width: 85px">
            <asp:TextBox ID="txtnote" runat="server"></asp:TextBox></td>
    </tr>
    <tr>
        <td style="width: 97px">
            开始日期</td>
        <td style="width: 19px">
            <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
        </td>
        <td style="width: 61px">
            结束日期</td>
        <td style="width: 85px">
            <asp:Calendar ID="Calendar2" runat="server"></asp:Calendar>
        </td>
    </tr>
    <tr>
        <td style="width: 97px">
            总结</td>
        <td style="width: 19px">
            <asp:TextBox ID="txtsumup" runat="server" TextMode="MultiLine" Width="158px"></asp:TextBox></td>
        <td style="width: 61px">
        </td>
        <td style="width: 85px">
        </td>
    </tr>
    <tr>
        <td style="width: 97px; height: 21px">
        </td>
        <td style="width: 19px; height: 21px">
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="完成" Width="100px" /></td>
        <td style="width: 61px; height: 21px">
            <asp:Label ID="Label1" runat="server" Width="118px"></asp:Label></td>
        <td style="width: 85px; height: 21px">
        </td>
    </tr>
</table>
