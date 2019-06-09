<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AddWorkLog.ascx.cs" Inherits="controls_AddWorkLog" %>
<table style="width: 689px">
    <tr>
        <td style="width: 174px">
            日志主题</td>
        <td>
            <asp:TextBox ID="txttitle" runat="server" Width="271px"></asp:TextBox></td>
    </tr>
    <tr>
        <td style="width: 174px">
            员工姓名：</td>
        <td>
            <asp:TextBox ID="txtname" runat="server" Width="270px"></asp:TextBox></td>
    </tr>
    <tr>
        <td colspan="2">
            日志内容</td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:TextBox ID="txtcontent" runat="server" Rows="6" TextMode="MultiLine" Width="559px"></asp:TextBox></td>
    </tr>
    <tr>
        <td style="width: 174px">
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="添加日志" Width="98px" /></td>
        <td>
            <asp:Label ID="Label1" runat="server" Width="218px"></asp:Label></td>
    </tr>
</table>
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtname"
    ErrorMessage="姓名必须填写"></asp:RequiredFieldValidator>
<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtcontent"
    ErrorMessage="内容必须填写"></asp:RequiredFieldValidator>
<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txttitle"
    ErrorMessage="主题必须填写"></asp:RequiredFieldValidator>
