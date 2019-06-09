<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DetailMail.aspx.cs" Inherits="DetailMail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="GridView1" runat="server" DataSourceID="ObjectDataSource1">
        </asp:GridView>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetTable"
            TypeName="MailTable"></asp:ObjectDataSource>
        &nbsp;
    
    </div>
    </form>
</body>
</html>
