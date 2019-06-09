<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CreateImage.aspx.cs" Inherits="CreateImage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="width: 494px; height: 156px">
            <tr>
                <td style="width: 197px">
                    图片路径：</td>
                <td>
                    <asp:FileUpload ID="FileUpload1" runat="server" /></td>
            </tr>
            <tr>
                <td style="width: 197px">
                    文件路径：</td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server" Width="219px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 197px">
                </td>
                <td>
                    <asp:Button ID="Button1" runat="server" Height="29px" OnClick="Button1_Click" Text="生成"
                        Width="154px" /></td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
