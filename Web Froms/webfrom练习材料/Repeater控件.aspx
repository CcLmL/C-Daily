<%@ Import namespace="System.Data" %>

<script runat="server">
    sub Page_Load
    if Not Page.IsPostBack then
       dim mycdcatalog=New DataSet
       mycdcatalog.ReadXml(MapPath("cdcatalog.xml"))
       cdcatalog.DataSource=mycdcatalog
       cdcatalog.DataBind()
    end if
    end sub
</script>
<html>
<body>
    <form id="form1" runat="server"> 
        <asp:Repeater id="cdcatalog" runat="server">

            <HeaderTemplate>
                <table border="1" width="100%">
                    <tr>
                        <th>Title</th>
                        <th>Artist</th>
                        <th>Company</th>
                        <th>Price</th>
                    </tr>
            </HeaderTemplate>

            <ItemTemplate>
                    <tr>
                        <td><%#Container.DataItem("title")%> </td>
                        <td><%#Container.DataItem("artist")%> </td>
                        <td><%#Container.DataItem("company")%> </td>
                        <td><%#Container.DataItem("price")%> </td>
                    </tr>
            </ItemTemplate>

            <FooterTemplate>
                </table>
            </FooterTemplate>

        </asp:Repeater>
    </form>
</body>
</html>
