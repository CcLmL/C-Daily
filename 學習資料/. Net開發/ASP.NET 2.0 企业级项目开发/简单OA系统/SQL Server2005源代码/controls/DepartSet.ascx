<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DepartSet.ascx.cs" Inherits="controls_DepartSet" %>
<%@ Register Src="DepartList.ascx" TagName="DepartList" TagPrefix="uc1" %>
<table style="width: 480px">
    <tr>
        <td style="width: 152px">
            部门名称</td>
        <td>
            <asp:TextBox ID="txtdepart" runat="server" Width="179px"></asp:TextBox></td>
        <td>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="添加" Width="56px" /></td>
    </tr>
    <tr>
        <td style="width: 152px">
        </td>
        <td>
            <uc1:DepartList id="DepartList1" runat="server">
            </uc1:DepartList></td>
        <td>
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="删除" Width="56px" /></td>
    </tr>
</table>
