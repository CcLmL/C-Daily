<!DOCTYPE html>
<%@ Page EnableViewState="false" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script runat="server">
        Sub change(sender As Object, e As EventArgs)
            lbl1.Text = "You changed text to " & txt1.Text
        End Sub
</script>
</head>
<body>
    <form runat="server">
        Enter your name:
        <asp:TextBox id="txt1" runat="server" text="Hello World!" ontextchanged="change" autopostback="true" />
        <p><asp:Label id="lbl1" runat="server" /></p>
    </form>
</body>
</html>
