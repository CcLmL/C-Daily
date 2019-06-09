<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PageDependency.aspx.cs" Inherits="PageDependency" %>
<%@ OutputCache Duration="10"  SqlDependency="AdventureWorks:Location" VaryByParam="None" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
            <table style="width: 467px">
            <tr>
                <td>
                    当前时间：<asp:Literal ID="Literal1" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td>
                    最后缓存时间：<asp:Literal ID="Literal2" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td>
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AllowPaging="True" AutoGenerateColumns="False" Width="435px">
            <Columns>
                <asp:BoundField DataField="LocationID" HeaderText="地点ID" InsertVisible="False" ReadOnly="True"
                    SortExpression="LocationID" />
                <asp:BoundField DataField="Name" HeaderText="地点名称" SortExpression="Name" />
                <asp:BoundField DataField="CostRate" HeaderText="费率" SortExpression="CostRate" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AdventureWorksConnectionString %>"
            SelectCommand="SELECT LocationID, Name, CostRate FROM Production.Location"
            OnSelected="SqlDataSource_Selected">
        </asp:SqlDataSource>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
