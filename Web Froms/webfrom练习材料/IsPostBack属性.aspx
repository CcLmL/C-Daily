<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script runat="server">
        Sub Page_Load
            if Not Page.IsPostBack then
                lbl1.Text="The date and time is " & now()
            end if
        End Sub

        Sub sumbit(source As Object, e As EventArgs)
            lbl2.Text = "Hello World"
        End Sub

        Sub btn1_Click(sender As Object, e As EventArgs)
            If btn1.Text = "you click me!" Then
                btn1.Text = "click me"
            Else
                btn1.Text = "you click me!"
            End If
        End Sub
</script>
</head>
<body>
    <form id="form1" runat="server">
        <h3><asp:Label id="lbl1" runat="server" /></h3>
        <h3><asp:Label id="lbl2" runat="server" /></h3>
        <asp:Button Text="Sumbit" OnClick="sumbit" runat="server" />
        <asp:Button id="btn1" Text="click me" OnClick="btn1_Click" runat="server"/>
    </form>
</body>
</html>
