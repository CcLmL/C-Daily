<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        &nbsp;&nbsp;
        <table style="width: 450px">
            <tr>
                <td>
                    选择原始图片：</td>
                <td style="width: 236px">
                    <asp:FileUpload ID="FileUpload1" runat="server" /></td>
            </tr>
            <tr>
                <td colspan="2">
                    指定缩略图的高度和宽度：</td>
            </tr>
            <tr>
                <td style="height: 21px">
                    高度</td>
                <td style="width: 236px; height: 21px">
                    <asp:TextBox ID="txtheight" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtheight"
                        ErrorMessage="高度必须填写"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>
                    宽度</td>
                <td style="width: 236px">
                    <asp:TextBox ID="txtwidth" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtwidth"
                        ErrorMessage="宽度必须填写"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td colspan="2" style="height: 21px">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="生成缩略图" Width="150px" /></td>
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
