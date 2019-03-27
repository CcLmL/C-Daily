<!DOCTYPE html>
<script runat="server">
    Sub btnOK_Click(sender As Object, e As EventArgs)
        If Page.IsValid Then
            lblMsg.Text = "验证成功"
        End If
    End Sub
</script>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="utf-8" />
    <title></title>    
</head>
<body>
    <form id="form1" runat="server"> 
        姓名：<asp:TextBox runat="server" ID="txtName" />
        <asp:RequiredFieldValidator runat="server" ID="Validator1" ControlToValidate="txtName" Text="必填项目" ErrorMessage="lalala~~~" /></br>
        电话：<asp:TextBox runat="server" ID="txtTel" /></br>
        <asp:Button runat="server" ID="btnOK" Text="确定" OnClick="btnOK_Click" />
        <asp:Label runat="server" ID="lblMsg" />
    </form>
</body>
</html>
