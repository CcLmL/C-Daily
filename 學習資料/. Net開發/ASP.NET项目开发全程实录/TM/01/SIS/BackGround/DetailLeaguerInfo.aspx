<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DetailLeaguerInfo.aspx.cs" Inherits="BackGround_DetailLeaguerInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <link href="../Css/StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table bordercolor="#ff00ff" cellpadding="0" cellspacing="0" style="width: 420px;
            height: 184px">
            <tr>
                <td style="width: 573px; height: 30px">
                    标题：</td>
                <td style="width: 205px; height: 30px">
                    <asp:TextBox ID="txtTitle" runat="server" Width="178px"></asp:TextBox></td>
                <td style="width: 124px; height: 30px">
                    信息类型：</td>
                <td style="height: 30px">
                    <asp:TextBox ID="txtType" runat="server" Width="91px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 573px; height: 181px">
                    内容：</td>
                <td colspan="3" style="height: 181px">
                    <asp:TextBox ID="txtInfo" runat="server" Height="180px" TextMode="MultiLine" Width="351px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 573px; height: 29px">
                    联系人：</td>
                <td style="width: 205px; height: 29px">
                    <asp:TextBox ID="txtLinkMan" runat="server" Width="139px"></asp:TextBox></td>
                <td style="width: 124px; height: 29px">
                    联系电话：</td>
                <td style="height: 29px">
                    <asp:TextBox ID="txtTel" runat="server" Width="92px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 573px; height: 13px">
                </td>
                <td style="width: 205px; height: 13px">
                </td>
                <td style="width: 124px; height: 13px">
                    &nbsp;</td>
                <td style="height: 13px">
                </td>
            </tr>
            <tr>
                <td style="width: 573px; height: 24px">
                </td>
                <td align="center" style="width: 205px; height: 24px">
                    <asp:LinkButton ID="LinkButton1" runat="server" OnClientClick="window.close();">关闭窗体</asp:LinkButton></td>
                <td style="width: 124px; height: 24px">
                </td>
                <td style="height: 24px">
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
