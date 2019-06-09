<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManagerDefault.aspx.cs" Inherits="Manager_ManagerDefault" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Manager/EditNews.aspx"
            Width="140px">编辑新闻</asp:HyperLink>
        <br />
        <asp:HyperLink ID="HyperLink2" runat="server" Height="27px" NavigateUrl="~/Manager/AddNews.aspx"
            Width="135px">发布新闻</asp:HyperLink></div>
    </form>
</body>
</html>
