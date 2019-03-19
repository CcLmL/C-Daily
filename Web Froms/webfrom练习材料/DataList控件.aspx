<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System." %>
<script runat="server">
    Sub Page_Load
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
        <asp:DataList ID="cdcatalog" GridLines="Both" runat="server" 
            cellpadding="2"
            cellspacing="2"
            borderstyle="inset"
            backcolor="#e8e8e8"
            width="100%"
            headerstyle-font-name="Verdana"
            headerstyle-font-size="12pt"
            headerstyle-horizontalalign="center"
            headerstyle-font-bold="True"
            itemstyle-backcolor="#778899"
            itemstyle-forecolor="#ffffff"
            footerstyle-font-size="9pt"
            footerstyle-font-italic="True">
            <HeaderTemplate>
                My CD Catalog
            </HeaderTemplate>
            <ItemTemplate>
                "<%# Container.DataItem("title") %>" of <%# Container.DataItem("artist") %> -$<%#Container.DataItem("price") %>
            </ItemTemplate>

            <AlternatingItemTemplate>
                "<%# Container.DataItem("title") %>" of <%# Container.DataItem("artist") %> -$<%#Container.DataItem("price") %>
            </AlternatingItemTemplate>

            <FooterTemplate>
                Copyright w3school.com.cn
            </FooterTemplate>
        </asp:DataList>
    </form>
</body>
</html>
