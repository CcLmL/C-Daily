<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="width: 522px">
            <tr>
                <td>
                    请先加载图片<asp:FileUpload ID="FileUpload1" runat="server" /></td>
            </tr>
            <tr>
                <td>
                    &nbsp;<asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="加载图片"
                        Width="116px" /></td>
            </tr>
            <tr>
                <td>
                    原图：<asp:Image ID="Image1" runat="server" /></td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="显示缩略图" /></td>
            </tr>
            <tr>
                <td style="height: 21px">
                    缩略图：<asp:Image ID="Image2" runat="server" /></td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
