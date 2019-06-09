<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        &nbsp;
        <table style="width: 410px">
            <tr>
                <td>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
                <td>
                    <asp:Button ID="Button1"
            runat="server" Text="取值" OnClick="Button1_Click" Width="88px" /></td>
            </tr>
            <tr>
                <td>
                    Fname</td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    Lname</td>
                <td>
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox></td>
            </tr>
        </table>
        &nbsp;
    </div>
    </form>
</body>
</html>
