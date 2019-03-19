<%@ Import Namespace="System.Data" %>

<script runat="server">
    Sub Page_Load()
        If Not Page.IsPostBack Then
            Dim mycountries = New DataSet()
            mycountries.ReadXml(MapPath("countries.xml"))
            rb.DataSource = mycountries
            rb.DataTextField = "text"
            rb.DataValueField = "value"
            rb.DataBind()
        End If
    End Sub

    Sub displayMessage(sender As Object, e As EventArgs)
        lbl1.Text = "Your favorite country is: " & rb.SelectedItem.Text
    End Sub
</script>

<html>
    <body>
        <form runat="server">
            <asp:RadioButtonList ID="rb" runat="server" AutoPostBack="true" OnSelectedIndexChanged="displayMessage" />
            <p><asp:Label ID="lbl1" runat="server" /></p>
        </form>
    </body>
</html>