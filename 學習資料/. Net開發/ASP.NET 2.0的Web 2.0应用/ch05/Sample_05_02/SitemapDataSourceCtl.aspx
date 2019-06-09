<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>访问站点地图数据源——SiteMapDataSource</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
		<asp:SiteMapPath ID="smpWeb" runat="server" Font-Names="Verdana" Font-Size="0.8em" PathSeparator=" : ">
			<PathSeparatorStyle Font-Bold="True" ForeColor="#990000" />
			<CurrentNodeStyle ForeColor="#333333" />
			<NodeStyle Font-Bold="True" ForeColor="#990000" />
			<RootNodeStyle Font-Bold="True" ForeColor="#FF8000" />
		</asp:SiteMapPath>
    </div>
    </form>
</body>
</html>
