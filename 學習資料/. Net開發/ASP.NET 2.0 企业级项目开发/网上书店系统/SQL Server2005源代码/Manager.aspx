<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Manager.aspx.cs" Inherits="Manager" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Category/AddCategory.aspx"
            Width="217px">添加目录</asp:HyperLink>
        <br />
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Category/DelCategory.aspx"
            Width="213px">删除目录</asp:HyperLink>
        <br />
                <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/Product/ProductInPage.aspx"
            Width="213px">图书入库</asp:HyperLink>
        <br />
                <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/Product/ProductEdit.aspx"
            Width="213px">图书资料修改</asp:HyperLink>
        <br />
        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Product/SupplierManager.aspx"
            Width="209px">供应商管理</asp:HyperLink></div>
    </form>
</body>
</html>
