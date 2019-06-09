<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ImageUpload.aspx.cs" Inherits="ImageUpload" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">

    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="width: 638px; height: 154px">
            <tr>
                <td>
                    上传图片到数据库</td>
            </tr>
            <tr>
                <td>
                    请选择<asp:FileUpload ID="FileUpload1" runat="server" /></td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="上传" Width="185px" /></td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
