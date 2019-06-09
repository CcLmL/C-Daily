<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Logon.ascx.cs" Inherits="UserControl_Logon" %>
<table border="0" cellpadding="0" cellspacing="0" class="siderbar_main" bgcolor="#f0f0f1" style="width: 222px">
    <tr>
        <td height="5">
            <img height="30" src="../images/index_13.jpg" width="222" /></td>
    </tr>
    <tr>
        <td height="5">
        </td>
    </tr>
    <tr>
        <td align="center">
            用户名：
            <asp:TextBox ID="txtName" runat="server" CssClass="inputcss" Width="113px"></asp:TextBox></td>
    </tr>
    <tr>
        <td align="center">
            密 &nbsp;码：
            <asp:TextBox ID="txtPwd" runat="server" CssClass="inputcss" TextMode="password" Width="112px"></asp:TextBox></td>
    </tr>
    <tr>
        <td align="center">
            <label>
                &nbsp;<asp:RadioButton ID="rdoBtnAdmin" runat="server" Text="管理员登录" GroupName="Check" />
                <asp:RadioButton ID="rdoBtnEmployee" runat="server" Text="职员登录" Checked="True" GroupName="Check" /></label></td>
    </tr>
    <tr>
        <td align="center" height="11">
            &nbsp;<asp:Button ID="btnLogin" runat="server" CssClass="buttoncss" Font-Size="smaller"
                OnClick="btnLogin_Click" Text="登  录" />&nbsp;
            <asp:Button ID="btnCandel" runat="server" CssClass="buttoncss" Font-Size="smaller"
                OnClick="btnCandel_Click" Text="取 消" /></td>
    </tr>
    <tr>
        <td height="3">
        </td>
    </tr>
</table>
