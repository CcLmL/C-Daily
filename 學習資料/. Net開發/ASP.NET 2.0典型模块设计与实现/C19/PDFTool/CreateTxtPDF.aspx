<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CreateTxtPDF.aspx.cs" Inherits="CreateTxtPDF" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        &nbsp;<table style="width: 500px">
            <tr>
                <td>
                    输入要生成的文本内容</td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server" Height="234px" Rows="8" TextMode="MultiLine"
                        Width="398px"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    输入要生成文件的目的地：（如c:\test1.pdf）</td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" Width="402px"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="生成" /></td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
