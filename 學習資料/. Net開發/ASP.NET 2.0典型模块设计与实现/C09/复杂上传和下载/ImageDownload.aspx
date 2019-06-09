<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ImageDownload.aspx.cs" Inherits="ImageDownload" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"
            OnRowCommand="GridView1_RowCommand" OnRowCreated="GridView1_RowCreated" Width="378px">
            <Columns>
                <asp:BoundField DataField="FileID" HeaderText="文件ID" InsertVisible="False" ReadOnly="True"
                    SortExpression="FileID" />
                <asp:BoundField DataField="Content" HeaderText="内容" SortExpression="Content" />
                <asp:ButtonField CommandName="down" HeaderText="下载" Text="按钮"   />

            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FileImageConnectionString %>"
            SelectCommand="SELECT [FileID], [Content] FROM [FileImageLoad]"></asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
