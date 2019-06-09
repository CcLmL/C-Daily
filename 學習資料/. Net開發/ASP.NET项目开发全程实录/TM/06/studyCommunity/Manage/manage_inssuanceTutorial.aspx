<%@ Page Language="C#" AutoEventWireup="true" CodeFile="manage_inssuanceTutorial.aspx.cs" Inherits="Manage_inssuanceTutorial" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
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
<link href="../css/css.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <span style="font-size: 16pt; color: #bc4a76"><strong>发布教程</strong></span><br />
        <table id="TABLE1" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td align="right" style="width: 86px; height: 24px">
                    教程名称：</td>
                <td style="width: 155px; height: 24px">
                    <asp:TextBox ID="TextBoxVname" runat="server"></asp:TextBox></td>
                <td style="width: 100px; height: 24px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxVname"
                        ErrorMessage="必须填写"></asp:RequiredFieldValidator></td>
            </tr>
            <tr style="color: #000000">
                <td align="right" style="width: 86px; height: 1px" valign="top">
                    教程类型：</td>
                <td style="width: 155px; height: 1px; text-align: left" valign="top">
                    <table border="0" cellpadding="0" cellspacing="0" style="width: 179px">
                        <tr>
                            <td style="width: 63px; height: 20px">
                                <asp:RadioButton ID="RadioButtonVideo" runat="server" Checked="True" GroupName="Type"
                                    Text="视频" /></td>
                            <td style="width: 100px; height: 20px">
                                <asp:RadioButton ID="RadioButtonSound" runat="server" GroupName="Type" Text="语音" /></td>
                        </tr>
                    </table>
                </td>
                <td style="width: 100px; height: 1px">
                </td>
            </tr>
            <tr>
                <td align="right" style="width: 86px; height: 22px">
                    课程类型：</td>
                <td style="width: 155px; height: 22px">
                    <asp:DropDownList ID="DropDownListType" runat="server" Width="99px">
                        <asp:ListItem Value="1">.NET</asp:ListItem>
                        <asp:ListItem Value="2">ASP</asp:ListItem>
                        <asp:ListItem Value="3">JSP</asp:ListItem>
                        <asp:ListItem Value="4">VB</asp:ListItem>
                        <asp:ListItem Value="5">VC</asp:ListItem>
                        <asp:ListItem Value="6">DELPHI</asp:ListItem>
                    </asp:DropDownList></td>
                <td style="width: 100px; height: 22px">
                </td>
            </tr>
            <tr>
                <td align="right" style="width: 86px" valign="top">
                    内容简介：</td>
                <td style="width: 155px">
                    <asp:TextBox ID="TextBoxContent" runat="server" Height="140px" TextMode="MultiLine"
                        Width="142px"></asp:TextBox></td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td align="right" style="width: 86px; height: 20px">
                    上传教程：</td>
                <td style="width: 155px; height: 20px">
                    <asp:FileUpload ID="FileUpload1" runat="server" /></td>
                <td style="width: 100px; height: 20px">
                </td>
            </tr>
            <tr>
                <td colspan="3" rowspan="3" style="height: 24px; text-align: center">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="发布" Width="51px" />
                    &nbsp;&nbsp;
                    <input id="Reset1" type="reset" value="重置" style="width: 46px" /></td>
            </tr>
            <tr>
            </tr>
            <tr>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
