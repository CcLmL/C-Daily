<%@ Page Language="C#" AutoEventWireup="true" CodeFile="WaterMarked.aspx.cs" Inherits="WaterMarked" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
                <table style="width: 533px">
            <tr>
                <td>
                    缩放图片的宽度</td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
            </tr>
                    <tr>
                        <td>
                            水印文字</td>
                        <td>
                            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
                    </tr>
            <tr>
                <td>
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="生成缩略图" /></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                        ErrorMessage="必须输入宽度"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Image ID="Image1" runat="server" /></td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
