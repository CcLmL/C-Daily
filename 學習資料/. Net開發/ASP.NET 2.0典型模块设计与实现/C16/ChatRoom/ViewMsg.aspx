<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewMsg.aspx.cs" Inherits="ViewMsg" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
 <meta http-equiv="refresh" content="5" />
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="width: 264px">
            <tr>
                <td style="width: 411px">
                    <asp:TextBox ID="TextBox1" runat="server" Rows="15" TextMode="MultiLine" Width="705px" Height="240px"></asp:TextBox></td>
            </tr>
        </table>
    
    </div>
        <table style="width: 719px; height: 157px;">
            <tr>
                <td style="width: 397px">
                    <hr />
                    &nbsp;私聊内容</td>
            </tr>
            <tr>
                <td style="width: 397px">
                    <asp:TextBox ID="TextBox2" runat="server" Rows="5" TextMode="MultiLine" Width="704px" Height="126px"></asp:TextBox></td>
            </tr>
        </table>
    </form>
</body>
</html>
