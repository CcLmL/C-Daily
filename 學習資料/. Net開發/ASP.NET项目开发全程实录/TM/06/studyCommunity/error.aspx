<%@ Page Language="C#" AutoEventWireup="true" CodeFile="error.aspx.cs" Inherits="error" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align: center">
        <span style="color: #cc0099"><span style="font-size: 16pt">出现错误请返回</span>!<br />
        </span>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/index.aspx">返回</asp:HyperLink></div>
    </form>
</body>
</html>
