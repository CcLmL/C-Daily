<%@ Page Language="C#" AutoEventWireup="true" CodeFile="WebManager.aspx.cs" Inherits="Manager_WebManager" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Manager/TitleManager.aspx">投票主题管理</asp:HyperLink>
        <br />
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Manager/ItemManager.aspx">投票项目管理</asp:HyperLink></div>
    </form>
</body>
</html>
