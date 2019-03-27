<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="utf-8" />
    <title></title>  
<script runat="server">
    Sub Page_Load(Sender As Object, e As EventArgs)
        Dim shI As Int32
        Dim LiA As ListItem

        For shI = 1 To 12
            LiA = New ListItem(shI)
            LiA.Text = shI & "月"
            ListBox1.Items.Add(LiA)
        Next
    End Sub
</script>
</head>
<body>
    <form id="form1" runat="server">  
        <asp:ListBox runat="server" ID="ListBox1">

        </asp:ListBox>
    </form>
</body>
</html>
