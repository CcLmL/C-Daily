<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
	string GetPageTitle()
	{
		return "当前页面的标题为：" + this.Title.ToString();
	}
</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>代码呈现块和代码声明块</title>
</head>
<body>    
    <center>
    <% for(int i = 2; i < 6; i++) { %>
		<font size='<%= i %>'>我喜欢ASP.NET技术…… <br /><%= GetPageTitle() %></font><br />
	<% } %>
	</center>
</body>
</html>
