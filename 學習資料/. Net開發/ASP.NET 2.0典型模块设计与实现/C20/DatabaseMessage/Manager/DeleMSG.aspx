<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DeleMSG.aspx.cs" Inherits="Manager_DeleMSG" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
            DataSourceID="SqlDataSource1" Width="457px" DataKeyNames="msgID">
            <Columns>
                <asp:CommandField ShowSelectButton="True" ShowDeleteButton="True" />
                <asp:BoundField DataField="Name" HeaderText="姓名" SortExpression="Name" />
                <asp:BoundField DataField="Mail" HeaderText="邮箱" SortExpression="Mail" />
                <asp:BoundField DataField="Url" HeaderText="网址" SortExpression="Url" />
                <asp:BoundField DataField="MsgContent" HeaderText="内容" SortExpression="MsgContent" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MSGConnectionString %>"
            SelectCommand="SELECT [msgID], [Name], [Mail], [Url], [MsgContent] FROM [msgView]" DeleteCommand="DELETE FROM [msgView] WHERE  [msgID]=@msgID">
            <DeleteParameters>
                <asp:Parameter Name="msgID" />
            </DeleteParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
