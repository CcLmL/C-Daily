<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>访问XML数据源——XmlDataSource</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
		<asp:TreeView ID="tvUser" runat="server" DataSourceID="myXmlUser" ImageSet="BulletedList" ShowExpandCollapse="False">
			<ParentNodeStyle Font-Bold="False" />
			<HoverNodeStyle Font-Underline="True" ForeColor="#5555DD" />
			<SelectedNodeStyle Font-Underline="True" ForeColor="#5555DD" HorizontalPadding="0px"
				VerticalPadding="0px" />
			<NodeStyle Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" HorizontalPadding="0px"
				NodeSpacing="0px" VerticalPadding="0px" />
		</asp:TreeView>
		<asp:XmlDataSource ID="myXmlUser" runat="server" DataFile="~/files/User.xml" XPath="/Users/User">
		</asp:XmlDataSource>
    </div>
    </form>
</body>
</html>
