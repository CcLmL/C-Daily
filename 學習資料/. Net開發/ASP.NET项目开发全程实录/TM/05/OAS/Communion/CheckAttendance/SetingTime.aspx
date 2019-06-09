<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SetingTime.aspx.cs" Inherits="Communion_CheckAttendance_SetingTime" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <link href="../../CSS/CSS.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table id="table1" align="center" border="1" cellspacing="0" class="css" style="width: 312px;
            height: 1px">
            <tr>
                <td align="center" class="csstitle" colspan="3" style="height: 13px">
                    员工上下班时间设置</td>
            </tr>
            <tr>
                <td style="width: 85px">
                    员工上班时间：</td>
                <td style="width: 84px">
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="inputcss" Width="80px">08:00:00</asp:TextBox></td>
                <td>
                    格式例如：08:30:00<asp:RegularExpressionValidator ID="regularexpressionvalidator1" runat="server"
                        ControlToValidate="TextBox1" ErrorMessage="** 格式不正确" ValidationExpression="^(0?[0-9]|1[0-9]|2[0-3]):([0-5])+([0-9]):([0-5])+([0-9])"></asp:RegularExpressionValidator></td>
            </tr>
            <tr style="color: #000000">
                <td style="width: 85px">
                    员工下班时间：</td>
                <td style="width: 84px">
                    <asp:TextBox ID="TextBox2" runat="server" CssClass="inputcss" Width="80px">17:00:00</asp:TextBox></td>
                <td>
                    格式例如：16:30:00<asp:RegularExpressionValidator ID="regularexpressionvalidator2" runat="server"
                        ControlToValidate="TextBox2" ErrorMessage="** 格式不正确" ValidationExpression="^(0?[0-9]|1[0-9]|2[0-3]):([0-5])+([0-9]):([0-5])+([0-9])"></asp:RegularExpressionValidator></td>
            </tr>
            <tr>
                <td align="right" colspan="3">
                    <asp:Button ID="btnSave" runat="server" CssClass="bluebuttoncss" OnClick="btnSave_Click"
                        Text="设　置" />
                    &nbsp; &nbsp;
                    <asp:Button ID="btnClear" runat="server" CausesValidation="false" CssClass="bluebuttoncss"
                        OnClick="btnClear_Click" Text="重　置" />
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
