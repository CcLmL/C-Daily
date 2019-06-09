<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DetailInfo.aspx.cs" Inherits="BackGround_DetailInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
    <link href="../Css/StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body style="background-image: url(images/tcbeijing.jpg); background-repeat: no-repeat">
    <form id="form1" runat="server">
        <div style="background-image: url(images/tcbeijing.jpg); background-repeat: no-repeat">
            <table bordercolor="#ff00ff" cellpadding="0" cellspacing="0" style="width: 593px;
                position: absolute;
            height: 169px; height: 202px; left: 51px; top: 22px;">
                <tr>
                    <td style="width: 500px; height: 30px">
                        标题：</td>
                    <td style="width: 205px; height: 30px">
                        <asp:TextBox ID="txtTitle" runat="server" Width="361px"></asp:TextBox></td>
                    <td style="width: 124px; height: 30px">
                        信息类型：</td>
                    <td style="height: 30px">
                        <asp:TextBox ID="txtType" runat="server" Width="91px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="width: 500px; height: 85px">
                        内容：</td>
                    <td colspan="3" style="height: 85px">
                        <asp:TextBox ID="txtInfo" runat="server" Height="80px" TextMode="MultiLine" Width="523px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="width: 500px; height: 29px">
                        联系人：</td>
                    <td style="width: 205px; height: 29px">
                        <asp:TextBox ID="txtLinkMan" runat="server" Width="139px"></asp:TextBox></td>
                    <td style="width: 124px; height: 29px">
                        联系电话：</td>
                    <td style="height: 29px">
                        <asp:TextBox ID="txtTel" runat="server" Width="92px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="width: 500px; height: 13px">
                    </td>
                    <td style="width: 205px; height: 13px">
                    </td>
                    <td style="width: 124px; height: 13px">
                        &nbsp;</td>
                    <td style="height: 13px">
                    </td>
                </tr>
                <tr>
                    <td style="width: 500px; height: 24px">
                    </td>
                    <td align="center" style="width: 205px; height: 24px">
                        &nbsp;
                        <asp:LinkButton ID="LinkButton1" runat="server" OnClientClick="window.close();" CssClass="huise1" Font-Bold="True" Font-Italic="False" Font-Underline="False" ForeColor="Red" Height="12px" Width="79px">关闭窗体</asp:LinkButton></td>
                    <td style="width: 124px; height: 24px">
                    </td>
                    <td style="height: 24px">
                    </td>
                </tr>
            </table>
            <a href="javascript:go()"></a>
        </div>
    </form>
</body>
</html>
