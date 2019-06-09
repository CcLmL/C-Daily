<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RuleUpdate.aspx.cs" Inherits="Rule_RuleUpdate" %>

<%@ Register TagPrefix="FTB" Namespace="FreeTextBoxControls" Assembly="FreeTextBox"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <link href="../CSS/CSS.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table align="center" border="0" class="css" style="width: 629px; height: 1px" cellpadding="0" cellspacing="0">
            <tr>
                <td align="center" class="csstitle" colspan="3">
                    编辑公司规章制度</td>
            </tr>
            <tr>
                <td colspan="3" style="height: 320px">
                <FTB:FreeTextBox id="FreeTextBox1" runat="Server" Height="300px" Width="620px" ButtonSet="OfficeMac" DisableIEBackButton="False" DownLevelMode="TextArea" Language="zh-cn" />
                    </td>
            </tr>
            <tr>
                <td align="center" colspan="3" style="height: 17px">
                    <asp:Button ID="Button1" runat="server" CssClass="redbuttoncss" OnClick="Button1_Click"
                        Text="提　交" />
                    <asp:Button ID="Button2" runat="server" CssClass="redbuttoncss" OnClick="Button2_Click"
                        Text="重　置" /></td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
