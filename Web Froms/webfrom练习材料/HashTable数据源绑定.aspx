
<script  runat="server">
sub Page_Load
if Not Page.IsPostBack then
   dim mycountries=New Hashtable
   mycountries.Add("C","China")
   mycountries.Add("S","Sweden")
   mycountries.Add("F","France")
   mycountries.Add("I","Italy")
   dd.DataSource=mycountries
   dd.DataValueField="Key"
   dd.DataTextField="Value"
   dd.DataBind()
end if
end sub

sub displayMessage(s as Object,e As EventArgs)
lbl1.text="Your favorite country is: " & dd.SelectedItem.Text
end sub
</script>

<html>
<body>

<form runat="server">
<asp:DropDownList id="dd" runat="server"
AutoPostBack="True" onSelectedIndexChanged="displayMessage" />
<p><asp:label id="lbl1" runat="server" /></p>
</form>

</body>
</html>