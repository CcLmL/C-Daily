<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Logon.aspx.cs" Inherits="Logon" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>供求信息－－－后台登录</title>
    <link href="Css/css.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table align="center" cellpadding="0" cellspacing="0" height="600" width="100%">
            <tr>
                <td valign="middle">
                    <table align="center" cellpadding="0" cellspacing="0" height="290" width="545">
                        <tr>
                            <td background="images/gongqiu.GIF" valign="bottom" width="545">
                                <table align="right" cellpadding="0" cellspacing="0" width="405">
                                    <tr>
                                        <td class="huise" height="30" width="63">
                                            管理员：</td>
                                        <td colspan="2" height="30">
                                            <asp:TextBox ID="txtUser" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUser"
                                                ErrorMessage="* 必填项"></asp:RequiredFieldValidator></td>
                                    </tr>
                                    <tr>
                                        <td class="huise" height="30">
                                            密&nbsp; 码：</td>
                                        <td colspan="2" height="30">
                                            <asp:TextBox ID="txtPwd" runat="server" TextMode="Password" Width="150px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPwd"
                                                ErrorMessage="* 必填项"></asp:RequiredFieldValidator></td>
                                    </tr>
                                    <tr>
                                        <td class="huise" height="30">
                                            验证码：</td>
                                        <td height="30" width="172">
                                            <asp:TextBox ID="txtCheckCode" runat="server"></asp:TextBox></td>
                                        <td align="left" class="hong" height="30" width="168">
                                            <asp:Label ID="lblCheckCode" runat="server" Text="1234" Font-Size="12pt" Width="46px"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            <a href="#">
                                                </a> &nbsp;<a href="#"></a><asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="images/denglu.gif"
                                                OnClick="ImageButton1_Click" />
                                            <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="images/chongzhi.gif" /></td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" height="45">
                                            &nbsp;</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
