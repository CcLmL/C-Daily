<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Upload.aspx.cs" Inherits="Upload" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
            <table style="width: 507px; height: 131px">
            <tr>
                <td>
                    上传文件到服务器</td>
            </tr>
            <tr>
                <td>
                    请选择文件：<asp:FileUpload ID="FileUpload1" runat="server" /></td>
            </tr>
            <tr>
                <td style="height: 26px">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="上传" Width="142px" />
                    <asp:Label ID="Label1" runat="server" Width="343px"></asp:Label></td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
