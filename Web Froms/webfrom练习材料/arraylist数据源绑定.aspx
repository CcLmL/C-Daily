<script  runat="server">
    sub Page_Load
        If Not Page.IsPostBack Then
            Dim mycountries = New ArrayList
            mycountries.Add("China")
            mycountries.Add("Sweden")
            mycountries.Add("France")
            mycountries.Add("Italy")
            mycountries.TrimToSize()
            mycountries.Sort()
            dd.DataSource = mycountries
            dd.DataBind()
            lbl1.Text = "Your favorite country is: " & dd.SelectedItem.Value
        End If
    End sub

    sub displayMessage(s as Object,e As EventArgs)
        lbl1.text="Your favorite country is: " & dd.SelectedItem.Text
    end sub
</script>

<html>
<body>
    <form runat="server">
        <asp:DropDownList id="dd" runat="server" AutoPostBack="True"  OnSelectedIndexChanged="displayMessage" />
        <p><asp:label id="lbl1" runat="server" /></p>
    </form>
</body>
</html>