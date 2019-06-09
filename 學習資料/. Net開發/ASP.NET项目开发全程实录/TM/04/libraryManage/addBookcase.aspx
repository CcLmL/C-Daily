<%@ Page Language="C#" AutoEventWireup="true" CodeFile="addBookcase.aspx.cs" Inherits="addBookcase" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
     <link href="css.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table align="center" background="Images/xiaobei.gif" border="0" cellpadding="0"
            cellspacing="0" height="176" width="292">
            <tr>
                <td style="text-align: center">
                    <table border="0" cellpadding="0" cellspacing="0" style="width: 227px; height: 56px">
                        <tr>
                            <td style="width: 74px; height: 12px">
                                书架名称：</td>
                            <td style="width: 100px; height: 12px; text-align: left">
                                <asp:TextBox ID="txtBookcase" runat="server" Width="126px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td colspan="2" style="height: 28px">
                                <asp:Button ID="btnSave" runat="server" Text="保　存" OnClick="btnSave_Click" />
                                <input id="Button2"  onclick="window.close();" type="button" value="关　闭" /></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
