<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BackMsg.aspx.cs" Inherits="BackMsg" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="width: 548px">
            <tr>
                <td style="width: 153px">
                    回复主题</td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server" Width="390px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 153px">
                    回复内容</td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" Rows="10" TextMode="MultiLine" Width="392px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox2"
                        ErrorMessage="内容必须填写"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width: 153px">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="回复" Width="94px" /></td>
                <td>
                    <asp:Literal ID="Literal1" runat="server"></asp:Literal></td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
