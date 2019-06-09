<%@ Control Language="C#" AutoEventWireup="true" CodeFile="entry.ascx.cs" Inherits="entry" %>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
<table align="center" cellpadding="0" cellspacing="0" style="height: 3px" width="802">
    <tr>
        <td background="images/index_03.jpg" style="height: 32px" valign="top">
              用户名：<asp:TextBox ID="txtName" runat="server" Width="67px">
            </asp:TextBox>密码：<asp:TextBox ID="txtPass" runat="server" TextMode="Password" Width="66px">
            </asp:TextBox>验证码：<asp:TextBox ID="txtYzm" runat="server" Width="64px"></asp:TextBox>
            <asp:Image ID="Image1" runat="server" Height="19px" Width="51px" />
            <asp:LinkButton ID="lnkbtnRe" runat="server" Font-Size="9pt"
                OnClick="LinkButton2_Click">看不清</asp:LinkButton>
            <asp:ImageButton ID="imgbtnLanding" runat="server" ImageUrl="~/images/denglu.gif"
                OnClick="imgbtnLanding_Click" />
            <asp:LinkButton ID="lnkbtnNew" runat="server" Font-Bold="True"
                Font-Size="10pt" Font-Underline="false" PostBackUrl="~/login.aspx"
                CssClass="baibai" Width="100px">［新用户注册］</asp:LinkButton>
            <asp:LinkButton ID="lnkbtnPass" runat="server" PostBackUrl="~/seekPass.aspx" CssClass="baibai"
                Width="86px">忘记密码</asp:LinkButton></td>
    </tr>
</table>
